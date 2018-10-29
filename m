Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59FE279ACA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 22:51:47 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j3so3465253otl.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h7PcaRGFVxxHnsFKAArdw1eE92o4DX/7jekUTAsCRMk=;
	b=T/maoh4vSJyfnnWKv2aModQU6ddKUeDMFwhSPB8hHuVVD/nnM9luPiuFOXBayeE3Ie
	ghppEkukm0B8NT2y0yy3DFmcH789RNOaW6mbD5jflvNNnJV3fRrShgmu/oOscVzAbJJi
	gtJ/D3GkIH75KdHASs0l3aJJAKiucqSqXnznWu3G/XPBhEeALY+ucplmI8JAZknoI6L8
	cFzfILNNV3Zy57zTKAm0DJ9i7Kgk2CySVjVx6vxu16OeZpLJp6gEo+uk9sQI3bs2Mpf9
	Dy0PwSWSPS6sjGgG5Lr0AOAtnqcmD3BT+QYgFM+GU7HI0FRi6cHaoYW5D8I4zeAUiSPA
	zMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h7PcaRGFVxxHnsFKAArdw1eE92o4DX/7jekUTAsCRMk=;
	b=c5fo+Z16aYC4IjG8PYM7LVLhAhsXr8zJ36zO3pseB/rzV2l6apDgC0um78KLQ2LA3o
	FMnGVZwE1qSMIf7fmdGIjENzh/yVwADlt4/tYG7utWsLujf+WdphdaOSGAFrbjJ17cFb
	7MsiTVX4yoEzKgGHGHF+aQofk4rKf1YzLsGfpP3gfauU4gbeJFLiGhMfQ8BVYBV3JQSd
	m9QqtZmh5V9bixQRwaNUk4x3bLri8mVYFLR6d6+CA5607TKXwEas0+Yu/3KQQF08yCZc
	agl8+FDpCZGRLhfO4gWopmHG85lm/9PYIYUcTKVZFtrxox4UCG91tuL4A9GoKd6ykj2E
	m1jQ==
X-Gm-Message-State: AGRZ1gL3dC21KE63wET5CzCyjNMaCQxJnDznD7yRP1REoZH3gMIcYXcz
	AmBH0lVn8ruFqxkiy2BU++9WtIS1sq/gU0CW15I=
X-Google-Smtp-Source: AJdET5eaE6i1eIhekD1tZYtISMDoakIVhiot9U2BhkqbEIN/ALkvhyKRAD7Ms/hLN+Wr0xzI2nKV6IyF5sImwTRUCgg=
X-Received: by 2002:a9d:6181:: with SMTP id g1mr4083929otk.324.1540853508306; 
	Mon, 29 Oct 2018 15:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<245bf6e59b04956ad91357d74a93c4ecd5326faf.1540830650.git.brendank310@gmail.com>
In-Reply-To: <245bf6e59b04956ad91357d74a93c4ecd5326faf.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Oct 2018 23:51:33 +0100
Message-ID: <CALbNGRRsrVdgQKQwba1hg7mJ0YadOYwoAr1gcJ98aZttTpxqEA@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 09/16] gdm: add recipe for gdm (Gnome Desktop Manager)
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
X-List-Received-Date: Mon, 29 Oct 2018 22:51:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  meta-gnome/recipes-gnome/gnome3/gdm_git.bb | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/gdm_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/gdm_git.bb b/meta-gnome/recipes-gnome/gnome3/gdm_git.bb
> new file mode 100644
> index 000000000..752aad13e
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gdm_git.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "GNOME Desktop Manager"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +           libcanberra \
> +           glib-2.0 \
> +           gtk+3 \
> +           accountsservice \
> +           plymouth \
> +           gconf-native \
> +           dconf-native \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://gitlab.gnome.org/GNOME/gdm.git;protocol=http;branch=master;tag=3.30.1 \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig distro_features_check gobject-introspection gettext
> +
> +FILES_${PN} += "${systemd_system_unitdir}"
> +FILES_${PN} += "${libdir}"
> +FILES_${PN} += "${datadir}"
^ Same as mentioned before
> +
> +do_configure_prepend() {
> +       install -d ${S}/build-aux
> +       sed -i '/AC_CHECK_FILE/d' ${S}/configure.ac
> +}
> +
> +do_install_append() {
> +       rm -rf ${D}/var/run
> +}
> --
> 2.17.1
>

