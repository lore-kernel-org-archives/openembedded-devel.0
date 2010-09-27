Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P07zA-0003on-5H
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 09:18:52 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 51921491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 09:18:42 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 27 Sep 2010 09:18:41 +0200
Message-ID: <4CA04557.5070207@dresearch.de>
Date: Mon, 27 Sep 2010 09:18:47 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285230784-16893-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1285230784-16893-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 27 Sep 2010 07:18:41.0719 (UTC)
	FILETIME=[36845470:01CB5E14]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.24: avoid kernel error if ubifs superblock read fails
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
X-List-Received-Date: Mon, 27 Sep 2010 07:18:52 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Ping!

Am 23.09.2010 10:33, schrieb Steffen Sledz:
> * .get_sb is called on mounts with automatic fs detection too, so this
>   function should not print an error if it cannot read the superblock
>   (new behaviour conforms the other fs types)
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  .../linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch |   11 +++++++++++
>  recipes/linux/linux_2.6.24.bb                      |    1 +
>  2 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch
> 
> diff --git a/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch b/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch
> new file mode 100644
> index 0000000..33f5f9f
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.24/ubifs-v2.6.24-silent-get-sb.patch
> @@ -0,0 +1,11 @@
> +--- linux-2.6.24.orig/fs/ubifs/super.c	2010-09-23 09:25:52.000000000 +0200
> ++++ linux-2.6.24/fs/ubifs/super.c	2010-09-23 09:36:21.000000000 +0200
> +@@ -2020,8 +2020,6 @@
> + 	 */
> + 	ubi = open_ubi(name, UBI_READONLY);
> + 	if (IS_ERR(ubi)) {
> +-		ubifs_err("cannot open \"%s\", error %d",
> +-			  name, (int)PTR_ERR(ubi));
> + 		return PTR_ERR(ubi);
> + 	}
> + 	ubi_get_volume_info(ubi, &vi);
> diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.bb
> index 9f3655c..982038b 100644
> --- a/recipes/linux/linux_2.6.24.bb
> +++ b/recipes/linux/linux_2.6.24.bb
> @@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2;name=k
>             ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
>             file://squashfs-lzma-2.6.24.patch \
>             file://ubifs-v2.6.24.patch \
> +           file://ubifs-v2.6.24-silent-get-sb.patch \
>             file://defconfig"
>  
>  # Moved away temporarely until committed properly (work in progress).




