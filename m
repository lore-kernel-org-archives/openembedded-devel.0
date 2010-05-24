Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OGhJX-0002cR-AU
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 01:44:08 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2Y005Z872DXI06@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 May 2010 18:39:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E73AF14AF60; Mon,
	24 May 2010 19:39:48 -0400 (EDT)
Date: Mon, 24 May 2010 19:39:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100524233948.GM25484@denix.org>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
	<13ca048a9b8e288c16467f1f833aeee6654d9981.1274642314.git.enrico.scholz@sigma-chemnitz.de>
MIME-version: 1.0
In-reply-to: <13ca048a9b8e288c16467f1f833aeee6654d9981.1274642314.git.enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 2/3] freetype: build with system zlib
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
X-List-Received-Date: Mon, 24 May 2010 23:44:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 23, 2010 at 09:20:02PM +0200, Enrico Scholz wrote:
> Problems mentioned in 4187d3df8838506f6578a2b0f2fb98f98c41e151 (Aug
> 2006) seem to went away and build succeeds with system zlib now.  Using
> system libraries is preferable because it saves space and allows better
> tracking of security issues.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  recipes/freetype/freetype_2.3.12.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
> index de9ff29..b1f8d6f 100644
> --- a/recipes/freetype/freetype_2.3.12.bb
> +++ b/recipes/freetype/freetype_2.3.12.bb
> @@ -1,7 +1,8 @@
>  DESCRIPTION = "Freetype font rendering library"
>  SECTION = "libs"
>  LICENSE = "freetype"
> -PR = "r0"
> +PR = "r1"
> +DEPENDS = "zlib"
>  
>  SRC_URI = "\
>    ${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
> @@ -18,7 +19,6 @@ inherit autotools pkgconfig binconfig
>  
>  LIBTOOL = "${HOST_SYS}-libtool"
>  EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
> -EXTRA_OECONF = "--without-zlib"
>  
>  do_configure() {
>  	cd builds/unix
> -- 
> 1.7.0.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


