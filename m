Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PEAhN-0005l3-Cp
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 02:02:33 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBE00BYR06MA0M3@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Nov 2010 20:01:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 82BB214AF6A; Thu,
	04 Nov 2010 21:01:34 -0400 (EDT)
Date: Thu, 04 Nov 2010 21:01:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101105010134.GB6115@denix.org>
References: <1288916270-21459-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1288916270-21459-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] task-arago-toolchain: Exclude from World build
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
X-List-Received-Date: Fri, 05 Nov 2010 01:02:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 04, 2010 at 05:17:50PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

As an Arago maintainer:
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/tasks/task-arago-toolchain-dvsdk-target.bb |    1 +
>  recipes/tasks/task-arago-toolchain-gst-target.bb   |    1 +
>  recipes/tasks/task-arago-toolchain-target.bb       |    1 +
>  3 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/tasks/task-arago-toolchain-dvsdk-target.bb b/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
> index c143255..a8d3884 100644
> --- a/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
> +++ b/recipes/tasks/task-arago-toolchain-dvsdk-target.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
>  ALLOW_EMPTY = "1"
>  PR = "r18"
> +EXCLUDE_FROM_WORLD = "1"
>  
>  PACKAGES = "${PN}"
>  
> diff --git a/recipes/tasks/task-arago-toolchain-gst-target.bb b/recipes/tasks/task-arago-toolchain-gst-target.bb
> index 3c6c2b9..ced1708 100644
> --- a/recipes/tasks/task-arago-toolchain-gst-target.bb
> +++ b/recipes/tasks/task-arago-toolchain-gst-target.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
>  ALLOW_EMPTY = "1"
>  PR = "r24"
> +EXCLUDE_FROM_WORLD = "1"
>  
>  PACKAGES = "${PN}"
>  
> diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks/task-arago-toolchain-target.bb
> index 496910e..8fb5182 100644
> --- a/recipes/tasks/task-arago-toolchain-target.bb
> +++ b/recipes/tasks/task-arago-toolchain-target.bb
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "Target packages for a standalone Arago SDK or external toolchain"
>  ALLOW_EMPTY = "1"
>  PR = "r3"
> +EXCLUDE_FROM_WORLD = "1"
>  
>  PACKAGES = "${PN}"
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


