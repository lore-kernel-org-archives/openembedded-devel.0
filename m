Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SJ5kQ-0005mq-NT
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2012 18:22:51 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2H000GY91O29D6@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	14 Apr 2012 11:13:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7D97F2016B; Sat,
	14 Apr 2012 12:13:00 -0400 (EDT)
Date: Sat, 14 Apr 2012 12:13:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120414161300.GB24515@denix.org>
References: <1334412572-19597-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1334412572-19597-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] systemd: create empty machine-id to fix first boot failures
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
X-List-Received-Date: Sat, 14 Apr 2012 16:22:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 14, 2012 at 04:09:32PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
> index b23e5f5..f4ca72a 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  PKGV = "v${GITPKGVTAG}"
>  
>  PV = "git"
> -PR = "r26"
> +PR = "r27"
>  
>  inherit useradd pkgconfig autotools vala perlnative
>  
> @@ -64,6 +64,10 @@ do_install() {
>  
>  	# create dir for journal
>  	install -d ${D}${localstatedir}/log/journal
> +
> +	# create machine-id
> +	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
> +	touch ${D}${sysconfdir}/machine-id
>  }
>  
>  python populate_packages_prepend (){
> -- 
> 1.7.2.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


