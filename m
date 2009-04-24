Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxGCK-0006np-Ii
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:51:50 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIL003QBHMFEQU7@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 02:47:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D0F126B83C6; Fri,
	24 Apr 2009 03:47:02 -0400 (EDT)
Date: Fri, 24 Apr 2009 03:47:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090424074702.GC28636@denix.org>
References: <1240557981-13344-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1240557981-13344-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] unzip: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:51:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 24, 2009 at 09:26:21AM +0200, Koen Kooi wrote:
> From: Stanislav Brabec <utx@penguin.cz>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/unzip/unzip_552.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/unzip/unzip_552.bb b/recipes/unzip/unzip_552.bb
> index 2f06e1b..d880919 100644
> --- a/recipes/unzip/unzip_552.bb
> +++ b/recipes/unzip/unzip_552.bb
> @@ -6,7 +6,7 @@ PR = "r1"
>  SRC_URI = "http://ftp.info-zip.org/pub/infozip/src/unzip${PV}.tar.gz"
>  S = "${WORKDIR}/unzip-5.52"
>  
> -export LD = "${CC}"
> +export LD = "${CC} ${LDFLAGS}"
>  
>  do_compile() {
>          oe_runmake -f unix/Makefile generic
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


