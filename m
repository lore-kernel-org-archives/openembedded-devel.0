Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 63FF17FBFD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 09:27:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47t3mS0N70z4M;
	Wed,  8 Jan 2020 10:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578475624;
	bh=FwIXXX53gd8YCCJ5Njdg5erK0bG87dbXM9qFjTs+e8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+Gnq4KD3mSxh4G7X6kugz2zGacLfPJXT7sQSC1uoDzdNDIbW7PcoBVOgOMrxqr/B
	Gpb6KY9mqez50vhTqtyUv7rAf+hVOZ0GBFLlHbNeilPiouBd4pm6hEx89JBWKcvlqC
	+E5XvBykyCWfrtR3WfiVT3E9aBUGxXovHHOyF084fQLcoU+0JSqF1if09uE2H4pnuM
	fvmEoylwfAeXFVXyfSsDIGV7RY8+euceaYNfum43yTulGQzpcNQMhL7H6jdnqjif9F
	8oEGYTwJpC3QShp5nKdM++a543Vju2dZ/1D1uBYNRilXExS1YDRX2i+1wgZQ5BLKb0
	LSwS/0/olBvnSzh78O+JaaAbp7M+DAAKlw3bnZbobBT90G3+mR8NwZOWdRK2LpiVJW
	pwJS7dN/9fa/w14YQr6nJ8cKptRMSfwUJBzbH3NuD8Xj4IuYpK/blGU5mrr4rnuuaU
	mhChuyeimvgk6i6DYCsPTZ+hGlasYXlNriYY5IsVoNIV2MAG/vAUugKBSNwUs3MzvJ
	Tu5lgK0RbqAEraoSVDCUErvFFTwkwp3T1dhrvRsPNgaNB5agcDMcfXUvxW8Xo/sJvg
	FzGHtYha23jBTx9NynwZjsfw3s5N2o4CptBwGzfkOCU9MBD7EvGPFw9nN5mcYW9EmE
	P4tl+1DAPzEH+dp9pZlcQBCQ=
Date: Wed, 8 Jan 2020 11:27:00 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20200108092700.GA25926@localhost>
References: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rocksdb: Fix compile error for DEBUG_BUILD
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
X-List-Received-Date: Wed, 08 Jan 2020 09:27:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 08, 2020 at 02:09:03PM +0800, Robert Yang wrote:
> Fixed do_compile error when DEBUG_BUILD = "1":
> db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>...

-Og warnings are not 100% reliable, and in general -Werror is
problematic for distributions.

Does building with -DFAIL_ON_WARNINGS=OFF fix this problem?

cu
Adrian

