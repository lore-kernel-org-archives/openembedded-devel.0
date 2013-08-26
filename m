Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id D34FD60990
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 08:47:02 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id p5so1166225lbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Yx+xTl7J5IMKms+lkHm0hgqYQ8CFS6GuU/G/Njgjnak=;
	b=Hlm3DopWlWjKEwfV+caSN1BVHxVdcMPbvTfcMSpfSZWVJFh0ZKLfL6lAq4TO044mwO
	g14EN9FctIO17h9vR/oECkQvsQStPUpjUy5gGmvAaHcEPIAzOwbr2L5rr7HSAsI+YA9J
	LetnEtcqWOAPDY6YS6/q8URCIScTMWjak2KTCr+jL8HbA0OoBr2XDk22Fb8NYo+ErVMR
	SfLaE5oNJQN8s+3FXzWgA/ffRhAqACd3eKDRt8sbTtJJFbZJpn0SgyktLEbPlZeGlb4I
	rw08ScKCkI9CoIwIMcEZdDtzdDv9e2O8wUcxpKL3HqvayjZrJm7sfbWsxtvpIorViNc2
	77QA==
MIME-Version: 1.0
X-Received: by 10.152.115.242 with SMTP id jr18mr173088lab.40.1377506822877;
	Mon, 26 Aug 2013 01:47:02 -0700 (PDT)
Received: by 10.112.209.40 with HTTP; Mon, 26 Aug 2013 01:47:02 -0700 (PDT)
In-Reply-To: <1377471203-489-1-git-send-email-andrea.adami@gmail.com>
References: <1377471203-489-1-git-send-email-andrea.adami@gmail.com>
Date: Mon, 26 Aug 2013 10:47:02 +0200
Message-ID: <CAAQYJAvbX1e6AVc0WCLz59B4hwiCTA_+vrPG==1o=ZwXH1C7NQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs] [PATCH] klibc_2.0.2: fix hardcoded symlinks to linux-libc-headers
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
X-List-Received-Date: Mon, 26 Aug 2013 08:47:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry, patch is broken for distros like meta-micro, collapsing /usr into /

Thinking again about the symlinks,  we have to respect the install
location of the linux-libc-headers, installed as:
> oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} <

So we have to adapt to the case where exec_prefix is not like  "/usr"

Revised version coming later today.
Cheers

Andrea



On Mon, Aug 26, 2013 at 12:53 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Klibc needs a copy of the linux headers for itself to build.
> On target the libs and a second copy of headers are installed as well:
> we link relatively to the staging sysroot of the target to make
> these headers available when necessary.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch       | 2 +-
>  meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
> index 28efcfd..305328b 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
> @@ -14,7 +14,7 @@ Index: klibc-2.0~rc2/scripts/Kbuild.install
>         $(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
>         $(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
>  -      $(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
> -+      $(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
> ++      $(Q)for x in ../../../usr/include/asm ../../../usr/include/asm-generic ../../../usr/include/linux ../../../usr/include/mtd; do \
>  +              ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
>  +      done
>         $(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
> index 03955f2..e8df8e0 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
> @@ -21,7 +21,7 @@ Index: klibc-1.5.24/scripts/Kbuild.install
>         $(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
>         $(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
>  -      $(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
> -       $(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
> +       $(Q)for x in ../../../usr/include/asm ../../../usr/include/asm-generic ../../../usr/include/linux ../../../usr/include/mtd; do \
>                 ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
>         done
>  @@ -103,7 +100,6 @@
> --
> 1.8.1.5
>

