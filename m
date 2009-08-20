Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Me0oA-00043o-Bl
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 08:07:35 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E50431B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 05:54:12 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 07:49:39 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com>
In-Reply-To: <1250738680-20274-7-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200908200749.39432.holger+oe@freyther.de>
Subject: Re: [PATCH] bitbake.conf: Add export for cross NM.
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
X-List-Received-Date: Thu, 20 Aug 2009 06:07:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 05:24:38 Chris Larson wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> When not providing a cross nm, the configure for libtool-cross falls back
> to the system nm. This can lead to empty "global_symbol_pipe" and
> "global_symbol_to_cdeclvarble" variables in the generated libtool script.
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>


> ---
>  conf/bitbake.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 0b35ea8..371bf8e 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -404,6 +404,7 @@ export RANLIB = "${HOST_PREFIX}ranlib"
>  export STRIP = "${HOST_PREFIX}strip"
>  export OBJCOPY = "${HOST_PREFIX}objcopy"
>  export OBJDUMP = "${HOST_PREFIX}objdump"
> +export NM = "${HOST_PREFIX}nm"
>  PYTHON = "${@sys.executable}"
>
>  export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"


