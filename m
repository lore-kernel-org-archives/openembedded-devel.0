Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4D32718EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 02:11:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI2B81q027380
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 18:11:08 -0800 (PST)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 17 Nov 2014 18:11:07 -0800
Message-ID: <546AAABA.5010301@windriver.com>
Date: Tue, 18 Nov 2014 10:11:06 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-3-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1416222008-9218-3-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [PATCH 2/5] nicstat : add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Nov 2014 02:11:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2014年11月17日 19:00, Li xin wrote:
> nicstat is a tool that prints out network statistics for all network
> interface cards (NICs), including packets, kilobytes per second,
> average packet sizes and more.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>   meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> index 31a015a..c75563d 100644
> --- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> +++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> @@ -17,15 +17,9 @@ do_compile() {
>   }
>
>   do_install() {
> -        install -d ${D}/${bindir}/
> -        install -d ${D}/${mandir}/
> +     	install -d ${D}/${bindir}/
> +	install -d ${D}/${mandir}/
>        	install -m 0755 ${S}/nicstat ${D}${bindir}/
>   	install -m 0644 ${S}/nicstat.1 ${D}/${mandir}/
>   }
>
> -
> -
> -
> -
> -
> -
>


I did not find nicstat_1.95.bb in meta-oe, are your patch completed?

-Roy

-- 
Best Reagrds,
Roy | RongQing Li

