Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 351C36E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 01:33:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t761XKMl011708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 18:33:20 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 18:33:19 -0700
Message-ID: <55C2B95E.3030606@windriver.com>
Date: Thu, 6 Aug 2015 09:33:18 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1438757380-15461-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1438757380-15461-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH][meta-networking] znc: provide SRCREV_FORMAT
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
X-List-Received-Date: Thu, 06 Aug 2015 01:33:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I'd like recall this patch since it duplicates with Joe's:

   [oe] [meta-networking][PATCH 1/1] znc: add SRCREV_FORMAT variable

// Wenzong

On 08/05/2015 02:49 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Add SRCREV_FORMAT to provide a composite version number for
> get_srcrev() in fetch2 code. This fixes error:
>
>    * FetchError: Fetcher failure: The SRCREV_FORMAT variable \
>      must be set when multiple SCMs are used.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta-networking/recipes-irc/znc/znc_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
> index d81c170..091db49 100644
> --- a/meta-networking/recipes-irc/znc/znc_git.bb
> +++ b/meta-networking/recipes-irc/znc/znc_git.bb
> @@ -13,6 +13,8 @@ SRC_URI = "git://github.com/znc/znc.git;name=znc \
>   SRCREV_znc = "f47e8465efa4e1cd948b9caae93ac401b4355df8"
>   SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
>
> +SRCREV_FORMAT = "znc_Csocket"
> +
>   S = "${WORKDIR}/git"
>
>   inherit autotools-brokensep pkgconfig
>

