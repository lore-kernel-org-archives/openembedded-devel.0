Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHHDI-0003bw-Ri
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 14:59:33 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ICmasO003407 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:48:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uhkoXXTf1FDV for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:48:36 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ICmY4j003383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 13:48:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1245267720-13612-3-git-send-email-khimov@altell.ru>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
	<1245267720-13612-3-git-send-email-khimov@altell.ru>
Date: Thu, 18 Jun 2009 13:47:33 +0100
Message-Id: <1245329253.11257.16.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 3/3] package_ipk: fix race in opkg.conf creation
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
X-List-Received-Date: Thu, 18 Jun 2009 12:59:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 23:42 +0400, Roman I Khimov wrote:
> It's a very little race, but one can hit it anyway on concurrent image builds.
> ---
>  classes/package_ipk.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
> index d804c78..a4e6918 100644
> --- a/classes/package_ipk.bbclass
> +++ b/classes/package_ipk.bbclass
> @@ -3,7 +3,7 @@ inherit package
>  BOOTSTRAP_EXTRA_RDEPENDS += "opkg-collateral opkg"
>  IMAGE_PKGTYPE ?= "ipk"
>  
> -IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
> +IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/${PN}-opkg.conf"
>  IPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf"
>  IPKGCONF_CANSDK =  "${STAGING_ETCDIR_NATIVE}/opkg-canadian-sdk.conf"

Please don't do this, it will just create a ton of files all with the
same content. If you're really worried about racing, add proper locking
instead.

Cheers,

Richard




