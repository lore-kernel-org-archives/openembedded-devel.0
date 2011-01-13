Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdB5x-0001LA-D1
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 01:31:17 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PdB5Q-00020U-QV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 16:30:44 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 12 Jan 2011 16:30:44 -0800
Received: from [172.30.80.227] ([172.30.80.227]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 12 Jan 2011 17:30:43 -0700
Message-ID: <4D2E47AE.5060803@mentor.com>
Date: Wed, 12 Jan 2011 17:30:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294867230-7827-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 13 Jan 2011 00:30:43.0827 (UTC)
	FILETIME=[1D2B6C30:01CBB2B9]
Subject: Re: [PATCH 1/3] strace: add patch allowing compilation with kernel	headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 00:31:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2011 02:20 PM, Eric Bénard wrote:
> tested with kernel headers 2.6.31&  2.6.37 : both compile fine.

Is there a reason to not switch to 4.5.20, or even newer instead?

>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
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


-- 
Tom Rini
Mentor Graphics Corporation


