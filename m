Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxGJ-0003oF-6D
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:24:07 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600IJ6385DUF4@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:21:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ED5C314AF6A; Wed,
	16 Mar 2011 16:21:40 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:21:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202140.GG3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<925e89153270dc162957903bc793ecbfdbf6ec05.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <925e89153270dc162957903bc793ecbfdbf6ec05.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2010.03-maintenance] [PATCH 3/7] external-toolchain:	allow override of linux-libc-headers provider
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
X-List-Received-Date: Wed, 16 Mar 2011 20:24:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:36PM -0400, Ben Gardiner wrote:
> only set PREFERRED_PROVIDER_linux-libc-headers if it is not
> already assigned a value.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Tested-by: Andrea Galbusera <gizero@gmail.com>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> (cherry picked from commit 829ea5110bc82f71a225f168bcb6a9a327b1b5c8)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/distro/include/toolchain-external.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
> index ab50308..12dc454 100644
> --- a/conf/distro/include/toolchain-external.inc
> +++ b/conf/distro/include/toolchain-external.inc
> @@ -4,7 +4,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain-${T
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-toolchain-${TOOLCHAIN_BRAND}"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN_BRAND}"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
> -PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain-${TOOLCHAIN_BRAND}"
> +PREFERRED_PROVIDER_linux-libc-headers ?= "external-toolchain-${TOOLCHAIN_BRAND}"
>  
>  TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
>  TARGET_VENDOR := "${TOOLCHAIN_VENDOR}"
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


