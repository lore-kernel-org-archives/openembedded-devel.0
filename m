Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 08D2B7E4FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 13:35:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45MvK02nLjz2C;
	Mon, 10 Jun 2019 15:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560173732;
	bh=KGijMKu4SBB8doSm0iVQq+YtjVDgKVLdIM04xlsg2Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJaBaAQQXcBaP//lY+rM9rEUiS7zQAPcuKj4v2PoknI3KHgi8QNX4BKG80LQ2voYr
	iu+ATcSfN065Zrbgh9PkDBt8iSPxgNZ629S01mQyfTxIwBw8wrs1Zx70j1HCPQA2CH
	XJSyQ8pwQnc2y7dgI9Erz0ffsl368iWd2lp/c10rQFIOt3LOf0vFOa1LgKWKK54Lov
	dbcjtG72avrzT4DMvjGuzt8U+WXb5TGbmQB6zJrpedhQRHlZcKM53hDqCjTMhNxOL7
	dJQqBeUM5zQHZtS4rWmTKpOmyB5oRN5L6abLHUFhH29Ixxo4Uj7ceID4zfSH/lwe7z
	WeysghavPc8E8+595vHW+7omyojyIuiILQjCZdK0CTiQuW/dDoq1PqmDGa7bZK2Iuw
	SymPSmJlqv65/h5mFG7gTMWgJ1Um9evqrk/kVA7mLVJ1VR2Xq6hZjDBmtWVlo19cnC
	VJhZikacY2JLghEel9tyWF8jq63oE2TLKnDPOO1jE/KnYIw94oeB+qjaLD4udpwxWW
	INcvjFfMjYlK/Nz/gBJq5lR3+yDX8VXKOzlEbelcWo3olVTIbD6WUVjax5WMNPR9ty
	D7zoTKmffhpsx/x31DkOGYZiuVr4GZVSmS+8QOrU/nQ7P4XJ2GHQ3qtyJGcwGHPAmC
	37NYL1tudsy3j5NkPYVDx6h8=
Date: Mon, 10 Jun 2019 16:35:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: mingli.yu@windriver.com
Message-ID: <20190610133529.GA18219@localhost>
References: <20190610071310.15157-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190610071310.15157-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] kea: replace -Og with -O
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
X-List-Received-Date: Mon, 10 Jun 2019 13:35:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 10, 2019 at 12:13:10AM -0700, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> With below logic in local.conf:
> MACHINE ??= "qemumips64"
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> require conf/multilib.conf
> DEBUG_BUILD = "1"
>  $ bitbake lib32-kea
> [snip]
> {standard input}: Assembler messages:
> {standard input}:305030: Error: branch out of range
> {standard input}:305041: Error: branch out of range
> {standard input}:305432: Error: branch out of range
> {standard input}:305443: Error: branch out of range
> Makefile:707: recipe for target 'dhcp4_parser.lo' failed
> make[6]: *** [dhcp4_parser.lo] Error 1
> [snip]
> 
> When DEBUG_BUILD enabled, -Og pass to compiler,
> replace -Og with -O to fix the above compile error.
>...

This sounds like a toolchain bug in gcc or binutils that should
be fixed there.

I've opened #13387 in bugzilla so that this doesn't get lost.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


