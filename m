Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 833AF7ECAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 16:44:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Cc8T0Z4Vz3P;
	Tue, 20 Aug 2019 18:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566319482;
	bh=bJnWfCEKqoKrgFiibRMjOyBjY/Bffk7xQuacmNjm94k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtbEUEGlSLzEPtcw4Srx+SnJw240Rucwzx1tO6U8OTLrmTXdQdOHD+l03ngg8dBOq
	sZO+WZ4+E7yD26OC+qUeRqVuifdLuT57t3jSoT99AOfR6/M3ECxhaQL1l758CN/2+P
	9OKHRYYM5ZYOL2SLXOMjWFOfF/v/Ady/KkYCXQuz1ZljErbJXKN0gM4U11l01Arbyz
	MEq0Eviy2ajF5gyoFrqZYFCE9azo3qXzgRmiHYFA88gDuw4UDCwedziV7Q8B32xr4V
	7b8/Pu9fRiLUzHDkqye+ACZPeNBX7THpXsY0KeWIFdBOQZnkMzLgNTM2B+iBvHAld+
	ySoA28lrFEAEImL+MIPzoEyB/AyBqMI7IrSmSujSuCDiQtjNoZFiLU9yYMOcoGfWI+
	7h+yK+MP7s5o7AgqRDF7F9Mq+Sk2acGExzDm5eDrMMyO6GvN+GN0ZO+tppwHxveQ/j
	bZnKshvEh0q9ZixbM78Ir0ilyuL9YkNXkXg3dSuOvMNs4I2t69+fDQGrPnvn5rPeBJ
	Wa1aPm5LdE3Iu9JypCsoXaDU5l32P2Ttr2Dwx6DENLSTYKarojCacm4OxZtcOJs40C
	fA/tOjqM/lKkHCz6DwIwryLLBqwIXr80PpLllUze29BwHGnEHEnqP4OpUEKRHA+v18
	X3bzdCnyDIhwkx1qa/meMQyM=
Date: Tue, 20 Aug 2019 19:44:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190820164438.GB24268@localhost>
References: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: compile with -fpermissive to workaround code diagnostics errors on armv5
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
X-List-Received-Date: Tue, 20 Aug 2019 16:44:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 20, 2019 at 09:30:36AM -0700, Khem Raj wrote:
> On Tue, Aug 20, 2019 at 2:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >
> > Build on qemuarmv5 failed:
> > ...
> > |poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
> > SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
> > qualifiers [-fpermissive]
> > ...
> 
> I wonder why this warning only shows up for armv5 and not for other
> arm subarches or
> non-arm arches.
>...

https://gitlab.freedesktop.org/poppler/poppler/issues/821

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


