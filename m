Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53EF373179
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 02:37:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u132boSB020205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Feb 2016 18:37:50 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 2 Feb 2016 18:37:49 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1454434802-29633-1-git-send-email-alexandru.but@ni.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56B167FC.3010901@windriver.com>
Date: Wed, 3 Feb 2016 10:37:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454434802-29633-1-git-send-email-alexandru.but@ni.com>
Subject: Re: [meta-oe][PATCH] efivar: nvme header was renamed in linux 4.4
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
X-List-Received-Date: Wed, 03 Feb 2016 02:37:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/03/2016 01:40 AM, Alexandru But wrote:
> nvme.h was renamed to nvme_ioctl.h in linux uapi headers since 4.4. Patch
> taken from the gentoo repository.
>
> Signed-off-by: Alexandru But <alexandru.but@ni.com>
> ---
>   .../efivar/efivar/0.21-nvme_ioctl.h.patch          | 30 ++++++++++++++++++++++
>   meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 ++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
>
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
> new file mode 100644
> index 0000000..221ec5a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
> @@ -0,0 +1,30 @@
> +From ae0869b71a90bc14e67f3c917bd9c96db25c99a6 Mon Sep 17 00:00:00 2001
> +From: Mike Gilbert <floppym@gentoo.org>
> +Date: Thu, 14 Jan 2016 17:02:31 -0500
> +Subject: [PATCH] Workaround rename of linux/nvme.h
> +
> +Bug: https://bugs.gentoo.org/571548
> +---
> + src/linux.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/linux.c b/src/linux.c
> +index 5ebc151..e551377 100644
> +--- a/src/linux.c
> ++++ b/src/linux.c
> +@@ -22,7 +22,12 @@
> + #include <inttypes.h>
> + #include <limits.h>
> + #include <linux/ethtool.h>
> ++#include <linux/version.h>
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
> ++#include <linux/nvme_ioctl.h>
> ++#else
> + #include <linux/nvme.h>
> ++#endif
> + #include <linux/sockios.h>
> + #include <net/if.h>
> + #include <scsi/scsi.h>
> +--
> +2.7.0
> +
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> index 1684a10..3c34a7b 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> @@ -9,7 +9,8 @@ DEPENDS_class-target = "popt efivar-native"
>
>   SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>   SRC_URI = "git://github.com/rhinstaller/efivar.git \
> -           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
> +           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch \
> +           file://0.21-nvme_ioctl.h.patch"

This path is based on your previous, so it can't be applied.

And I got errors after fix conflicts:

| linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory
| compilation terminated.

My kernel is 4.1.


// Robert

>   SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
>   SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
>
>

