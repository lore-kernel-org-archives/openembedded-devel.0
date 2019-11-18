Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 14:55:07 UTC
Received: from us-smtp-delivery-164.mimecast.com
	(us-smtp-delivery-164.mimecast.com [216.205.24.164])
	by mail.openembedded.org (Postfix) with ESMTP id 976597F98A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:55:07 +0000 (UTC)
Received: from webmail.essvote.com (40.142.57.162 [40.142.57.162]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-vmYdnXzaOSeq8jQnOnq-iQ-1; Mon, 18 Nov 2019 09:48:57 -0500
Received: from ESS-EX02.essvote.corp.local (172.16.130.13) by
	ESS-EX02.essvote.corp.local (172.16.130.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1591.10; Mon, 18 Nov 2019 09:48:56 -0500
Received: from ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5]) by
	ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5%3]) with mapi
	id 15.01.1591.017; Mon, 18 Nov 2019 09:48:56 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] merged changes to master
Thread-Index: AQHVm5ot5HuU48xqf0KJs1Tt8ETx8aeRA85g
Date: Mon, 18 Nov 2019 14:48:56 +0000
Message-ID: <c62671a8324949a786b64e3dfc53a6b4@essvote.com>
References: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
In-Reply-To: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.79]
MIME-Version: 1.0
X-MC-Unique: vmYdnXzaOSeq8jQnOnq-iQ-1
X-Mimecast-Spam-Score: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java] merged changes to master
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
X-List-Received-Date: Mon, 18 Nov 2019 14:55:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Two I would like to see backported.

This one fixes a build break in at least thud and probably warrior.
openjdk-8: disable stringop-overflow compiler errors

This one fixes multi-lib builds in thud and warrior.
Revert "base-files: Define JAVA_HOME by default"


From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> On Behalf Of Richard Leitner
Sent: Friday, November 15, 2019 3:51 AM
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [oe] [meta-java] merged changes to master

Hi,
this is a note to let you know that I've just merged the following
patches from master-next to the master branch of the meta-java
repository at git://git.yoctoproject.org/meta-java<git://git.yoctoproject.o=
rg/meta-java>.

If any of them should be backported to any stable branches please get in
contact with us by replying to this email. Thanks.


Alistair Francis (1):
layer.conf: Mark as compatible with zeus

Chris Laplante (2):
classpath: add patch to fix BigDecimal.compareTo()
classpath: add patch to fix BigDecimal.stripTrailingZeros()'s
handling of 0.

Fang Jia (1):
Revert "base-files: Define JAVA_HOME by default"

Nicola Lunghi (1):
openjdk-8: Enable HotSpot builds on 5.x Linux kernels

Ricardo Ribalda Delgado (23):
icedtea7: Add missing DEPENDS
openjdk7: Make kerberos optional through PACKAGECONFIG
openjdk8: Make kerberos optional through PACKAGECONFIG
classpath: Fix build with targets aarch64
jamvm: Do not build for aarch64 targets
cacao: Do not build for aarch64 targets
javasqlite: Create cc tool to make libtool happy
jdon: Fix location of S
rxtx: Fix path of javac
jamvm: Fix binary name for javac
cup: Do not use all as PACKAGE_ARCH
dbus-java: Do not use all as PACKAGE_ARCH
rhino: Do not use all as PACKAGE_ARCH
ca-certificates: Cannot be an allarch package
xalan-j: Do not use all as PACKAGE_ARCH
xom: Do not use all as PACKAGE_ARCH
jaxen: Do not build an all PACKAGE_ARCH
jlex: Do not build as an all PACKAGE_ARCH
bsf: Do not build as all PACKAGE_ARCH
poi: Do not build as all PACKAGE_ARCH
xom: Allow re-running do_compile
jdom: Do not use all as PACKAGE_ARCH
dom4j: Do not use all as PACKAGE_ARCH

Richard Leitner (7):
README: mention new TESTIMAGE_AUTO variable
oeqa: runtime: java: Drop OETestID
cacao: update to latest staging tip 2d6f6c14daf9
README: rewrite build host dependencies
icedtea7-native: disable new compiler warnings
openjdk-8: disable stringop-overflow compiler errors
layer.conf: remove compatibility with thud and warrior


If you have any questions, please let me know.
regards;Richard.L
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists.o=
penembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-devel<http://li=
sts.openembedded.org/mailman/listinfo/openembedded-devel>

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast Ltd, an innovator in Software as a Service (=
SaaS) for business. Providing a safer and more useful place for your human =
generated data. Specializing in; Security, archiving and compliance. To fin=
d out more visit the Mimecast website.

