Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NV6lB-0003ut-BB
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 18:12:00 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW700MJ03NS4RS0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Jan 2010 11:09:33 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 069FD14AF60; Wed,
	13 Jan 2010 12:09:28 -0500 (EST)
Date: Wed, 13 Jan 2010 12:09:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100113170927.GC24151@denix.org>
References: <1263313440-14774-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1263313440-14774-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] classpath-native: disable-gjdoc, it calls	antlr and fails without antlr installed on buildhost (runantlr from	antlr-native is found by configure, but antlr.jar from staging	doesn't work)
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
X-List-Received-Date: Wed, 13 Jan 2010 17:12:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 12, 2010 at 05:24:00PM +0100, Marcin Juszkiewicz wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/classpath/classpath-native.inc       |    1 +
>  recipes/classpath/classpath-native_0.97.2.bb |    2 +-
>  recipes/classpath/classpath-native_0.98.bb   |    2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/classpath/classpath-native.inc b/recipes/classpath/classpath-native.inc
> index e7570c4..35a2485 100644
> --- a/recipes/classpath/classpath-native.inc
> +++ b/recipes/classpath/classpath-native.inc
> @@ -30,6 +30,7 @@ EXTRA_OECONF = "\
>    --disable-gtk-peer \
>    --disable-plugin \
>    --disable-dssi \
> +  --disable-gjdoc \
>    --enable-examples \
>    --enable-tools \
>    --includedir=${STAGING_INCDIR}/classpath \
> diff --git a/recipes/classpath/classpath-native_0.97.2.bb b/recipes/classpath/classpath-native_0.97.2.bb
> index 4de5602..b026f40 100644
> --- a/recipes/classpath/classpath-native_0.97.2.bb
> +++ b/recipes/classpath/classpath-native_0.97.2.bb
> @@ -1,6 +1,6 @@
>  require classpath-native.inc
>  
> -PR = "r6"
> +PR = "r7"
>  
>  # The code affected by the javanet-local patch
>  # is usually not compiled. However if someone changes
> diff --git a/recipes/classpath/classpath-native_0.98.bb b/recipes/classpath/classpath-native_0.98.bb
> index 6659178..a924b8a 100644
> --- a/recipes/classpath/classpath-native_0.98.bb
> +++ b/recipes/classpath/classpath-native_0.98.bb
> @@ -3,7 +3,7 @@ require classpath-native.inc
>  # Deadlocks occur on at least amd64 hosts.
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  # The code affected by the javanet-local patch
>  # is usually not compiled. However if someone changes
> -- 
> 1.6.6
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


