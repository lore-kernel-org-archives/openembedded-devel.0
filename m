Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E281371A2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 15:57:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IFv82R025261
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 08:57:08 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 08:57:07 -0700
To: <Qi.Chen@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <1502940920-30350-1-git-send-email-Qi.Chen@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2a09e83a-dab4-467c-a1ec-4f93687f203c@windriver.com>
Date: Fri, 18 Aug 2017 11:57:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502940920-30350-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][PATCH] openobex: disable building documentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Aug 2017 15:57:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-16 11:35 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> When building openobex on a host without any connection to outside,
> the configure fails as it tries to get some url from outside to build
> the documentation.
> 
> Fix this problem by disabling building documentation.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> index 053c80a..2db48f3 100644
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -21,6 +21,7 @@ inherit cmake pkgconfig
>   S = "${WORKDIR}/${BP}-Source"
>   
>   EXTRA_OECONF = " -DCMAKE_SKIP_RPATH=ON "
> +EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
>   
>   #--enable-apps --enable-syslog
>   
> 

Okay as a work-around. I guess.

What would it take to add the additional data/src used
to build the docs?


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

