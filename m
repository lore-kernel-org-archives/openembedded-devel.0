Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16110731BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:15:36 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f206so265192wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=UK12NocHaemdTBIUOnYh4x1BfE7XgBKs4hBUMiHQe6k=;
	b=R2dglobWD/SUuvSdNWVIeLPbNzu84Gx0Goyz2yCc6Yv8Vt/m8fkBqTmF9hECL5Qm8N
	JVjd21qxFcQ9ddaf8CHPecT1/TMTpRDMNJlvJVIjO+RdqmHxXibqzRWiFd9bi6fE5r/2
	IhHjxj1R2oivgfpgCRN4ZL32PACjAtkT49vOipSKGc4MYJXX08goVtSJSsDZ1Dj9b8jU
	iyhv2CXACXKpHzQmCQZEvwSp5b7j7OJKU+m0vpfUTTn6WYCTE/4ILnBSrH0FG0YOcMxv
	OCSBUKfUmejozo8z0NGZaSBY/aFpMLdzY2YxetR6zNNA4BAiXnuT7KDPBcTG9Iqg3oCZ
	ImJA==
X-Received: by 10.194.176.170 with SMTP id cj10mr85568225wjc.165.1451934936848;
	Mon, 04 Jan 2016 11:15:36 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	df10sm72732699wjb.44.2016.01.04.11.15.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:15:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C775A8C@ALA-MBA.corp.ad.wrs.com>
Date: Mon, 4 Jan 2016 20:15:35 +0100
Message-Id: <A66657BF-BF4F-4E1B-B35D-021C0B14E377@gmail.com>
References: <1B858668EC6A94408DCA5225FDFA85AA010C775A8C@ALA-MBA.corp.ad.wrs.com>
To: Jie Huang <jackie.huang@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] how to properly handle conflict between openjdk-8-native, fastjar-native and ecj-bootstrap-native
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
X-List-Received-Date: Mon, 04 Jan 2016 19:15:38 -0000
X-Groupsio-MsgNum: 59329
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0F41FAC8-F7DF-42A6-93C3-DC02B5674F81";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_0F41FAC8-F7DF-42A6-93C3-DC02B5674F81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 21.12.2015 um 10:14 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
> Hi,
>=20
> I found that builds with sstate will fail with:
> checking if /build/tmp/sysroots/x86_64-linux/usr/bin/ecj-initial =
works... configure: error: The Java compiler =
/build/tmp/sysroots/x86_64-linux/usr/bin/ecj-initial failed (see =
config.log, check the CLASSPATH?)
>=20
> That's because the do_install of openjdk-8-native install files =
directly into staging dirs, so the sstate is empty, I tried to send a =
patch to fix it:
> [meta-java][PATCH v2] openjdk-8-native: fix incorrect do_install
>=20
> But ends up with conflicting with fastjar-native and =
ecj-bootstrap-native, further investigation show me that they are not =
properly handled.
>=20
> fastjar-native provides virtual/jar-native,
> ecj-bootstrap-native provides virtual/javac-native (used to, the =
PROVIDES was removed recently)
>=20
> and openjdk-8-native provides both of them.
>=20
> Usually we use update-alternatives to avoid conflicts but seems like =
it doesn't work for native package,
> But openjdk-8-native is still trying to use it which should be =
invalid:
>=20
> $ grep ALTERNATIVE openjdk-8-native_72b05.bb
> ALTERNATIVE_${PN} =3D "java javac jar pack200 unpack200 keytool"
> ALTERNATIVE_LINK[java] =3D "${bindir}/java"
> ALTERNATIVE_TARGET[java] =3D "${JDK_HOME}/bin/java"
> ALTERNATIVE_PRIORITY[java] =3D "100"
> ALTERNATIVE_LINK[javac] =3D "${bindir}/javac"
> ALTERNATIVE_TARGET[javac] =3D "${JDK_HOME}/bin/javac"
> ALTERNATIVE_PRIORITY[javac] =3D "100"
> ALTERNATIVE_LINK[jar] =3D "${bindir}/jar"
> ALTERNATIVE_TARGET[jar] =3D "${JDK_HOME}/bin/jar"
> ALTERNATIVE_PRIORITY[jar] =3D "100"
> ALTERNATIVE_LINK[pack200] =3D "${bindir}/pack200"
> ALTERNATIVE_TARGET[pack200] =3D "${JDK_HOME}/bin/pack200"
> ALTERNATIVE_PRIORITY[pack200] =3D "100"
> ALTERNATIVE_LINK[unpack200] =3D "${bindir}/unpack200"
> ALTERNATIVE_TARGET[unpack200] =3D "${JDK_HOME}/bin/unpack200"
> ALTERNATIVE_PRIORITY[unpack200] =3D "100"
> ALTERNATIVE_LINK[keytool] =3D "${bindir}/keytool"
> ALTERNATIVE_TARGET[keytool] =3D "${JDK_HOME}/bin/keytool"
> ALTERNATIVE_PRIORITY[keytool] =3D "100"
>=20
> So we should use  the virtual/foo everywhere and set =
PREFERRRED_PROVIDER for it, but many
> recipes is depending on fastjar-native directly:

