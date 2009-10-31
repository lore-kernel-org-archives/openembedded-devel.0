Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48ok-0004IK-Ib
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:56:13 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD006Q2CNO1O86@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:55:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF36C14AF60; Sat,
	31 Oct 2009 03:55:00 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:55:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075500.GK16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-6-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-6-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: Re: [STABLE][PATCH 5/6] task-proper-tools: added few extra	packages
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
X-List-Received-Date: Sat, 31 Oct 2009 07:56:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:57AM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@openembedded.org>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/tasks/task-proper-tools.bb |   35 ++++++++++++++++++++---------------
>  1 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes/tasks/task-proper-tools.bb b/recipes/tasks/task-proper-tools.bb
> index c5045a1..056109e 100644
> --- a/recipes/tasks/task-proper-tools.bb
> +++ b/recipes/tasks/task-proper-tools.bb
> @@ -1,31 +1,36 @@
>  DESCRIPTION = "Full versions of tools provided by busybox"
> -PR = "r9"
> +PR = "r10"
>  
>  inherit task
>  
>  RDEPENDS_${PN} = "\
> +		binutils-symlinks \
>  		coreutils \
> +		cpio \
> +		debianutils \
> +		diffutils \
> +		e2fsprogs \
> +		e2fsprogs-fsck \
> +		fbset \
>  		findutils \
> -		util-linux-ng \
> -		grep \
>  		gawk \
> -		sed \
> -		wget \
> -		patch \
> -		tar \
> -		diffutils \
> +		grep \
> +		gzip \
> +		iproute2 \
> +		iputils \
>  		less \
> -		vim \
> -		e2fsprogs \
> -		binutils-symlinks \
>  		module-init-tools \
> +		netcat \
>  		net-tools \
> -		iproute2 \
> -		iputils \
> +		patch \
> +		procps \
>  		psmisc \
> -		debianutils \
> +		sed \
> +		tar \
>  		tcptraceroute \
> -		fbset \
> +		util-linux-ng \
> +		vim \
> +		wget \
>          "
>  #
>  # binutils-symlinks provide ar in a way which conflict with busybox - #1465 for more info
> -- 
> 1.6.5
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


