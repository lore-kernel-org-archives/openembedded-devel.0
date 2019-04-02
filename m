Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFDF7D139
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 15:35:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k14so15777827qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2019 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RaGAuzTM01j0je5aM8nRnYdXu0Zy3cNUnCYbsQjebc8=;
	b=IdPsnHJMuP1J8eyYWzpQV3DqLzQh973OSkgi+HZhiIPh656xZWUFDzzNDOsPllpiBk
	8pMVKryzDISXynap3fw4zWtoEVjNIt4nP37DavPjAoDxmtu13Vj3/gf14jhcFSyYMqpk
	DbFLMSHE1fq7LU3IJa5DJiTuaWUkRhi0OAbdUHSrpg0JZefYbdUQh35HuoMrufBi8TT9
	+1McdziYpk1C7/nEQDyTsMULPBXYfczzsIINbOJUbcpkkZfKkvwVPp8sa+IzCQPEMQXn
	io5UGNNcma8bBiDmCctrgnZLnQGq0oh8CMbjoSaTtOcahx46Fix8orM3zeOOf+Qu1Ee7
	1lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RaGAuzTM01j0je5aM8nRnYdXu0Zy3cNUnCYbsQjebc8=;
	b=SdS/B3IJWt5vUBi72EB3ZwaTHcMdVwMpo2KCFzTk0C5kvoxH49+21FsjvL9zEhk4Ej
	v+5Sxra+2k7KTSORMvi3gGIRyTEeePbjfpGVVNEJwdg0jWOAyvPXO8HhwWiwE/HE/glM
	4Q9b7uwgIhZLyWYojiT6hG4s9He0PeDareV927jqkH6j0buBW7B7kUn3v3my9A77RUYD
	j6JtHW3isSBnY+8+EM3bA4lo7s/wmIw1NGP//bf/xFxP9oLyxDaxXQhvoest4surxDJs
	jQPZtKu956u3JpgbwELy7vLH5z0duvBTUWv+oQNiks0DFOBtWs4UZ28ObPgQYV+dPQTr
	x4/g==
X-Gm-Message-State: APjAAAX7MNLQ21phKfcwPt1WWBA171a45p18/bQivndt7652OQwWZHCD
	Hlddu9T/JRAZ1MgtHEQJLYlYZodhzuSa4lkRmaGsGsJ/
X-Google-Smtp-Source: APXvYqzUv++dg9fTSHjXs/f/fq88MY6RW3oROisyE1p7Ij9OfbbcCOtMg94nvpLhtEIsVJhHOSOw2LSUZwMMhiatQ9M=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr60902070qtk.262.1554219305779; 
	Tue, 02 Apr 2019 08:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190330165630.4403-1-Randy.MacLeod@windriver.com>
	<d0946b9c-81d5-b30a-7b24-92e4673f7303@windriver.com>
	<CAMKF1spUTKn98ay_nOw55i86qHHfvB=NQYs4B0HOibe-jVQXSw@mail.gmail.com>
	<ca714279-bb2b-59bb-5161-53d497e90c92@windriver.com>
	<7bb35f4d-8eda-1284-99e0-84240b3c0ae6@windriver.com>
In-Reply-To: <7bb35f4d-8eda-1284-99e0-84240b3c0ae6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Apr 2019 08:34:39 -0700
Message-ID: <CAMKF1soePYfVRRByHxTpwO=61aJM76Yf1fLff-qmCxECERWRsQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Tue, 02 Apr 2019 15:35:05 -0000
Content-Type: text/plain; charset="UTF-8"

its v3


On Mon, Apr 1, 2019 at 7:38 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 4/1/19 10:33 PM, Randy MacLeod wrote:
> > On 4/1/19 10:28 PM, Khem Raj wrote:
> >> On Sat, Mar 30, 2019 at 12:56 PM Randy MacLeod
> >> <randy.macleod@windriver.com> wrote:
> >>>
> >>> On 3/30/19 12:56 PM, Randy MacLeod wrote:
> >>>> The previous SRC_URI did not work for the new version and
> >>>> when looking at the site, users are required to navigate
> >>>> through a click-through license agreement. Also use git
> >>>> repo rather than the .zip archive since the github checksum
> >>>> can change from time to time.
> >>>>
> >>
> >> https://errors.yoctoproject.org/Errors/Details/235000/
> >
> > That's odd.
> >
> > I built the update for all qemu targets and both glibc/musl.
> > I may not have done sysvinit but I doubt that matters.
> >
> > Are you sure there wasn't something wrong on your end?
> >
> > I'll try the rpi tomorrow.
>
> You are replying on the v2 thread.
> Did you see and use v3?
> ../Randy
>
> >
> > ../Randy
> >
> >>
> >>
> >>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> >>>> ---
> >>>>    .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5
> >>>> ++---
> >>>>    1 file changed, 2 insertions(+), 3 deletions(-)
> >>>>    rename
> >>>> meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb =>
> >>>> wolfssl_3.15.8.bb} (77%)
> >>>>
> >>>> diff --git
> >>>> a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> >>>> b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> >>>> similarity index 77%
> >>>> rename from
> >>>> meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> >>>> rename to
> >>>> meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> >>>> index 0a0a6075d..29e094783 100644
> >>>> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> >>>> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> >>>> @@ -12,9 +12,8 @@ LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >>>>    PROVIDES += "cyassl"
> >>>>    RPROVIDES_${PN} = "cyassl"
> >>>>
> >>>> -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
> >>>> -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
> >>>> -SRC_URI[sha256sum] =
> >>>> "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
> >>>> +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
> >>>> +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
> >>>>
> >>> Oops, I forgot:
> >>> +S = "${WORKDIR}/git"
> >>>
> >>> v3 sent already.
> >>> ../Randy
> >>>>    inherit autotools
> >>>>
> >>>>
> >>>
> >>>
> >>> --
> >>> # Randy MacLeod
> >>> # Wind River Linux
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux

