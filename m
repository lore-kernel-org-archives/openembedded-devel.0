Return-Path: <ayoub.zaki@googlemail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2027B6079E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 12:47:20 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id q18so155458uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CyRCK97AZwD0jwY1xxWbHZKgJ/rH+D4nCkM7ocSThzA=;
	b=HLJgq3aQ4BzquSnZOR1uIBtzySlt8BPoI9axQZHTEds/eG3CkTuZVeqtiBjrj/jwvr
	XXC7ckH1/6+7jcQyoNiSiMsqAlTOlZ2zck+U3MF+qMD8VuHcPgHFcR5e+RqdfgCR5SEI
	PIRiRk3qOF4exyFj4XRx2xyJSA/fqojPQ5D/wDnY/GsAuDM0+L+b7e67tnBRAqElE4rG
	vbn3thj8ZIMp+Kw3RGgH4t2jrJTp/i/5jwRwFTARpsFgLqTuVKagS/+xfC8eYR2nufdo
	NJjhnsnop/AtJJgfZ4HpDWZx8Vwp9u+0vdhWBIeM/1Xzy0JVp0ngBC6FsGSTGwfNFQUl
	Wcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CyRCK97AZwD0jwY1xxWbHZKgJ/rH+D4nCkM7ocSThzA=;
	b=cn3LrpchbTHjT62+SHXnVIa+98cs5lSWVRb9w+5RqPCVJw5HWLtMEUnHj1lFQWbswW
	qNbp3AJdWYnCuuYrCJl8eF79uN0DCDDvEgUmxdg5ICTklAKAhvBVq9WBPdA0F/4/fGTc
	4CzMqIcDtkmjB/U7ENVDdc/kI5LrCGRssPlx4nDsZ9G+415W7+D7hOrDxAnzW1C9uqAR
	0BAWaaLEZomvKW9RwPi607tIbW0QBwXjN1V5b0omkbUTtekqSTT2QxC4m4+hJGrt72kf
	aH+N/ay7gjB8EQh1sVLNN2enl+JlyldDF5HSUKvVtBxtBIpC+6uUVzLZtyKUctw9DZ1X
	G1kg==
X-Gm-Message-State: AJaThX6mp8GNZk6XgEP0MzgBLfl/t5kHq8uat+KSv6xkkcxJQY3vu75n
	193I21pNFurHXUA+koWbbOSg8KtQsAPtTXxxa5Y=
X-Google-Smtp-Source: AGs4zManDPGgxW+LeFj1jHi+jIx0CUMYXhPYTHnZhMwkKMsFFaVw+Xt/GTi9uw2KCIM+wE7RZhFZsLPrwRDKiAcvQJ0=
X-Received: by 10.176.78.155 with SMTP id l27mr35162880uah.108.1511873241782; 
	Tue, 28 Nov 2017 04:47:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.67 with HTTP; Tue, 28 Nov 2017 04:47:21 -0800 (PST)
In-Reply-To: <CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	<CADseiPmvSsqCQqjbU-VwGMhp=y97d0AFx5R2Yrnmw5zf_kji_g@mail.gmail.com>
	<CA+-BmJaRAePpM1UfwLOTPS0NPuViq5mQGD51BNwZrtES5XgzOA@mail.gmail.com>
	<CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@googlemail.com>
Date: Tue, 28 Nov 2017 13:47:21 +0100
Message-ID: <CA+-BmJbzMoPd2bEyzJkrHN=+RvUmJu0F0XVFmPSSCJcKcUPe7A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Tue, 28 Nov 2017 12:47:21 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Otavio,

that's a shame :-( thanks for the information.
are they other browsers that are well supported with GPU acceleration on
iMX6 ?
what about Firefox ?
Thank you!

On Tue, Nov 28, 2017 at 12:58 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Nov 28, 2017 at 6:13 AM, Ayoub Zaki <ayoub.zaki@googlemail.com>
> wrote:
> > Thank you, indeed I used rocko branches and it seems to build and also
> run
> > on an iMX6!
> > I use a mainline kernel 4.14  and with iMX6 Etnaviv GPU acceleration
> > support.
> > It's not clear for me how to enable GPU acceleration with chromium +
> > Etnaviv :
> > I tried the switch --use-gl=any,  it starts up but when running WebGL
> demo
> > Chromium/Etnaviv is crashing...
> > For normal browsing it works just fine however I noticed that CPU
> > consumption is very high > 50%
> > Anyone having better experience with Chromium + HW accleration support on
> > iMX6 ?
>
> The i.MX6 support requires a number of patches to properly support its
> hardware. Currently not well supported ...
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

