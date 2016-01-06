Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4086660767
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 13:57:03 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u188so61059869wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=HlpSTwUpOnwv3TaNzoAhnavgj4B2cJwF/E2G0bh9m80=;
	b=wEIjsHeYBSxm9L/fV7kF2FwCwo9CHPk7C46GuT7JLDzTA7mGraRTuXn9lQFxh2mj7t
	sGHC5gk0auk7SR0PAnWpaYJX1CNe/X2ggs7TIF4ZGws3y1lA8l3pRC2bQiYoe079nfK9
	N1Wto7P095jVMuugQkrvtMe9V52sXZcvgPqIid8AZp1R7GTZfU/YO3eUqqEMAikyRSaz
	QdW+za6j1za2xm7mDPRKcI7CiVOjg6JBNNrzZWiRuiANRQ2391RjsPPlUHFvah0VX8XE
	euwQVqRf3qAcjojK7TAv1+QjCv5Eboxtzbs2YkdPmA+AFyD/GlRWafB2pp4uJhp+tahh
	7hvQ==
X-Received: by 10.194.209.129 with SMTP id mm1mr70307059wjc.47.1452088624236; 
	Wed, 06 Jan 2016 05:57:04 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	w8sm52307389wjx.21.2016.01.06.05.57.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 05:57:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
Date: Wed, 6 Jan 2016 14:56:58 +0100
Message-Id: <9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native: fix do_install	and PROVIDES
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
X-List-Received-Date: Wed, 06 Jan 2016 13:57:04 -0000
X-Groupsio-MsgNum: 59384
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F60EA778-D1B1-4D2A-9A6D-14768BD6F675";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F60EA778-D1B1-4D2A-9A6D-14768BD6F675
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>> Sent: Tuesday, January 05, 2016 3:21 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>=20
>> It's insane re-introducing a virtual/javac-native without =
understanding
>> the issues coming with that.
>=20
> Please carefully review the patches before saying insane, I don't =
think it was
> correct to remove virtual/javac-native since there are several =
providers.

What does virtual/javac-native mean? Correctly, there can be several =
providers.

How many of them can you have in one sysroot/build? One.

So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE =
virtual/javac-native,
what happens?

It is insane to have multiple providers for the same virtual/foo when at =
least a bunch
of them are required to finish a particular build.

> Thanks,
> Jackie

You're welcome,
Jens

