Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D99347E6CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 21:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45NjBW2SBWz4x;
	Tue, 11 Jun 2019 23:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560286963;
	bh=bVjMClyr6wC11odZheeBxqoCOsrK5nYv/boOelK0MGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsdOc41DA4VD3Vt266ffe5ZDwP5ggLUYj1BeFQ/p6+czd+EOmYRmtT7vY8+LSWtKb
	WrONOEafqMs1Kh3Ot5ijRTO12U0yhVzHPYlMAtHypPF5aHlcfHQlJO0booBxc7gEJY
	dXtd9746RPAx97AM0QFKx7Nu2ClvZz/ZMtAkQixZrXwByxLb5U0mAQRTKRk5RtQE0M
	9H4FQr9OFy7XHA0fBCUL/p0uHBSKSLTvK1EzVbd8RgN/NJDFHN86YUCuVgBnnUH/Br
	uCZry5/T3z8urS7ifCrrgPyDa9dP4W4eKkBap8mf0i+jzIsgHZ4ch1LVqCFjOHFcCH
	tR1iQ+QCLccAZ5L+Esk92/ospcmABYA2oV/TZQAna/Q8YCNg4eKOclBbijAcX3nb2p
	DcvqvWBd2hwwQyTAh+QJT+Okz0ZiwLQiS/ypU2D1/gWiTctBNKS4Cf1e1PJBu5wpsl
	/C30kdWR4PTYPcV4kXvmoyz+FyG6YOqF3d8I0QD0UT+txZWZ4V25VDKXHdUnq55Rit
	NCudv7hc9AsoHhh7hfasNj3jds78gnCpJN4kOmv9mVfY/xpC+xWQtIialPCDsF4ox/
	0MN26upDoDO8td+8K8dd7rW74E7FtEb4gdz5I4ZrumdEQAILdJAJUtrZ9p/hGzAqY2
	S9YSY0ieLlNZouSPHW9zQYNM=
Date: Wed, 12 Jun 2019 00:02:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <20190611210239.GA2162@localhost>
References: <20190610071310.15157-1-mingli.yu@windriver.com>
	<20190610133529.GA18219@localhost> <5CFF16F7.90003@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5CFF16F7.90003@windriver.com>
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
X-List-Received-Date: Tue, 11 Jun 2019 21:02:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 11, 2019 at 10:50:31AM +0800, Yu, Mingli wrote:
> 
> 
> On 2019年06月10日 21:35, Adrian Bunk wrote:
> > On Mon, Jun 10, 2019 at 12:13:10AM -0700, mingli.yu@windriver.com wrote:
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > > 
> > > With below logic in local.conf:
> > > MACHINE ??= "qemumips64"
> > > MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> > > MULTILIBS ?= "multilib:lib32 multilib:libn32"
> > > DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> > > DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> > > require conf/multilib.conf
> > > DEBUG_BUILD = "1"
> > >   $ bitbake lib32-kea
> > > [snip]
> > > {standard input}: Assembler messages:
> > > {standard input}:305030: Error: branch out of range
> > > {standard input}:305041: Error: branch out of range
> > > {standard input}:305432: Error: branch out of range
> > > {standard input}:305443: Error: branch out of range
> > > Makefile:707: recipe for target 'dhcp4_parser.lo' failed
> > > make[6]: *** [dhcp4_parser.lo] Error 1
> > > [snip]
> > > 
> > > When DEBUG_BUILD enabled, -Og pass to compiler,
> > > replace -Og with -O to fix the above compile error.
> > > ...
> > 
> > This sounds like a toolchain bug in gcc or binutils that should
> > be fixed there.
> > 
> > I've opened #13387 in bugzilla so that this doesn't get lost.
> 
> Could you help to post the link here about the issue you opened?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13387

> Thanks,

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


