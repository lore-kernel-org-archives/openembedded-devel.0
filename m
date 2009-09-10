Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mlctm-0003B0-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 08:12:53 +0200
Received: from tamarin.localnet (123-192-182-244.dynamic.kbronet.com.tw
	[123.192.182.244])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7320A1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 06:18:02 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2009 08:12:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
	<1252350704-9530-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1252350704-9530-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200909100812.14300.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] tune-xscale.inc: Use TARGET_ARCH to find endianness
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
X-List-Received-Date: Thu, 10 Sep 2009 06:12:53 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 07 September 2009 21:11:44 Khem Raj wrote:
> * Use TARGET_ARCH to find endianness instead of
>   SITEINFO_ENDIANNESS which is not yet evaluated.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>

> ---
>  conf/machine/include/tune-xscale.inc |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/conf/machine/include/tune-xscale.inc
> b/conf/machine/include/tune-xscale.inc index 7fa6447..3a6bd0e 100644
> --- a/conf/machine/include/tune-xscale.inc
> +++ b/conf/machine/include/tune-xscale.inc
> @@ -1,9 +1,12 @@
> -FEED_ARCH =  "${@['armv5teb',
> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}" +# this
> depends on fact that for ARM the TARGET_ARCH is 'arm' for little endian and
> 'armeb' for bigendian +# this is the case as of now for all arm machines in
> OE.
> +
> +FEED_ARCH =  "${@['armv5teb', 'armv5te'][bb.data.getVar('TARGET_ARCH', d,
> 1) == 'arm']}"
>
>  TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
>  TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
> -PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t
> armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> -BASE_PACKAGE_ARCH := "${@['armv5teb',
> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> +PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t
> armv5te'][ bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
> +BASE_PACKAGE_ARCH = "${@['armv5teb',
> 'armv5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
>
>  # Include tune file for thumb support, it defaults to off so DISTROs can
> turn it on if they wish require conf/machine/include/tune-thumb.inc


