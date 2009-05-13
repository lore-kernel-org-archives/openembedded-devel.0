Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4Fzw-0007VE-FI
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 17:03:56 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4FtP-0004Bd-Ip
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 14:57:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 14:57:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 14:57:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 May 2009 16:56:58 +0200
Message-ID: <guen3q$p5u$1@ger.gmane.org>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 15:03:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 16:46, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<hrw@openembedded.org>
>
>
> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
> ---
>   conf/distro/angstrom-2008.1.conf |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index a466834..b5dbc48 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -101,6 +101,7 @@ ANGSTROM_GCC_VERSION_bfin			= "4.1.2"
>
>   ANGSTROM_GCC_VERSION_486sx      = "4.3.3"
>   ANGSTROM_GCC_VERSION_armv7a     = "4.3.3"
> +ANGSTROM_GCC_VERSION_geode      = "4.3.3"
>
>   # Uncomment this if want need to build an armv7a kernel with CSL toolchain (<2.6.27 don't boot with mainline gcc)
>   #KERNEL_CCSUFFIX_armv7a= "-4.2.1+csl-arm-2007q3-53"

NAK, this would interfere with an outstanding patch that Graeme and I 
are testing:

http://dominion.thruhere.net/koen/OE/angstrom-dev-toolchain.diff

regards,

Koen



