Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E2DA37F28F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jc2F16gtz3J;
	Wed, 28 Aug 2019 21:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567022198;
	bh=RWdrVP/WlPOPSIHjdV+K4oAqCnWWaZodR3ZhWeCviH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txF5oqqDIIxdkQLuTTkfwv4cGzvbJwTpYaXmucMAL+a4szgCPUkQk/AYtJlh1P9Wa
	fem+3NX4OZtehZ1qShJwINtmpfAieevp0d0CY+N+jxjGhu/4NuTFP9BZk1wYyFZDrn
	Iuyo+l3wkPyCqGybzK+X7G203EnBgpxnMJGERqr4nXtamJMtuXbQw90AU0MPuI1dJr
	eSXtoh2u9f9v68G8eEJpkrmaTj07MbzXb/MeHVFawAOc6SqLhbSPqZTMSdH+ZJDocR
	hUQMWyhroZ5uI7B7abgvnZLWU70SMg8XXP4ITw+mIi4NFtci0yyiQBCrTkFt0XNBAV
	b9Rzk9MkMYi0xnm4Dw/AJwke5irLmJFxxQnY30ve+xRsnFuqGtNUEpZdha3QzzQcGU
	MSxbZ9+oI5ANZzSUiU7h7TWmNGQXbmWO7vSUJejSOIkotMrFUX3R4xftmOuHQItnci
	jJh1+OtEnR7MK2aMJlg1xEz/Esmbecw36LR8MDH1xux2XC3JUeNCR88rGEnAZJP+r/
	jS8QMhEGsRsIWCutlWAmbICHy4FwJcz4KcOx5IC7U96QI+RkCiYZYOEpY6h8eH0X+I
	Lv1kViuEdeBMvV39CD3ez6TOFtD0tHFSGAei4iOXze+PdxAv+4Srk0cxpsI8dSUwfi
	VPqqW9tLEKacpVE55ijanEU0=
Date: Wed, 28 Aug 2019 22:56:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190828195635.GB3044@localhost>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Aug 2019 19:56:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
> On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > What about marking networkmanager as incompatible with musl instead of
> > maintaining an ever-growing mess?
> >
> 
> if the fix is specifically done for musl alone then I would agree, but
> in many cases, the fixes
> have been cleaning up assumptions in kernel UAPI headers on glibc
> provided headers
> which is a good thing, and it does take some time for kernel header
> changes to flow upstream
> but eventually, they do. e.g. see [1]

This is not a cleanup, this is a workaround for a misfeature of musl.

The kernel userspace headers are the userspace ABI of the kernel for 
usage by all C libraries provided in one place, they are not tied to
any specific C library.

musl upstream does not even try to use the kernel userspace headers.

The kernel userspace headers used to be a mess, but after more than 10 
years of cleanup there is no excuse for musl to insist on providing own 
definitions of what is already provided by the kernel headers.

> > Networkmanager uses parts of systemd as a library and also has own
> > glibc-only usages.
> >
> > Both systemd and networkmanager are fundamentally Linux-only,
> > and for systemd it is known that upstream has made the design
> > decision to not compromise their software for rare usecases
> > with C libraries other than glibc.
> >
> > AFAIK OE is the only distribution trying to build either of these
> > with musl, other musl-using distributions are using less heavyweight
> > solutions.
> 
> We should enable as much as possible we can and not go overboard in
> supporting everything
> except for core packages where it might be ok to put a bit of effort
> and upstream the changes
> network manager is quite useful in base images eg. xfce images etc
>...

When you are using networkmanager and xfce in your image,
what is the point of using musl instead of glibc?

Networkmanager alone has twice the size of glibc.

There is a benefit of a small C library when your flash space is 
single-digit megabytes, but maintaining plenty of not upstreamable 
OE-only patches for using networkmanager on musl without a sane
usecase is a waste of effort.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


