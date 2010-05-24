Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OGhM7-0002o0-5w
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 01:46:47 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2Y00HWY76ZAS44@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 May 2010 18:42:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B5A0F14AF60; Mon,
	24 May 2010 19:42:35 -0400 (EDT)
Date: Mon, 24 May 2010 19:42:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100524234235.GN25484@denix.org>
References: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-version: 1.0
In-reply-to: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] packaged-staging.bbclass: added missing space in	find call
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
X-List-Received-Date: Mon, 24 May 2010 23:46:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 23, 2010 at 02:37:59PM +0200, Enrico Scholz wrote:
> Old find statement failed with something like
> 
>   $ find . \( -name XXX\)
>   find: invalid expression; I was expecting to find a ')' somewhere but did not see one.

Ah, that's where I was getting it from! :) It then triggered the same/similar 
issue with tar complaining about the modified archive...

> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  classes/packaged-staging.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
> index 62a78e4..83f3578 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -19,7 +19,7 @@ PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_
>  PSTAGE_PKGNAME    = "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk"
>  PSTAGE_PKG        = "${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}"
>  PSTAGE_WORKDIR   = "${TMPDIR}/pstage"
> -PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-config"\) -type f"
> +PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-config" \) -type f"
>  
>  PSTAGE_NATIVEDEPENDS = "\
>      shasum-native \
> -- 
> 1.7.0.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


