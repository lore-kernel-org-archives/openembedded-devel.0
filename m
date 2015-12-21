Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D27C160616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 09:14:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBL9EVA6025967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 01:14:31 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.162]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Mon, 21 Dec 2015 01:14:30 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] how to properly handle conflict between
	openjdk-8-native, fastjar-native and ecj-bootstrap-native
Thread-Index: AdE7z/zF2KRcdn8CShC3IbglM9ILBw==
Date: Mon, 21 Dec 2015 09:14:28 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C775A8C@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.138]
MIME-Version: 1.0
Subject: [meta-java] how to properly handle conflict between openjdk-8-native, fastjar-native and ecj-bootstrap-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Dec 2015 09:14:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I found that builds with sstate will fail with:
checking if /build/tmp/sysroots/x86_64-linux/usr/bin/ecj-initial works... c=
onfigure: error: The Java compiler /build/tmp/sysroots/x86_64-linux/usr/bin=
/ecj-initial failed (see config.log, check the CLASSPATH?)

That's because the do_install of openjdk-8-native install files directly in=
to staging dirs, so the sstate is empty, I tried to send a patch to fix it:
[meta-java][PATCH v2] openjdk-8-native: fix incorrect do_install

But ends up with conflicting with fastjar-native and ecj-bootstrap-native, =
further investigation show me that they are not properly handled.

fastjar-native provides virtual/jar-native,
ecj-bootstrap-native provides virtual/javac-native (used to, the PROVIDES w=
as removed recently)

and openjdk-8-native provides both of them.

Usually we use update-alternatives to avoid conflicts but seems like it doe=
sn't work for native package,
But openjdk-8-native is still trying to use it which should be invalid:

$ grep ALTERNATIVE openjdk-8-native_72b05.bb
ALTERNATIVE_${PN} =3D "java javac jar pack200 unpack200 keytool"
ALTERNATIVE_LINK[java] =3D "${bindir}/java"
ALTERNATIVE_TARGET[java] =3D "${JDK_HOME}/bin/java"
ALTERNATIVE_PRIORITY[java] =3D "100"
ALTERNATIVE_LINK[javac] =3D "${bindir}/javac"
ALTERNATIVE_TARGET[javac] =3D "${JDK_HOME}/bin/javac"
ALTERNATIVE_PRIORITY[javac] =3D "100"
ALTERNATIVE_LINK[jar] =3D "${bindir}/jar"
ALTERNATIVE_TARGET[jar] =3D "${JDK_HOME}/bin/jar"
ALTERNATIVE_PRIORITY[jar] =3D "100"
ALTERNATIVE_LINK[pack200] =3D "${bindir}/pack200"
ALTERNATIVE_TARGET[pack200] =3D "${JDK_HOME}/bin/pack200"
ALTERNATIVE_PRIORITY[pack200] =3D "100"
ALTERNATIVE_LINK[unpack200] =3D "${bindir}/unpack200"
ALTERNATIVE_TARGET[unpack200] =3D "${JDK_HOME}/bin/unpack200"
ALTERNATIVE_PRIORITY[unpack200] =3D "100"
ALTERNATIVE_LINK[keytool] =3D "${bindir}/keytool"
ALTERNATIVE_TARGET[keytool] =3D "${JDK_HOME}/bin/keytool"
ALTERNATIVE_PRIORITY[keytool] =3D "100"

So we should use  the virtual/foo everywhere and set PREFERRRED_PROVIDER fo=
r it, but many
recipes is depending on fastjar-native directly:
$ grep -r 'DEPENDS.*fastjar-native' *|wc -l
14

virtual/jar-native is never used in depends.

And many recipe is depending on ecj-bootstrap-native directly through java-=
bootstrap-components.bbclass:

$ tail -n 2 classes/java-bootstrap-components.bbclass=20
DEPENDS_prepend_class-native =3D " ecj-bootstrap-native "
DEPENDS_prepend_class-target =3D " virtual/javac-native "

I don't understand the purpose from reading the commit logs there, and it s=
eems not correct to me.
The default for virtual/javac-native is openjdk-8-native, then these confli=
cted recipes will be built
together, it works without ssate since openjdk-8-native force to remove tho=
se files in staging dir
before installing them(which definitely breaks sstate):
# clean up the mess from bootstrap
    for tool in jar java javac keytool pack200 unpack200
    do
        rm -f ${STAGING_BINDIR_NATIVE}/$tool

        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${STAGING_BINDIR_NATIVE}/$=
tool
    done

it's assuming that fastjar-native and ecj-bootstrap-native are built before=
 openjdk-8-native,
but its' not always true especially when build with sstate.

I'm going to fix the do_install and remove the useless ALTERNATIVE settings=
 for openjdk-8-native,=20
and fix the depends only on virtual/foo then the user needs to set PREFERRE=
D_PROVIDER,
so to avoid these conflicts. Please anyone has a better understanding corre=
ct me if this doesn't seem
to work.

Anyone has a better idea? Thanks!

Thanks,
Jackie






