Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 20893609A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:48:51 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id h18so3499609igc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 16:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8pcXDB2NJc7Ntm0K016GPlqo3VLBNCiGiDC7xNoNYQ0=;
	b=Joz+GadhqAL6YEkfXO7yWHPBOetyKVZ/PSOQnvJV82Ja0LH4Kl7esLf13Wd/wHcLVK
	ZqVSF3JLJI6YXXkBPVuG9Rp0DOCKRsPQ1qeGYKAGY2SJ2k0lKNEbDW0q7f5fZ+Wj4jcQ
	ajJOTb15+28Bd0JTTv6fdRIAbRbtjKFLT9JG2OH29sQDcYPdrt8HK/GfdlWrTq1vxAhY
	HW/e8ZO//BNIgNvYsaBpVkFnIT+FPQJg4oC9KiuDBgFCfuAgTHpkdItXFtUaiIpr8dJl
	bn1elgq/aOkRKOvg4MTxZGKzRpUc0N7CxTgZbrdddkJbR3Tl1xRKTDezXJjp/3pe50Kp
	pHSQ==
MIME-Version: 1.0
X-Received: by 10.42.82.148 with SMTP id d20mr37769410icl.50.1398210532539;
	Tue, 22 Apr 2014 16:48:52 -0700 (PDT)
Received: by 10.64.127.38 with HTTP; Tue, 22 Apr 2014 16:48:52 -0700 (PDT)
In-Reply-To: <CAMKF1spaSE0TF=XpYtQMKevKKODbv_C6cFxECeYTA2bfstXx3g@mail.gmail.com>
References: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
	<CAMKF1spaSE0TF=XpYtQMKevKKODbv_C6cFxECeYTA2bfstXx3g@mail.gmail.com>
Date: Wed, 23 Apr 2014 08:48:52 +0900
Message-ID: <CALYKT1ibZMhW+K7Rh+ch6rCyDPfFPOud8dT=mh2eeB0SX=UjaA@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 22 Apr 2014 23:48:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi Chris Larson and Khem Raj,

Thank you for the answers!

With the simple method Khem Raj instructed worked!!

I am finally able to customize my oe-core!

Thank you again!!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-21 23:52 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

> On Monday, April 21, 2014, Journeyer J. Joh <oosaprogrammer@gmail.com>
> wrote:
>
> > Hello,
> >
> > I am the guy who uses oe-core for MSM.
> >
> > oe-core for MSM is just a clone of oe-core.
> > And mine is open via codeaurora :
> >     git://codeaurora.org/quic/le/openembedded/openembedded-core
> >     https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome
> >
> >
> > I want to use strace to debug my application on the image of oe-core (for
> > MSM).
> > I mean I want to use it on target embedded system.
> >
> > And I found strace from my oe-core source tree:
> >     oe-core/meta/recipes-devtools/strace
> >
> > And there are:
> >     strace-4.6/  strace_4.6.bb
> >
> > This gives me impression that I can use strace from my target system.
> > But there is no source code for strace... in it!
> >
> > Then how can I use strace?
>
>
> Add it to IMAGE_INSTALL
>
> >
> > Thank you very much in advance!
> >
> > Sincerely
> > Journeyer
> >
> > ----------------------------------------
> > Journeyer J. Joh
> > o o s a p r o g r a m m e r
> > a t
> > g m a i l  d o t  c o m
> > ----------------------------------------
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org <javascript:;>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

