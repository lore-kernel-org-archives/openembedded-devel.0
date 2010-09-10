Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou7tQ-00072J-Og
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:00:15 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00DTJLXJH3L7@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 12:58:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 66E5E14AF64; Fri,
	10 Sep 2010 13:58:31 -0400 (EDT)
Date: Fri, 10 Sep 2010 13:58:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910175831.GC28148@denix.org>
References: <1284136044-7651-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1284136044-7651-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qte: only export touchscreen setting if ts exists
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
X-List-Received-Date: Fri, 10 Sep 2010 18:00:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 10, 2010 at 11:27:24AM -0500, Chase Maupin wrote:
> * Changed the qte.sh script to check for whether or not the
>   touchscreen exists before exporting QWS_MOUSE_PROTO to use
>   the touchscreen.  This is so that devices that don't have
>   a touchscreen can use the regular mouse support.
> * Bumped the PR
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/qt4/files/qte.sh     |    8 +++++---
>  recipes/qt4/qt4-embedded.inc |    2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/qt4/files/qte.sh b/recipes/qt4/files/qte.sh
> index ddea77d..21d6ecb 100644
> --- a/recipes/qt4/files/qte.sh
> +++ b/recipes/qt4/files/qte.sh
> @@ -1,5 +1,7 @@
>  #!/bin/sh
>  
> -QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> -
> -export QWS_MOUSE_PROTO
> +if [ -e /dev/input/touchscreen0 ]
> +then
> +    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> +    export QWS_MOUSE_PROTO
> +fi
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 61cd3bf..d756a29 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
>  PRIORITY = "optional"
>  HOMEPAGE = "http://www.trolltech.com"
>  DEPENDS += "directfb tslib"
> -INC_PR = "r21"
> +INC_PR = "r22"
>  
>  QT_BASE_NAME ?= "qt4-embedded"
>  QT_BASE_LIB  ?= "libqt-embedded"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


