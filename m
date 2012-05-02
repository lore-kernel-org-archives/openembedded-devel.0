Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SPTvm-00057t-C5
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 09:24:58 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3D0094CW5C3RM1@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 May 2012 02:15:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9C7232016E; Wed,
	02 May 2012 03:15:12 -0400 (EDT)
Date: Wed, 02 May 2012 03:15:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120502071512.GB2681@denix.org>
References: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
	<1335819064-29468-2-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1335819064-29468-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [toolchain-layer][PATCH 2/3] gcc-crosssdk-intermediate_4.5.bb: with-headers has been moved from common include
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
X-List-Received-Date: Wed, 02 May 2012 07:24:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 30, 2012 at 01:51:03PM -0700, Khem Raj wrote:
> To accomodate gcc 4.7 which needed a different option
> than --with-header this option setting has been moved
> into version specific recipes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  .../gcc/gcc-crosssdk-intermediate_4.5.bb           |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
> index 971f3ba..61a0dfb 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
> @@ -1,3 +1,3 @@
>  require recipes-devtools/gcc/gcc-cross-intermediate_${PV}.bb
>  require recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
> -
> +EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


