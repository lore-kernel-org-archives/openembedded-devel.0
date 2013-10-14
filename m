Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 591BD6CDB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 21:45:22 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so6289629lbi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OgAa0WO8Zr9sEXZjrp78Mp2WB4G+aEof6bAOgh/wYgk=;
	b=mJaDLMAvNP5y53qT/o47EErBX1J4ubK4uUut++eHSDGvVEt4wXHOc/zO3AcQCyqwmo
	JCI6qROTV8cBiqPhw8QdAlVUoQV2gBnqurbn8LnQxd3jBBBHnksbhQ1pBR0InempnPSV
	D1iqhJfn2FMt0q56ZJcxEILSnR/TrxrdeK8jZ+V+bzp+M2sSb1RFFzJOC/hCJMSFUjS5
	L1Edy/Wxd8uALD06Hvh5ZCdsgpeU7EaCIkBKNenPehIdNQtPAsoKJkBJtFZjmienSrlf
	N1dyidNVlzqxxhi309ci7n1thnP9B9p3ElAVfyG2lOQnkQEmZIcj5kxUq+dKmE6PHlWU
	UyIw==
MIME-Version: 1.0
X-Received: by 10.152.116.109 with SMTP id jv13mr3959518lab.30.1381787122903; 
	Mon, 14 Oct 2013 14:45:22 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Mon, 14 Oct 2013 14:45:22 -0700 (PDT)
In-Reply-To: <1381786468-9072-1-git-send-email-andrea.adami@gmail.com>
References: <1381786468-9072-1-git-send-email-andrea.adami@gmail.com>
Date: Mon, 14 Oct 2013 23:45:22 +0200
Message-ID: <CAAQYJAvHmSY2ruKgCec3wrXQoUty1VPQLUtK1tiqLmA0KT0XaQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] zaurus: use mkfs.jffs2 -n option only for NAND
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
X-List-Received-Date: Mon, 14 Oct 2013 21:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please disregard this patch: is wrong (-n is set in IMAGE_CMD_JFFS2)
and superseded

Sorry for the noise
Andrea


On Mon, Oct 14, 2013 at 11:34 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> And remove it for collie (NOR).
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/akita.conf  | 2 +-
>  conf/machine/c7x0.conf   | 2 +-
>  conf/machine/collie.conf | 4 ++--
>  conf/machine/poodle.conf | 2 +-
>  conf/machine/spitz.conf  | 4 ++--
>  conf/machine/tosa.conf   | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
> index 12a2fe9..e6f020b 100644
> --- a/conf/machine/akita.conf
> +++ b/conf/machine/akita.conf
> @@ -11,7 +11,7 @@ require conf/machine/include/tune-xscale.inc
>  PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
>  MACHINE_FEATURES += "iwmmxt"
>
> -EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
> +EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000 -n"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
>
>  # UBI: max akita (128-7 MiB = 968 PEBs)
> diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
> index ffa998d..08a528e 100644
> --- a/conf/machine/c7x0.conf
> +++ b/conf/machine/c7x0.conf
> @@ -11,7 +11,7 @@
>  require conf/machine/include/zaurus.inc
>  require conf/machine/include/tune-xscale.inc
>
> -EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
> +EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
>
>  # UBI: max c7x0 (128-7 MiB = 7744 PEBs)
> diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
> index 26bc257..9f45f56 100644
> --- a/conf/machine/collie.conf
> +++ b/conf/machine/collie.conf
> @@ -5,8 +5,8 @@
>  require conf/machine/include/zaurus.inc
>  require conf/machine/include/tune-strongarm1100.inc
>
> -EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000 -n"
> -EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000 -n"
> +EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000"
> +EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000"
>
>  # UBI: max collie (14.125 = 113 PEBs)
>  # 14.125 x 1024 : 128 = 113 PEBs
> diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
> index 53dbc4a..ce3c8b3 100644
> --- a/conf/machine/poodle.conf
> +++ b/conf/machine/poodle.conf
> @@ -8,7 +8,7 @@
>  require conf/machine/include/zaurus.inc
>  require conf/machine/include/tune-xscale.inc
>
> -EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
> +EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
>
>  # UBI: max poodle (64-7 MiB = 3648 PEBs)
> diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
> index 6a74165..0ecce8b 100644
> --- a/conf/machine/spitz.conf
> +++ b/conf/machine/spitz.conf
> @@ -12,7 +12,7 @@
>  #
>  # SL-C3000 (16-7 MiB = 576 PEBs)
>  # 9 x 1024 : 16 = 576 PEBs
> -# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
> +# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
>  # MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
>  # UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
>
> @@ -22,7 +22,7 @@ require conf/machine/include/tune-xscale.inc
>  MACHINE_FEATURES += "iwmmxt"
>  PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
>
> -EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
> +EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000 -n"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
>
>  # UBI: max spitz (128-7 MiB = 968 PEBs)
> diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
> index 0ec93c7..3c19225 100644
> --- a/conf/machine/tosa.conf
> +++ b/conf/machine/tosa.conf
> @@ -8,7 +8,7 @@
>  require conf/machine/include/zaurus.inc
>  require conf/machine/include/tune-xscale.inc
>
> -EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
> +EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
>
>  # UBI: max tosa (128-7 MiB = 7744 PEBs)
> --
> 1.8.1.5
>

