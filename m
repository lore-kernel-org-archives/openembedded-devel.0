Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1PO9SW-0006gc-Mk
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 14:44:29 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 5391D1C08C46
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:43:06 +0100 (CET)
Received: from gonzales.localnet (ppp-188-174-87-224.dynamic.mnet-online.de
	[188.174.87.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id 45F141C00170
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:43:06 +0100 (CET)
From: Klaus Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Dec 2010 14:43:08 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.3; x86_64; ; )
References: <1291280468-25378-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1291280468-25378-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201012021443.08558.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nokia900: build uImage instead of zImage
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
X-List-Received-Date: Thu, 02 Dec 2010 13:44:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 2. Dezember 2010, 10:01:08 schrieb Martin Jansa:
> * meego and debian on n900 are now using u-boot so we should too
> ---
>  conf/machine/nokia900.conf |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/nokia900.conf b/conf/machine/nokia900.conf
> index a16f1da..10bce2a 100644
> --- a/conf/machine/nokia900.conf
> +++ b/conf/machine/nokia900.conf
> @@ -20,7 +20,10 @@ GUI_MACHINE_CLASS = "bigscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "800"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
> 
> -KERNEL_IMAGETYPE = "zImage"
> +KERNEL_IMAGETYPE = "uImage"
> +
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"
> 
>  ROOT_FLASH_SIZE = "100"
>  EXTRA_IMAGECMD_jffs2_nokia900 = "--pad --little-endian
> --eraseblock=0x20000 -n"

Acked-by: Klaus Kurzmann <mok@fluxnetz.de>

-- 
Klaus 'mrmoku' Kurzmann


