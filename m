Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD17C7EDF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:42:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x21so13140724qto.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x4Hz/xwAHoKELUURj9hQQRo7LKTO3BV1oCR6vlY+AUE=;
	b=sr9B8S3Qvl62lWtUehKTwmHQs6fyy3CaK8vAeDIcQ1wHC5yeK9jxnK3W9Cus/LrtC3
	qDz1YEjtgQAvcewAFRzFF7dO1xIScvGpatxO2aE6XxUEuW/TvJArPAXFHHEUKPk3G2wQ
	CXL2jqH8q+yLleyrQ0gUCM311s9NJNpfPOMjXo2/ka74s/mBuTmFNt0OByJ4MORnnJTq
	3pu8H8f7EE4AJ4n0AZzx0rhE6s8u+gFrhbvJ71WKunCdWnEPTNc9VrGb1TgT+3Xkt6Iv
	e/8emLNt6hDXZrloKonAt3hFbJJvCOI2AOl8QhuzOO3V5xtg40kGf9xWuN6lR53Cd3RD
	/Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x4Hz/xwAHoKELUURj9hQQRo7LKTO3BV1oCR6vlY+AUE=;
	b=KtADZIv+K1TAKYxEAhZ21SfQUYxIeMyr2joVKyIZ+HG59vhYcYXChamhxyrEKoSdty
	br9nLk5EDOmg0eLararPYhi5C7JKBFBoajIAm6Ku/z/pc7e97mJkRstNZV1GACwx1ugI
	mDeieAkSiqCn7ayICnx8kN7wqeZjJ3u8Z8Y593ui5OC2QLw+usxaHKdKAqgquoZv3HkK
	zSdFvLoSxnmmntJ5JAUfLkm665gtBWMwmLEaa3SHpHLg9IoqzVi+8D2UaEPTViEkHNQn
	A7YwFROTsKA6LIrIqaRhFaY7Kq4HiXauNI1f0COZh9dpguI3rd3OB6Niilah0kKYJqRe
	U+8g==
X-Gm-Message-State: APjAAAUU6jQ7uJ2kUzMIES228UANp4sirjw15uPtX9oRat7vdJKeTO7u
	Pjui11sRw/kcURY41K9e4lQUKgy/hn1fypeqxNs=
X-Google-Smtp-Source: APXvYqxmSSo4MBTe2olVjRJ+2ND58sU6aa3mQmijNsgIzH5VCDcqXGDVCfOm+5aTn+dwitwSXpwJLpFYgo8t1kEkpVU=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr10326427qvy.109.1572619326280; 
	Fri, 01 Nov 2019 07:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <1572607459-67246-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1sqngtqVNPer5oytnH7xe1xGGJ7FLaz6GGz_BWzdhmojUg@mail.gmail.com>
In-Reply-To: <CAMKF1sqngtqVNPer5oytnH7xe1xGGJ7FLaz6GGz_BWzdhmojUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 07:41:39 -0700
Message-ID: <CAMKF1sqT0UeQH-C5A_ky1FfBrtT-s80O-hhTAp+kXU0tYSuCWg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iwd: upgrade 0.20 -> 0.23
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
X-List-Received-Date: Fri, 01 Nov 2019 14:42:06 -0000
Content-Type: text/plain; charset="UTF-8"

Oh hang on thats not this patch

On Fri, Nov 1, 2019 at 7:39 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails on musl
>
> https://errors.yoctoproject.org/Errors/Details/275171/
>
> On Fri, Nov 1, 2019 at 12:45 AM Zheng Ruoqin
> <zhengrq.fnst@cn.fujitsu.com> wrote:
> >
> > 1) Add DEPEND python-docutils-native to generate manual pages.
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-connectivity/iwd/{iwd_0.20.bb => iwd_0.23.bb} (87%)
> >
> > diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> > similarity index 87%
> > rename from meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
> > rename to meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> > index 4220503..d48fb84 100644
> > --- a/meta-oe/recipes-connectivity/iwd/iwd_0.20.bb
> > +++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
> > @@ -2,12 +2,12 @@ DESCRIPTION = "Wireless daemon for Linux"
> >  LICENSE = "LGPL-2.1"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> >
> > -inherit autotools pkgconfig systemd
> > +inherit autotools pkgconfig systemd pythonnative
> >
> > -DEPENDS = "ell readline dbus"
> > +DEPENDS = "ell readline dbus python-docutils-native"
> >
> >  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
> > -SRCREV = "00f0039232cc73bbcf7a1875f8f9aae464d90a8f"
> > +SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
> >  S = "${WORKDIR}/git"
> >
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

