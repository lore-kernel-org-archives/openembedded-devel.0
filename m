Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdUQy-0008B9-OG
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 22:10:16 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PdUQQ-0001nY-G8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 13:09:42 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 13 Jan 2011 13:06:27 -0800
Received: from [172.30.80.234] ([172.30.80.234]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 Jan 2011 14:06:26 -0700
Message-ID: <4D2F694C.7000806@mentor.com>
Date: Thu, 13 Jan 2011 14:06:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2F1728.3050308@mentor.com>
	<1294950867-17198-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294950867-17198-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 13 Jan 2011 21:06:26.0341 (UTC)
	FILETIME=[BD8D3D50:01CBB365]
Subject: Re: [PATCH] strace 4.5.20: stable since 04/14/2010 so remove DP=-1
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
X-List-Received-Date: Thu, 13 Jan 2011 21:10:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/13/2011 01:34 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   recipes/strace/strace_4.5.20.bb |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
> index 89c5fd3..3de5469 100644
> --- a/recipes/strace/strace_4.5.20.bb
> +++ b/recipes/strace/strace_4.5.20.bb
> @@ -1,11 +1,7 @@
>   DESCRIPTION = "strace is a system call tracing tool."
>   SECTION = "console/utils"
>   LICENSE = "BSD"
> -PR = "r1"
> -
> -DEFAULT_PREFERENCE = "-1"
> -DEFAULT_PREFERENCE_mips = "1"
> -DEFAULT_PREFERENCE_mipsel = "1"
> +PR = "r2"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>             file://mips-nolargefile.patch \

Shouldn't need to bump PR, it'll just show up as now available to 
distros that didn't pin to it already.

-- 
Tom Rini
Mentor Graphics Corporation


