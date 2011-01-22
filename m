Received: from smtpauth05.prod.mesa1.secureserver.net ([64.202.165.99])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PgSIO-0000HQ-2U
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 02:29:40 +0100
Received: (qmail 22534 invoked from network); 22 Jan 2011 01:22:16 -0000
Received: from unknown (209.242.7.132)
	by smtpauth05.prod.mesa1.secureserver.net (64.202.165.99) with ESMTP;
	22 Jan 2011 01:22:16 -0000
Message-ID: <4D3A313D.6040601@mwester.net>
Date: Fri, 21 Jan 2011 19:22:05 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295634811-5751-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295634811-5751-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 4/4] conf/distro/include/slugos.inc: Remove redundant virtuals
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
X-List-Received-Date: Sat, 22 Jan 2011 01:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/21/2011 12:33 PM, Khem Raj wrote:
> * Slugos now gets them correctly defined through sane-toolchain includes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Love to see things simplified! :)

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/slugos.inc |   11 -----------
>  1 files changed, 0 insertions(+), 11 deletions(-)
> 
> diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
> index 0ed22d2..4c5b463 100644
> --- a/conf/distro/include/slugos.inc
> +++ b/conf/distro/include/slugos.inc
> @@ -123,17 +123,6 @@ IGNORE_STRIP_ERRORS = ""
>  # kernel, so there has to be a non-libc gcc to build the kernel!)
>  
>  # Virtuals:
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial	    = "gcc-cross-initial"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc		    = "gcc-cross"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++		    = "gcc-cross"
> -
> -# Set the preferred provider for a few toolchain-related items, otherwise
> -# these may be selected from the external-toolchain instead.
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils	    = "binutils-cross"
> -PREFERRED_PROVIDER_virtual/arm-linux-binutils		    = "binutils-cross"
> -PREFERRED_PROVIDER_virtual/armeb-linux-binutils		    = "binutils-cross"
> -PREFERRED_PROVIDER_linux-libc-headers			    = "linux-libc-headers"
>  
>  # Select the appropriate x11 library provider.  The diet-x11 libraries are
>  # much smaller, but may not be as current as the standard x11 libraries; by



