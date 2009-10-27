Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2iVM-0005Ss-OL for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 10:38:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2iUC-0004qL-QU
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 10:37:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 10:37:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 10:37:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Oct 2009 10:36:42 +0100
Message-ID: <hc6eva$qum$1@ger.gmane.org>
References: <70c9a9110910270155j3d9aed71m4f106612a94b8cfe@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <70c9a9110910270155j3d9aed71m4f106612a94b8cfe@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/5] igep0020.conf: Fix missing u-boot entrypoint
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
X-List-Received-Date: Tue, 27 Oct 2009 09:38:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27-10-09 09:55, Enric Balletbò i Serra wrote:
> Signed-off-by: Enric Balletbo i Serra<eballetbo@iseebcn.com>
> ---
>   conf/machine/igep0020.conf |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
> index 512a977..7430646 100644
> --- a/conf/machine/igep0020.conf
> +++ b/conf/machine/igep0020.conf
> @@ -24,6 +24,9 @@ IMAGE_FSTYPES += "tar.bz2 ubi"
>   # Guesswork
>   SERIAL_CONSOLE = "115200 ttyS2"
>
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"

NACK, that is already set from within omap3.inc

regards,

Koen



