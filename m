Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB4460088
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Jul 2016 17:15:25 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so5399148qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2016 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=avT7ZFMLyDzbOIvJpDhCcnYW4NJzTNwC42KeBHOBs7I=;
	b=xNc44SMQuu9D5suKZTvlMOdoKrwu6qYOn7BPJLARCmhU25RoPbixS33TkyBMmFQU/6
	yFRXI8kJK+59uEtzwyXkL8sxg8WRIjV2kLBQWRneqhEKK2hiLkkx+WqLx5bCIi3+J83K
	gnIwjreYImXqrLrRqM1Fw4HWrQ2CELE0lnhb6G3ytk3EKMK1PFxtRUXaklE85NDHpUPl
	Cw9Tg2+7tB1mGDQVPvh3C7SFrmEVcAYrRCtHCJtkkEbZNLjGONKAjIRppljlaWfRHJJ1
	DRFcjlVdmrd06oBwmVqIHLymZ0p8vr3mZYKXROi/n+zrsWEw0RfpvRvCUchMTEoIZncD
	w9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=avT7ZFMLyDzbOIvJpDhCcnYW4NJzTNwC42KeBHOBs7I=;
	b=ORnhvdP5FQN4JogJ4OJdeefAvlz9U3PZxmmgC9hGoChbbONeDfjLgn9a4p8vdGASMn
	u2hi1A4He25nZT0nwe5/xxjJiGdoJlhjbFU6lX0EbtC3mLVTtgNgVy1QD7oSotzN6zFZ
	eyLU8OZRXEFP/wilCFXs/ZB6cA63uu45WwKXv4yBrarDYamOXxqWTLJtQRT4Jd00MoQg
	IZHskQ3UqJRQj+bYLyxkc1tfS6bXh2cmuDwtpyZsQdChekIMHZDRaKualk7S1Uf0rjqc
	8H7mABtcPEy4iRXz5/MNLgVvZy44s9s80aupFt1xdG3MGfXD2RvzCd55/hgM24Vxjtpu
	en+w==
X-Gm-Message-State: ALyK8tIDovm53T2HyKZNNZ1j71jxd/F5j+qtkhyyGy88CM5Zarf0TpiMOSeGxmaPEIlznLsjhx8VCDhMmu1Gig==
MIME-Version: 1.0
X-Received: by 10.55.122.69 with SMTP id v66mr5907851qkc.26.1467479725971;
	Sat, 02 Jul 2016 10:15:25 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sat, 2 Jul 2016 10:15:25 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sat, 2 Jul 2016 10:15:25 -0700 (PDT)
In-Reply-To: <CAGNsrLAET5WkH9MkfqqTAE+=x0kRgNt1QBXimzeUywag_MTQMw@mail.gmail.com>
References: <20160701051457.20909-1-raj.khem@gmail.com>
	<CAGNsrLAET5WkH9MkfqqTAE+=x0kRgNt1QBXimzeUywag_MTQMw@mail.gmail.com>
Date: Sat, 2 Jul 2016 10:15:25 -0700
Message-ID: <CAMKF1srWbfeeihoVr_8M55Y_NfiPvAw==PHZ14jAjNQnniwgiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] android-tools: Fix, enhance and move from meta-shr
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
X-List-Received-Date: Sat, 02 Jul 2016 17:15:26 -0000
Content-Type: text/plain; charset=UTF-8

On Jul 2, 2016 8:42 AM, "Fathi Boudra" <fathi.boudra@linaro.org> wrote:
>
> Hi Khem,
>
> On 1 July 2016 at 08:14, Khem Raj <raj.khem@gmail.com> wrote:
> > android tools offer filsystem tools for creating sparse
> > images, so package them in package of its own.
>
> fwiw, I plan to rework android-tools recipes for:
> https://bugs.linaro.org/show_bug.cgi?id=2179
>
> It's currently based on Ubuntu package, forked for Ubuntu phone.
> I've updated Debian package built from AOSP source and up-to-date.
> I've dropped the ubuntu-ism which will never be upstreamed.
>
> The plan is to be closer to the upstream AOSP source code and be able
> to update the recipe regularly.
>
> Obviously, it doesn't prevent to get current recipe moved to meta-oe.
> It's just a heads up :)

Thanks for.update. I think this really should go into oe core. Since sparse
file system is across many devices
>
> Cheers,
> Fathi
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

