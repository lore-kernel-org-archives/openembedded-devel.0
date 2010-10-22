Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P9Qli-0000zC-8S
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 01:11:27 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAP007LOSDJ3SW2@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	22 Oct 2010 18:10:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 800EF14AF64; Fri,
	22 Oct 2010 19:10:31 -0400 (EDT)
Date: Fri, 22 Oct 2010 19:10:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101022231031.GB11514@denix.org>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
	<1287730684-14143-4-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1287730684-14143-4-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/5] binutils: Update libtool macros to reflect	--with-sysroot -> --with-libtool-sysroot rename
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
X-List-Received-Date: Fri, 22 Oct 2010 23:11:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 21, 2010 at 11:58:03PM -0700, Khem Raj wrote:
> * We dont need to filter out with-sysroot anymore
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

> diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
> index 0f086f3..ab9e457 100644
> --- a/recipes/binutils/binutils.inc
> +++ b/recipes/binutils/binutils.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
>  SECTION = "devel"
>  LICENSE = "GPL"
>  
> -INC_PR = "r12"
> +INC_PR = "r13"
>  
>  COMPATIBLE_TARGET_SYS ?= "(?!nios2)"
>  
> @@ -42,10 +42,6 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>  
>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>  		--enable-shared"
> -python __anonymous () {
> -       cfg = oe_filter_out('--with-sysroot$' , bb.data.getVar('CONFIGUREOPTS', d, 1) or "", d)
> -       bb.data.setVar('CONFIGUREOPTS', cfg, d)
> -}

Nice! That anonymous function was giving me all sorts of issues. I'm all for 
removing it, but unfortunately I already re-structured my code to work it 
around... :)

-- 
Denys

>  # This is necessary due to a bug in the binutils Makefiles
>  EXTRA_OEMAKE = "configure-build-libiberty all"
> -- 
> 1.7.1


