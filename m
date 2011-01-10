Received: from p3plsmtpa01-10.prod.phx3.secureserver.net ([72.167.82.90])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PcL3G-0000cZ-Kd
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:57:03 +0100
Received: (qmail 9572 invoked from network); 10 Jan 2011 16:49:49 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-10.prod.phx3.secureserver.net (72.167.82.90) with ESMTP;
	10 Jan 2011 16:49:49 -0000
Message-ID: <4D2B389B.80407@mwester.net>
Date: Mon, 10 Jan 2011 10:49:31 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294640096-21868-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1294640096-21868-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] slugos.conf: Use thumb mode to save some more space
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
X-List-Received-Date: Mon, 10 Jan 2011 16:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/10/2011 12:14 AM, Khem Raj wrote:
> I have successfully nfs booted nslu box with the console-image generated
> with thumb enabled gcc. This should help in reducing the code size a bit
> more. I will build the image in all arm mode and compare how much we really
> save
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/slugos.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
> index e2e7cc0..853a58e 100644
> --- a/conf/distro/slugos.conf
> +++ b/conf/distro/slugos.conf
> @@ -10,7 +10,7 @@ DISTRO_NAME = "SlugOS"
>  # DISTRO_FEED = "unstable"
>  DISTRO_TYPE = "alpha"
>  TARGET_ARCH ?= "armeb"
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET = "thumb"
>  IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
>  PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"



