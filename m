Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EE2E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 17:42:05 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.134743.1734630124713901228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 09:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKBq+VU7;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71e2aa8d5e3so524422a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734630124; x=1735234924; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5nwGhZ0UZJHNSQ4QOIPI1OpXofx9uxbf5MIW8mwJFg=;
        b=ZKBq+VU7WrZS2tJeju/WY0OtyU/gaIwHxpTzpN65oJnT3pGqZsbIV4qvAZDpAmsVSX
         H2CekmaEJjN1ImdLc9HHv3ok10sFPSacKMAl/w9SGYH+MX4AOIAp5XlIjUa27zHrv1HO
         2eUuUrS3/3B4wq+HDp1wO7uF+Qd2zqzJ3XP7yev81Zb+BvHp0d1kx2T4Qr0PuM8rz2NQ
         UsD9fRMx/3c5AP/pZ8otGwtohy1TIUKmJGlQjaWoTSoQmNKEIEZkbysZPbLRprJ1o0k0
         gZMMWMLzNidhf5GMhHt4jlPdVMyZPNHuWME/0Vu4jKPygEBxY1E82JioxswFdLLwJWAv
         sZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630124; x=1735234924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5nwGhZ0UZJHNSQ4QOIPI1OpXofx9uxbf5MIW8mwJFg=;
        b=VCCso6P2NTxfJJbK8bGkWvdMBAtzkZLTBlpxGlexZbEKQ1ZXUU0FVyJRRKrTBVWf93
         XmolwZDfxy8DRrar49WbWuQdhHug5HQyquNnH7tDXnvil0b+7phowQK8Y7RO5gdk2OIE
         fcnEPK8MgSv8EyRYqjmfhz+OMcH718oxuVpIAEiteojMeKMS+Q81zy6YiEYs6KRkI3G8
         0nGiREytCl8YUMknvYog00Veb43703llikFj6mnxpDW1fFsZAyl57uZyiHTpDcjzzKCA
         GtT0Ar/7WaICe3gx8U8LwzjqCUxYNXnJ5T/2dxuotmxI2xX4Q+CFjFGzdGrw7ADJqDAu
         EoYw==
X-Gm-Message-State: AOJu0Yy/bwc1ZrvmzRr9gWM8J2Nu/iyAscj0B/BcwO0FLpYedMiSOyhy
	2edciWXUjBt7hbMBihJsaiSWfBGYcewPmY7zkN3Xd1TWXrgaCuon7h0cyQ2+joy50kG7+pmWbsm
	BaHRV6uJewmbJ0Hu4xKjnk4gu6/Y=
X-Gm-Gg: ASbGncs2/qWvXFPo9v3y0oskMDATJmeI7AYsayLsH8ZfmEtzzqwyM+6WiZcHYYT8j14
	eGalETFdIzYr6FiLZDSmbbZsqlOoQZyol9unL
X-Google-Smtp-Source: AGHT+IER/z4MXcu2miUNo9o0YudqOOSuIYkaWe4+y58QuvKWtthHBqCGWmjrAYIppMWgIExfe4+pOLIbqsW+nFAFfrA=
X-Received: by 2002:a05:6871:d083:b0:29f:9554:9b94 with SMTP id
 586e51a60fabf-2a7b31850c1mr4377418fac.18.1734630123640; Thu, 19 Dec 2024
 09:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20241216114349.125642-1-miroslav.nagy@siemens.com> <AS1PR10MB569793D31A8537F39634F9C4FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569793D31A8537F39634F9C4FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Dec 2024 09:41:37 -0800
Message-ID: <CAMKF1spvc9YjN570YtRVff0NbDzTx7zy0BRDQEOd922H+4D18Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] 7-zip: add new recipe
To: peter.marko@siemens.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Nagy, Miroslav" <miroslav.nagy@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 17:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114400

On Thu, Dec 19, 2024 at 8:38=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Please drop this patch.
> The newer patch from Hongxu Jia adds the same component under different r=
ecipe name and is more feature-rich.
>

Thanks for letting us know

> Peter
>
> > -----Original Message-----
> > From: Nagy, Miroslav (FT D EU SK BFS1) <miroslav.nagy@siemens.com>
> > Sent: Monday, December 16, 2024 12:44
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Nagy, Miroslav (FT D EU SK BFS1) <miroslav.nagy@siemens.com>; Marko=
,
> > Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [meta-oe][PATCH] 7-zip: add new recipe
> >
> > From: Miroslav Nagy <miroslav.nagy@siemens.com>
> >
> > This recipe should eventually replace p7zip recipe.
> > p7zip is very old and not updated with unfixed security vulnerabilities=
.
> > Using real upstream package should solve this.
> >
> > Signed-off-by: Miroslav Nagy <miroslav.nagy@siemens.com>
> > Reviewed-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta-oe/recipes-extended/7-zip/7-zip_24.09.bb | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
> >
> > diff --git a/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb b/meta-oe/re=
cipes-
> > extended/7-zip/7-zip_24.09.bb
> > new file mode 100644
> > index 000000000..6e8d0ba77
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/7-zip/7-zip_24.09.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY =3D "7-Zip is a file archiver with a high compression ratio."
> > +HOMEPAGE =3D "https://www.7-zip.org"
> > +LICENSE =3D "LGPL-2.1-or-later & BSD-3-Clause & unRAR"
> > +LIC_FILES_CHKSUM =3D
> > "file://DOC/copying.txt;md5=3Db0d181292c99cf9bb2ae9166dd3a0239 \
> > +
> > file://DOC/unRarLicense.txt;md5=3D9c87ddde469ef94aed153b0951d088de \
> > +                    file://DOC/License.txt;md5=3D8bfe22e0285a3043b61ea=
408d234c55d"
> > +CVE_PRODUCT =3D "7-zip 7zip"
> > +
> > +PV_WITHOUT_DOT =3D "${@d.getVar('PV').replace('.', '')}"
> > +
> > +SRC_URI =3D "https://www.7-zip.org/a/7z${PV_WITHOUT_DOT}-
> > src.tar.xz;subdir=3D${BP}"
> > +SRC_URI[sha256sum] =3D
> > "49c05169f49572c1128453579af1632a952409ced028259381dac30726b6133a"
> > +
> > +B =3D "${WORKDIR}/build"
> > +
> > +EXTRA_OEMAKE +=3D 'LDFLAGS=3D"${LDFLAGS}" LFLAGS_STRIP=3D"" O=3D"${B}"=
'
> > +
> > +do_compile() {
> > +    cd ${S}/CPP/7zip/Bundles/Alone2
> > +    oe_runmake --file makefile.gcc
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 0755 ${B}/7zz ${D}${bindir}/7zz
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114399): https://lists.openembedded.org/g/openembedde=
d-devel/message/114399
> Mute This Topic: https://lists.openembedded.org/mt/110142798/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

