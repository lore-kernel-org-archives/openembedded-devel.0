Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 211C271CAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 15:08:32 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id f2so13012640uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=edsTq5bqXrUt7zy0tgt+HgMt/YgFmxrtjA71phxjl8c=;
	b=WN/x2wffCDDqLeCp1rgzPgc9Q7eM9c8kkBYAewRDMA0fn37MvlJ4mZiWLfZAJYC+a5
	ci310o80/N3mBUdl41JcohJ/Cf60LKJqd/7sxqSVFrij+9+vDONr8gP6Mt9KmaWsNuyb
	oUlpF+CMQWxwBFR/wHHmP7Gan4aPN6Dh+ubrXse+PpQ2cJxMLBzCFjlvwQkUaHax/NCT
	5+YkOu2MZJq7gc/DNgtywB9pdccIgVd8jzvP4R4szMAhzZygUQxHZJVLAuX7klVWDAdi
	QgYjAjdugylB2gIfGUT5Lfmhm/7O4VHxSPKBmmKAyYbjLla210aSS+IGVEld7cZyRGr2
	Pfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=edsTq5bqXrUt7zy0tgt+HgMt/YgFmxrtjA71phxjl8c=;
	b=JdQq4Gg7tio/q+Yv6CgyWIL6ZlaPEFLTQko+pJsUGpA/DyMhrmCTqfAbUu8JdBTKnY
	lJWGlf80Lwc27jTCokwkmzd+RU1GiuUpRFyRwN0Ta3Pz2ZZCE35gd2aL+1O63jW/uyV5
	fZwHgqg+f0LGZp7MDoWD22RkfjqndyPW+Opt9lzZihvQbFNAUlzYZPyKeljx/NQy2d+0
	JlRylOdlhhqzvIkChhdXA9LGJwSOGdwONPv9iBLnPGeUC+YBqvMaGn0fgqwdVZgG4aY9
	PtQhqCSq89lzpJDW+zgYrxtmcNxpxYfDPTZvHNJENrlBDV6hLdf+x/dt/d+caJz34qKO
	5KDg==
X-Gm-Message-State: AIkVDXIV6ATfzYc5incblBcvUi603Fr49xMZ1u/qCICgiHYHJdFgfApqWdzppuiHWgbnVC55sh4PEHCkrmnz2Q==
X-Received: by 10.176.92.26 with SMTP id q26mr9107308uaf.88.1486566512832;
	Wed, 08 Feb 2017 07:08:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Wed, 8 Feb 2017 07:08:32 -0800 (PST)
In-Reply-To: <20170208143140.22903-4-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
	<20170208143140.22903-1-andreas.kling@gmail.com>
	<20170208143140.22903-4-andreas.kling@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 8 Feb 2017 16:08:32 +0100
Message-ID: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: Re: [meta-gnome][PATCH v02 3/3] dconf: make gtk+3 dependency optional
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
X-List-Received-Date: Wed, 08 Feb 2017 15:08:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 3:31 PM,  <andreas.kling@gmail.com> wrote:
> From: Andy Kling <andreas.kling@peiker-cee.de>
>
>   dconf requires gtk+3 only for dconf-editor and is useful
>   even on systems without gui.
>
>   add PACKAGECONFIG for editor, enable it by default if x11
>   is present in DISTRO_FEATURES
>
>   add gtk+3 to DEPENDS only if editor is present in PACKAGECONFIG
>
>   add x11 to REQUIRED_DISTRO_FEATURES only if editor is enabled
>
>   Note: editor will be dropped from dconf in version 0.23.1
> ---
>  meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
> index f7666cc0f..8c66958a6 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
> @@ -9,15 +9,20 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
>  SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
>  GNOME_COMPRESS_TYPE = "xz"
>
> -DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
> +DEPENDS = "dbus glib-2.0 libxml2 intltool-native ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk+3", "", d)}"
>
>  inherit vala gtk-doc distro_features_check
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "editor", "", d)}"
> +
> +#note: editor will be removed in version 0.23.1
> +PACKAGECONFIG[editor] = "--enable-editor,--disable-editor,gtk+3"
You add gtk+3 twice: in DEPENDS above and here. Just keep it in PACKAGECONFIG

Andreas

