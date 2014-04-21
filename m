Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id DEA3860C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 14:52:41 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hl10so1849034igb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9idfM2cbg/HOlrU3/mERJj39OGo8brzK+sSuLm1WXAk=;
	b=iImKoUe5PmHGAP94B2PlDaepJYTePfcNuboSwWr2HcvfP18GyaMRx8naps/3DDTL7H
	I0w067dXGjmw77GoFr5QPmQ4BuVu1mxv93y2zSbXhlXXdqFG/m2q8AfZpxvJ22p102fO
	bbIkI5n2xzViooEFambXJmT9AdAMNxLrGEcdZssawbZTBUq4AJCX0o7GyMNMyTePCW6P
	4gfD59LvjsIIckUhbcUijMWUSiSzPnXnhYjx8Gbtn6KsBZNDns2hrlVVYoCdfpBFyeXX
	m2ACULsyxjZZDjSA1qDhl84Um/oR8qDSRXFxanldkTZEAx5MMrN1gJn/6NC0iJUyS0+Z
	uAUw==
MIME-Version: 1.0
X-Received: by 10.42.136.130 with SMTP id u2mr28793911ict.51.1398091962118;
	Mon, 21 Apr 2014 07:52:42 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 21 Apr 2014 07:52:42 -0700 (PDT)
In-Reply-To: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
References: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
Date: Mon, 21 Apr 2014 07:52:42 -0700
Message-ID: <CAMKF1spaSE0TF=XpYtQMKevKKODbv_C6cFxECeYTA2bfstXx3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I use / enable strace of the image of oe-core?
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
X-List-Received-Date: Mon, 21 Apr 2014 14:52:49 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, April 21, 2014, Journeyer J. Joh <oosaprogrammer@gmail.com>
wrote:

> Hello,
>
> I am the guy who uses oe-core for MSM.
>
> oe-core for MSM is just a clone of oe-core.
> And mine is open via codeaurora :
>     git://codeaurora.org/quic/le/openembedded/openembedded-core
>     https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome
>
>
> I want to use strace to debug my application on the image of oe-core (for
> MSM).
> I mean I want to use it on target embedded system.
>
> And I found strace from my oe-core source tree:
>     oe-core/meta/recipes-devtools/strace
>
> And there are:
>     strace-4.6/  strace_4.6.bb
>
> This gives me impression that I can use strace from my target system.
> But there is no source code for strace... in it!
>
> Then how can I use strace?


Add it to IMAGE_INSTALL

>
> Thank you very much in advance!
>
> Sincerely
> Journeyer
>
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

