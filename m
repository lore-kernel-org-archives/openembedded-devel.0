Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 191CB6B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 00:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D0vQta002444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jun 2014 17:57:27 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 12 Jun 2014 17:57:26 -0700
Message-ID: <539A4C80.6030001@windriver.com>
Date: Fri, 13 Jun 2014 08:57:36 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>,
	Joe MacDonald <joe@deserted.net>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 01/14] iftop: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 13 Jun 2014 00:57:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I send two copies of these patches, please apply anyone.

These patch are fixing the building failure on master.


On 06/13/2014 08:46 AM, rongqing.li@windriver.com wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> It needs autotools-brokensep, otherwise do_configure error:
>
> cat: config/pthread.c: No such file or directory
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta-networking/recipes-support/iftop/iftop_1.0pre2.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> index 73f2d85..cc1f8b0 100644
> --- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> +++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> @@ -10,5 +10,5 @@ SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
>   SRC_URI[md5sum] = "fef521a49ec0122458d02c64212af3c5"
>   SRC_URI[sha256sum] = "1b193037bb3019afae88cd94c87468aac4b045d81ab816ed8d2f489716b14027"
>
> -inherit autotools
> +inherit autotools-brokensep
>
>

-- 
Best Reagrds,
Roy | RongQing Li

