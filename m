Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0C7601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jan 2015 03:21:47 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so22128034pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=3zIaI8tTf2JiPZPNdARF3TPsTJJ1ZzBF40kde7qABsE=;
	b=AxJOtP7euTBL9sPMil0V2wQdtJAs/WzRGWhGqRm5rlmO9oLAtP979CYUKOQ3XYFkLn
	aZMTSd590OH0ZCzFRVv6Ed9qiT6E+OwizCnU9QjVfj+9twLksDVZzbn0O7Yl2zZknxXQ
	BEji0iQ2EXCvhCETrvogOGK2YqNoCIXy14Rj/QiEYJ9hPuwpGPrjLsHgahfiFBss6zZT
	nx8Mdjgdexrf5x1m0iu6NVNUSTn612MlD4f1sKs/W7yZvYztnj6ZgerAI7c+bB9cvlI3
	i5b1e+xwpXburEgflqDM8/Sjvmqlg0XyYCaykJX2qc7g756lV3ROrjd64zb6V4+bquv7
	j1QQ==
X-Received: by 10.70.103.238 with SMTP id fz14mr95828261pdb.79.1420082508126; 
	Wed, 31 Dec 2014 19:21:48 -0800 (PST)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	d14sm42510527pdj.46.2014.12.31.19.21.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 19:21:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1419367619-3158-1-git-send-email-philip@balister.org>
Date: Wed, 31 Dec 2014 19:21:46 -0800
Message-Id: <CFBF5656-FBFD-4DC0-97FE-1A8E7105DBB3@gmail.com>
References: <1419367619-3158-1-git-send-email-philip@balister.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-oe][PATCH] log4cpp : Add new recipe.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jan 2015 03:21:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 23, 2014, at 12:46 PM, Philip Balister <philip@balister.org> =
wrote:
>=20
> Built for armv7a basad machine.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb | 23 =
+++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
>=20
> diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb =
b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
> new file mode 100644
> index 0000000..1e0a44c
> --- /dev/null
> +++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "A library of C++ classes for flexible logging to =
files, syslog, IDSA and other destinations."
> +HOMEPAGE =3D "http://sourceforge.net/projects/log4cpp/"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e34"
> +
> +SRC_URI[md5sum] =3D "1e173df8ee97205f412ff84aa93b8fbe"
> +SRC_URI[sha256sum] =3D =
"35abf332630a6809c969276b1d60b90c81a95daf24c86cfd7866ffef72f9bed0"
> +
> +SRC_URI =3D =
"http://downloads.sourceforge.net/log4cpp/log4cpp-${PV}.tar.gz \
> +          "
> +
> +S=3D"${WORKDIR}/log4cpp=E2=80=9D

may be spaces on both sides of =3D

> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "\
> +    --enable-doxygen=3Dno \
> +    --enable-dot=3Dno \
> +    --enable-html-docs=3Dno \
> +    --enable-latex-docs=3Dno \

may be use CACHED_CONFIGUREVARS to specify these

> +    LDFLAGS=3D-lpthread \

this could be an independent assignment

LDFLAGS +=3D =E2=80=9C-pthread=E2=80=9D no -l there gcc should
take care of it.

> +"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


