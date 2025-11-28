Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3985BD116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 22:27:52 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5126.1764368866222201210
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 14:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=UCR3W5uS;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764368864; x=1764973664; i=jan.claussen10@web.de;
	bh=9NY66WsCzJ/KOWLQNDuhH2ENQIn10GHyHN0n4C9h+Pw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:To:Subject:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UCR3W5uSU2sFQToL3sAms/cUT1gurnwdoZF+QJAQgVX3g1L4prTj+Dls7HutyWMz
	 elK86D7so1giI+TjIr1yqC3pNtttTxfpmx7JfLvk8lSx+8WSuZwMPZTtHUFHrMbpY
	 oI6tUpuzBbJR6Hx6ueNslkbgEvWhRV7bVyPxmYSzdjEo9g7iEUlx2/2Wcw4OEDkPI
	 NqYpAO3oCnOqY79mJ19B+t+XUFlMfRdMcG4pC7uAoeue+MEkeSaI5oyZQJ+/TToa2
	 Q7bzkOWoqAQ9grpF8TBkKqq/rPzq8gjpoUjWBXEo0UJme6UgFdUuCg2sy7FulT9gb
	 tONHJWUA2tBZEDqahg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.184.20] ([192.196.196.197]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1vk6m40rEa-00QZKN; Fri, 28
 Nov 2025 23:27:44 +0100
Message-ID: <c7ac67c0-8a3b-4feb-8bd0-b3a77ae4d279@web.de>
Date: Fri, 28 Nov 2025 23:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: jan.claussen10@web.de
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Martin Jansa <martin.jansa@gmail.com>, raj.khem@gmail.com,
 openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][master][PATCH] python3-soundcard: Add recipe
References: <20251128115800.2757259-1-jan.claussen10@web.de>
 <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
 <CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=pv+jzkbW8w@mail.gmail.com>
 <35b21d06-11cb-4327-a80b-4ebeffdbad0d@web.de>
In-Reply-To: <35b21d06-11cb-4327-a80b-4ebeffdbad0d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AMU+2Xiriy/KXJmcmHRrNW/QdJOQTabVBiUBHVabapLZN2H8Ecp
 rp1OGHGi/+lBHQU3J/9Nv3JdFNa6JZcpJkKq8bCesdKaMiMzdMn1bVj2qXfzO5y3inkSkH1
 SxQ1p+bkkmJ7mFRkb6MrIA2jGbbjQ8eyJYnPzvVSQYEfQaRNRSlI65lVItJDBrTbqlYMt5u
 JweYPgox6B696CTHHGtdw==
UI-OutboundReport: notjunk:1;M01:P0:8Fo9rQeFsmA=;kAAiTrIRtZmu2QrW+bIfIQmiWAP
 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
 OdjZn9no=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 22:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122154

I added a longer DESCRIPTION, HOMEPAGE and added SECTION =3D "devel/python=
".=20

=2D--

SoundCard is a library for playing and recording audio without resorting t=
o a CPython extension.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 .../python/python3-soundcard_0.4.5.bb         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_=
0.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
new file mode 100644
index 0000000000..5116892dad
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Python library for accessing soundcards"
+DESCRIPTION =3D "SoundCard is a library for playing and recording audio w=
ithout resorting to a CPython extension"
+HOMEPAGE =3D "https://github.com/bastibe/SoundCard"
+SECTION =3D "devel/python"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b04=
2c"
+
+SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08=
f54b832a56946aa"
+
+inherit pypi setuptools3 features_check
+
+REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
+
+RDEPENDS:${PN} +=3D " \
+    libpulse \
+    pulseaudio-server \
+    python3-cffi \
+    python3-numpy \
+"
=2D-=20
2.52.0

On 28.11.25 21:27, Jan Clau=C3=9Fen <jan.claussen10@web.de> wrote:
> @Martin: Thanks, for pointing that out
>=20
> I fixed the recipe added inherit features_check. Should maybe also add a=
=20
> meaningful commit message, but I didn't know what to add.
>=20
>=20
> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
>  =C2=A0.../python/python3-soundcard_0.4.5.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 ++++++++++++++++
>  =C2=A01 file changed, 16 insertions(+)
>  =C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-=
=20
> soundcard_0.4.5.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-=20
> soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/python3-=20
> soundcard_0.4.5.bb
> new file mode 100644
> index 0000000000..e25f13a116
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Python library for accessing soundcards"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b=
042c"
> +
> +SRC_URI[sha256sum] =3D=20
> "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
> +
> +inherit pypi setuptools3 features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> +
> +RDEPENDS:${PN} +=3D " \
> +=C2=A0 =C2=A0 libpulse \
> +=C2=A0 =C2=A0 pulseaudio-server \
> +=C2=A0 =C2=A0 python3-cffi \
> +=C2=A0 =C2=A0 python3-numpy \
> +"
> --=20
> 2.52.0
>=20
> Am 28.11.25 um 21:18 schrieb Martin Jansa:
> > And REQUIRED_DISTRO_FEATURES =3D "pulseaudio" probably doesn't do
> > anything without features_check inherit
> >
> > On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via lists.openembedde=
d.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >> results in
> >>
> >> ERROR: ParseError at /mnt/b/yoe/master/sources/meta-openembedded/meta=
-python/recipes-devtools/python/python3-soundcard_0.4.5.bb:13: Unparsed li=
nes /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtoo=
ls/python/python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libp=
ulse ']
> >> ERROR: Parsing halted due to errors, see error messages above
> >>
> >>
> >> On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via lists.op=
enembedded.org<jan.claussen10=3Dweb.de@lists.openembedded.org> wrote:
> >>> Signed-off-by: Jan Clau=C3=9Fen<jan.claussen10@web.de>
> >>> ---
> >>>   .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++=
++++
> >>>   1 file changed, 12 insertions(+)
> >>>   create mode 100644 meta-python/recipes-devtools/python/python3-sou=
ndcard_0.4.5.bb
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0=
.4.5.bb b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> >>> new file mode 100644
> >>> index 0000000000..632b54eaef
> >>> --- /dev/null
> >>> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> >>> @@ -0,0 +1,12 @@
> >>> +SUMMARY =3D "Python library for accessing soundcards"
> >>> +LICENSE =3D "BSD-3-Clause"
> >>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3De39df1540c06c17ca310ce87c=
36b042c"
> >>> +
> >>> +SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c=
7d2e08f54b832a56946aa"
> >>> +
> >>> +inherit pypi setuptools3
> >>> +
> >>> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> >>> +
> >>> +RDEPENDS:${PN} +=3D " \
> >>> +    libpulse \
> >>> +    pulseaudio-server \
> >>> +    python3-cffi \
> >>> +    python3-numpy \
> >>> +"
> >>
> >>> --
> >>> 2.52.0
> >>>
> >>>
> >>>
> >>>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#122127):https://lists.openembedded.org/g/openembe=
dded-devel/message/122127
> >> Mute This Topic:https://lists.openembedded.org/mt/116512050/3617156
> >> Group Owner:openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub=
 [martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>=20

