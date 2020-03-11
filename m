Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id CAA5661BE9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 14:38:41 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id k29so2237221ilg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cGVk/WBXd6B8aPUh7GEZN884f7QztgIN9yRs+B7zP7o=;
	b=D4dXMZnDwjIwbSGSGAgJbSwJ/TrMAeP59TuqF4D+V5U5XTAeWJUVx5YXb2MC6ZI+Tc
	mkjs/sBrtfelhljCFdQjkB5T4DEZwg9/gE/ee4pVpiNsaIsFC+N1pyzVVH4PO0j7r+u5
	UYDzIT3tpi/jdMS+ZVZlsnoO/HWTcwxh1GO/AJYke5H9/ILNpJsr84Dxwihf+itRWjHc
	FWba5EWUEiKMgsewW8ppSF62t9ld+nxkri3Zpd63OPogLJvjLUYP3hy+yBX33rTQQd4m
	U/zh3J2cqjc+TEHvoMpP2Tfg92Z3hxxZNLCjTZfpyWhi2GXZW2x9hVYG8QXSVMap/36V
	p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cGVk/WBXd6B8aPUh7GEZN884f7QztgIN9yRs+B7zP7o=;
	b=KeC75MIUhvbGqDVFJIKcqGl95pAhJGFNlCKAuZCC+hFg3KVXBsB0a1tp+U4nVmM9q6
	2f/7X98XVil3TYIwsHh/F49+HSoEOYx9jxwqeC41kfvIzl+PP2gg75NOm9LhveL88I+T
	TfMn5rY30UBYU4KOoAFZC/OALCCdBbHoFIqNresr0t5RoXYx/C/Z3Jh4pRv5zEjO64ws
	jUkJswjoehAGV870XImWEZSP99J5gH8PyT/wz4a4fo7pJr4Iiuy/OKqffX4V5Vcq8Q3a
	JkHgKA/p2rg6+UtItIbpPEFOVdeBurddt3hy4r4H7dl9hWClfOQF0EvazRUeon5MoNo4
	/FBg==
X-Gm-Message-State: ANhLgQ2hacKujj0HE4W1L38ADVYzUDm51QHi6aCWEXWICQcqb5ik42Tt
	Dtsqf/a6yXiP94R1MhNKNCYFOXA3Jyf0aziJQ6w=
X-Google-Smtp-Source: ADFU+vtgRQ2IjLjKN1MK3qInjp2cf4B6kkb4ifc7rq8/FTcsFRu9GJZhf9UovnjIygBA/67Gw7S3EBooua8ymZuNPvA=
X-Received: by 2002:a05:6e02:1090:: with SMTP id
	r16mr3506680ilj.198.1583937522225; 
	Wed, 11 Mar 2020 07:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
	<CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
	<c519184e-2e78-36fd-2f9a-1b97ebfcb2f1@windriver.com>
	<CAMKF1spdp2K5V2-ejRC+9aHiWoDiqkkDw6KwwQXz1BjdprygJw@mail.gmail.com>
In-Reply-To: <CAMKF1spdp2K5V2-ejRC+9aHiWoDiqkkDw6KwwQXz1BjdprygJw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 11 Mar 2020 07:38:31 -0700
Message-ID: <CANx9H-A94H-OdEHBPwwRuDGctRq_Qqx5SLQq-4K8Ov5O08nbxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 11 Mar 2020 14:38:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 12:38 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Mar 10, 2020 at 11:39 PM Changqing Li
> <changqing.li@windriver.com> wrote:
> >
> >
> > On 3/7/20 12:12 AM, Khem Raj wrote:
> > > On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > >> Can we fix mozjs instead?
> > > perhaps thats better fix, maybe it can made optional via packageconfig
> ?
> > > or marked incompatible if meta-python is not included
> >
> > Hi,  Khem
> >
> > There are 2 solutions for the problem, Which do you think is better?
> >
> >
> > 1.  fix this by using BBFILES_DYNAMIC, add a folder dynamic-layers under
> > meta-oe,
> >
> > and move those recipes that depend on meta-python under the
> > dynamic-layers.  and add
> >
> > these bbfiles by BBFILES_DYNAMIC.   but these will need to move many
> > recipes from
> >
> > original folder to folder dynamic-layers,   do you think this change is
> > acceptable?
>
>
> I think we can live with BBFILES_DYNAMIC solution.


I agree.


>

