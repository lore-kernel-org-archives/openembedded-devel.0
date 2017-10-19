Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6064971A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 17:47:08 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id v78so7774856pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=lxmgQ/o4TxEei716JzweUCxVs8zqeLK7plqsi3SW6ZQ=;
	b=Xf1NWK0bHZHyKyaxppcZPTzAmrYoS8OeGyddlmHxl69dpq1yjv+SUSMs917UA2pBXC
	CHZV0PkteQnqL60eHNv/nurGO0cO2EWFERCsodKN4zhHBg+khRU5aIlt/7ALu4JKRPb1
	QK2FecTeKS1vdYGUktZJwMS+576hopz1R5vIN8aWMZcWJNivSCPE2OWg87p//wxjBm7p
	nwLHyu7E6ELwvAC8ytXG4DHbeysPI0HojEOPKFtX2CZiNe+q+bqGlWMGY6aW3uSjGAVR
	ZIFoAliA2OxPeLbgdhmXDJ3Se/Ycc+vtp9laF//H+eLIc49U/kL2oHBjMhG55WR/IUym
	NAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lxmgQ/o4TxEei716JzweUCxVs8zqeLK7plqsi3SW6ZQ=;
	b=T0pFtFawJGJ6JZemVDmlIKjdOWHgjN5ODropSM/1Lkrnx0w8UccrdCVgEQRHkuHUEB
	Pwv7sNvU8u9ziOZjkz7EcT73KBmxGfB8AHeyK8vPo6jg/FG+EenucOW8K80QvCzNlflr
	Y9Mib0cWX+iUFmFiZQtY+t8QMHqFVTovr9y1CsoqjTRsuDYLtmNNzDFmLWYfpo00wANd
	tlrsoFEJY2busuK9JRkbFgwNQvxY8h2OLbVnR7W/cj/Fx3jB2mVZdS4ozLzpa3GEtvw6
	nD4HFo38oId5N7nBMzucAqbMmp6KcdiVPxl6M2oIMwpFWFNvN1AMw7ojehhwIIBS+HGV
	B8Ew==
X-Gm-Message-State: AMCzsaVxH+Vf+cR9ALkBV05VaRxClQn0gqECxCw4EyAnyIKTWnS8LG7q
	ksMGyIPJhd6y8AjkKybnj5WZ3Q==
X-Google-Smtp-Source: ABhQp+S9WZVvj0KnNizUbHiUUppeffGSYufMgIATu3fBTdM56ASOhC/sb5RY8BF2P0tL0H6IG628Wg==
X-Received: by 10.99.114.24 with SMTP id n24mr1955326pgc.253.1508435230412;
	Thu, 19 Oct 2017 10:47:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:90bb:230:77f6:7662?
	([2601:202:4001:9ea0:90bb:230:77f6:7662])
	by smtp.gmail.com with ESMTPSA id
	z1sm23465259pge.45.2017.10.19.10.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 10:47:10 -0700 (PDT)
To: "Anselmo L. S. Melo" <anselmo.melo@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20171019174010.4331-1-anselmo.melo@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c6f16ef5-0bef-5ba9-9861-55b7b07925b1@gmail.com>
Date: Thu, 19 Oct 2017 10:47:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171019174010.4331-1-anselmo.melo@intel.com>
Subject: Re: [meta-oe][PATCH 0/1] pyro: Fix opencv build
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
X-List-Received-Date: Thu, 19 Oct 2017 17:47:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/19/2017 10:40 AM, Anselmo L. S. Melo wrote:
> git cherry-pick 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
> from meta-oe master branch.
>
> Ismo Puustinen (1):
>   opencv: fix runtime dependencies.
thanks. its in my stagging now.
- armin
>
>  meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>


