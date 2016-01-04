Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5AB731B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 19:20:53 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id u188so2718838wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=WGnedt5XgQiRSWsxhVvThJB6DEKRZ2XHOKxYV2chBWI=;
	b=V0UkKTWTE5IWZxvi0ytiqJWYZBNr/z7OgtW/gM6ao2NFmSC4G0mEaxGiCaahbeA6pF
	ZgU1ylMGv2NrIpCGSpHTERaT86OPJ7EREMNfxUisF82x/5VMQG8DhYxR990tLHye4qRo
	04Tb2K+vCZcSreozR/SNUApHWs2VCm5lcdjGgUAWUG2E1kAa8OfmKp06e2VSqfTd0NtE
	sd4ty3DYr68UAuXpjNXp05qxtTGqkU2qqETH+zeM2BTNqRsS4QfvLfPcIjmS4m5rqDp+
	D74V3B5XEbGlTqsv2SacIzrET80fcWur42jSxhMyZRQFcUnp7pQVgB1QSl/7rGIGf+i2
	qJFw==
X-Received: by 10.194.11.66 with SMTP id o2mr110398866wjb.103.1451935253958;
	Mon, 04 Jan 2016 11:20:53 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id w23sm49587wmd.1.2016.01.04.11.20.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 11:20:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <cover.1450864063.git.jackie.huang@windriver.com>
Date: Mon, 4 Jan 2016 20:20:50 +0100
Message-Id: <0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native: fix do_install and PROVIDES
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
X-List-Received-Date: Mon, 04 Jan 2016 19:20:54 -0000
X-Groupsio-MsgNum: 59331
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC4358AD-54B4-411D-8792-294D5BA5D06D";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DC4358AD-54B4-411D-8792-294D5BA5D06D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

It's insane re-introducing a virtual/javac-native without understanding
the issues coming with that.

> Am 23.12.2015 um 11:03 schrieb jackie.huang@windriver.com:
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> I asked about this issue two days ago but no response, please =
carefully
> review and correct me if anyone have better understanding.

Please excuse when people enjoy their holidays around Christmas.

> My tests includes building openjdk7 and openjdk8 on qemux86-64
> with/without sstate cache.
>=20
> --
> The following changes since commit =
35739fca028996c594b1efa2225a77c8d6038193:
>=20
>  openjdk-8: Use zero mode on arm (2015-12-17 10:39:21 -0200)
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib.git jhuang0/d_jdk8-fix_151223_0
>  http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_jdk8-fix_151223_0=