>>=20
>>> Am 23.12.2015 um 11:03 schrieb jackie.huang@windriver.com:
>>>=20
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>=20
>>> I asked about this issue two days ago but no response, please =
carefully
>>> review and correct me if anyone have better understanding.
>>=20
>> Please excuse when people enjoy their holidays around Christmas.
>>=20
>>> My tests includes building openjdk7 and openjdk8 on qemux86-64
>>> with/without sstate cache.
>>>=20
>>> --
>>> The following changes since commit =
35739fca028996c594b1efa2225a77c8d6038193:
>>>=20
>>> openjdk-8: Use zero mode on arm (2015-12-17 10:39:21 -0200)
>>>=20
>>> are available in the git repository at:
>>>=20
>>> git://git.pokylinux.org/poky-contrib.git jhuang0/d_jdk8-fix_151223_0
>>> =
http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_jdk8-fix_151223_0
>>>=20
>>> Jackie Huang (2):
>>> Revert "meta-java: rely on well known bootstrap-path"
>>> openjdk-8-native: fix improper do_install and PROVIDES
>>>=20
>>> README                                             | 12 ++++++++--
>>> classes/java-bootstrap-components.bbclass          |  7 ------
>>> classes/java-library.bbclass                       |  3 +--
>>> recipes-core/ant/ant-native_1.8.1.bb               |  2 +-
>>> recipes-core/antlr/antlr_2.7.7.bb                  |  2 +-
>>> recipes-core/cacao/cacao_1.6.1.bb                  |  6 ++---
>>> recipes-core/classpath/classpath.inc               |  4 ++--
>>> recipes-core/classpathx/gnujaf_1.1.1.bb            |  2 +-
>>> recipes-core/classpathx/gnumail_1.1.2.bb           |  2 +-
>>> recipes-core/classpathx/inetlib_1.1.1.bb           |  2 +-
>>> recipes-core/cup/cup_0.10k.bb                      |  2 +-
>>> recipes-core/ecj/ecj-bootstrap-native.bb           |  4 +++-
>>> recipes-core/ecj/libecj-bootstrap.inc              |  2 +-
>>> recipes-core/icedtea/icedtea7-native.inc           |  2 +-
>>> recipes-core/jacl/jacl_1.4.1.bb                    |  2 +-
>>> .../jakarta-commons/commons-logging_1.1.1.bb       |  2 --
>>> recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  2 --
>>> .../jakarta-libs/avalon-framework-api_4.3.bb       |  2 +-
>>> recipes-core/jakarta-libs/bsf_2.4.0.bb             |  2 +-
>>> recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  2 +-
>>> recipes-core/jakarta-libs/logkit_1.2.2.bb          |  2 +-
>>> recipes-core/jakarta-libs/oro_2.0.8.bb             |  2 +-
>>> recipes-core/jakarta-libs/poi_3.0.bb               |  2 +-
>>> recipes-core/jakarta-libs/regexp_1.5.bb            |  2 +-
>>> recipes-core/jamvm/jamvm.inc                       |  4 ++--
>>> recipes-core/jcraft/jsch_0.1.40.bb                 |  2 +-
>>> recipes-core/jcraft/jzlib_1.0.7.bb                 |  2 +-
>>> recipes-core/jdepend/jdepend_2.9.1.bb              |  2 +-
>>> recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
>>> recipes-core/junit/junit4_4.3.1.bb                 |  4 +++-
>>> recipes-core/junit/junit_3.8.2.bb                  |  2 +-
>>> recipes-core/openjdk/openjdk-8-native.inc          | 13 +++++------
>>> recipes-core/openjdk/openjdk-8-native_72b05.bb     | 26 =
----------------------
>>> recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
>>> recipes-core/servlet-api/servlet2.3_4.1.37.bb      |  4 +++-
>>> recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  2 ++
>>> recipes-core/xalan-j/xalan-j_2.7.1.bb              |  2 +-
>>> recipes-core/xerces-j/xerces-j_2.11.0.bb           |  6 ++---
>>> recipes-core/xml-commons/jaxp1.3_1.4.01.bb         |  4 +++-
>>> .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  6 ++---
>>> recipes-core/xml-commons/xpp2_2.1.10.bb            |  2 ++
>>> recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         |  2 ++
>>> 42 files changed, 69 insertions(+), 90 deletions(-)
>>> delete mode 100644 classes/java-bootstrap-components.bbclass
>>>=20
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>> --
>> Jens Rehsack - rehsack@gmail.com
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F60EA778-D1B1-4D2A-9A6D-14768BD6F675
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWjR0qAAoJEESZlq7c5Qqdv1cQAKemxwrSqvU/DTltRLTYR46E
cWR8vPW/iZcLeoaolI41sJB6bMTFAjLQ+8y9jXagDPqMPkyIrLxMWT0PGQQcXI7i
86DHxo+B8UldM4IM32nWQEBUF7LVGRnLlwF/lRmrHnw/5XI/7FGuysbb4PMpTo1b
2694gWDdUxBQ3MqXM4B+DT8vV32ifZ2kJjsZsjYRd+ka4pdfjMDJIChzWNEdrf8f
ddh/O8lR76FwamHX/wWFB0ErhtaBYHnlmFVGcLFRVJHNy7mDlLyqGux5p8DbB3jN
rTV1ZEooRwtsWnjRbI9RvQ3P33J3urvLJo12drBKaJDpH3Ms8dSij07JldQDbIQN
t3zneN483gyoVlIU8xskfkfuLbG573fo1RujBHgp5wSxDbdeTGgD7uvevNKlo79+
13MGqkfH64EWddEUCqBbMJMfIxAfvavKKLXSp7SAk0wmyDmfZbE5oBbAPt/02Iio
5z2IE25yuxpJXkURBGQG5sj2HyMyqpKuYLA/XsFVQcCDcCS/KfW1bb1ZQjrPlCdB
/SitoQdOQAWi71dCdpZ1B1fWrXL79jyZ2Oeyl0AZEkeDG5MDxSj3w9AdaUFGioVe
p1JaGjNVpPELN0PEXTqvGj2QFPvaVELc4/hMgd4fBadaZYx4iF65gWCIdBOFFzXG
+v1xwREM6HMoTJfQqt25
=aISz
-----END PGP SIGNATURE-----

--Apple-Mail=_F60EA778-D1B1-4D2A-9A6D-14768BD6F675--
