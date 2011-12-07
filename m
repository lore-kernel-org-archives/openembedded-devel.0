Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYPYF-0003c4-5K
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 23:01:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 13:54:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93662366"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2011 13:54:24 -0800
Message-ID: <4EDFE090.6010101@linux.intel.com>
Date: Wed, 07 Dec 2011 13:54:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1323292658.git.otavio@ossystems.com.br>
	<602892cc30a9872388e3e116d7eea691ebafe034.1323292658.git.otavio@ossystems.com.br>
In-Reply-To: <602892cc30a9872388e3e116d7eea691ebafe034.1323292658.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/1] connman: update to 0.78
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
X-List-Received-Date: Wed, 07 Dec 2011 22:01:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2011 01:18 PM, Otavio Salvador wrote:
> We moved to GIT repository as the tarball releases are not available
> since kernel.org compromise.
>
Any reason this can't be updated in OE-core?

Sau!

> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../connman/{connman_0.77.bb =>  connman_0.78.bb}   |   13 ++++++-------
>   1 files changed, 6 insertions(+), 7 deletions(-)
>   rename meta-oe/recipes-connectivity/connman/{connman_0.77.bb =>  connman_0.78.bb} (75%)
>
> diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.78.bb
> similarity index 75%
> rename from meta-oe/recipes-connectivity/connman/connman_0.77.bb
> rename to meta-oe/recipes-connectivity/connman/connman_0.78.bb
> index 9ef368b..f486f95 100644
> --- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
> +++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bb
> @@ -1,5 +1,4 @@
>   require connman.inc
> -PR = "r4"
>
>   EXTRA_OECONF += "\
>     --disable-gtk-doc \
> @@ -18,13 +17,13 @@ EXTRA_OECONF += "\
>     --with-ntpd=${bindir}/ntpd \
>   "
>
> -SRC_URI  = "\
> -  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
> -  file://connman \
> -"
> +S = "${WORKDIR}/git"
> +
> +# 0.78 tag
> +SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
>
> -SRC_URI[md5sum] = "2e95edb0ead4fff3e84458f7fa192a64"
> -SRC_URI[sha256sum] = "df6e926c4b0ccbab26d6e21b9935ab72fa5adf275eb7ac2b48540117ae84cbcc"
> +SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
> +            file://connman"
>
>   # alg-test doesn't build, so disable that and test for if_alg.h as this header is only in 2.6.39
>   do_configure_prepend() {


