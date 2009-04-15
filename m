Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lu1Ps-0005JX-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 11:28:26 +0200
Received: by ewy20 with SMTP id 20so3036055ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 02:24:36 -0700 (PDT)
Received: by 10.210.66.13 with SMTP id o13mr3935832eba.46.1239787475989;
	Wed, 15 Apr 2009 02:24:35 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id g9sm15607196gvc.4.2009.04.15.02.24.35
	(version=SSLv3 cipher=RC4-MD5); Wed, 15 Apr 2009 02:24:35 -0700 (PDT)
Message-ID: <49E5A7C7.6010809@xora.org.uk>
Date: Wed, 15 Apr 2009 10:24:23 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239784615-19928-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1239784615-19928-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 09:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2009 09:36 AM, Roman I Khimov wrote:
> libpcap can be used in distros where no bluetooth support will ever
> exist. So this dependency should be weakened to only exist in distros
> that explicitly need bluetooth.
> ---
>   recipes/libpcap/libpcap.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libpcap/libpcap.inc b/recipes/libpcap/libpcap.inc
> index 4468a4b..81bf826 100644
> --- a/recipes/libpcap/libpcap.inc
> +++ b/recipes/libpcap/libpcap.inc
> @@ -2,7 +2,11 @@ DESCRIPTION = "Network Packet Capture Library"
>   HOMEPAGE = "http://www.tcpdump.org/"
>   SECTION = "libs/network"
>   LICENSE = "BSD"
> -DEPENDS = "bluez-libs flex-native bison-native"
> +DEPENDS = " \
> +	${@base_contains("COMBINED_FEATURES", "bluetooth", "bluez-libs", "", d)} \
> +	flex-native \
> +	bison-native \
> +	"
>
>   PR = "r1"
>
>    
NACK, this doesnt do what you think it does as you don't disable 
bluetooth via any form of alteration to the build system. You have 
created randomness in your build now.

Graeme