You cannot do that in a sane way for java, because they depend on each =
other. So your openjdk-xy
build will end with 3-5 virtual/java-native packages, which must fail.

> $ grep -r 'DEPENDS.*fastjar-native' *|wc -l
> 14
>=20
> virtual/jar-native is never used in depends.
>=20
> And many recipe is depending on ecj-bootstrap-native directly through =
java-bootstrap-components.bbclass:
>=20
> $ tail -n 2 classes/java-bootstrap-components.bbclass
> DEPENDS_prepend_class-native =3D " ecj-bootstrap-native "
> DEPENDS_prepend_class-target =3D " virtual/javac-native "
>=20
> I don't understand the purpose from reading the commit logs there, and =
it seems not correct to me.
> The default for virtual/javac-native is openjdk-8-native, then these =
conflicted recipes will be built
> together, it works without ssate since openjdk-8-native force to =
remove those files in staging dir
> before installing them(which definitely breaks sstate):
> # clean up the mess from bootstrap
>    for tool in jar java javac keytool pack200 unpack200
>    do
>        rm -f ${STAGING_BINDIR_NATIVE}/$tool
>=20
>        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" =
${STAGING_BINDIR_NATIVE}/$tool
>    done
>=20
> it's assuming that fastjar-native and ecj-bootstrap-native are built =
before openjdk-8-native,
> but its' not always true especially when build with sstate.
>=20
> I'm going to fix the do_install and remove the useless ALTERNATIVE =
settings for openjdk-8-native,
> and fix the depends only on virtual/foo then the user needs to set =
PREFERRED_PROVIDER,
> so to avoid these conflicts. Please anyone has a better understanding =
correct me if this doesn't seem
> to work.
>=20
> Anyone has a better idea? Thanks!

Better idea: rewrite the entire bootstrap packaging (including every =
native component) and use
a ${STAGING_LIBDIR_NATIVE}/jvm/${JVM_IDENT} only. Properly deal with =
JAVA_HOME and PATH by having
some nice jvm-xy-native.bbclass

Best regards
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_0F41FAC8-F7DF-42A6-93C3-DC02B5674F81
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWisTXAAoJEESZlq7c5QqdYuIP/1XrxTN6FZ7a9WsPbPbTlO4t
QuMeRgNy/x8SlgSJOl67wwTbEVqQOFrlqTaMcXK+KigaIJGbNIBEPzLuBiqEFqgH
tjQLFP6QAYRk0bckIOcQtlIfcvR43MGj2rDQ7S8K8MXfTzoZWHqzzfjzhg82Z8ii
R9igv7BpakovUPjBxk2QShN4/I8V13UDVYfkywQ0/HwL9i7UUUkqJG/bBtSdqcC4
gUpIs1Sr3usMvTqJxS8G9PBaoqsPczKNM1WsebXD0UzY3t/vu3pO2bo3BPAs4MLl
A6xcAPiIeXhTU0g16ay9zrrwc7DOqq0iM+JJ5ToeYdU3XsiSypJfwSMVhpRUYgw4
eHfZL/jZEYvbjvKr1EdQoevhnH1Wym1bwy3Jou6B1ML/2lyFSJKY9uwsOIXAG7EI
LA5nxtbIFs1AesHOWQFW0voMYvffaRLX5LSj7ITGjx1K6Tz6zdHMb52zPIZ2aYGa
V9wMr1RC4cKRcXcadn3ghBsRYAfI8chqAxheH+zeigZTFngTiGa4cAxnliK6BRWr
H6mxIgm93C4hOOVLu2Es3PAXSAiJl8AmvpRt0GFPr+i/0uuao+SG47OjtokCt8/V
mwgjsJ+xpPZOEAVdIql8CX4nMiAxAATzR2Hrs+aJ/SL7PwOacCGPiboFEpUjugyu
4QdCiz0msq7SGtU14X4M
=7laY
-----END PGP SIGNATURE-----

--Apple-Mail=_0F41FAC8-F7DF-42A6-93C3-DC02B5674F81--
