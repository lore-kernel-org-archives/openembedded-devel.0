Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGXvd-0003il-6h
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 17:19:37 +0200
Received: from iph5.telenor.se (iph5.telenor.se [195.54.127.136])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 6B2C7EB48E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 17:13:46 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArQuAAPonk5T4zkNPGdsb2JhbAAMOIk8kEuPBQEBAQE3giABAQEBAgE4EwEsBgsLFQwWDwkDAgECATEUEwYCAQGHfKdzAY1niBsEk36RWQ
X-IronPort-AV: E=Sophos;i="4.69,372,1315173600"; d="scan'208";a="55996226"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph5.telenor.se with ESMTP; 19 Oct 2011 17:13:46 +0200
Message-ID: <4E9EE929.4000005@telia.com>
Date: Wed, 19 Oct 2011 17:13:45 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
In-Reply-To: <1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
Subject: Re: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
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
X-List-Received-Date: Wed, 19 Oct 2011 15:19:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-19 17:10, ulf_samuelsson@telia.com skrev:

FYI:
With the three patches in the patchset,
classic openembedded builds on a 64 bit Ubuntu-11.10.
Did not test them on a board yet.

BR
Ulf Samuelsson

> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
>
> Tarball is updated to 2.20.1b so checksums have changed.
>
> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
>
> ---
>   recipes/binutils/binutils_2.20.1.bb |    7 ++++---
>   1 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
> index 5154e2d..0497675 100644
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ b/recipes/binutils/binutils_2.20.1.bb
> @@ -1,7 +1,7 @@
>   require binutils.inc
>   LICENSE = "GPLv3"
>
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
>   EXTRA_OECONF += "--disable-werror"
>
>   #COMPATIBLE_TARGET_SYS = "."
> @@ -24,10 +24,11 @@ SRC_URI_append_nios2 =" \
>   	file://binutils-nios2.patch \
>   	"
>
> -SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
> +SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
>
>   # powerpc patches
>   SRC_URI += "\
>        file://binutils-2.16.1-e300c2c3.patch \
>        "
> +


-- 
Best Regards
Ulf Samuelsson



