Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE3BF749F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 16:54:53 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15-v6so722929qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2018 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zQ0h2dSv5K3AyK8dRBjDKhVNAFY0eRirT5Z/XaeemWI=;
	b=Fo18TuSvGHAisegparNkrCFg28oozNjM9k+8NoEeBVUnbK1FYL7rQ4SxTYV/AkQKDS
	C4QvhBuhZKaMl9IJlakOPiEOsL2j+ZyBDz9s6tjY7i7AQ6bLyKnjRF1S729py129KD1U
	s+s14uaRx8BJzttXIP9GFvyQNQkJZgThrMyjc1uU74pnULmzmirioh79z3co458iuD83
	gr+w+YjvgqngDFAsbAC/wEAuEA6K3veCpXecliTVry0TSbx//1zPho6XIXCXtXcxySdE
	TEIAL7FBkpZBS8yhsm22Ty8NMGJ8IA4QwBPn21xrIAURODFH0llU0ale4SKGI9gu+upb
	Tv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zQ0h2dSv5K3AyK8dRBjDKhVNAFY0eRirT5Z/XaeemWI=;
	b=OAHwypfb6nuSEdT7+/Ij9KCBSpmXAC4qwLNR7L+X9LiCChizAlAWFrcbRY328jF5gC
	GWs27xG99YJIlspyEEap2qQDNlaC+vKDZq+HIHnZOEMjwLWK0vS3P8eBUeOJG17fvcVw
	DLD9bzsRPCuPhFyrLCQEbbfQtPeO6soaZP4zVscFE5mae6rVlhgYwqsynGouYncmt42p
	8YkAFRIIqn026AW/qykra2+up9/VJP0bnyRx2FBiCzoAVdf09xBQuljOCGvn+Hd0N9tG
	nRyU7XujQoFISyQ7x1IGDIeZxinPdH4qIo4zeYOCHqwrgzC9v6GxuVI/5or3dbI4o3yL
	0J/w==
X-Gm-Message-State: APzg51CXcKaOK6E0h7xTQ5txn5rDj3rDTPgMrtL1UcgLoIqDYcPOFfyh
	ZTExeoSAV20ess9CkZ13b012alEA54pZeWoepw61cA==
X-Google-Smtp-Source: ANB0VdbZE87NETJXjJJdeopHexA0c1A78liwWTJofAnOc1Y4opaL194VY5UiRmo/gwQcU7DWgkkUHXd3uACzYiP+WPI=
X-Received: by 2002:a37:6d0:: with SMTP id
	199-v6mr25619124qkg.71.1535993694312; 
	Mon, 03 Sep 2018 09:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <1535934937-30606-1-git-send-email-leon@sidebranch.com>
In-Reply-To: <1535934937-30606-1-git-send-email-leon@sidebranch.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 09:54:28 -0700
Message-ID: <CAMKF1spXp=U+k5yx-g7ip+U=rX4pV6-nCdPzM7_MGgfMOTLOgA@mail.gmail.com>
To: Leon Woestenberg <leon@sidebranch.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Mon, 03 Sep 2018 16:54:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Leon

Please send these patches to openembedded-core ml
On Sun, Sep 2, 2018 at 5:36 PM Leon Woestenberg <leon@sidebranch.com> wrote:
>
> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
> architecture (such as zImage). The kernel-fitimage.bbclass packs that
> image as sub-image in a flattened image tree image (fitImage) and
> deploys this fitImage along with the image tree source file (.its).
>
> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
> also contains "fitImage", which kernel.bbclass will also deploy
> redundantly with different naming.
>
> The result is a dual deployment with slightly different naming,
> each with a set of symlinks.
>
> The solution chosen is to have fitImage deployment be handled by
> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> types during deployment.
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
>  meta/classes/kernel.bbclass | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b341733..fd43ecd 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -675,8 +675,10 @@ kernel_do_deploy() {
>         fi
>
>         for type in ${KERNEL_IMAGETYPES} ; do
> -               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
> +               if [ "$type" != "fitImage" ]; then
> +                       base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
> +               fi
>         done
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>                 mkdir -p ${D}/lib
> @@ -685,21 +687,25 @@ kernel_do_deploy() {
>         fi
>
>         for type in ${KERNEL_IMAGETYPES} ; do
> -               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> -               symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> -               ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
> -               ln -sf ${base_name}.bin $deployDir/${type}
> +               if [ "$type" != "fitImage" ]; then
> +                       base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +                       symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> +                       ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
> +                       ln -sf ${base_name}.bin $deployDir/${type}
> +               fi
>         done
>
>         cd ${B}
>         # Update deploy directory
>         for type in ${KERNEL_IMAGETYPES} ; do
> -               if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
> -                       echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
> -                       initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
> -                       initramfs_symlink_name=${type}-initramfs-${MACHINE}
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
> -                       ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +               if [ "$type" != "fitImage" ]; then
> +                       if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
> +                               echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
> +                               initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
> +                               initramfs_symlink_name=${type}-initramfs-${MACHINE}
> +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
> +                               ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
> +                       fi
>                 fi
>         done
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

