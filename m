Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 435A9793BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 18:48:55 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id q12-v6so3671022qkl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iLkSlpzWcHWOKgfliYYp/WqVH/OuIVPQhfRJIKNNP8A=;
	b=qZ+ZZF9d2p0n+zSbWdbdBFF4n/i44K3zhFxHZooSIakisZIe4g5fIq2i3SdJvL3uvz
	e9D+Tg90anAlDij6o+CpVtnMO5d9wmuRwFSpbfATstFu91IRcviF0k6QSNEvO8u6D+jJ
	oXkB58adIt5M601K4KcRZQp6P3IDp1RTIfW/uebyJwxz4NKpNx7GvuAQRS2mpRep/DY7
	bWo0ZEe4stU9AgVN7Ln+2oLh+ELSXu48TmG+/CTKyLkVuA8WMxBgpOM3x5o9abjTWbe5
	QjJWjrKe0pxqr4x4cxd+8TZUk1771Un+rwo+derONrdT1VvjwdWzPrYXEVodSIs03S8N
	hpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iLkSlpzWcHWOKgfliYYp/WqVH/OuIVPQhfRJIKNNP8A=;
	b=e5ZjwiH5PmACCtEvHJOIP7BOzuft8W8YfuU+nQU2lHq0QaMT2u0QiOHuYrdGHp9qIH
	RVT06MoEExw/76FlYRWXVzERMvm5NKqvGsYhNHwu88kCpweQXU6jZMQPVh4hV+3eCvV+
	pvvv9gT2lah83jHS9UBqfmDlZDAt+odx5O7vNIc6uPgINgIL/0/HFzCV/ZppGNEDhL/r
	+X64VY3w2ItUjYX9JENSc5JpEocirOK1J1SkrlCYsLiOdksmsBDtisv8ULOpQFCTudA9
	qrtuMgthBcSygTQER51GSM/E1jtvBCKlRMkfIvgARdIl4z3Euhc8sUXBxK429PRdJzST
	nsOg==
X-Gm-Message-State: ABuFfoiZpAQZTjA/vi8ChY60vwbutrJrzYr/RV/PUJeGgTG4lykOi73Y
	4MM/PEGfN64Nx705E+5PqyQMHPbVQwwxj7y00FKoiQ==
X-Google-Smtp-Source: ACcGV63o/PojpyEZWKEZUWoR+93++X5ydEgBQce1F4Uvl7cd70I0Mdlnpb0VNRCXJhcY6pClB5FLZD5lXCHOAdfice0=
X-Received: by 2002:a37:3086:: with SMTP id
	w128-v6mr90988qkw.315.1537814935932; 
	Mon, 24 Sep 2018 11:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <1537510551-128643-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spt0HYHxVTTGgerYxR6LgqbhDx4Jeqfd0MbMpuzmtbB0A@mail.gmail.com>
In-Reply-To: <CAMKF1spt0HYHxVTTGgerYxR6LgqbhDx4Jeqfd0MbMpuzmtbB0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2018 11:48:29 -0700
Message-ID: <CAMKF1spAyeKGrM1oK=XS-ktZzM8SQkfdP62jrEBfOPaD-9H-AA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] php: Upgrade 7.2.9 -< 7.2.10
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
X-List-Received-Date: Mon, 24 Sep 2018 18:48:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 22, 2018 at 6:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> http://errors.yoctoproject.org/Errors/Details/193970/

I think its a different commit causing it. So I will take this one

> On Thu, Sep 20, 2018 at 11:16 PM <changqing.li@windriver.com> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > 1. Upgrade 7.2.9 -> 7.2.10
> > 2. php 5.x not support valgrind config, so move it to php_7.x.bb
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta-oe/recipes-devtools/php/php.inc                         | 1 -
> >  meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} | 5 +++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} (80%)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> > index 65dfd2d..9eacabe 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -92,7 +92,6 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
> >  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >  PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
> >  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> > -PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
> >
> >  export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
> >  export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
> > diff --git a/meta-oe/recipes-devtools/php/php_7.2.9.bb b/meta-oe/recipes-devtools/php/php_7.2.10.bb
> > similarity index 80%
> > rename from meta-oe/recipes-devtools/php/php_7.2.9.bb
> > rename to meta-oe/recipes-devtools/php/php_7.2.10.bb
> > index a5d5afe..8dc64bb 100644
> > --- a/meta-oe/recipes-devtools/php/php_7.2.9.bb
> > +++ b/meta-oe/recipes-devtools/php/php_7.2.10.bb
> > @@ -13,12 +13,13 @@ SRC_URI_append_class-target = " \
> >                                  file://0001-opcache-config.m4-enable-opcache.patch \
> >                                  "
> >
> > -SRC_URI[md5sum] = "175023bc43fd8f883e60849a02a03b93"
> > -SRC_URI[sha256sum] = "e9e3aaa6c317b7fea78246a758b017544366049d2789ad5a44fe9398464c53a8"
> > +SRC_URI[md5sum] = "0ce8ff615bfb9de7a89bab8d742c11c0"
> > +SRC_URI[sha256sum] = "01b6129a0921a1636b07da9bc598a876669e45a462cef4b5844fc26862dbda9d"
> >
> >  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
> >                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> >                          ,--without-mysqli --without-pdo-mysql \
> >                          ,mysql5"
> > +PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
> >
> >  FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

