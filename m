Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.16062.1589557777557147212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 08:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=rnxlllCX;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vty/=65=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NtBj5hTxz2k
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 17:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589557773;
	bh=Q8D2LGvBCA1Ko/rMRPRSb9RE0Uj+wZF+OHaaiPsBoW4=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
	 References:In-Reply-To:From;
	b=rnxlllCXaavDKcUeDgE5ZfFazX5J2yPvGQAzal73luEUgXiMsLxKILDVHI0aMjTV+
	 TRh80ji9QAvj/++NuovKxFSav1nPL7CGDbwETn8pYgpnQOkhahS0qZlcUyE2mNes/L
	 ZGe43jFEfqFkm3UbiKNsokg30Nb8vq+uyJFFMYcCpSXpvIAX2ckEwib1f+WCGPn2j4
	 w+Y+kt2l+HsODJulM+91ORyUFZkA9rzQVLT96u2mYWfTIFHDWfaoLkeE0bWEwKyP5E
	 41NcK/nQijGKFF4HUESt3OlFVmSMkz5UgFpKQmLo6h+FfiJQgv8OKS8TllB7BGheiG
	 g9J/8dQbiJcpK7CXTnaA2dzAkfJnNZkW1HJ+5izXYADeZ1JolLexsuAarTorjxVvH7
	 L+kbYxHHGHanwKmNEi2TRVc/1QYs/WkilO222n7Qv9YED5/ToGqDdvAUDAbo4tNqh0
	 IGw7+8Fzk5zqn9ipcPDMpbkw+H2QwPjSmtygyQ8KYs5Djqpzi0k6bi+/YhBc05YUW7
	 Wh9Wx+6MS22MCsFRDiey3nPKDZlef+4K93lWaROuX6mrwqttsXd0EYWZj78U3Wu0xR
	 L+loMfiWFoI3eMMUmvtirPBs5Cq24lORvYiIyOXsmlbYeOkXtpSHfaeWVD9jvs2aox
	 ztnx94n+T5cTX4NO+6UCsklE=
Resent-From: Adrian Bunk <bunk@stusta.de>
Resent-Date: Fri, 15 May 2020 18:49:32 +0300
Resent-Message-ID: <20200515154932.GB20323@localhost>
Resent-To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2020 18:46:45 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Sean Nyekjaer <sean@geanix.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Alistair Francis <alistair23@gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
Message-ID: <20200515154645.GA20323@localhost>
References: <20200515121436.2078760-1-sean@geanix.com>
 <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 15, 2020 at 05:07:37PM +0200, Martin Jansa wrote:
> I was seeing this issue also on arm (raspberrypi4), so it's not specific to
> aarch64 as subject says.
> 
> With this fix I'm still seeing build failure:
> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
> 
> going back to 3.19 fixes both issues (so it's not caused by my setup).
>...

The root cause of all these problems is likely:

...
DEBUG: Executing shell function do_compile
scons: Reading SConscript files ...
This system is: linux
Checking whether the C compiler works... no
ERROR: CC doesn't work
Checking if compiler accepts -pthread... no
...


cu
Adrian
