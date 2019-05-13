Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF7487E070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 09:19:21 +0000 (UTC)
Received: from [10.130.30.123] (unknown [89.221.170.34])
	by first.geanix.com (Postfix) with ESMTPSA id E2AE7A13;
	Mon, 13 May 2019 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557739161; bh=W8XJkalo2OC6gvRb8VqSfxE3Y3pLnJyKYTwfJC1tQvs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Z55+J7WnZbMzKCyzbfryjcTd7xh/jM4u74d9RL74hPjn5wiSVPc1Na8Qp6L9XhJQ3
	wtULSk+07paIuzj11qdVaidKHVcrMI3Q1N3AGfjX2sFWTrik/g9IeWAu12MpD12qQX
	R6cFT8+80+uiZlUS4SUkoS52XTXaVYpw46A6fnvEKduBMjfo7zlndhxxCXx8OSIE8R
	7mLKviclhxg1Kh4YZrBWESNr07L7tSEeECnCayVRBduKIGM0oOaejELuO0bLFpbOm9
	XMFSjWTnHz7ZtXsASOYFcORibTEb1BaY5iT+VCAtDR4d+y3djUtuOZjBG527C6XJ0K
	2rRDz061Wj2jw==
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <20190513091753.24046-1-nicolas.dechesne@linaro.org>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <6c379d46-cf29-7a07-2cb4-9d251301d928@geanix.com>
Date: Mon, 13 May 2019 11:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513091753.24046-1-nicolas.dechesne@linaro.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 796779db2bec
Subject: Re: [meta-oe][PATCH] cannelloni: move from meta-oe to meta-networking
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
X-List-Received-Date: Mon, 13 May 2019 09:19:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 13/05/2019 11.17, Nicolas Dechesne wrote:
> It has a dependency on lksctp-tools which is available in
> meta-networking. Move the recipe to avoid dependency from meta-oe onto
> meta-networking.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Acked-by: Sean Nyekjaer <sean@geanix.com>
> ---
>   .../recipes-connectivity/cannelloni/cannelloni_git.bb             | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename {meta-oe => meta-networking}/recipes-connectivity/cannelloni/cannelloni_git.bb (100%)
> 
> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
> similarity index 100%
> rename from meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
> 

