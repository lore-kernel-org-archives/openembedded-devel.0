Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 968AC6093C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 12:26:16 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id z52so8115920wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MTKQUUnf3TQ1ii8X9yBlv0oUhEyjgUoIbAgeiQ0gtuA=;
	b=OHYGO4LN5mST0VIKz8aW5syS5jUTd3Y1ow/MWsg7nbg7qXNTaxsJde51Wda9qAo3RK
	QNKnVNqOAvGrbfuxMtx7s5Ck5r6Mws5DwMz2sykB8zVZE8u0w4B5D6/IY3JbUzkaFPRk
	U+ovgK9+6p/ejNCA4xow9vdQCfkzm6VF2WVUAW3U0Aid6xDj0pUlCoXEE76o580kaDtD
	T0QCydhEJaznjbWrNZ5qKXW+PM10BS6gfhjStGqZWHK19v3WFZyKaThG8kQ2VSwsztsq
	zBqsMubwB83h4Bhytb8J8x87Eah4S7Sgdf+oOoTrzTWvsYiN1ZD8G/2YQ7EVi1KYe43A
	RRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MTKQUUnf3TQ1ii8X9yBlv0oUhEyjgUoIbAgeiQ0gtuA=;
	b=Bm/DBVjy3ZR9/MWI9xzviLeiV5dsYbodK3iVYUnw2Wqdh2Xoy1WruRRmO3gxt+r2vq
	nrCl+BSvgrIwKiIMADlCFLl8L1U0Pjk1E7VTTHgTwRQVO8VHpEIgEB3JSTsQssnOYWrC
	kGpK0mOyzFOrc2PIT+fxhQ4DPEtiNut3Dos4RhTmAN5YaDYN3uHDBn/E2q3WM0gGDLam
	kbbFBakRBY8Iq4jOf8MMgR4a7i8kjHSqlzusg1q2b0LTQA9UhX3RmHYnt4eELxEEEqa9
	JllX/YJ3cWjQtaaRAhmYfJFgw3fN1zL2+iD77THLW4LKTP0WgtvLsoTvZqQBxAK1bEsl
	LhQQ==
X-Gm-Message-State: AODbwcBJhMhEKvMLcyiZPmGpt8V1GDwj0L++Goj3WcoLloPYIcHgt01t
	+Me2ukYkKZqdS79VNrUh2w03lbtWpA==
X-Received: by 10.80.165.23 with SMTP id y23mr2861846edb.64.1495023977265;
	Wed, 17 May 2017 05:26:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 17 May 2017 05:26:16 -0700 (PDT)
In-Reply-To: <20170506191840.26070-2-raj.khem@gmail.com>
References: <20170506191840.26070-1-raj.khem@gmail.com>
	<20170506191840.26070-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 14:26:16 +0200
Message-ID: <CA+chaQc-igmSCje4h2XC7Urcq=yE1JJTfcQR3L1J2vbLdM_0fQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 2/4] rygel: Update to 0.34.0
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
X-List-Received-Date: Wed, 17 May 2017 12:26:17 -0000
Content-Type: text/plain; charset="UTF-8"

Causes:

rygel-0.34.0: rygel: Files/directories were installed but not shipped in
any package:
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/rygel.service

On Sat, May 6, 2017 at 9:18 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Fix build without X
> Licence is more consistent now see
>
> https://github.com/GNOME/rygel/commit/cdcb6bd55efd0c3b7a2fd4ae5c3d85
> 56f69f8402
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rygel/{rygel_0.28.2.bb => rygel_0.34.0.bb}          | 17
> +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>  rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.28.2.bb =>
> rygel_0.34.0.bb} (80%)
>
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> similarity index 80%
> rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> index 38fac65d5..798ecea9d 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> @@ -5,26 +5,27 @@ Additionally, media player software may use Rygel to
> become a MediaRenderer \
>  that may be controlled remotely by a UPnP or DLNA Controller."
>  HOMEPAGE = "http://live.gnome.org/Rygel"
>
> -LICENSE = "LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> -                    file://src/rygel/rygel-main.vala;endline=27;md5=
> 99324118da4c012d25edae2f779ae9b3"
> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0
> gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0
> libunistring sqlite3 intltool-native"
>  RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
>  RRECOMMENDS_${PN} = "rygel-plugin-media-export"
>
>  GNOME_COMPRESS_TYPE = "xz"
> -SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
> -SRC_URI[archive.sha256sum] = "9ea23df7186caac5f1aad3137edf6d
> 507d339b9a469fc3133df4043fa66b61f5"
> +SRC_URI[archive.md5sum] = "7d8923324b280cd5452803d61176a34a"
> +SRC_URI[archive.sha256sum] = "fbb2d46cbe4e750df6610b4c66b227
> 8f06d1f71a257c7903e676ccb394dad418"
>
> -inherit gnomebase vala gobject-introspection
> +inherit gnomebase vala gobject-introspection gettext
>
>  EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
>
> -PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch
> gtk+3"
> +PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
> +
> +PACKAGECONFIG_append = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "
> gtk+3", "", d)}"
> +
>  PACKAGECONFIG[external] = "--enable-external-plugin,--
> disable-external-plugin"
>  PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
> -PACKAGECONFIG[mediathek] = "--enable-mediathek-plugin,--
> disable-mediathek-plugin"
>  PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
>  PACKAGECONFIG[media-export] = "--enable-media-export-plugin,
> --disable-media-export-plugin"
>  PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--
> disable-gst-launch-plugin"
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

