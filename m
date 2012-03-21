Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAMYN-0000ZB-GT
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 15:30:19 +0100
Received: by wera1 with SMTP id a1so987161wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=OiOaXwg2HwOv+J/d71B1uavbvu7sU+iXbH2eFgmwPpw=;
	b=JhRQ6oZ+7HE5nQ28bkKVyO89ALP2bO2QMxJmXtLbvUq0XfUO+xB5g3TSXjU+/KWoKu
	5OMwywcsHitBK+igMTLHxyl9PT64h/JB3sRg3fXiVg/18K3eAHQaKolgDj3uFgFPqGLw
	j2zPY6/Bj+PbL4uGxE0nFxdOIIJLjgLpSxZPi+3Kos7MOBDwWxJoReZiNFBOOPgWr3my
	SelYDxHAiEPB/cBFHodC6GFq1Qtrd1RroQAG7iSZY4aDifDf0PUyDbgiN76KOi9Vg/DI
	GimoO31+eeqVOECzY2kaTKfMscoClojCudZwgzX1GXlbSf0EHLWhWNDru09/5+YwsJ/T
	KkAg==
MIME-Version: 1.0
Received: by 10.180.101.72 with SMTP id fe8mr9608795wib.4.1332339685848; Wed,
	21 Mar 2012 07:21:25 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Wed, 21 Mar 2012 07:21:25 -0700 (PDT)
In-Reply-To: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 21 Mar 2012 15:21:25 +0100
Message-ID: <CAGiJk9dVLGRqMXatZp4bwn=L0X-ogQ4J9jawNhviaWMEHW487w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 14:30:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Seems like my commit message got lost sorry,
this was requested from a tester of meta-kde who doesn't use meta-openembed=
ded.

2012/3/21 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> =C2=A0meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb | =C2=A0 20 -------=
-------------
> =C2=A01 files changed, 0 insertions(+), 20 deletions(-)
> =C2=A0delete mode 100644 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
>
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/re=
cipes-devtools/giflib/giflib_4.1.6.bb
> deleted file mode 100644
> index bd7b495..0000000
> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "shared library for GIF images"
> -SECTION =3D "libs"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2917be39b11f78d715=
19a"
> -PR =3D "r2"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> -
> -inherit autotools
> -
> -DEPENDS =3D "libsm"
> -
> -PACKAGES +=3D "${PN}-utils"
> -FILES_${PN} =3D "${libdir}/libgif.so.*"
> -FILES_${PN}-utils =3D "${bindir}"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -SRC_URI[md5sum] =3D "7125644155ae6ad33dbc9fc15a14735f"
> -SRC_URI[sha256sum] =3D "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d22=
85e8e1f3b93f2bed"
> --
> 1.7.5.4
>



--=20
Regards
Samuel


