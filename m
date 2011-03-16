Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxGh-0003oi-VW
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:24:32 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600HB239C9IZ1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:22:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 33E3714AF6A; Wed,
	16 Mar 2011 16:22:24 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:22:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202224.GK3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<64d42452395f0c02d355516943c8493dc770ade2.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <64d42452395f0c02d355516943c8493dc770ade2.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [2010.03-maintenance] [PATCH 7/7]	toolchain-external.conf: set the default provider for gdbserver
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
X-List-Received-Date: Wed, 16 Mar 2011 20:24:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:40PM -0400, Ben Gardiner wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> (cherry picked from commit df59f77a2eb37d9807c6d9167488110e92601d7b)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/distro/include/toolchain-external.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
> index 12dc454..6ea2a37 100644
> --- a/conf/distro/include/toolchain-external.inc
> +++ b/conf/distro/include/toolchain-external.inc
> @@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-toolchai
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN_BRAND}"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
>  PREFERRED_PROVIDER_linux-libc-headers ?= "external-toolchain-${TOOLCHAIN_BRAND}"
> +PREFERRED_PROVIDER_gdbserver ?= "external-toolchain-${TOOLCHAIN_BRAND}"
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


