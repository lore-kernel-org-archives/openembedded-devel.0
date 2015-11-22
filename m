Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 22 Nov 2015 16:40:43 UTC
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 51DFA605FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 16:40:43 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 58F31DC8A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 16:31:46 +0000 (UTC)
Received: from localhost ([127.0.0.1]:32933 helo=owm.eumx.net)
	by owm.eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1a0Xb3-0004l8-Ah
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2015 16:34:37 +0000
Received: from cpc2-slam8-2-0-cust880.2-4.cable.virginm.net
	([82.24.207.113]:57038 helo=[192.168.0.22])
	by owm.eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1a0Xb3-0004l3-4I for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2015 16:34:37 +0000
To: openembedded-devel@lists.openembedded.org
References: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <5651EE95.9050707@communistcode.co.uk>
Date: Sun, 22 Nov 2015 16:34:29 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
Subject: Re: [meta-oe][PATCH] libsoc: upgrade from version 0.6 to 0.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Nov 2015 16:40:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 22/11/2015 15:45, Fathi Boudra wrote:
> * update SRCREV
> * add --with-board-configs to configure
> * run oe-stylize to sanitize the recipe
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>   .../recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb}    | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} (85%)
>
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> similarity index 85%
> rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> index 79c171a..1a7f4a7 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> @@ -1,17 +1,17 @@
>   SUMMARY = "Library for interfacing with common SoC peripherals"
>   DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio, i2c, spi, pwm) \
>                  found in SoC (System on Chips) through generic Linux Kernel interfaces."
> -
>   HOMEPAGE = "https://github.com/jackmitch/libsoc"
> -
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
> +SRCREV = "4d5c5af71e225cc4e792d2166da3f3e432b08735"
>
> -inherit autotools
> -
> -SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
>   SRC_URI = "git://github.com/jackmitch/libsoc.git"
>
>   S = "${WORKDIR}/git"
>
> +inherit autotools
> +
> +EXTRA_OECONF = "--with-board-configs"

I think this should be a packageconfig, you don't want to ship board 
files by default. Most boards will not be supported (as they will be 
custom in-house boards) and as such just clutter up the users filesystem 
and waste space.

> +
>   RDEPENDS_${PN} = "libgcc"
>

