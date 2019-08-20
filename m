Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C60317ECAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 16:53:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i4so6800035qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/4w6+nUxehinzqI4qWRJpBf0wZ2dptZM3Q2U0NzKLaI=;
	b=iMdnCKWhL/K1t8CeK1PTMPcTMYKUJa53AXZ6a7A4IK1rkxYq65wiNytASsglt5jxJ+
	ClTtecl8mwC9acaArU59gZrnr7HzbCnlMdxcXcHTIKGJV507njWQNKo13VUDVPD8vviZ
	gmskz3T5ZWu/gLboOOEQCBDLMuVcdrv8tnf5bVrLB84fYkOyhopb42b7WaYY/hLy7cBm
	4BPuDHiIVrUfYpgK5oiiVVIqPJQgTWDFWj5jOmvc1NA0ZB64u07zR2lf/Bpp3yOclhFO
	vwAYzu2rH+HTTaPnuWdAsh5V96wKsh4vBcSLa3KuT9Nd3h0z0FuD5OuWpW176agVWk95
	TERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/4w6+nUxehinzqI4qWRJpBf0wZ2dptZM3Q2U0NzKLaI=;
	b=qdDZs1C4F/90XlwIuqvyLwIYVDAGIn5WV1MxP0zArBh5nW8CUVnDL6U4Y+IdUSHnyi
	JPjEArMoCgSq6l2bHnjObcCS/VQKOmogfXuVN5vRjOL2dazZuvuO0/3q8y8AkU8xXdcM
	q9XkSt3eLLXeR5egAeBhaGgQaxoNAldv+w9xNg1IfcC0J7Q2OFm3wi7SwwLzt+IILXC3
	nCH+9FRGDWnKcpUS+gW0z3oTfvZ1cpRcOUvRkIxp3nngccAMPAj00RNmvCbyW/Y3YdVM
	6R9AbnIIC5rUWCL2TybMLbuEisQ976arWGgnD4NjjLD3sCf8wJt7RErc4SO+B1wAPDZv
	khug==
X-Gm-Message-State: APjAAAVcKLH1+7eLVo6n9mB1n9on5VfIxuk4KUTmg3Jlbv4tSyvCCXWc
	D/7dUO8U7iBHajDFuM6vuVnZME6jTG2PGW6MK0C0g0CU
X-Google-Smtp-Source: APXvYqysG01x7e8jgeS5fzMAE5XsnX+Q8znMivy9nxyP+7YqP0hn/Ep6DjqllgeKMig60XB/NwR1zfCtYyd8E2MGbik=
X-Received: by 2002:ad4:44a7:: with SMTP id n7mr11612222qvt.51.1566320017347; 
	Tue, 20 Aug 2019 09:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
	<20190820164438.GB24268@localhost>
In-Reply-To: <20190820164438.GB24268@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Aug 2019 09:53:11 -0700
Message-ID: <CAMKF1sqqUo3haTA8RpCd+8bLb2rw2OKJjVVVPk+tbPhS--tDnA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Tue, 20 Aug 2019 16:53:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019 at 9:44 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Aug 20, 2019 at 09:30:36AM -0700, Khem Raj wrote:
> > On Tue, Aug 20, 2019 at 2:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > >
> > > Build on qemuarmv5 failed:
> > > ...
> > > |poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
> > > SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
> > > qualifiers [-fpermissive]
> > > ...
> >
> > I wonder why this warning only shows up for armv5 and not for other
> > arm subarches or
> > non-arm arches.
> >...
>
> https://gitlab.freedesktop.org/poppler/poppler/issues/821

I see. This makes sense now. I wonder if we should just disable the
support instead of keeping
it dragging along ?

