Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 64CF176806
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:52:13 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id u30so77829103qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3NpY3SE6RKwB6zvRJE4DIlAFjyvZ6PCT92vaPMddGPc=;
	b=ehxYVHK2hXybGiuKOxulHgyUZNE92Y2EtnctgHnJQKmDQ5U5JVjuxTF2D43MFZm8LQ
	GqLIwZIYgdvRN3ywkmNTRjsnE963HQNLmkCW+r7B0dkaslZlzekMxAOVOray335qvkiG
	PkVcoyVuJ7rU3OHDsQFhZYGK6tBH04F+bCHe/mBXgX8eUs8ruIfqWqLlndB23p2XRDfy
	l0Xm1ulnIIJyJeXaB6Gd8yi7mnIjLcFjUlBPvs28HU/rCKTOCBETasAHjcvhLYi3+Zkm
	BkyYCjBgHPEkLrUURa4Qwwz1L3JQkoex92VNMQkx4d1KoFjcBgqR/g3UDtpGKG6TKt/x
	1zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=3NpY3SE6RKwB6zvRJE4DIlAFjyvZ6PCT92vaPMddGPc=;
	b=dwUVJuUr6aj9k+ROdMuRhfwkQOn02bR2vTXyRJez5Yv9z7GONoVsgy9KRteJ2C5yRa
	4WvnWmc5jpRUN8TA1Pv135CJ1olOeAx4akNlNyhebPSZvcIEIa2iRKNOyjEpv7ZwMZZB
	GG0LkHolGh5xF72/ZJD2DIhV1XUxOezv48esPXjT/kEddQFiqBfTHFbI94pXwUq+kKmq
	neGiDEJEJP+yE6aW0uz+CXF4XBHbmCpiivWOu9jXQrM9pLjfQD6ooNK2ccSLOCNU8BlH
	Y48wobMNtDt+DrboA8r0Fjppe8VicO6HQN/gij1365qpt5YZGVmWEm4XiCVM8GT8NxaM
	hC5A==
X-Gm-Message-State: AG10YOTXFaYbkK7g48p8bbnqBruhCCVIbszPNeAuqoZcPO0aGyD/5D1bpAtwZW1mfxFiEB4DPkPEoUB2zFxaWQ==
X-Received: by 10.140.254.9 with SMTP id z9mr20083561qhc.5.1454705534465; Fri,
	05 Feb 2016 12:52:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 5 Feb 2016 12:51:45 -0800 (PST)
In-Reply-To: <1454705380-22071-1-git-send-email-ross.burton@intel.com>
References: <1454705380-22071-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Feb 2016 12:51:45 -0800
Message-ID: <CAMKF1srx2eRWua1d1B=VE00-8Exa+k0NGsAPmiKTN6fOgUipUg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] gtk-theme-torturer: add
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
X-List-Received-Date: Fri, 05 Feb 2016 20:52:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 12:49 PM, Ross Burton <ross.burton@intel.com> wrote:
> Add this to meta-gnome as it's being removed from oe-core.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../gtk-theme-torturer/gtk-theme-torturer_git.bb   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb

may be recipes-benchmarks in meta-oe is better place for it ?

>
> diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
> new file mode 100644
> index 0000000..b67806d
> --- /dev/null
> +++ b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "GTK+ Theme benchmark program"
> +DEPENDS = "gtk+"
> +HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
> +
> +SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
> +PV = "0.0.0+git${SRCPV}"
> +
> +SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
> +S = "${WORKDIR}/git/gtk-theme-torturer"
> +
> +CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
> +
> +inherit distro_features_check
> +ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 0755 torturer ${D}${bindir}
> +}
> +
> +
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

