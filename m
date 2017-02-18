Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDA26FF84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 21:35:58 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id x71so4484462qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mL0GzWSHwNgrg3C5Sa63aldhH6ZxQnUwJ4hzKQbr+5A=;
	b=BsMUoqShM7LzNQr9V7KwZCW10txlGfBu5DZcWOR1Hh88J8FdT7QzpJQ5z4NSdsVt1R
	o2HRhWqumiPpTZZZrXLcJwZxiLriqrbHDbRXdKS5un8UzL3sjqH1uWgWDic1WO9A44vW
	f0xkUvgNH6+X4QY/z7czu1F7BGzNFv/psw3l1fNI7M1FqcUHDAWRf/A7tc5g80PJPK64
	sO6dkKdnmfqL88XIDcKdlJfIF4oNU/hvdQgfmH4zFgDq/gLHB67xQlFNBazzw/lqVvAV
	0gCMDYT1HDmULMX/y5n5YWEnCgvUycyidSq66GqqzlkgcHIbyyKuhUX7oIocd2THDwxN
	C/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mL0GzWSHwNgrg3C5Sa63aldhH6ZxQnUwJ4hzKQbr+5A=;
	b=AUrndTfLRNn8hbnOv+b/43FRLVAdYLPfRzZQJD1kUpETUhiV7bexFRwZPx7fNIDIge
	lgqZQD9EIo/NhZbIFsortjCWDZmf6cSKRKcPWwkr+n88U9Tad+vyifPrL0wrVtmJ3ekR
	WjzJU+ebh5OHLYE5M71aMuag2z92+q1rpF093582Rbbswu9ONlS9PsAkOBvv9L0a0hLN
	RyCqws9IaNaLOIlHgAmKJBqLXkJmFE7Ze6aFEC1IW5edkkgruj7p1fKSjgfuZUDlqFja
	X1jATuCmajk7oipk9mXtn5VGR0vKVxYKQGr7mAR9+UE6aqXzNIWhIIBrvEL0N6YyoanV
	Q9yg==
X-Gm-Message-State: AMke39m8Un010BmfFAIS+GvePAXW8zWzfVFgOnp7IggJsbDd+xRqwT+UMmFp6DvyVcCuSJWGDqGRF4BwWBF+h0c/
X-Received: by 10.55.175.195 with SMTP id y186mr6105789qke.26.1487453758993;
	Sat, 18 Feb 2017 13:35:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Sat, 18 Feb 2017 13:35:38 -0800 (PST)
In-Reply-To: <20170217180254.GA3276@jama>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 18 Feb 2017 21:35:38 +0000
Message-ID: <CAJTo0LYTa-8gUdGQNuSvMwX5gwMs5B_=W4KmU5q0usEL=m=uhA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Sat, 18 Feb 2017 21:36:00 -0000
Content-Type: text/plain; charset=UTF-8

On 17 February 2017 at 18:02, Martin Jansa <martin.jansa@gmail.com> wrote:

> 1) RSS is good thing.
>
> 2) The breakage wasn't caused by lack of maintainers (at least I don't
>    think that I or Joe were the bottleneck for integrating the fixes).
>
> 3) More maintainers doesn't mean more contributions from people actually
>    using now broken components, it's actually easier to just send a fix
>    than to be a maintainer of some layer just to be able to also merge
>    your fix yourself.
>
> 4) It doesn't look so dramatic if it turns out that 200 of those
>    blacklisted recipes weren't actually used by anyone still active in
>    OE ecosystem.
>
> 5) If someone wants to replace me as meta-oe maintainer, go ahead, it
>    stopped being fun for me long time ago, now it's just slightly annoying
>    routine which takes my free time I would rather invest in something
>    cooler
>

I'll probably reply to this properly when I'm not rushing between various
things, but I want to make it clear that I think the work you (JaMa) has
been doing on meta-oe is beyond legendary and I've no problem at all with
that.  I just wonder if it would be easier to deal with stale layers that
nobody is actually using if they were separate repositories instead of
being part of the meta-oe umbrella.

But they're not my layers so I have no say, and obviously everyone else
disagrees! :)

Ross

