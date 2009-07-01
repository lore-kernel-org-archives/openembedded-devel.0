Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5dq-0003xa-Jo
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:38:51 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400M72BCMTF72@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:26:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6D0C114AF5F; Wed,
	01 Jul 2009 15:26:46 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:26:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701192646.GK20815@denix.org>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
	<1246474496-16704-5-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474496-16704-5-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 040/125] openssl-native: removed FILESPATH	setting which is not needed
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
X-List-Received-Date: Wed, 01 Jul 2009 19:38:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:55PM +0200, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@openembedded.org>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/openssl/openssl-native_0.9.7g.bb |    2 --
>  recipes/openssl/openssl-native_0.9.7m.bb |    2 --
>  recipes/openssl/openssl-native_0.9.8g.bb |    2 --
>  recipes/openssl/openssl-native_0.9.8j.bb |    2 --
>  4 files changed, 0 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes/openssl/openssl-native_0.9.7g.bb b/recipes/openssl/openssl-native_0.9.7g.bb
> index 14f6d92..dfe3ab5 100644
> --- a/recipes/openssl/openssl-native_0.9.7g.bb
> +++ b/recipes/openssl/openssl-native_0.9.7g.bb
> @@ -8,8 +8,6 @@ SRC_URI += "file://debian.patch;patch=1 \
>              file://armeb.patch;patch=1;pnum=0 \
>              file://gnueabi-arm.patch;patch=1"
>  
> -FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  do_install() {
>  	:
>  }
> diff --git a/recipes/openssl/openssl-native_0.9.7m.bb b/recipes/openssl/openssl-native_0.9.7m.bb
> index b00dc5e..445b6e9 100644
> --- a/recipes/openssl/openssl-native_0.9.7m.bb
> +++ b/recipes/openssl/openssl-native_0.9.7m.bb
> @@ -12,8 +12,6 @@ SRC_URI += "file://debian.patch;patch=1 \
>              file://armeb.patch;patch=1;pnum=0 \
>              file://gnueabi-arm.patch;patch=1"
>  
> -FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  do_install() {
>  	:
>  }
> diff --git a/recipes/openssl/openssl-native_0.9.8g.bb b/recipes/openssl/openssl-native_0.9.8g.bb
> index 1ad90a0..a5aa9ec 100644
> --- a/recipes/openssl/openssl-native_0.9.8g.bb
> +++ b/recipes/openssl/openssl-native_0.9.8g.bb
> @@ -16,8 +16,6 @@ SRC_URI += "file://debian.patch;patch=1 \
>  
>  PARALLEL_MAKE = ""
>  
> -FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  do_install() {
>  	:
>  }
> diff --git a/recipes/openssl/openssl-native_0.9.8j.bb b/recipes/openssl/openssl-native_0.9.8j.bb
> index 5f3e307..7189cec 100644
> --- a/recipes/openssl/openssl-native_0.9.8j.bb
> +++ b/recipes/openssl/openssl-native_0.9.8j.bb
> @@ -16,8 +16,6 @@ SRC_URI += "file://configure-targets.patch;patch=1 \
>  
>  PARALLEL_MAKE = ""
>  
> -FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  do_install() {
>  	:
>  }
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


