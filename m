Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PQ4kb-0002Fy-7k
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 22:07:07 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LD200FPCT8FHK23@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Dec 2010 15:05:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ACCFC14AF64; Tue,
	07 Dec 2010 16:05:02 -0500 (EST)
Date: Tue, 07 Dec 2010 16:05:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101207210502.GC6510@denix.org>
References: <1291749231-15483-1-git-send-email-j-lance1@ti.com>
MIME-version: 1.0
In-reply-to: <1291749231-15483-1-git-send-email-j-lance1@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH 1/2] matrix-gui: updating SRC rev to pick up new	platforms and matrix code enhancements
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
X-List-Received-Date: Tue, 07 Dec 2010 21:07:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 07, 2010 at 01:13:50PM -0600, Jeff Lance wrote:
> * Added Matrix Enhancements:
>   * Added new platforms am180x, am181x and am3517
>   * add control menubar at the top of matrix-gui (HTML change not code change)
>   * add descriptions to matrix applications (source code change)
>   * make matrix scalable with respect to number of applications.
>     * allow addtional main menu pages and allow additional sub-menu pages (source code change)
> 
> NOTE: code changes are backwards compatible with existing platform support files.

Jeff, Chase,

The only comment I have is that in the first patch you add new .bb files with 
latest SRCREV and for some reason bump INC_PR in the .inc files, altough there 
are no changes there. Then in the second patch you update the .inc files and 
don't bump the INC_PR. It would make more sense to increment INC_PR as part of 
the second patch and not the first.

-- 
Denys


> Signed-off-by: Jeff Lance <j-lance1@ti.com>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/ti/matrix-gui-common.inc    |    2 +-
>  recipes/ti/matrix-gui-common_1.4.bb |    8 ++++++++
>  recipes/ti/matrix-gui-e.inc         |    2 +-
>  recipes/ti/matrix-gui-e_1.3.bb      |    5 +++++
>  recipes/ti/matrix-gui.inc           |    2 +-
>  recipes/ti/matrix-gui_1.3.bb        |    4 ++++
>  6 files changed, 20 insertions(+), 3 deletions(-)
>  create mode 100644 recipes/ti/matrix-gui-common_1.4.bb
>  create mode 100644 recipes/ti/matrix-gui-e_1.3.bb
>  create mode 100644 recipes/ti/matrix-gui_1.3.bb
> 
> diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
> index b5a368e..2d2cea3 100644
> --- a/recipes/ti/matrix-gui-common.inc
> +++ b/recipes/ti/matrix-gui-common.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> -INC_PR = "r5"
> +INC_PR = "r6"
>  
>  COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
>  
> diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
> new file mode 100644
> index 0000000..c578a47
> --- /dev/null
> +++ b/recipes/ti/matrix-gui-common_1.4.bb
> @@ -0,0 +1,8 @@
> +require matrix-gui-common.inc
> +
> +# Use the mem_util application from am-sysinfo instead of a
> +# prebuilt version in the repository.
> +RRECOMMENDS_${PN} = "am-sysinfo"
> +
> +SRCREV = "192"
> +PR = "${INC_PR}.0"
> diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
> index 86f08b1..c3a9341 100644
> --- a/recipes/ti/matrix-gui-e.inc
> +++ b/recipes/ti/matrix-gui-e.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> -INC_PR = "r20"
> +INC_PR = "r21"
>  
>  COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
>  
> diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
> new file mode 100644
> index 0000000..dd1b16b
> --- /dev/null
> +++ b/recipes/ti/matrix-gui-e_1.3.bb
> @@ -0,0 +1,5 @@
> +require matrix-gui-e.inc
> +
> +SRCREV = "192"
> +PR = "${INC_PR}.0"
> +
> diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
> index a2a2721..b7678b2 100644
> --- a/recipes/ti/matrix-gui.inc
> +++ b/recipes/ti/matrix-gui.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> -INC_PR = "r18"
> +INC_PR = "r19"
>  
>  COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
>  
> diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
> new file mode 100644
> index 0000000..53db8af
> --- /dev/null
> +++ b/recipes/ti/matrix-gui_1.3.bb
> @@ -0,0 +1,4 @@
> +require matrix-gui.inc
> +
> +SRCREV = "192"
> +PR = "${INC_PR}.0"
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


