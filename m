Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdG4j-0001On-P7
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 06:50:21 +0100
Received: by pxi17 with SMTP id 17so195621pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 21:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=n+a+QtrGI278Ow1BmRK5PUfj7OFG8UDeZaC0Fd2ht34=;
	b=NdlykMhqM9sjjI/zdO9GBbTJrdBY3eMZmm+qHRjOmgMhVxVLKBIsEcUEVCeGzWYjU3
	ZVI8GQvIeky2Ggmt0RVxvPNt1YhsLWQhtP0b2RRWO3yDfneUcyDmM9a1BmS1MKvxouyP
	dVsINueHpGF+2hYPnJflptruwsyvLivM5ZiOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=MEhr+GNP+IIkwgDLrcm4TfR7vUl2vqaLqLEpFoDi8ZbPpXN+m3QwJDSijuuGi0T8f6
	yt++J1FvA+wL/YZur4C3Uo02y+tyf9BmnNeCO+6mZtfYL9rRvtyzWKj2PZmNg4Gxo/zb
	ZUsa8H8aaLCz4C0E1tv3+Su2op6gC41yDI/M8=
Received: by 10.142.147.16 with SMTP id u16mr532407wfd.426.1294897774738;
	Wed, 12 Jan 2011 21:49:34 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w14sm1873846wfd.18.2011.01.12.21.49.33
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 21:49:34 -0800 (PST)
Message-ID: <4D2E9269.2020409@gmail.com>
Date: Wed, 12 Jan 2011 21:49:29 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294867230-7827-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 1/3] strace: add patch allowing compilation with kernel headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 05:50:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/2011 1:20 PM, Eric Bénard wrote:
> tested with kernel headers 2.6.31&  2.6.37 : both compile fine.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

I think you forgot to add the patch itself.

> ---
>   recipes/strace/strace_4.5.14.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
> index 33a44ad..395e4ee 100644
> --- a/recipes/strace/strace_4.5.14.bb
> +++ b/recipes/strace/strace_4.5.14.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "strace is a system call tracing tool."
>   SECTION = "console/utils"
>   LICENSE = "BSD"
> -PR = "r9"
> +PR = "r10"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>              file://glibc-2.5.patch \
> @@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>              file://strace-arm-no-cachectl.patch \
>              file://strace-dont-include-linux-dirent-h.patch \
>              file://mips-sigcontext.patch \
> +           file://strace-linux-2.6.32.patch \
>             "
>
>   # The strace-4.5.14-avr32.patch conflicts with some other patches.



