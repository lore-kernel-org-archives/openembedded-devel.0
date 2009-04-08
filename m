Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrLu4-0008QH-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 02:44:56 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHR00AZWB8LWAIL@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 19:41:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5703B6B83A8; Tue,
	07 Apr 2009 20:41:09 -0400 (EDT)
Date: Tue, 07 Apr 2009 20:41:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408004109.GH11203@denix.org>
References: <1239036431-26959-1-git-send-email-jeremy.laine@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <1239036431-26959-1-git-send-email-jeremy.laine@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeremy Lain?? <jeremy.laine@m4x.org>
Subject: Re: [STABLE][PATCH] gd: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Wed, 08 Apr 2009 00:45:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 06, 2009 at 06:47:11PM +0200, Jeremy Lain?? wrote:
> From: Jeremy Lain?? <jeremy.laine@m4x.org>
> 
> 
> Signed-off-by: Jeremy Lain?? <jeremy.laine@m4x.org>

Since I finally caught up with last week's emails and saw Koen's complaint 
about stable branch maintainers not doing their job, here we go... :)

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/gd/gd_2.0.33.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gd/gd_2.0.33.bb b/recipes/gd/gd_2.0.33.bb
> index 7c1f7c3..7e47b08 100644
> --- a/recipes/gd/gd_2.0.33.bb
> +++ b/recipes/gd/gd_2.0.33.bb
> @@ -2,7 +2,7 @@ SECTION = "libs"
>  LICENSE = "GD"
>  DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
>  DEPENDS = "libpng jpeg zlib"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "http://www.boutell.com/gd/http/gd-${PV}.tar.gz"
>  S = "${WORKDIR}/gd-${PV}"
> @@ -17,7 +17,7 @@ EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
>                    --without-xpm \
>                    --without-x"
>  
> -EXTRA_OEMAKE = "LDFLAGS=-L${STAGING_LIBDIR}"
> +EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
>  
>  headers = "gd.h gdcache.h gd_io.h gdfx.h gdfontmb.h \
>  	   gdfontg.h gdfontl.h gdfonts.h gdfontt.h"
> -- 
> 1.6.2.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