>=20
> Jackie Huang (2):
>  Revert "meta-java: rely on well known bootstrap-path"
>  openjdk-8-native: fix improper do_install and PROVIDES
>=20
> README                                             | 12 ++++++++--
> classes/java-bootstrap-components.bbclass          |  7 ------
> classes/java-library.bbclass                       |  3 +--
> recipes-core/ant/ant-native_1.8.1.bb               |  2 +-
> recipes-core/antlr/antlr_2.7.7.bb                  |  2 +-
> recipes-core/cacao/cacao_1.6.1.bb                  |  6 ++---
> recipes-core/classpath/classpath.inc               |  4 ++--
> recipes-core/classpathx/gnujaf_1.1.1.bb            |  2 +-
> recipes-core/classpathx/gnumail_1.1.2.bb           |  2 +-
> recipes-core/classpathx/inetlib_1.1.1.bb           |  2 +-
> recipes-core/cup/cup_0.10k.bb                      |  2 +-
> recipes-core/ecj/ecj-bootstrap-native.bb           |  4 +++-
> recipes-core/ecj/libecj-bootstrap.inc              |  2 +-
> recipes-core/icedtea/icedtea7-native.inc           |  2 +-
> recipes-core/jacl/jacl_1.4.1.bb                    |  2 +-
> .../jakarta-commons/commons-logging_1.1.1.bb       |  2 --
> recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  2 --
> .../jakarta-libs/avalon-framework-api_4.3.bb       |  2 +-
> recipes-core/jakarta-libs/bsf_2.4.0.bb             |  2 +-
> recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  2 +-
> recipes-core/jakarta-libs/logkit_1.2.2.bb          |  2 +-
> recipes-core/jakarta-libs/oro_2.0.8.bb             |  2 +-
> recipes-core/jakarta-libs/poi_3.0.bb               |  2 +-
> recipes-core/jakarta-libs/regexp_1.5.bb            |  2 +-
> recipes-core/jamvm/jamvm.inc                       |  4 ++--
> recipes-core/jcraft/jsch_0.1.40.bb                 |  2 +-
> recipes-core/jcraft/jzlib_1.0.7.bb                 |  2 +-
> recipes-core/jdepend/jdepend_2.9.1.bb              |  2 +-
> recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
> recipes-core/junit/junit4_4.3.1.bb                 |  4 +++-
> recipes-core/junit/junit_3.8.2.bb                  |  2 +-
> recipes-core/openjdk/openjdk-8-native.inc          | 13 +++++------
> recipes-core/openjdk/openjdk-8-native_72b05.bb     | 26 =
----------------------
> recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
> recipes-core/servlet-api/servlet2.3_4.1.37.bb      |  4 +++-
> recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  2 ++
> recipes-core/xalan-j/xalan-j_2.7.1.bb              |  2 +-
> recipes-core/xerces-j/xerces-j_2.11.0.bb           |  6 ++---
> recipes-core/xml-commons/jaxp1.3_1.4.01.bb         |  4 +++-
> .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  6 ++---
> recipes-core/xml-commons/xpp2_2.1.10.bb            |  2 ++
> recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         |  2 ++
> 42 files changed, 69 insertions(+), 90 deletions(-)
> delete mode 100644 classes/java-bootstrap-components.bbclass
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_DC4358AD-54B4-411D-8792-294D5BA5D06D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWisYSAAoJEESZlq7c5Qqd0qIQAK7n8RgMK6+6Rkp1Iv/QHMxv
hMdo9GPB0Vn+Cse3cYHJ/IZ6QXWmHUjcSjA/L1JNwsGoBhURzF+I71Px2/0GCGRO
JXDkxZWCTkMVRzSoJW9s6hVp67UX4YaIIa0mMBmq7n5KriBEia89PGwg3CrCzgzl
p19E1ZU7oy/vt2VQQD+0UpTxGwfKDFEi4m2zrJnCA24gh7reDgi9epQdejdV7HNP
azGEQtWlEvtf+UbeX2Iiqt//JHQzibcgIsVuBQNN3kFnGpWHSvXWZjl23ZvzORAo
6hCfPESI/Y9s73ke5dJPHT7UrNZy9mHoaPiU4CxM+WZMzqkz3AZOBfA6JKDow173
iDNdjsqBUUHoWVepbvH/GOTDa8zpKYxJqW6ojhaa/v/RN0LP3FQL1+dT4zcEqbfg
bKHW/4OMrjC7VK3yCbpRVMdFTieaOWxdVvwwO8Tq93el+uNbAGsSBwI8E0mz0xkX
zKGfMeFjd/IECTWcA17Sou1tL5IxVsCnk3lKcM2aQigqhaulRvMSrsbINTIwRK/f
/EaaeC6rLn6T+93KxDDHEJbyqEkT/yZ/uCzPvyCNkW+CDYfGDRAX/PWEviUIGdOZ
4kbz269Bv5FZ97lSYOB7Tzx/CAFkBS+ddT/YUVM6o4uLjLuD4aZDIPHx54VE6tyB
ZXGXWcBD0M/ik7aMV2v7
=UUEy
-----END PGP SIGNATURE-----

--Apple-Mail=_DC4358AD-54B4-411D-8792-294D5BA5D06D--
