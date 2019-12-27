Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 243337CE86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 05:26:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47kb0v1GdPz4D;
	Fri, 27 Dec 2019 06:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577424415;
	bh=Q8EeVmtbDWVeEUjKWLVIc7YSqVwLwHcbHffDIk2fM3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDsqd6KcNM8Oyg02u0daz084n8RGCDQLURPS5D3LXCVLgeYoYGt53ORRQrBd3QyZh
	IZ4qgoJVR0JrdjM8pfXJlLaHHWgqhZpojZazPcnX0M7A6umP+Zx++A8Gl+vg4xYNc6
	+C3zkU0/xbEDbY2Dlwr9xt/qWrMJmfb1XajRFiNNrsEKCEdix2RnGnJXXmHg9hZ2Q+
	CrhHjbybmwgWL3/IiW1LJWW4PCDZ1CJeq1uvzdojpl4b84TUIjvYptofUTWVQVxrDk
	WS5hH8obv0B40QX1lxBhxLLgVT5fMTIrhFJzhCUQYqo1wDUFDabQorBJ1770k6XAAo
	yeQMMffFddbtqpMl9yVIuzeyYlkQcU6Es2oFiuoaofSS8NQIF8pS0vnqqEeJJFX8cA
	ZxbSNXlvAA3E0Tkg20b1o5bYaBGWwrdZ0JAbi3Rt13lFPnhzeRWrdLcDyxPFZWMZbv
	0SYtfyvH0HdVZT+rE+x3OayfJRHMPXdrkaU9Gwg/7/D6UqtZ6dA+S8CHnGzouEspmi
	GBFXNi1rIDoaWpQknLDffKD03qgN9gVOavijcp+nurRcMZp4FDzri9yuji+LIJUjMZ
	Z3SLmUsFeJy/l01joo4kckoOzT9oCSxjlnwFmhXRnQiDwkGoXidThSU04QddAk1FFJ
	G+JXv6xp//NsorVQLOIEaHqQ=
Date: Fri, 27 Dec 2019 07:26:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191227052653.GE19235@localhost>
References: <20191227035639.303716-1-raj.khem@gmail.com>
	<20191227035639.303716-5-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191227035639.303716-5-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 5/5] ippool: Fix strncpy -Wformat-truncation warning
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
X-List-Received-Date: Fri, 27 Dec 2019 05:26:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 26, 2019 at 07:56:39PM -0800, Khem Raj wrote:
>...
> +| ippool_config.c:112:2: note: 'snprintf' output between 8 and 55 bytes into a destination of size 48
> +|   112 |  snprintf(prompt, sizeof(prompt), "ippool-%s", server_name);
> +|       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/cli/cli_readline.c
> ++++ b/cli/cli_readline.c
>...

Is this a paste of the wrong warning?
The patch is in a different file in code that looks unrelated.

cu
Adrian

