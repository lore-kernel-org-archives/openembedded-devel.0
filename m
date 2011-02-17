Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pq5kk-0006IZ-RV
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 16:26:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pq5jZ-0002Q9-0n from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 07:25:33 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 17 Feb 2011 07:25:32 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 17 Feb 2011 08:25:31 -0700
Message-ID: <4D5D3DE7.2020604@mentor.com>
Date: Thu, 17 Feb 2011 08:25:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297925304-12171-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1297925304-12171-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 17 Feb 2011 15:25:31.0924 (UTC)
	FILETIME=[EA3A2540:01CBCEB6]
Subject: Re: [PATCH] contrib/testing/testscript.sh: Dont define BBMASK
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
X-List-Received-Date: Thu, 17 Feb 2011 15:26:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2011 11:48 PM, Khem Raj wrote:
> * BBMASK is set in bitbake.conf by default and it
>    skips nonworking and obsolete recipes which is
>    what we want emptying it here could cause redundant
>    parse of the graveyards
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   contrib/testing/testscript.sh |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/contrib/testing/testscript.sh b/contrib/testing/testscript.sh
> index 992b02e..3c3927f 100755
> --- a/contrib/testing/testscript.sh
> +++ b/contrib/testing/testscript.sh
> @@ -49,9 +49,6 @@ TMPDIR = "${TOPDIR}/tmp"
>   BBFILES = "${TOPDIR}/openembedded/recipes/*/*.bb"
>   ENABLE_BINARY_LOCALE_GENERATION = "0"
>
> -# Which files do we want to parse:
> -BBMASK = ""
> -
>   # ccache always overfill $HOME....
>   CCACHE=""

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


