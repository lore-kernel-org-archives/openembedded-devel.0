Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 37EEB7CA71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:18:34 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z20so2402966ljj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FBWhNIV6BOiqD2fOnghEWKjO81tx1ENUJKyA2wP/9OQ=;
	b=kcTcfJ6aj39dDoyAUiwma1yJHEv4q4cTowBw5xAdkTH8f7gPvN9Mg2yWUB9Bt49KYU
	/emz4ay0V5qVhFbqP83UI7ANEeU5blKVPHpl0Z/kmDWZG7/DpulCM27LIjZ71vK2kur6
	OSRin3pZDUMNgwpuIYYaxIkZ3nu/m2FZ/tkhJqHo7MmJwgozMiOBg7++IejhU5JD6xjX
	0Pt6EdeKl5W9z2cV+qZkk+3DlLNTuwPeZKVs1hy1CT9GdLkDLXRTCjbo6mIHVlLPAOBi
	nb2nu+zMTpeVsvRAuBwy5xf0JU5vN+y8WCV9fGtbvt/cYq2mdrSpJfE8gVNaXEW/Q14A
	54tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FBWhNIV6BOiqD2fOnghEWKjO81tx1ENUJKyA2wP/9OQ=;
	b=EAMkcsFJVvjwQKsLLzWgEoZg0dyGQz6nq4RlPglpr17OvYwzo9AJfcNpjstRYsmJC0
	IpL4UaPh9prhd19DTanvdl1YcVMLeQb6CxwcXEE4k62GYHR/DTMgZs2JR/MdyUJ84oEw
	4s1vqYY1KxinzJ7Jg3cbOoUYLbrtjG6X0sWbFt8NdU+GD/XH4+VLkwXemMCGDjfMdGdW
	YCpOQ1G/0rVRqfXi2fQnjRf5J/zGHQff+S5Vs/ghWNZ4ayKPDoMzZCx9p9gMuoDUHFad
	Xn3RAnIvVG+v8qTO0iKxgijC8rh8pK+xyR3FSCeF0mwM6GCfVx0gwZny/pFq1bcctcof
	RbHA==
X-Gm-Message-State: AHQUAuZHB5tQ+EBlVU+y/fQBWHPUFGaCXiwpIZiIP71ZfusisiTJm8Py
	kYdrHFZocG4peY9+Y5EIK4BOfPJWOaQuHO2QiEbsPQ==
X-Google-Smtp-Source: AHgI3IbfSiJChP5QwKCeEyBlDFNSZnT691cUJFoVIOiKLjc3QyES4MKLlK3Mu2zerQnnK9yd3if9AA2w/XAe1lXWqCc=
X-Received: by 2002:a2e:9a8b:: with SMTP id p11mr3104327lji.66.1550859514616; 
	Fri, 22 Feb 2019 10:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<CAMKF1soDj0s94rB5AtbhxYnO+G3zgB=gsK8-Up18Lea-jQGvpA@mail.gmail.com>
In-Reply-To: <CAMKF1soDj0s94rB5AtbhxYnO+G3zgB=gsK8-Up18Lea-jQGvpA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 22 Feb 2019 19:18:23 +0100
Message-ID: <CAP71Wjys=BuA8-c=5dymEF9CD3uqNJTDvF6Uc12zFBmA6Wc+pA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/4] A few fixes when trying to run yocto-check-layer
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
X-List-Received-Date: Fri, 22 Feb 2019 18:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 22, 2019 at 7:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > I was trying to run yocto-check-layer script and it has caught some issues.
> >
> > Note that I was able to get a PASS status for meta-oe, using two additional patches
> > from Mingli Yu <Mingli.Yu@windriver.com>, i found on the list:
> >
> > upower: add REQUIRED_DISTRO_FEATURES for polkit
> > udisks2: add REQUIRED_DISTRO_FEATURES for polkit
> >
>
> they are in master-next

right. that's actually where I took them. Just wanted to highlight
that with these 2 patches + my 4 patches, the script passes.

>
> > Nicolas Dechesne (4):
> >   meta-oe: fixup LAYERDEPENDS to include meta-python
> >   polkit: add REQUIRED_DISTRO_FEATURES for polkit
> >   packagegroup-meta-oe: fixup package that now require polkit
> >   udisks: add REQUIRED_DISTRO_FEATURES for polkit
> >
> >  meta-oe/conf/layer.conf                                    | 1 +
> >  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
> >  meta-oe/recipes-extended/polkit/polkit-group-rule.inc      | 3 +++
> >  meta-oe/recipes-support/udisks/udisks_1.0.5.bb             | 5 ++++-
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

