Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC3E79C98
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:38 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id u68so2453549qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3wKbuWQ+kyUJO/3BqCmecrwkKYhHG/fH2meMGW/2iBs=;
	b=JSLOA6KbDvFVOIwV5+kD+teATns2WZ7NG3KvDjTLJ8dhQUTxl2DKtJ6wm95cnFLP5C
	21h0TjN4PnrZFx7p3om69NgHOoCYSZeSbE7mtvnXgDUaXGIyMhP8otxHCE29gCzF6qGM
	jaJvbC+pe734uyRnaIMlF4fiX+4Rv5BWXbXzVk751RRcRcxUSBQMryKy4HXli0Z6ARkn
	FsZ7W0PHq2Tvl8tKDoe3yrbaiH9Od+NNqCuPF1DUSHazsCGAwFwZK7vfIasS9zUAnRgR
	jzapnhAjyqAlqwgACoeU7BG7Imh1iA7bg52CXB/KOb3O6dmaPhzTCPMrCXi4Ev5I1Dp2
	AHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3wKbuWQ+kyUJO/3BqCmecrwkKYhHG/fH2meMGW/2iBs=;
	b=gP6LSNiaqbTQfyLJOgCNMVa2IV6rVIk75XhJzbbNTbDspzz55CpY3fV4ISw41ui04Z
	y0bOoerhylmEDcyEfJCjeYUtdrQuis4gQvutfUvX1JPdy6DM+yz7OQarW4u/nx/DjJrL
	X+HndvUoLD1M5Ltv1+1K2YlZ1ZmMGosVaW268gSwAJQYkfW4+pBM4wtw9J42Hhe1F8Tt
	+RsCtEP75mHMQ5mEfxYFtwe8yk/YzjOAhj4w6IRI8yaqdhMOqvJrkV0rwip/+T6ltf8I
	33f/B0IgX9FVDu+jbwxk1HTV2sGngaMzCuE8cb+nvM3jaBCRyCCG1qad2/dmB2iK1air
	NDlg==
X-Gm-Message-State: AGRZ1gLH1HKGnW14oRHt/mo3B9K8ZrpyFAKwo49PTJqAcUU/ksaZfjN5
	MsFK4czy11yC2FC6EVnOra0IoTOcFNoQU2or3Q0=
X-Google-Smtp-Source: AJdET5dSuq8f0ahGOQiQ6EN5yu4xcX57grJhX8I/YYb7rhENb16RPpCDB39wyXkUWMpEdYY7Ik5cLOS58bz9bhWP2QE=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr15019448qkb.102.1540870959114; 
	Mon, 29 Oct 2018 20:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<eeb685e9cefb4e85e07b1a51f4e562c03dda96b7.1540830650.git.brendank310@gmail.com>
In-Reply-To: <eeb685e9cefb4e85e07b1a51f4e562c03dda96b7.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:52:47 -0700
Message-ID: <CAMKF1sq17swAVLpY=fXkug3s7C4TvDxJd8JF4cQOknicmjnr-A@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 07/16] geocode-glib: add recipe for geocode-glib library
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:42 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../recipes-gnome/gnome3/geocode-glib_git.bb  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
> b/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
> new file mode 100644
> index 000000000..73332e374
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/geocode-glib_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Geocode Library for glib"
> +LICENSE = "GPLv2"


The checksum seems to be operating on a COPYING.LIB can you confirm its not
LGPL but rather GPL

>
> +DEPENDS = " \
> +           glib-2.0 \
> +           json-glib \
> +           libsoup-2.4 \
> +          "
> +
> +LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +SRC_URI = "git://
> gitlab.gnome.org/GNOME/geocode-glib.git;protocol=http;branch=master;tag=3.26.0
> \
> +           "
> +


hmm tags are floating kind of commits so they would result in checking
remote repo on every fetch task it would be better to use a hard coded SHA

>
> +EXTRA_OEMESON += " -Denable-installed-tests=false -Denable-gtk-doc=false "
> +
> +FILES_${PN} += "${datadir}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson gobject-introspection
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

