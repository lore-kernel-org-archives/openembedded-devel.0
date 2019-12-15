Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id E0FC06BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 07:48:47 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id w13so2979114ilo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 23:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=gwcCitksrttdOTBamhmhMZHVSwztatAU0hPlQVxCV7k=;
	b=Vd7dA/eLaE6Sbn+yJvIUbSPHwsQBpPdnJKMtHhuhHrFYClu26yhW+CgTR2YaowUoRf
	Wk9qeLxIVZPr8xRjPcYFsW92nZ7UqF/vuIt8fuq+w3RceSsfiPkAs8LF+9xOIbTioJSe
	eoQdhH8zncRZhBq0CDFJb2pA9fRin4pVSwmYS44vBVDVxMWnrWBiYJnoKlZUGlRs4Ic/
	MGfmXoZ18NNlRfaF5oiucA4MjZtdWHrH/KweK+qenMeYLvqtSQVCMauoV7AKg/tveY5j
	Vh5P5qxkAkwilV8s03DRn4FegPlQ03QeW5IAFd6vyiabq47FsJicGZHNt9r5F55pFf1H
	Bfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=gwcCitksrttdOTBamhmhMZHVSwztatAU0hPlQVxCV7k=;
	b=bTeSMiIEU3F82h1Fz9TzxyWcXXlFMqqv7b+qTsBqkZU+2BDzAPcyT6ot3w1aUy/eQm
	mRYtJw8LFapw2wgmNRRavyHna19Eef2ZHZ1XTAz+VyNOABTm1ZikTEJgDOmJtaZtJvPW
	X/sY9kt9G2Biz7j2yig2xM0AwXVtyLcqlXMU3cIB7NgKRdLmg4g4Zy9g4TDhQTOHp7as
	XrZicmI9eBgLVtIRyKbiydGbTp/m9FAiuBSO/Zc8xo/r9kC6DoUF2CsQvtgQuxkTCK22
	Sge3lA+gq4Q5IYNphkuGF/Fn7hJ4c+oRB1iL19tnYPVAxR9gl3c3dugIfsreMu3dGPJq
	+3ww==
X-Gm-Message-State: APjAAAXtpMVHrmbZd7Q4Cq6fMJhYspK5jNIGHCAWK0fDhsFCFdmhzKkN
	ZlXxnfpoXX/ia3QcgYw4Ph0MShD75Ao2R+ZvAq6gvJV7
X-Google-Smtp-Source: APXvYqwzm/G+CSvVOk4SqLja0yQpoGVlQxvkjz1+TYWRbivWuBtxeftQXQsH3sYvC/SIFx4qGnzSPCaR5BXD4qoS7iM=
X-Received: by 2002:a92:47c9:: with SMTP id e70mr7326864ilk.144.1576396128832; 
	Sat, 14 Dec 2019 23:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20191215073423.89510-1-alex.kiernan@gmail.com>
	<20191215073423.89510-2-alex.kiernan@gmail.com>
In-Reply-To: <20191215073423.89510-2-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 15 Dec 2019 07:48:37 +0000
Message-ID: <CAO5Uq5QPBD0JTNDsnfVP68a031cELXp5EYmAei2bSmM_VFO-yg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] ostree: Add support for gjs tests
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
X-List-Received-Date: Sun, 15 Dec 2019 07:48:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 15, 2019 at 7:34 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Now gjs is packaged in meta-gnome, if that layer is available then
> enable the gjs tests. Also weaken test for python3-pyyaml so that
> building ptest without meta-python is possible (though more tests will
> have to be skipped).
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

gjs fails to build without gobject-introspection-data - will send a v2

> ---
>
>  meta-oe/recipes-extended/ostree/ostree_2019.6.bb | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
> index 86a7aac31c27..374ceb397ba0 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
> @@ -86,6 +86,10 @@ EXTRA_OECONF_class-native = " \
>      --disable-otmpfile \
>  "
>
> +CACHED_CONFIGUREVARS += " \
> +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'gnome-layer', 'ac_cv_path_GJS=${bindir}/gjs', '', d)} \
> +"
> +
>  # Path to ${prefix}/lib/ostree/ostree-grub-generator is hardcoded on the
>  # do_configure stage so we do depend on it
>  SYSROOT_DIR = "${STAGING_DIR_TARGET}"
> @@ -166,9 +170,10 @@ RDEPENDS_${PN}-ptest += " \
>      grep \
>      python3-core \
>      python3-multiprocessing \
> -    python3-pyyaml \
>      tar \
>      ${PN}-trivial-httpd \
> +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'gnome-layer', 'gjs', '', d)} \
> +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
>  "
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
>
> @@ -179,9 +184,3 @@ SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
>  SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
>
>  BBCLASSEXTEND = "native"
> -
> -python __anonymous() {
> -    if bb.utils.contains('PTEST_ENABLED', '1', 'True', '', d):
> -        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', '', d):
> -            raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
> -}
> --
> 2.17.1
>


-- 
Alex Kiernan

