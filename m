Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF06E79EAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:17:30 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 131so12732739qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GmrgetAb4bU2dcT66hLL17A8v9Q8X13G3rBaCk2UmlE=;
	b=ONuY1SSAKZD9M5D7QxuZFLzQEcEiF3RZmvLgn70bVPY3ST+td/2kVginRcUgvf9k2A
	p7fn7vFGuDL96KDudXFglT0DEF18w8jy+4gAZwRuAGQ5LMvc/fQvE5FkJJh+Iq5bugts
	3sWb0mLTAPm/czysJ17Q4nqxS2APpumxGBEdLrvtBJAR1JUQO6jVosHkw4AtmvCgvYCh
	plzYvxzkTRwHIHUqkX9c5MyJUGztzMQRxmx7Jr6SuBFDjgzKdyjZCWSb4jdoN0CYh1CU
	yi18cOIIzjKST+K6bdbJXeCt8u54pCVHAh5RU4dAMXUazGlLJk6C7cBJ7IAXAHPuqW9w
	H6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GmrgetAb4bU2dcT66hLL17A8v9Q8X13G3rBaCk2UmlE=;
	b=cgVWo+yAccnQouomcvjIzb3AMSveMEZRq87+9oUPFgztPSpoMbdP2geA4jX8aTNLC4
	iUqpngCOWMwGoBXYrdtPDbUgR6QK7EVBWQ3ePcacaX3C7SKQ0ubBsU4YcZv919BBBbPC
	BEDluXiByDfaOXIGDKDCI0p/PuRTqUJpGqKbg9zZY10xaj6jcuFHR3Da+d5dtntM5uHz
	ThHhwwR+9LxwCk7INczMHpr/5rirJxVh36mtm1YNhax0/sFzJuMKl92D+tB72i8hH/Uo
	p5YrJn8p3d0qQEtmbs1OcPPl6pmtFs9meEtuemxgbyH/BwNp7QzvS0JwQAPQqkWtDiWW
	WW+Q==
X-Gm-Message-State: AGRZ1gK260wSrZhdq2gilJGhujbnGWG0BU2WLPYNwQOCy6lhFwaxMvvt
	Cb8KYXHBBXp+OsixhJFXieRo4VOlM7nyn4UlZL/PZQct
X-Google-Smtp-Source: AJdET5eyG+AMnH25DKXRrx85nROYK4fbd0Uql9yMC5lnFHcLbGXNyHYPKu94Tt7pqX80Fw0KFT5Vd3t3mBHv/BqbcZA=
X-Received: by 2002:a37:d408:: with SMTP id l8mr7290176qki.315.1541092651442; 
	Thu, 01 Nov 2018 10:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <1540779130-71208-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1540779130-71208-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 10:17:05 -0700
Message-ID: <CAMKF1spXDWuvkf67J7zwC+S3ZaSd_41DRVMEbfTv7x9ao4jRDA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] network-manager-applet: change default buildclass
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
X-List-Received-Date: Thu, 01 Nov 2018 17:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

its been updated to 1.8.18 on master-next and if we still need this
patch please rebase and send a v2
On Sun, Oct 28, 2018 at 7:13 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> network-manager-applet don't have good support of out-of-tree
> build. refer this link:
> https://gitlab.gnome.org/GNOME/network-manager-applet/issues/30#note_353935
>
> change default buildclass to fix below occasionally compile failed
> problem.
>
> can't write to file src/wireless-security/ws-resources.hcan't write to file
> src/wireless-security/ws-resources.cMakefile:5299: recipe for target
> 'src/wireless-security/ws-resources.h' failed
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../network-manager-applet/network-manager-applet_1.8.14.bb             | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> index 957516e..f200495 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> @@ -2,6 +2,8 @@ SUMMARY = "GTK+ applet for NetworkManager"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> +GNOMEBASEBUILDCLASS = "autotools-brokensep"
> +
>  DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
>             gconf libgnome-keyring iso-codes nss \
>             intltool-native \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

