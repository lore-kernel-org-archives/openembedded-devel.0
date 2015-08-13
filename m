Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id A03A273D64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 17:57:58 +0000 (UTC)
Received: by igui7 with SMTP id i7so4591978igu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 10:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=Fx2XPWeb3cu5uqf7eySPj2HqzhvHAdgvxVJySYtDWcw=;
	b=aXCGaUZ/60OHM5BDyBq11fdDNk1N8xR2iCuBPqpJ5BOVYpcMinriKAQb5W1F2l39ZC
	tz6JfV42Yz/m1kf+iYlXXGA2X+7DR5Ii+GTRVQVbI4GWYm4By+JYcfElzZnQkJhjRat6
	FXaY8rja6LJuvTFxT2AIOhp6Yga8SkPBz8lrxJ7p7s+43H0FCZizIxfIwy9F3tE4mvwB
	/zHfEz5WH4H6k2gzri87pIBjlCYTMpE75EEZ8IL91lWkzd0+KpXCMP0gLboW9cQpozQ9
	7k8gjUFh//z+O4kv8NCvIPTtcbbiCEr6crzYPVed6rOPYC89VWaXGmirXGEVhAK/G0Qt
	eIxw==
X-Gm-Message-State: ALoCoQkHCg7PrLlxtmDGFb1Gg0XC1Dv2xdxB65sFFGIq896ZUN7CpV8Vm3QzC6AoSEbIjyKK8j3S
X-Received: by 10.50.73.41 with SMTP id i9mr10681608igv.14.1439488678112;
	Thu, 13 Aug 2015 10:57:58 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180])
	by smtp.gmail.com with ESMTPSA id m65sm673344ioe.1.2015.08.13.10.57.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 10:57:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so41480036igf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 10:57:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.50.239 with SMTP id f15mr4071990igo.19.1439488676174;
	Thu, 13 Aug 2015 10:57:56 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 13 Aug 2015 10:57:56 -0700 (PDT)
In-Reply-To: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
References: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
Date: Thu, 13 Aug 2015 14:57:56 -0300
Message-ID: <CAP9ODKrc9dTGwrp-2FT1SbfeRz6_nLkt3m8rW-wFkpwzxrQO7g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 0/5] Add OpenJDK7 based on IcedTea 2.6.1 (OpenJDK 7u85b01)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Aug 2015 17:58:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 12:03 PM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> This patch series adds support for IcedTea 2.6.1 (OpenJDK 7u85b01).
> I've tested the build for multiple targets. Furthermore I tested the
> build on a real ARM Cortex A9 SoC with HardFP.
>
> All test were done with the current master branches of poky & meta-oe.

Awesome! ;-)

> Currently the old 2.5.4 release is not removed. This should be done when
> this version was tested by someone else and in use for some time.
>
> I'm very happy about every test result and feedback!

I would like to see the removal patch as well. I think we ought to
drop the old version ASAP so people are moved to the new one and any
regressions are spot.

The Java layer is suffering of lack of resources so removing recipes
helps in tidying it up to a more manageable form.

I am out of office and will won't be able to test it until 25th of
Aug. So if you can, please prepare the removal as a new patchset and I
test both before merging.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

