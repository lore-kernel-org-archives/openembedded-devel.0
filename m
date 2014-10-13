Return-Path: <nickdademo@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id F166B60167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 21:10:00 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id a3so14276829oib.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XxN1VN1CDqxSs3JXnoG7uhSvNgn6B0tfUk07zSNnzPM=;
	b=zbl6aWqULYEB0DOBcDeg94l6WeMxC6mKf7Z9Z7G3wkEzblty4e3rREFtjznNnlrGVB
	PV2LskslTGOO+jxOTuSQFKycYUg39adFC3YlCG4mN6kvDVV3De4sPA5SXwHg4v6PUS6N
	00nPlfm2QX2aw8vtjyTRqUUAtKiAzXndjK1zLCeLECVsWwoX22yat779pDGqq840Cw63
	RuXiXbA1zP2u1XPfDpvu2PaZ0NZUlyl5WhO1c4/WwFaORQLAgEAT6f1rhcwZPOUDrijA
	QyKbbwlss+HLOj2DSsru4TxqfwZiWHkqDo/joHzCHARlPmBqrjKHL1d3cPEwHetFumCW
	v4Lg==
X-Received: by 10.202.84.77 with SMTP id i74mr735901oib.29.1413234601198; Mon,
	13 Oct 2014 14:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Mon, 13 Oct 2014 14:09:41 -0700 (PDT)
In-Reply-To: <20141013071037.GA5099@ad.chargestorm.se>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Tue, 14 Oct 2014 08:09:41 +1100
Message-ID: <CANR6C54sFocGNOmgQ65vJy_ZEmadg_LBReDQf8w=TKxYKXhxhg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: anders@chargestorm.se
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Mon, 13 Oct 2014 21:10:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Anders,

Are you using Qmake or Cmake to build? (I suspect Qmake).

My source code actually has no .PRO file.

Cheers,
Nick

On Mon, Oct 13, 2014 at 6:10 PM, Anders Darander <anders@chargestorm.se>
wrote:

> Hi,
>
> * Nick D'Ademo <nickdademo@gmail.com> [141013 01:50]:
> > Has anyone had any success at all building a Qt5-based recipe with CMak=
e?
>
> Yes, I've at least got a local recipe here building KDSoap, which uses
> cmake.
>
>
>
> > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com>
> wrote:
>
> > > Looks like the *qmake* binary cannot be found.
>
> > > The relevant parts of the recipe are as follows:
>
>
> > > *DEPENDS =3D "qtbase"*
>
> Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. However, =
I've
> also the following line (situated after the DEPENDS +=3D...)
>
> inherit qmake5
>
> That line should set up all the necessary path's in order to find qmake.
>
> Let us know if this helps you.
>
> Cheers,
> Anders
>
> --
> Abstainer, n.:
>         A weak person who yields to the temptation of denying himself a
>         pleasure.
>                 -- Ambrose Bierce, "The Devil's Dictionary"
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

