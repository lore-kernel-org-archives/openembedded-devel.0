Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Metgc-0006Nh-Hm
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 18:43:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 28F08547981
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:25:55 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11312-03 for <openembedded-devel@lists.openembedded.org>; 
	Sat, 22 Aug 2009 12:25:55 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C00A9547976
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:25:53 -0400 (EDT)
Date: Sat, 22 Aug 2009 12:25:53 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247540261-4537-3-git-send-email-msmith@cbnco.com>
Message-ID: <Pine.LNX.4.64.0908221224480.3621@juice.ott.cti.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
	<1247540261-4537-2-git-send-email-msmith@cbnco.com>
	<1247540261-4537-3-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 3/4] mesa-dri: move tls configure logic to a class
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
X-List-Received-Date: Sat, 22 Aug 2009 16:43:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


... OK to commit?

On Mon, 13 Jul 2009, Michael Smith wrote:

> Will allow reuse by xorg-xserver.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  .../mesa-tls.inc => classes/glx-use-tls.bbclass    |    3 ++-
>  recipes/mesa/mesa-common.inc                       |    3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename recipes/mesa/mesa-tls.inc => classes/glx-use-tls.bbclass (81%)
> 
> diff --git a/recipes/mesa/mesa-tls.inc b/classes/glx-use-tls.bbclass
> similarity index 81%
> rename from recipes/mesa/mesa-tls.inc
> rename to classes/glx-use-tls.bbclass
> index 1472aa7..7530872 100644
> --- a/recipes/mesa/mesa-tls.inc
> +++ b/classes/glx-use-tls.bbclass
> @@ -1,6 +1,7 @@
> -
>  def get_tls_setting(bb, d):
>      # until we have no prober TLS support in uclibc disable it
>      if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
>          return ""
>      return "--enable-glx-tls"
> +
> +EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
> diff --git a/recipes/mesa/mesa-common.inc b/recipes/mesa/mesa-common.inc
> index 4f18c2f..d7bfc14 100644
> --- a/recipes/mesa/mesa-common.inc
> +++ b/recipes/mesa/mesa-common.inc
> @@ -19,8 +19,7 @@ EXTRA_OECONF = "--enable-glu \
>                  --disable-glut \
>  	       "
>  
> -require mesa-tls.inc
> -EXTRA_OECONF += "${@get_tls_setting(bb, d)} "
> +inherit glx-use-tls
>  
>  # Package contents vary according to ${MACHINE_DRI_MODULES}.
>  PACKAGE_ARCH = "${MACHINE}"
> -- 
> 1.6.3
> 


