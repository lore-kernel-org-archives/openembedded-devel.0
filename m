Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PUl0W-0001pg-V9
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 20:02:53 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PUl0P-0002Lm-K3 from Tom_Rini@mentor.com ;
	Mon, 20 Dec 2010 11:02:45 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 20 Dec 2010 11:02:45 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 20 Dec 2010 12:02:44 -0700
Message-ID: <4D0FA851.9010108@mentor.com>
Date: Mon, 20 Dec 2010 12:02:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: =?UTF-8?B?VsOtY3RvciBNYW51ZWwgSsOhcXVleiBMZWFs?= <vjaquez@igalia.com>
References: <1292871300-22853-1-git-send-email-vjaquez@igalia.com>
In-Reply-To: <1292871300-22853-1-git-send-email-vjaquez@igalia.com>
X-OriginalArrivalTime: 20 Dec 2010 19:02:44.0592 (UTC)
	FILETIME=[7BEE3700:01CBA078]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] db5: append CXX tag to libtool
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
X-List-Received-Date: Mon, 20 Dec 2010 19:02:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/20/2010 11:54 AM, Víctor Manuel Jáquez Leal wrote:
> Signed-off-by: Víctor Manuel Jáquez Leal<vjaquez@igalia.com>
> ---
>   recipes/db/db5.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/db/db5.inc b/recipes/db/db5.inc
> index 78b99ff..390dfac 100644
> --- a/recipes/db/db5.inc
> +++ b/recipes/db/db5.inc
> @@ -62,7 +62,7 @@ MUTEX_arm = "${ARM_MUTEX}"
>   MUTEX_armeb = "${ARM_MUTEX}"
>   EXTRA_OECONF += "${MUTEX}"
>
> -LIBTOOL = "${HOST_SYS}-libtool"
> +LIBTOOL = "${HOST_SYS}-libtool --tag=CXX"
>   EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
>
>   # Cancel the site stuff - it's set for db3 and destroys the

Applied, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


