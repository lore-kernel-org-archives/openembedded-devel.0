Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 189D77F2A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:11:17 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id u14so10932229ljj.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1ISVAFabIIOcFEgq5Qt+ih/btbqWiSTPwXL0hpMk1mA=;
	b=Qm7VJ2yr/wMZZL6rZX9FUhuNtl1uMTdHAVWwOSJEd9XGs38HuQpfwlVyrl0zW6Glb+
	Dcvo1oMDkI2dQXKmG0Cq9mWF7DOjHumurYscQEUEfwCwQH/o6oV6C96vPUERg9bL+c/k
	6Kjkmx2aMEqd6RnJIJyDgQiNHxxBgKfz6cZSVbXO7Mk/1z5J2DEwidSMhNppI6l2gE3F
	jDEE8j8fYZhfz3tVp9VXEMyTzbw7sxV/2bJo3zcmxGsRUq5sa5Xj498yKqwHKviearAD
	NDHeqX7DTyUuosi8IWoeYNCoPot/19JLs5fhd6cQXOKInZTgZduLR+SZEaigZX6aHX9m
	N9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1ISVAFabIIOcFEgq5Qt+ih/btbqWiSTPwXL0hpMk1mA=;
	b=TDR1T/DuBnP+oH0miwIKBLUmVNKiwIgDOAYJxo2g66eXvv2gtsBBlQ83Ev6u3+qqbL
	XwVIdudsW6X7dDG6+iSaQALQ5+yVm+5eM0WSpIOt/Lnc97DaMrcnBsZg9vvPq/m0Cehk
	eor/dlpzTRvZMu9XdOjpBIgpuIYROx/AJVmIccqrQno3y3T6EbZ/FhK2lPlV+CGxDKnU
	YTrVmdHxq2lQaBnqA/6cImkwJV501gr1EBwtL+5r/b2USZNGBQquSDjCfO3Ctqqcp0nm
	4DODbLZDQ5LLNEsDFcpIBhuScs0/gwOLjwjwEnPRe3IH6UReZV7ByGwWFtZ5nAFYtznv
	mjOw==
X-Gm-Message-State: APjAAAX+Sq+c2LtG/WVk5e/+vJ43nFskDbVlOAGJ/OVxqVm4VJPnT8Q2
	b6ecfcQuoP0NwvrrtIw1VJeYzYfO9zfdzT6xb58=
X-Google-Smtp-Source: APXvYqyRqjgKNMBrtQzcv8sGj5jbuZK4JxnST9LrRPifaJhy6OlkKgyqNnX6I/zZZIColAPtdonOYCTNCgod8GEGiCQ=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr3252496ljl.79.1567545077505;
	Tue, 03 Sep 2019 14:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <1567156014-79892-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1spP9hQt64stWn_mSGfE7tVg_wLhaADyp4VHqWLCe1GCog@mail.gmail.com>
In-Reply-To: <CAMKF1spP9hQt64stWn_mSGfE7tVg_wLhaADyp4VHqWLCe1GCog@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:11:06 -0400
Message-ID: <CADkTA4MqB8Sx7vP4VPL3GzG8J1pOMKps9TkTzgvhXmGdKxjHQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-realtime][PATCH] layer.conf: add openembedded-layer to LAYERDEPENDS
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
X-List-Received-Date: Tue, 03 Sep 2019 21:11:17 -0000
Content-Type: text/plain; charset="UTF-8"

Indeed.

If khem hadn't followed up, I wouldn't have seen this at all.

I have grabbed the patch and merged it, but in the future, the
linux-yocto list is the one we are (re)using for the realtime stuff.

Bruce

On Tue, Sep 3, 2019 at 11:31 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> please send this to linux-yocto@yoctoproject.org as per
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-realtime/tree/MAINTAINERS
> always good to check README for such information.
>
> On Fri, Aug 30, 2019 at 2:08 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
> >
> > latencytop.bb depends on gtk+ which exists at openembedded-layer.
> >
> > So we should add openembedded-layer to LAYERDEPENDS, otherwise
> > "yocto-check-layer-wrapper meta-realtime --dependency 'cat mylist'"
> > will fail with "NO PROVIDE gtk+ ..."
> >
> > Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > ---
> >  conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index cb24358..72ae7ad 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -16,4 +16,4 @@ BBFILE_PRIORITY_realtime = "5"
> >  # cause compatibility issues with other layers
> >  LAYERVERSION_realtime = "1"
> >  LAYERSERIES_COMPAT_realtime = "thud warrior"
> > -LAYERDEPENDS_realtime = "core"
> > +LAYERDEPENDS_realtime = "core openembedded-layer"
> > --
> > 2.8.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

