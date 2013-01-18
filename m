Received: from mail-ia0-f181.google.com ([209.85.210.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tw8Gg-0006Dy-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 10:29:50 +0100
Received: by mail-ia0-f181.google.com with SMTP id k25so1187081iah.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=70JsRH2yxTwqwa7mN8hxtcXk20XcxfdSVOgSS3FDO6s=;
	b=GPVK95LbLHwV3oCX5wHazKPH1QgVXEiFt9T0CyjjLaaCJGjH6qOiX4fV93c5kM1seO
	ZjzvVLiGrr0m0CSX7eh0Wgi1Np+IDFbdffV5VB5JJVSP242Zm/EF4rHMm+DiFaOztkp/
	g3XJ9UDBYi9YxKcKpJawt9u+33JH2LMdGwss0jjujlMl2vwfxxXlFXMPNIXkb7TZCbLq
	NYFVdZ7oMy65or6ZsJ4LQSdbqWRzHihXXbTPsMivNTvBT5gEQpWicwhLMzbpBB6U2Zch
	SNxzmoVTPUYWNaXrRbS6hF+pd9hH6xCcJDYEXMbIztF23x3oMbFNOuUCBX8wduLtHlmV
	11kg==
MIME-Version: 1.0
X-Received: by 10.50.179.100 with SMTP id df4mr1503655igc.60.1358500461813;
	Fri, 18 Jan 2013 01:14:21 -0800 (PST)
Received: by 10.64.98.163 with HTTP; Fri, 18 Jan 2013 01:14:21 -0800 (PST)
In-Reply-To: <1357925200-12243-1-git-send-email-andrea.adami@gmail.com>
References: <1357856764-10950-1-git-send-email-andrea.adami@gmail.com>
	<1357925200-12243-1-git-send-email-andrea.adami@gmail.com>
Date: Fri, 18 Jan 2013 10:14:21 +0100
Message-ID: <CAAQYJAusCkVE1-rS1Bd_F+gitpuWMqx-WG9pFSzfLxmAuUevGQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH v2] klibc_2.0.2: apply FIX_V4BX patch for armv4 targets only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 09:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 11, 2013 at 6:26 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>  * linker fix is needed to avoid 'bx, lr' instruction on armv4
>  * patch is applied only for armv4 for eabi builds
>  * http://wiki.debian.org/ArmEabiPort#Choice_of_minimum_CPU
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../klibc/klibc-2.0.2/armv4-fix-v4bx.patch         |   15 +++++++++++++++
>  meta-initramfs/recipes-devtools/klibc/klibc.inc    |   12 +++++++++---
>  2 files changed, 24 insertions(+), 3 deletions(-)
>  create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
> new file mode 100644
> index 0000000..6bb384b
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
> @@ -0,0 +1,15 @@
> +Status: not applicable upstream, in OE/Yocto we use $(FIX_V4BX)
> +which is "" in case of armv5 or thumbs.
> +
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +
> +--- a/usr/klibc/arch/arm/MCONFIG       2013-01-09 01:12:02.000000000 +0100
> ++++ b/usr/klibc/arch/arm/MCONFIG       2013-01-08 23:45:59.000000000 +0100
> +@@ -29,6 +29,7 @@
> + KLIBCSHAREDFLAGS = -Ttext 0x01800200
> + ifeq ($(CONFIG_AEABI),y)
> + KLIBCREQFLAGS += -mabi=aapcs-linux -mno-thumb-interwork
> ++KLIBCLDFLAGS += $(FIX_ARMV4_EABI_BX)
> + else
> + KLIBCREQFLAGS += -mabi=apcs-gnu -mno-thumb-interwork
> + endif
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index a95706e..fa31f73 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
>  # debugsources.list: No such file or directory:
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>
> -INC_PR = "r0"
> +INC_PR = "r1"
>
>  KLIBC_ARCH = '${TARGET_ARCH}'
>  KLIBC_ARCH_armeb = 'arm'
> @@ -21,11 +21,17 @@ KLIBC_ARCH_i586 = 'i386'
>  KLIBC_ARCH_i686 = 'i386'
>  KLIBC_ARCH_pentium = 'i386'
>
> +export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> +
>  SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
>  SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
>
> -SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
> -SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch"
> +SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
> +                                 file://armv4-fix-v4bx.patch \
> +                               "
> +SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
> +                                    file://armv4-fix-v4bx.patch \
> +                                  "
>
>  SRC_URI += "file://klibc-linux-libc-dev.patch \
>              file://prefix.patch \
> --
> 1.7.8.6
>

ping


