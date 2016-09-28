Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3DD6059F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 05:17:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S5HBSN026449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 22:17:11 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 27 Sep 2016 22:17:10 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1474969502-17781-1-git-send-email-wenlin.kang@windriver.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <487bacc0-d679-09f2-4616-b248838da7b2@windriver.com>
Date: Wed, 28 Sep 2016 13:17:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474969502-17781-1-git-send-email-wenlin.kang@windriver.com>
X-Originating-IP: [128.224.162.160]
Subject: Re: [meta-oe][PATCH] lvm2: enable option o_direct
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
X-List-Received-Date: Wed, 28 Sep 2016 05:17:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年09月27日 17:45, Wenlin Kang wrote:
> During some lvm operations, e.g, create many volumes, we notice
> a quite big degradation in performance with o_direct disabled,
> if enabled the performance get much better, so, here we should
> enable this option.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index d66daf8..c6d91b0 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -29,7 +29,7 @@ PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,
>   # Unset user/group to unbreak install.
>   EXTRA_OECONF = "--with-user= \
>                   --with-group= \
> -                --disable-o_direct \
> +                --enable-o_direct \
>                   --enable-realtime \
>                   --enable-applib \
>                   --enable-cmdlib \

Please ignore this, I will re-send the new patch.



-- 
Thanks,
Wenlin Kang


