Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16A4D79C5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:06:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d5so8490008oti.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k8mGSPpUNBXeR6tXyXo95JOdOtH0YY+S9TmxRyeEJRk=;
	b=SNPKM5Gxg4DIXwLQ5x8m2lRPcIBMpW+1TLJJAG+pXTb08pWpduRC629gTo5Z/U4sUJ
	AgE8Y2Sqxu6vo13JAGkfYO/A2hPFYJHp9gBUDFR9Id+l2rVlTJAy6m0bOmYWFaguWbvt
	g9/pPvF7LWzrzCbyjVZ9WAqgUWiVyN8F0ctgQyxYx73Z+ZuD0gpDPM6cDYd8azsXEJ0y
	puYNqyI9ZWOkL+F7HE2k2kwKPpEoq4NKcR93+szTbSA9hI3T6J2hEDuuhOPyL9H4dBQv
	LYnp5SVWm9w8wUP4i1sE8jNt7ZM24maCPUagtDosxpAS6bLXL6txfj8baQidJyQb1KNw
	/QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k8mGSPpUNBXeR6tXyXo95JOdOtH0YY+S9TmxRyeEJRk=;
	b=oi87mXjHd8dhcnCDvFKE48YP658Zmxf6CGncuSKeeC0vGkBgaEjOxWT+SxEIt9sMEB
	ItczuybNkhhbckYWGvMEhUYvQj+LPOnW3dIccHZvEsKE9sU2UTDTpkW5J5xSIGntt8GR
	as2bJseYkRBTelICfeqTliaeNbWMzCsMFfNiaOPGNRQJhhN6IC/ooPN7WvxXM420Xsrx
	X9tmZsqPGJv7q880YVCY2lgSwL71pUemgpZTYCyClOasjR+yIR0Wg6fwsQcVqmBdlRmD
	2Y6qpifRRX5nmJ8WeFwYwUIdwmDyOisaEOmQo+kK2Fi7wlts0ZC5Zfn6xkjimjyYqr+d
	hPrA==
X-Gm-Message-State: AGRZ1gKke12mwlELW6gwEpDxmcUQOiWr8WUnZ3r/jEgkVFLqgHjQEWLa
	OMXP4IMfXg66SXgJrd8LA3K93y4udBaFDYjPDMBfVf9j
X-Google-Smtp-Source: AJdET5dOLp1SvFt7bFukdLfWMQTTzdgLtnn52sr1Ax7FsG3vghBzZeBFNnzP4XDOPN7U3fT/gJaV1sWGAB8hVsFpbfM=
X-Received: by 2002:a9d:309e:: with SMTP id s30mr195961otc.132.1540836376108; 
	Mon, 29 Oct 2018 11:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
In-Reply-To: <4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 18:06:04 +0000
Message-ID: <CAJTo0LaqiCwZXZjKwGfX8qwHLrX20_hOaOzwBs7q5XsO+fj+xA@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 10/16] dconf-native: add dconf-native recipe
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
X-List-Received-Date: Mon, 29 Oct 2018 18:06:15 -0000
Content-Type: text/plain; charset="UTF-8"

There's already a dconf in meta-gnome, so just add
BBCLASSEXTEND="native nativesdk".

Ross
On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> gdm recipe requires a native dconf tool.
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../dconf/dconf-native_0.28.0.bb              | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> new file mode 100644
> index 000000000..ee78fbb66
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "configuation database system"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +SECTION = "x11/gnome"
> +
> +SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
> +SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
> +
> +DEPENDS = "dbus glib-2.0 intltool-native"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +inherit gnomebase gsettings bash-completion vala native
> +
> +FILES_${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${libdir}/gio/modules/*.so \
> +    ${bindir}/dconf \
> +"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

