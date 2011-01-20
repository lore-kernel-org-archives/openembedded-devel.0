Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Pg32C-0003nx-Jd
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 23:31:17 +0100
Received: (qmail 12931 invoked from network); 20 Jan 2011 22:23:55 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	20 Jan 2011 22:23:55 -0000
Message-ID: <4D38B5EF.8020905@mwester.net>
Date: Thu, 20 Jan 2011 16:23:43 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295561718-19143-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295561718-19143-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] preferred-slugos-versions.inc: Prefer perl 5.10.1
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
X-List-Received-Date: Thu, 20 Jan 2011 22:31:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/20/2011 4:15 PM, Khem Raj wrote:
> * We do not need to pin bluez-libs anymore we use bluez4 for everything
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/preferred-slugos-versions.inc |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index 4649c90..c68d511 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -38,6 +38,8 @@ PREFERRED_VERSION_linux-libc-headers		?= "2.6.31"
>  PREFERRED_VERSION_m4				?= "1.4.14"
>  PREFERRED_VERSION_m4-native			?= "1.4.14"
>  PREFERRED_VERSION_nslu2-linksys-firmware	?= "2.3r63"
> +PREFERRED_VERSION_perl				?= "5.10.1"
> +PREFERRED_VERSION_perl-native			?= "5.10.1"
>  PREFERRED_VERSION_pkgconfig			?= "0.23"
>  PREFERRED_VERSION_pkgconfig-native		?= "0.23"
>  PREFERRED_VERSION_udev				?= "118"
> @@ -55,6 +57,3 @@ PREFERRED_VERSION_udev				?= "118"
>  
>  # latest tcl recipe has a bug that overwites regex.h; use the old tcl
>  #PREFERRED_VERSION_tcl				?= "8.4.19"
> -
> -# We need the bluez4 version of the libs, which has default_precedence = -1
> -PREFERRED_VERSION_bluez-libs			?= "4.42"



