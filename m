Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 50BC67935C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 18:48:30 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id s129-v6so9226942qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I9+FRziM4FdHLqag2M4jZ043FHeEmHWkE7Jeg85BUyk=;
	b=U79AHFHUrvr9idyRGGa2bA4kVZWPb39mf4FqzO1kcc1WanhKP0O3W7htkHuy16VgZK
	Wa+u1/tsHwR1YBh8+B00itZqDK3FcIIAkhdlmvn4k55HRnHa8uKcDSh7MvY9ra6DbL9e
	8/kSJab0Y9an8R5kDhFPAKupVexkq3toSpnFFNnOK3lZifBC3xfVr6v/nusLK0igprCR
	olPwz/oulxsNLOY8Coj2XU8A9l6QZUBicV17BkK7wUFCwId57CI9mDP9QdahWMWQWBCo
	pc3hfsc3thsSzUR1wreL7/1VmwJa9/bdOInXdT0RXNqVNAdZPXxA9C3Nt8St7Kq7X+FM
	r27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I9+FRziM4FdHLqag2M4jZ043FHeEmHWkE7Jeg85BUyk=;
	b=YzoKOuWPCc8QLjJZaFR0nFM50ZdnpG2SQ9rGipHZcytaWOj1CRq0VIKRyACPvsckan
	zodY93EY6RE9xTj02Kp13XXqcya+ifN3etRdmZ0QOICOwDuz2vp9oJi4QTgsn8/ORIgp
	UuHkPDiQ8HSutUNJk1/QZ/tEDaEGFyl8n1hDxElBiJiFODkJdepr0KV8Tw9nfm8xg46N
	rfNz13Fo3w+kgeJH0adeUCzEFuQbXDCA0I20MObS/KXAfpNIe4N+Al1OZpdAMYPDCF4R
	xFtqBKhmWOsmg6ddqtsv0b/ZwuZZMHLGM6gvZRQTjrpiy5bI7Pp/XCVkMaFNAmK1NGjh
	tpdQ==
X-Gm-Message-State: ABuFfohQKNFXD0hBvuPnSizNowsmHxp74lHk70PxH9C3P9oc2FESbzKf
	kL3E0yVsr0D4AcJ15wdgKwvNUaXI9E7oTlJxCRQ=
X-Google-Smtp-Source: ACcGV60VmWJMAKYfk/pefu+P9XyCazbuE+FPeTQRaIcN7d0AA3aStRBIWIkHuqnSsLFD6oYcGiMxS5SZqGijZ6u5DW4=
X-Received: by 2002:a37:2915:: with SMTP id
	p21-v6mr135846qkh.206.1537814910741; 
	Mon, 24 Sep 2018 11:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180918082608.1088-1-max+openembedded@blarg.de>
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2018 11:48:04 -0700
Message-ID: <CAMKF1spwKoe9+NqUsU6DZ0PvSWtT9N3-uPEUS8Y7n3heCHeM8A@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [meta-oe] devtools/php: remove the failing ${D}/${TMPDIR} code
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
X-List-Received-Date: Mon, 24 Sep 2018 18:48:30 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/193970/
On Tue, Sep 18, 2018 at 1:36 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Appending ${TMPDIR} to ${D} doesn't make any sense, because both are
> absolute paths.  And additionally, the code fails:
>
>  rmdir: failed to remove '/usr/src/oe/tmp-musl/work/core2-64-oe-linux-musl/php/7.1.9-r0/image//usr': Directory not empty
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 65dfd2d89..120f678d7 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -139,7 +139,6 @@ do_install_append_class-target() {
>      if [ -d ${RECIPE_SYSROOT_NATIVE}${sysconfdir} ];then
>           install -m 0644 ${RECIPE_SYSROOT_NATIVE}${sysconfdir}/pear.conf ${D}${sysconfdir}/
>      fi
> -    rm -rf ${D}/${TMPDIR}
>      rm -rf ${D}/.registry
>      rm -rf ${D}/.channels
>      rm -rf ${D}/.[a-z]*
> @@ -164,14 +163,6 @@ do_install_append_class-target() {
>              ${D}${systemd_unitdir}/system/php-fpm.service
>      fi
>
> -    TMP=`dirname ${D}/${TMPDIR}`
> -    while test ${TMP} != ${D}; do
> -        if [ -d ${TMP} ]; then
> -            rmdir ${TMP}
> -        fi
> -        TMP=`dirname ${TMP}`;
> -    done
> -
>      if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
>          install -d ${D}${libdir}/apache2/modules
>          install -d ${D}${sysconfdir}/apache2/modules.d
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

