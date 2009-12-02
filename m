Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NFvc3-0008Vn-3c
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 21:15:50 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KU1006KYHEZ2S67@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 Dec 2009 13:13:48 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0420414AF60; Wed,
	02 Dec 2009 14:13:46 -0500 (EST)
Date: Wed, 02 Dec 2009 14:13:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091202191346.GC21762@denix.org>
References: <1259769386-5786-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1259769386-5786-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: Re: [STABLE][PATCH] linux-bug: bumped SRCREV for new fixes, autoload SDIO wifi
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
X-List-Received-Date: Wed, 02 Dec 2009 20:15:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Dec 02, 2009 at 04:56:26PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/linux/linux-bug_2.6.27.2.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
> index bb4d11f..85ed0a9 100644
> --- a/recipes/linux/linux-bug_2.6.27.2.bb
> +++ b/recipes/linux/linux-bug_2.6.27.2.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
>  
>  PV_append = "+svnr${SRCREV}"
>  KV = "2.6.27.2"
> -PR = "r30"
> +PR = "r31"
>  
>  COMPATIBLE_MACHINE = "bug"
>  
>  SVN_PRJ = "bug-linux-${KV}"
> -SRCREV = "10371"
> +SRCREV = "10550"
>  
>  SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
>             file://defconfig \
> @@ -46,5 +46,6 @@ module_autoload_bugpm = "bugpm"
>  module_autoload_bugpm_apm = "bugpm_apm"
>  module_autoload_rtc-isl12026 = "rtc-isl12026"
>  module_autoload_bug_v4l2_capture = "bug_v4l2_capture"
> +module_autoload_libertas_sdio = "libertas_sdio"
>  # bmi_lcd_core loaded to ensure xserver device nodes are created on boot.
>  module_autoload_bmi_lcd_core = "bmi_lcd_core"
> -- 
> 1.6.5.3
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


