Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqVq6-0002Iq-0Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 20:18:23 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqVot-00013U-7z from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:16:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 11:16:46 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 12:16:46 -0700
Message-ID: <4D5EC598.5090607@mentor.com>
Date: Fri, 18 Feb 2011 12:16:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
	<1298038322-20481-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1298038322-20481-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 18 Feb 2011 19:16:46.0145 (UTC)
	FILETIME=[62520310:01CBCFA0]
Subject: Re: [PATCH v2] u-boot-2009.03: use AMD fixups for AMIC too
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
X-List-Received-Date: Fri, 18 Feb 2011 19:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2011 07:12 AM, Steffen Sledz wrote:
> From: Mario Schuknecht<m.schuknecht@dresearch.de>
>
> * AMIC flashes are AMD clones and need the same fixups.
>
> Signed-off-by: Mario Schuknecht<m.schuknecht@dresearch.de>
> Signed-off-by: Steffen Sledz<sledz@dresearch.de>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch |   11 +++++++++++
>   recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch |    3 ++-
>   recipes/u-boot/u-boot_2009.03.bb                   |    7 +++++--
>   3 files changed, 18 insertions(+), 3 deletions(-)
>   create mode 100644 recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
>
> diff --git a/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch b/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
> new file mode 100644
> index 0000000..9d8c7ab
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
> @@ -0,0 +1,11 @@
> +diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c u-boot-2009.03/drivers/mtd/cfi_flash.c
> +--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c	2011-02-18 14:11:24.870432001 +0100
> ++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-18 14:11:45.440432001 +0100
> +@@ -1883,6 +1883,7 @@
> + 		/* Do manufacturer-specific fixups */
> + 		switch (info->manufacturer_id) {
> + 		case 0x0001:
> ++		case 0x0037: // AMIC
> + 			flash_fixup_amd(info,&qry);
> + 			break;
> + 		case 0x001f:
> diff --git a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch b/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> index 5b91d28..20a47da 100644
> --- a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> +++ b/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
> @@ -6190,10 +6190,11 @@ diff -Nurd u-boot-2009.03.orig/cpu/arm926ejs/start.S u-boot-2009.03/cpu/arm926ej
>   diff -Nurd u-boot-2009.03.orig/drivers/mtd/cfi_flash.c u-boot-2009.03/drivers/mtd/cfi_flash.c
>   --- u-boot-2009.03.orig/drivers/mtd/cfi_flash.c	2009-04-15 11:05:24.000000000 +0200
>   +++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2009-04-15 11:08:18.000000000 +0200
> -@@ -1883,6 +1883,7 @@
> +@@ -1883,7 +1883,8 @@
>    		/* Do manufacturer-specific fixups */
>    		switch (info->manufacturer_id) {
>    		case 0x0001:
> + 		case 0x0037: // AMIC
>   +		case 0x00da: // Winbond
>    			flash_fixup_amd(info,&qry);
>    			break;
> diff --git a/recipes/u-boot/u-boot_2009.03.bb b/recipes/u-boot/u-boot_2009.03.bb
> index 2cbded9..4b822f1 100644
> --- a/recipes/u-boot/u-boot_2009.03.bb
> +++ b/recipes/u-boot/u-boot_2009.03.bb
> @@ -6,9 +6,12 @@ DEFAULT_PREFERENCE_hipox = "1"
>
>   DEPENDS_append_hipox = " oxnas-boot-tools oxnas-boot-tools-native "
>
> -SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
> +	file://cfi-amic-fixup.patch \
> +"
>
> -SRC_URI_append_hipox = "file://00-hipox.patch \
> +SRC_URI_append_hipox = " \
> +	file://00-hipox.patch \
>   	file://01-hipox-fix-gmac-reset.patch \
>   	file://02-hipox-enable-mmu.patch \
>   	file://03-hipox-direct-switch.patch \


-- 
Tom Rini
Mentor Graphics Corporation


