Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8727C326
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 20:49:48 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id r20so12155342qtp.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nrr25VZK57srV0C9bNjb4dSOVECGgg5jj8yVCZ9Tyto=;
	b=DTbGlrrUDrhYllHGC3USD3EUrYPmH0dWOvj/YuRQKxvuj8Oocps0FP/fgL+jYmX0eb
	H+fO10/oTYBwJWkuFGogz7Ho0vgoMjc2oqtQ6XG3TqSl86efCFBjeYNikSGkNNxWlE46
	gobJR/ERtGeWsr/bGEfTESwygW4191cZ9jh77ETHaT/DH+fUaCawgSWyTZpRMXKRfMiE
	A0Dz7BUTbVNGmfMtvk3hGGdG3GKVUmQmo82Gmig+gfueKLf1Ej2ObtdAVo6hFb8BWP5Z
	LernLYoXdPo8fRKcmeBuy5ybhSyxIkcsEtr/A5SwrUzjfBJLniIxT+/a5wYfHMATG58Z
	lPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nrr25VZK57srV0C9bNjb4dSOVECGgg5jj8yVCZ9Tyto=;
	b=p3NT+e4hotucLUS5g1mezDCWYpTVVm4Xu1hjSs8gTR+9wiu55c953lv9q9PSgtxWvf
	FZoXfZ9omReDBHBe16w0M26UpxUUYsn2uwrHJoBpu1tBkesPuESBcauZ7c8Mu4OUZR9j
	G2srPeNWZk4D+BWGHSjVMdO6QTSP3uBkYCLo4NumqhwIKllB4TR2KqDx/pey3iq1alhC
	UZIodF9326fmSvj+fVO9MxmotPsu/cWqBoB4VfUAd/LPHiBRHS7HenX75rUruPwGEA0d
	hVAW5IxidkFqRNAN10XMFZoAN25Sl0cViPF7uQCxwTnkYN1Q//UUzFMrPVCFf13DPKCK
	GHHw==
X-Gm-Message-State: APjAAAWaq11hIbQdYu5s/8KWSfv9xO96kZt2CTHwgOf0t50QXs1Ug4sm
	Xp/N4t/Qg9q2420MtyRh7XngbuvW2xkSahnJ6p8=
X-Google-Smtp-Source: APXvYqxtSWk150kTix9FCtt+nS1y/DEFyywNUt8x/+gsoUxRhDpolUsaxeSmtwCRXZhyFqvSqpQa7vCuzZLGGGcr8uY=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr15566103qtj.80.1573850988352; 
	Fri, 15 Nov 2019 12:49:48 -0800 (PST)
MIME-Version: 1.0
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
	<30fccbf16335d228013fb5d59b0ae1cc18c25a38.camel@gmail.com>
	<ea1acf07-73d8-0e08-8979-2e89c6552bbb@intel.com>
In-Reply-To: <ea1acf07-73d8-0e08-8979-2e89c6552bbb@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2019 12:49:21 -0800
Message-ID: <CAMKF1sob3Znp-dXkpnr-avGtA=-t=yKtbU6ckW-w_zgmb8VeNg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 20:49:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 11:25 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 15/11/2019 17:30, Khem Raj wrote:
> > On Fri, 2019-11-15 at 16:09 +0100, Carlos Rafael Giani wrote:
> >> meta-browser would be more appropriate.
> >
> > I was contemplating that as well. but these layer has more chromium and
> > firefox lineage
>
> But it's called meta-browser and not meta-firefox-and-chromium. :)
>

certainly, worth proposing there.

> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

