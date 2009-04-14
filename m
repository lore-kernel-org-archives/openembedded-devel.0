Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtqaH-0005vh-Fr
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 23:54:28 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI4009NL209WWUL@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 16:50:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6B4A66B83A8; Tue,
	14 Apr 2009 17:50:33 -0400 (EDT)
Date: Tue, 14 Apr 2009 17:50:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414215033.GG28306@denix.org>
References: <1239720071-6333-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1239720071-6333-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] ltrace: fix build (at least for omap3)
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
X-List-Received-Date: Tue, 14 Apr 2009 21:54:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 04:41:11PM +0200, Koen Kooi wrote:
> From: Carsten Haitzler (Rasterman) <raster@rasterman.com>

Same comment as for gdbm...

Acked-by: Denys Dmytriyenko <denis@denix.org>


> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/ltrace/ltrace_0.4.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/ltrace/ltrace_0.4.bb b/recipes/ltrace/ltrace_0.4.bb
> index 19a0d43..9dc959e 100644
> --- a/recipes/ltrace/ltrace_0.4.bb
> +++ b/recipes/ltrace/ltrace_0.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://packages.debian.org/unstable/utils/ltrace.html"
>  SECTION = "devel"
>  DEPENDS = "binutils libelf"
>  LICENSE = "GPL"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "${DEBIAN_MIRROR}/main/l/ltrace/ltrace_0.4.orig.tar.gz \
>             ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_0.4-1.diff.gz;patch=1 \
> @@ -18,6 +18,7 @@ EXTRA_OEMAKE = "INSTALL_FILE='$(INSTALL) -p -m 0644' \
>  		INSTALL_DIR='$(INSTALL) -p -d -m 0755' "
>  
>  export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
> +TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  do_configure_prepend() {
>  	ln -sf ./linux-gnu sysdeps/linux-gnueabi
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


