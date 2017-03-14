Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 57B5877829
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AF63220BA7;
	Tue, 14 Mar 2017 16:14:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WoyqzVq427_F; Tue, 14 Mar 2017 16:14:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D0DD209A4;
	Tue, 14 Mar 2017 16:14:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2C4441623E8; Tue, 14 Mar 2017 12:14:31 -0400 (EDT)
Date: Tue, 14 Mar 2017 12:14:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <20170314161431.GJ15664@denix.org>
References: <20170228150119.21252-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20170228150119.21252-1-nicolas.ferre@microchip.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] devmem2: Change source URL to regain access to it
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
X-List-Received-Date: Tue, 14 Mar 2017 16:14:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2017 at 04:01:19PM +0100, Nicolas Ferre wrote:
> Change URL due to connexion error on the original page.
> As the header of the new devmem2.c source file has changed, change the
> signature and the LIC_FILES_CHKSUM specificaiton.

Oh, great! So, now, everyone who has this file cached locally would have to 
invalidate their mirrors? Moreover, if you are building master and morty or 
older, you can't reuse the same source mirror as each of the builds will 
complain about bad checksums...

-- 
Denys


> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> index e48cc9210bb3..c42eb5e0b1c5 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "Simple program to read/write from/to any location in memory"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
>  PR = "r7"
>  
> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
> +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>  S = "${WORKDIR}"
>  
> @@ -18,5 +18,5 @@ do_install() {
>      install devmem2 ${D}${bindir}
>  }
>  
> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
> -- 
> 2.9.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

