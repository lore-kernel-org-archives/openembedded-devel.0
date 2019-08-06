Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 793507F262
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 18:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4633Kd4XDYz56;
	Tue,  6 Aug 2019 20:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565116677;
	bh=Zjxl5l1He18wudiB7Za3KakQxzMiJxsStxOUWmNNCxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUA5EXSe7txiQbTvXtbFw/5Jkf7ACSqcMhuTQJaTTE0I6GiUDcrlInLIV05g2ay3E
	f2iEXVfWcpyP4wxDDQuGA4l0H1CxWAdklC31zrR/nlyHskBM1mvx/tfv2OKJYbj1mo
	ZtN2FgZoDygvk+kNXWrI4rWJQdxCTIwbdJlktuLYx0vV2RtJYVT5477acMaNuDUK0b
	lQDdsBHCtaQW4/NuhEmVrSdXC0Yxf/wJdQBp8VXlRabrY34o9/MHWk4syYBD4FFBhj
	aasIHKmfYJ1mpPLglIBf+omvW+ipZpf8WQxHvP1lR6nKtxXH1MUunQG1I+Si1BvNsO
	5GRjj00Z5EOjuwAhpz68ktDWbwsZJ04UTs2GlgQXAazDyJEHWOytpBPJdXxy15px/Y
	E7TGvSYQ0HeXniz5lZ3Xff8ERmyasbHyY0M2pongZM42ATPEHt+dwZiM5eaiurvav5
	+XcwuRHLWAnmGUuuiAfnqUjq0JarKT99Pp4fXCFjwL6ymM68FBg/0GiddQ/hOADVqa
	J3md1RahIUpV98lhdmXvbDoeIpfmXUtLsmzu77Ud4ugS7ZyD6uvDqByx+8PqQj/RaK
	+X71mbm1zsx5brmsbqZQujbdBeCMgGnRBB8oqJZOzhBUXo1+++bIy0GbVsyhr3rqEF
	K9cgIzMd//SOzqcdRbX77CNM=
Date: Tue, 6 Aug 2019 21:37:50 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190806183750.GA26061@localhost>
References: <20190806153909.5965-1-bunk@stusta.de>
	<CAMKF1srCPKCXiAVqBcZWXPytw7dLgPVED-deVbHRrHABbGcTxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srCPKCXiAVqBcZWXPytw7dLgPVED-deVbHRrHABbGcTxg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] modemmanager: Use a simpler workaround for the clang build
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
X-List-Received-Date: Tue, 06 Aug 2019 18:37:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 06, 2019 at 11:09:50AM -0700, Khem Raj wrote:
> On Tue, Aug 6, 2019 at 8:39 AM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > @@ -33,7 +32,7 @@ PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
> >  EXTRA_OECONF = " \
> >      --with-udev-base-dir=${nonarch_base_libdir}/udev \
> >  "
> > -CFLAGS_append_toolchain-gcc = " -Wno-unused-but-set-variable"
> > +EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
> >
> 
> I think this will disable extra warnings but since the patch was
> anyway doing same although just for one warning
> this is fine by me.

And it's only for clang.

> I still would like to have an option to be able to
> build with default warning set and have easy way for OE devs to
> fix/report such issues to package upstream instead of masking them
> out.

If someone wants to fix or report warnings upstream, then a stable 
release that might be years behind upstream master is usually not
a good starting point - when you are upstream in OE you are also
not very enthusiastic when people send patches for Yocto 2.0 today.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


