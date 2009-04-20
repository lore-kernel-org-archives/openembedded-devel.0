Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>)
	id 1Lw1Nb-00015u-UE; Mon, 20 Apr 2009 23:50:20 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090420214557.QFOE6112.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>;
	Mon, 20 Apr 2009 17:45:57 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id hxlw1b0074dMFYL03xlw2a; Mon, 20 Apr 2009 17:45:56 -0400
X-Authority-Analysis: v=1.0 c=1 a=xf50CYIYzL0A:10 a=7o0ETNSU-kMA:10
	a=Q4-j1AaZAAAA:8 a=4HVRqb_MAAAA:8 a=22pK5S-mAAAA:8
	a=OkwHLb1yjWG7sziNQOAA:9
	a=vNnHvpILEq3JQWNs01PftfWFG2cA:4 a=UcWZWmDdwLsA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Mon, 20 Apr 2009 14:45:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090420214556.GH17629@smtp.west.cox.net>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-8-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1240241104-21935-8-git-send-email-marcin@juszkiewicz.com.pl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: Re: [STABLE][PATCH 1/1] util-linux-ng: depend on	virtual/libintl to pass building with uclibc
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
X-List-Received-Date: Mon, 20 Apr 2009 21:50:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2009 at 05:25:00PM +0200, Marcin Juszkiewicz wrote:

> From: Marcin Juszkiewicz <hrw@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/util-linux-ng/util-linux-ng.inc       |    2 +-
>  recipes/util-linux-ng/util-linux-ng_2.13.1.bb |    1 +
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index dda9792..01e769e 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
>  SECTION = "base"
>  LICENSE = "GPL"
> -DEPENDS = "udev zlib ncurses e2fsprogs-libs"
> +DEPENDS = "udev zlib ncurses e2fsprogs-libs virtual/libintl"
>  
>  inherit autotools
>  
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> index 946147d..8fded14 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> @@ -1,5 +1,6 @@
>  require util-linux-ng.inc
>  
> +SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v2.13/util-linux-ng-${PV}${RC}.tar.bz2"
>  #SRC_URI += "file://util-linux_2.12r-12.diff.gz;patch=1"
>  #SRC_URI += "file://glibc-fix.patch;patch=1"
>  #SRC_URI += "file://glibc-umount2.patch;patch=1"
> -- 
> 1.6.2.3
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


