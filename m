Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LuFHE-00039E-D0
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 02:16:47 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI6003YH38LETGL@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	15 Apr 2009 19:12:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AB3786B83B5; Wed,
	15 Apr 2009 20:12:21 -0400 (EDT)
Date: Wed, 15 Apr 2009 20:12:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090416001221.GD2118@denix.org>
References: <1239777218-20213-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1239777218-20213-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] sysstat: fix build on omap3 to actually	work (gnu_hash problem like ltrace)
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
X-List-Received-Date: Thu, 16 Apr 2009 00:16:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 15, 2009 at 08:33:38AM +0200, Koen Kooi wrote:
> From: Carsten Haitzler (Rasterman <raster@rasterman.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/sysstat/sysstat_8.1.6.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/sysstat/sysstat_8.1.6.bb b/recipes/sysstat/sysstat_8.1.6.bb
> index 0f394ed..a734d14 100644
> --- a/recipes/sysstat/sysstat_8.1.6.bb
> +++ b/recipes/sysstat/sysstat_8.1.6.bb
> @@ -2,6 +2,7 @@ DESCRIPTION = "The sysstat utilities are a collection of performance monitoring
>  HOMEPAGE = "http://pagesperso-orange.fr/sebastien.godard/"
>  LICENSE = "GPL"
>  SECTION = "console/utils"
> +PR = "r1"
>  
>  SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz"
>  
> @@ -13,3 +14,4 @@ do_configure_prepend() {
>  
>  FILES_${PN} += "${libdir}/sa"
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


