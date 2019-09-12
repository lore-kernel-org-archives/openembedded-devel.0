Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C712B7E093
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Ts1H5mVCz56;
	Thu, 12 Sep 2019 23:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568322772;
	bh=EJeJ5+gu2jxkakEpNwH/aR9OwvkJ5NvcRrgLgjTpXuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HT5Drtb6LQyCF28fTbcyCfETTT6V0JY44tp4rMjrmnQQS9TO7+iiX58Isx4mPU6/W
	C4XJZr3u53VoUjz0vEAJctcAxCSqjKXv1PIEZ3fhWiEpGkubMaGSYIh+g9uJRejooe
	D9Ik75oKwAKcxhsoTNTWxhd682omUhrnvIQTnVdUrJvbBrQ7+iKqEs1+t0nPOkWMew
	X2RRfhpAfeZbXIPwDSOv7KdsL54p6H6A1BP2WDL2mN4BzG6C4nmuUgIM99da5/EqFW
	yT6PNQs360h3Sg1UAhC/QgG5QAjp1lWVPLVtYVLU8XjbKtkq2GF3mG3drv3mYTsSFV
	yGYp5fH/hpidAHG1Pbaut1jLpP5ajPDvXUOIp2dCegCB0bOnLZO2D56o/G6JURrkPJ
	gJ81xCqqwXKYqYc+QltzRnl9p0vF5w4m2JvN/D3pnETDBQaLx0gs2aTvZgvu2ruBy1
	4qQNQVr1uHVZxq+fsaXiE+QnuO9evQG39NZBAFOJfDwQ0H8V/kOi3NfEZs0RVasQE0
	DpMZRVyTQnSqHhttUAHo6YmgESeGHJ20h13JaMLPdApYg7Toa3VRusWNzgH0cgvzMt
	/bEVmL/B8JJex0ZFnjAwTFT1GhRWxf5tet0qzTnWxWNhxJdJzKS4ONgBM1MwHP0qLR
	JuZpvhlpx4FETdt4ENe3VsBA=
Date: Fri, 13 Sep 2019 00:12:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190912211249.GA25165@localhost>
References: <20190912201831.51848-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190912201831.51848-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] mycroft: Make rdep on alsa-oss conditional on glibc
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
X-List-Received-Date: Thu, 12 Sep 2019 21:12:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 12, 2019 at 01:18:31PM -0700, Khem Raj wrote:
> alsa-oss does not build for musl so its marked incompatible for musl
>...
>  # Mycroft uses Alsa, PulseAudio and Flac
> -RDEPENDS_${PN} += "alsa-oss alsa-utils alsa-plugins alsa-tools"
> +RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
> +RDEPENDS_${PN}_append_libc-glibc = " alsa-oss"
>...

This looks wrong - either it needs also-oss or it does not need it.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


