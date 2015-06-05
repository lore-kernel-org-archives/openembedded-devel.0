Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id AF37773BBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 15:55:01 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so17782242igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HBab2djpLUcaV7QcTz2mkmXDk9tc2UZKILJuBLJCN7M=;
	b=0YW6ORQUlugqd1lRhFQSOS1NTNtOixNZYx0CUp/t9lDneKgHuxZxofWCemBWrT8RLZ
	25l1oLhFn+UaK1A7Zx50UB9G6HnDXY000WKJZxcqBjLSJn0sG/m8dMHni8WlRPw+85KN
	libPyRctsbgg2I1s7aEs+HhrQo+UE3hVF4IN0kLD674iGvJuzgmsU4lFqYZlYGDxfhvZ
	Xtt07TcVry/uoFWRjCHoax5rSRtCauhm4f8PSdvJsHyDmu3/xMR40rNiGmvaToswXTYs
	M8JJSPwV5bMWcNPMspmr96sRV0w6zpBz/hYmvlAOQ5dNmscd5mcZ7m1NqVke9Pq2lddT
	fgWA==
X-Received: by 10.50.138.74 with SMTP id qo10mr13295000igb.39.1433519702541;
	Fri, 05 Jun 2015 08:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.138.134 with HTTP; Fri, 5 Jun 2015 08:54:32 -0700 (PDT)
In-Reply-To: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
References: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 5 Jun 2015 08:54:32 -0700
Message-ID: <CAK8F28m=ZQLXUgNHZ8P8Fm6Bt55KApbO8YETf2AjyQzafcHnTQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, otavio@ossystems.com.br
Subject: Re: [meta-oe][PATCH V2 2/8] polkit-gnome: Upgrade 0.102 -> 0.105
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jun 2015 15:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Can this patch and "gdm: Whitelist it" be applied to the fido branch?

Meta-question: Is this an appropriate request? What patches are
considered for backport?  In this case, I'm updating the
meta-gumstix-extras layer to Fido which depends on meta-openembedded
and, as it happens, these two patches.  I can readily carry such fixes
as updated recipes/bbappends in my layer until I next up-rev if these
aren't suitable for backporting---just looking to understand the
process :).

Thanks,
Ash

On Tue, May 5, 2015 at 8:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
> add missing dep on gtk+3
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch  | 12 ++++++++++++
>  .../{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb}       | 14 ++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>  rename meta-oe/recipes-extended/polkit/{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb} (62%)
>
> diff --git a/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
> new file mode 100644
> index 0000000..4b6ad75
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
> @@ -0,0 +1,12 @@
> +--- polkit-gnome-0.105/configure.ac.org        2015-05-04 22:33:03.925977953 -0700
> ++++ polkit-gnome-0.105/configure.ac    2015-05-04 22:33:16.862288030 -0700
> +@@ -120,6 +120,9 @@
> + # Check for required packages
> + # ***************************
> +
> ++# check for gtk-doc
> ++GTK_DOC_CHECK([1.14],[--flavour no-tmpl])
> ++
> + POLKIT_AGENT_REQUIRED=0.97
> + POLKIT_GOBJECT_REQUIRED=0.97
> + GTK_REQUIRED=3.0.0
> diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
> similarity index 62%
> rename from meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
> rename to meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
> index f5480e7..be33908 100644
> --- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
> @@ -7,22 +7,24 @@ LICENSE = "LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
>                      file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
>
> -SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
> +SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${PV}.tar.xz \
> +           file://gtk-doc-check.patch \
>  "
> +SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
> +SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
>
> -PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
> -
> -PR = "r2"
> +#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
>
>  EXTRA_OECONF = "\
>      --disable-examples \
>      --disable-introspection \
> +    --disable-static \
>  "
>
> +DEPENDS += "gtk+3"
> +
>  inherit autotools gtk-doc pkgconfig
>
>  FILES_${PN} += " ${datadir}/dbus-1 \
>                   ${datadir}/PolicyKit \
>  "
> -SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
> -SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

