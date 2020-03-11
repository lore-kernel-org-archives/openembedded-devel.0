Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3B624605E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:38:01 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f28so1125711qkk.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VRNnysooEIDfIcqGk563hzuf9jCO9aZpMEuLi7M5NFA=;
	b=MC1F/rUBsD/Wb/Z4wqM+O1LN60w2WUZr8OC7gN94HxwvRUFhFCvde2XJdYbyk1U5sj
	m0pCNRp5o/5fLdZqWtPKLQeDaXroY//MBCAjJ4hQUV9uWHeZKTxWFgoKEPHCalxyg9On
	sIkiQRBxboj7JzEgjllyTcvwtQE2sU9kyJCRd6jTExfcfins1fSWwHlgEcZY/j+S3B4n
	psDQaLuw4zziEngu3Cpk10XhUebUYL4s573Wz67mEZZCVmLOUNBSrUaazW2cIK6M379X
	Q9VtZDZYuAQXV/zNp3EBZV4sbezEBHl3yop2TtFNfH5cRLaxPLcmV99L6NX1+DpSGVDU
	MR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VRNnysooEIDfIcqGk563hzuf9jCO9aZpMEuLi7M5NFA=;
	b=lGNKwck+4Sfp3oO5yOy1Oh75a4ahVCj/kpPZa2Aa6lR16JnWGv6T9vGUbmJedWITr0
	1PuZB9Z/eldVoGghhHOeqguBCThpS5XYfr9gW3lHXj1jobU0XaIYfZYkwl2Oiat8gqKp
	T/eojIxrRUP/BR6N7lVq6msOqJcYPOhIEabxM4NR7bFuIb9/HaEEPd2J/UrpD03EUlQs
	gZxUysiXh2YyNSIGgVbq5mF+h6J5roMbSjNULFisOT/3XVOFzh4TTzA5iOIqiIrxm4kF
	HzhyODHUU6kPa0fB5e2vjeJdXZhviIQMaY6L+9TeppY0eZdLJdwh0e4MIS8JurV70ctd
	UzsQ==
X-Gm-Message-State: ANhLgQ09VFCv2VJGoJDHp3R4S/VzYTApP2qc1n35sHQIJVgGqNjkoAu7
	Fddi72Z4W+2vUSXDNPapLOWMhv+b2i5W+fsjdaU=
X-Google-Smtp-Source: ADFU+vtpyd2hbrkI5WbbPjMz+ETy7NAP7yqbyapXxALZrwebTOfsnEGx8PC0zX2m8iDzvfNVj/mxz/0WQZPDTNrWRbA=
X-Received: by 2002:a05:620a:22b:: with SMTP id
	u11mr1487215qkm.225.1583912281671; 
	Wed, 11 Mar 2020 00:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
	<CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
	<c519184e-2e78-36fd-2f9a-1b97ebfcb2f1@windriver.com>
In-Reply-To: <c519184e-2e78-36fd-2f9a-1b97ebfcb2f1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Mar 2020 00:37:34 -0700
Message-ID: <CAMKF1spdp2K5V2-ejRC+9aHiWoDiqkkDw6KwwQXz1BjdprygJw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Wed, 11 Mar 2020 07:38:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 10, 2020 at 11:39 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
> On 3/7/20 12:12 AM, Khem Raj wrote:
> > On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >> Can we fix mozjs instead?
> > perhaps thats better fix, maybe it can made optional via packageconfig ?
> > or marked incompatible if meta-python is not included
>
> Hi,  Khem
>
> There are 2 solutions for the problem, Which do you think is better?
>
>
> 1.  fix this by using BBFILES_DYNAMIC, add a folder dynamic-layers under
> meta-oe,
>
> and move those recipes that depend on meta-python under the
> dynamic-layers.  and add
>
> these bbfiles by BBFILES_DYNAMIC.   but these will need to move many
> recipes from
>
> original folder to folder dynamic-layers,   do you think this change is
> acceptable?


I think we can live with BBFILES_DYNAMIC solution.
>
> git diff conf/layer.conf
>
> +# only activates content when identified layers are present,
> +# to ensure yocto compatibility check pass
> +BBFILES_DYNAMIC +=
> "meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
> +"
>
> 2. move those python recipes from meta-python under meta-oe
>
> >> On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com> wrote:
> >>
> >>> From: Changqing Li <changqing.li@windriver.com>
> >>>
> >>> yocto-check-layer/test_world failed since error:
> >>> ERROR: test_world (common.CommonCheckLayer)
> >>> ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
> >>> /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
> >>> DEPENDS on or otherwise requires it). Close matches:
> >>>    python3-numpy-native
> >>>    python3-pycairo-native
> >>>    python3-rpm-native
> >>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> >>> providers.
> >>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> >>> 'mozjs', 'python3-pytoml-native']
> >>>
> >>> mozjs depend on recipe under meta-python, but meta-python
> >>> isn't in LAYERDEPENDS, so error occurred. Fix by add
> >>> it into LAYERDEPENDS.
> >>>
> >>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >>> ---
> >>>   meta-oe/conf/layer.conf | 5 ++++-
> >>>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> >>> index c537736..0ce0ad2 100644
> >>> --- a/meta-oe/conf/layer.conf
> >>> +++ b/meta-oe/conf/layer.conf
> >>> @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
> >>>   # cause compatibility issues with other layers
> >>>   LAYERVERSION_openembedded-layer = "1"
> >>>
> >>> -LAYERDEPENDS_openembedded-layer = "core"
> >>> +LAYERDEPENDS_openembedded-layer = " \
> >>> +    core \
> >>> +    meta-python \
> >>> +"
> >>>
> >>>   LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
> >>>
> >>> --
> >>> 2.7.4
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

