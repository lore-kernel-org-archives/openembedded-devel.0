Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIhyK-0006Oo-Ep
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:46:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIhni-0002ty-VU
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 11:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 13:04:26 +0200
Message-ID: <h1nofq$af4$2@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-11-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-11-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 034/125] fixes wrong license value usage for GPLv2
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
X-List-Received-Date: Mon, 22 Jun 2009 11:46:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Otavio Salvador<otavio@ossystems.com.br>
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/xfce.bbclass                  |    2 +-
>   recipes/gnash/gnash-minimal.inc       |    2 +-
>   recipes/gnash/gnash.inc               |    2 +-
>   recipes/linphone/linphone_1.3.99.8.bb |    2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/classes/xfce.bbclass b/classes/xfce.bbclass
> index 48e012e..b18313f 100644
> --- a/classes/xfce.bbclass
> +++ b/classes/xfce.bbclass
> @@ -5,7 +5,7 @@
>   # Global class to make it easier to maintain XFCE packages
>
>   HOMEPAGE = "http://www.xfce.org"
> -LICENSE = "LGPL-2"
> +LICENSE = "LGPLv2"
>   DEPENDS += "startup-notification"
>
>   XFCE_VERSION = ${PV}
> diff --git a/recipes/gnash/gnash-minimal.inc b/recipes/gnash/gnash-minimal.inc
> index a8e5229..5a8a91e 100644
> --- a/recipes/gnash/gnash-minimal.inc
> +++ b/recipes/gnash/gnash-minimal.inc
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
>   HOMEPAGE = "http://www.gnu.org/software/gnash"
> -LICENSE = "GPL-2"
> +LICENSE = "GPLv2"
>
>   DEPENDS = "virtual/libiconv virtual/libintl libtool agg libxml2 zlib boost jpeg pango curl freetype \
>              ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
> diff --git a/recipes/gnash/gnash.inc b/recipes/gnash/gnash.inc
> index 3602f6f..ea20524 100644
> --- a/recipes/gnash/gnash.inc
> +++ b/recipes/gnash/gnash.inc
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
>   HOMEPAGE = "http://www.gnu.org/software/gnash"
> -LICENSE = "GPL-2"
> +LICENSE = "GPLv2"
>   DEPENDS = "giflib libtool gtk+ cairo libxml2 libsdl-mixer zlib boost jpeg pango curl freetype \
>              ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
>
> diff --git a/recipes/linphone/linphone_1.3.99.8.bb b/recipes/linphone/linphone_1.3.99.8.bb
> index f96bd66..4e9b130 100644
> --- a/recipes/linphone/linphone_1.3.99.8.bb
> +++ b/recipes/linphone/linphone_1.3.99.8.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "SIP-based IP phone (Console edition)"
>   HOMEPAGE = "http://www.linphone.org/?lang=us"
> -LICENSE = "GPL-2"
> +LICENSE = "GPLv2"
>   DEPENDS = "libosip2 speex libogg alsa-lib readline"
>   PR = "r0"
>




