Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 74F0F7F277
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 21:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JfKd6Zrjz3J;
	Wed, 28 Aug 2019 23:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567028407;
	bh=LiUlVNAq34Ntn+b7k1q9FYhmCyimbikuGwGBr4FFsAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcIEmkg72WaDIcglJjp6S70sKMSdR3KeJxW4Vo7dtxvZZSv8J4DyMhZW6YruCYdBB
	RHW9+qHvSNUP4ZFa9Y6i6fXNUrwitpObpGSYkaICi/x19olP+YN93fHz5Jsolv9toJ
	EDCWLRDYmpC+lbO6FDc0xQjnTkZFjx2Omx3Dt5IM4JjJ6OTWgV/qPN/Jrn79NTLFzU
	K8Oac9Q+XPe3EL1+tr/aJGAZkwNP8Zr3WiO59YNmR1V9ssbqjEKXc0g/HS4mWQURab
	patGjVTumiH9qcHfgUqsaBVopBxH8RzkZUVFORP9kB4RLxWX0fW5Iv3hc3SNKHtADp
	Agxi5drZ50Ml6ejePkgXhW+4SmKPbh9bjs16kj3NdzJm9EcrHh2bHXIIHr9tWSLbG2
	r48KJfbiByQrcGzxGw7CteZvVdcKp2bscLdkgkQKKi4uGmgzs162ZSKLGWY1VpzYGU
	QKcmA8m1UIkTOprzJUAWg0DGweSiamT8SXbo7g7AQoqdZNH5eLclnxRwsCOLsOjhUg
	HAnjZuMbv2RckEMFPF+MIM9SNSB01HtVWBccoaqxduSvKlS6a7Rd4XDC66U7LV6/kn
	2fnTZA+VGRK39cChLnPHZ+JOxJ+K/k7rddWaXm8RZ6wWGZpUdKXxFYkQPer0DV6q04
	vmSn+jw8epL1MZZ1kcYBi+88=
Date: Thu, 29 Aug 2019 00:40:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190828214003.GE3044@localhost>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
	<20190828195635.GB3044@localhost>
	<CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Wed, 28 Aug 2019 21:40:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 01:32:52PM -0700, Khem Raj wrote:
> On Wed, Aug 28, 2019 at 12:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
> > > On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > What about marking networkmanager as incompatible with musl instead of
> > > > maintaining an ever-growing mess?
> > > >
> > >
> > > if the fix is specifically done for musl alone then I would agree, but
> > > in many cases, the fixes
> > > have been cleaning up assumptions in kernel UAPI headers on glibc
> > > provided headers
> > > which is a good thing, and it does take some time for kernel header
> > > changes to flow upstream
> > > but eventually, they do. e.g. see [1]
> >
> > This is not a cleanup, this is a workaround for a misfeature of musl.
> >
> > The kernel userspace headers are the userspace ABI of the kernel for
> > usage by all C libraries provided in one place, they are not tied to
> > any specific C library.
> >
> > musl upstream does not even try to use the kernel userspace headers.
> >
> > The kernel userspace headers used to be a mess, but after more than 10
> > years of cleanup there is no excuse for musl to insist on providing own
> > definitions of what is already provided by the kernel headers.
> 
> I was citing an example, you might have good feedback maybe bring it up
> upstream with musl or

musl upstream says the patched kernel-headers package from sabotage 
linux should be used:
  https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-

>...
> > There is a benefit of a small C library when your flash space is
> > single-digit megabytes, but maintaining plenty of not upstreamable
> > OE-only patches for using networkmanager on musl without a sane
> > usecase is a waste of effort.
> 
> I have said it before as well, I will say it again if we can improve an upstream
> packages portability that itself is a good thing, but we should not go overboard
> if its too much of work.

Networkmanager doesn't aim at portability and is too much work.

> there are container distros using musl so we
> have a wide
> list of packages which work well with musl, and this list is always
> increasing, so I
> would refrain from pushing musl to a narrow usecase

AFAIK OE is the only distribution trying to build software like systemd 
or networkmanager with musl, and container distros optimized for size
are only supporting smaller alternatives.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


