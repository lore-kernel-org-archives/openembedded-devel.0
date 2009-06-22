Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIifs-0004cV-Ch
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 14:31:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIiVG-0004sC-Go
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 12:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 12:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 14:10:36 +0200
Message-ID: <h1nsbs$mg7$2@ger.gmane.org>
References: <200906221206.37496.marcin@juszkiewicz.com.pl>
	<1245669099-30990-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245669099-30990-3-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 081/125] openswan: fixed broken download URL
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
X-List-Received-Date: Mon, 22 Jun 2009 12:31:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 13:11, Marcin Juszkiewicz wrote:
> From: Martin Dietze<martin@the-little-red-haired-girl.org>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/openswan/openswan_2.2.0.bb |    2 +-
>   recipes/openswan/openswan_2.4.7.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/openswan/openswan_2.2.0.bb b/recipes/openswan/openswan_2.2.0.bb
> index b1c5271..bcf5a28 100644
> --- a/recipes/openswan/openswan_2.2.0.bb
> +++ b/recipes/openswan/openswan_2.2.0.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.openswan.org"
>   LICENSE = "GPLv2"
>   DEPENDS = "gmp flex-native"
>   RRECOMMENDS = "kernel-module-ipsec"
> -RDEPENDS_nylon = "perl"
> +RDEPENDS_append_nylon = "perl"
>   PR = "r5"
>
>   SRC_URI = "http://www.openswan.org/download/old/openswan-${PV}.tar.gz \
> diff --git a/recipes/openswan/openswan_2.4.7.bb b/recipes/openswan/openswan_2.4.7.bb
> index 353e0ea..28e599b 100644
> --- a/recipes/openswan/openswan_2.4.7.bb
> +++ b/recipes/openswan/openswan_2.4.7.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.openswan.org"
>   LICENSE = "GPLv2"
>   DEPENDS = "gmp flex-native"
>   RRECOMMENDS = "kernel-module-ipsec"
> -RDEPENDS_nylon = "perl"
> +RDEPENDS_append_nylon = "perl"
>   PR = "r0"
>
>   SRC_URI = "http://www.openswan.org/download/openswan-${PV}.tar.gz \




