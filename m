Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 516AF7F57B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:40:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a1so3292123ioc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jsk41np+mFoCQDPEPUQ1Fflm9jNYidCv0BLFFwmHUsk=;
	b=YgRQrKpvw2AnZit3kYX2Mlnz8OTq6MFHJamSRUI5N4xfCwpUR227TTgQfYHi2pvaPz
	F+QomPnkQaHMg/hACJyrxlxRoxk00SI/hxCuZPknUV43bmhn+c8Hw8a3SxcJieqAkQRT
	2LdSCfhWNIBPVYuDSjQ7FCc83B34GG+mXaxi1rOuPRowZ6v1vt/qkt3dGkV83fYF4zoY
	VoO7YxsDo2XsmB8Z3+HX/j01yidK6hb7Of6YJPnjISk98CE/fs7u5P2BKwLZ69O8h1AQ
	aqO+4n38ysEnss9fw+OdlI/tcQW00DoZZx9wNYpjtvNhpf9yTyKx7yMuncNucsEhJSdG
	xMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jsk41np+mFoCQDPEPUQ1Fflm9jNYidCv0BLFFwmHUsk=;
	b=Bxb3E0tOkWbvEFVDiyUvaapViw4UOABVNAEgo/nCfwxOzZu8sWT8Yppxbes7JZ2mrR
	BeimtpFV/vawCrj7s4/CpdUjXnZ/VJPbmv4oHQsj1OB8zfNQnMFJvyTlqe6Lh8uirpni
	C/B3wXeuEevnei0NUIpHB/LGQVlidLnPIKAfqcYo87IB9S4jbvujUD/7TUE1Ai1sTEvb
	JIgMdXz/MtXPipgnRWrJm4g5U+rGAUG0BZQDW9W/scQ3AKX2XnNcvg736UQn4r/E2Lbr
	6KqrWnFCLSYnGn8nk+vC8IIS2daK4VyDuNTlMUQWG0n/fPZT3jAG2IZ/84NPFKGDD5sL
	4wGg==
X-Gm-Message-State: APjAAAVIQFIee1tExuAzY7Pc9pB1NJ1gBNCF/ZegYSw1erWZbLzkcMSz
	Eo1GIKSsCb/yn76JgINMHcP5OLxMHQlomsgkXOU=
X-Google-Smtp-Source: APXvYqxIIBqvHPn5SM38YMO32Wkjc1VFI2v6XZ+iJQ2jWW9xnAGr1ipgIhvX4EUBrlE15Od8wzZR1WA4WAsd9SL4YP4=
X-Received: by 2002:a05:6638:60f:: with SMTP id
	g15mr3788559jar.21.1571323201286; 
	Thu, 17 Oct 2019 07:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191017130318.1978280-1-raj.khem@gmail.com>
	<20191017130318.1978280-2-raj.khem@gmail.com>
In-Reply-To: <20191017130318.1978280-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 17 Oct 2019 16:39:49 +0200
Message-ID: <CALbNGRTVOM5_svEfSdcWQ65ZiBUj_Vqr8ZfqBpTYPQky52_aTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 2/2] dconf: Upgrade to 0.34.0
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
X-List-Received-Date: Thu, 17 Oct 2019 14:40:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 3:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-gnome/dconf/{dconf_0.32.0.bb => dconf_0.34.0.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/dconf/{dconf_0.32.0.bb => dconf_0.34.0.bb} (76%)
>
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> similarity index 76%
> rename from meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
> rename to meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> index 8d1bbdfd1a..a1996a1a37 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> @@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  SECTION = "x11/gnome"
>
> -SRC_URI[archive.md5sum] = "e1ac0b6285abefeed69ca9e380e44f5a"
> -SRC_URI[archive.sha256sum] = "68bce78b19bc94cb2c3bb8587e37f9e5e338568c3a674f86edde9c9f1624ffab"
> +SRC_URI[archive.md5sum] = "a3ab18ed51a0494a1c8436fef20cc1b0"
> +SRC_URI[archive.sha256sum] = "943a94ab16121de5580ceaed2605b87444d1bca1c6cd8beefb778bcb0aa2da52"
>
>  DEPENDS = "dbus glib-2.0 intltool-native"
>
Have same here: Does it build for you with meson 0.52.0?

Andreas

