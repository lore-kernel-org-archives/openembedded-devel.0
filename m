Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB0B60125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 16:30:22 +0000 (UTC)
Received: by igcpe7 with SMTP id pe7so16663556igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=j7tLq641KANXtVsU8o/89Txr8GtBi1hPzdzfSsl7tjs=;
	b=iSDM2EoLOewSmCqgj4Y3HNUCX4rv4TCueOSbbjo+6j7kjs73CRZcouhjHljLkE/Enx
	q8IT5ikj/RNXoRqjj9tJ4BIkIpIufFZu/7eZTJpXOkAL+Mcq7BKQc/36e38D61F7/7BQ
	WLHbX7Ju/Mu6bCkmmIW/ZDpPsU4qLghzA1SdWGesBoVzDSE6HOBKTa8L/sy/3rL4Qea5
	xY7lX0KOzkdy13H0TUUL7dEJHKnnx/0+KZazlBDYd+QD2VwPFfGlJHi60HFDYafrjqXo
	onDv5Lll4aDbCB2ZItL32aZs7SqNvvc7MAdMKIGef/UmR4rW/TQ7jiN/4pQrniM1Kejg
	nmFg==
X-Gm-Message-State: ALoCoQn4GBssN+puDUGe0Y2bdYC1utGoalR51Do2xGJsiONUCrYl2yY/bPDAPGwRdIwxv6gRPwrO
X-Received: by 10.50.78.7 with SMTP id x7mr5535995igw.54.1444321822869;
	Thu, 08 Oct 2015 09:30:22 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174]) by smtp.gmail.com with ESMTPSA id
	95sm17156973iop.31.2015.10.08.09.30.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 09:30:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so64107681iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:30:21 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr9526191ioi.192.1444321821206;
	Thu, 08 Oct 2015 09:30:21 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 8 Oct 2015 09:30:21 -0700 (PDT)
In-Reply-To: <20151008152425.GL2385@jama>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
	<20151006222919.GC2383@jama>
	<33DC3C44-62D2-4C8E-A7FE-FCCB11A83AFA@gmail.com>
	<20151008152425.GL2385@jama>
Date: Thu, 8 Oct 2015 13:30:21 -0300
Message-ID: <CAP9ODKofPKdt=+vtL84gnuLOW4xnEBO8d+-RY81KnfmuzcrKCg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
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
X-List-Received-Date: Thu, 08 Oct 2015 16:30:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 8, 2015 at 12:24 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 07, 2015 at 06:36:41PM -0700, Khem Raj wrote:
>>
>> > On Oct 6, 2015, at 3:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > On Tue, Oct 06, 2015 at 06:58:25PM -0300, Otavio Salvador wrote:
>> >> On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann <manuel.bachmann@iot.bzh> wrote:
>> >>> We make the "freerdp" recipe active again, fix the build
>> >>> by pulling a more recent version (the "stable" branches are
>> >>> buggy and useless), and fix ARM runtime with -fPIC.
>> >>>
>> >>> We can then :
>> >>> - make X11 non-mandatory ;
>> >>> - add support for Wayland ("wlfreerdp" client) ;
>> >>> - add support for DirectFB ("dfreerdp" client) ;
>> >>> - add support for GStreamer 1.0 ;
>> >>> - make "heavy" features such as pulseaudio, cups...
>> >>> non-mandatory.
>> >>>
>> >>> We really want to install the "winpr-makecert" tool to have
>> >>> TLS, but CMake does not position its RPATH cleanly, so let
>> >>> us have a custom patch for that until it gets sorted out.
>> >>>
>> >>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>> >>
>> >> I fully agree with the changes and those are very welcome. However, it
>> >> would be good if you could move from nonworking in one patch and do
>> >> the changes here in another patch.
>> >
>> > I wanted to get rid of all nonworking directories, I'm sending patch
>> > series which reverts the recipe moves and replaces it with PNBLACKLIST.
>>
>> PNBLACKLIST still causes parsing overhead. I would suggest to move it to a layer under meta-openembedded
>> like meta-trash or some such, if someone gets it to work move it back to the appropriate layer.
>
> Lets move all blacklisted recipes to meta-broken or some such after
> jethro is branched.
>
> Big advantage of PNBLACKLIST is that it's easy to unblacklist from
> distro/local.conf and that bbappends in upper layer are still parsed
> corectly, moving the recipes to separate layer (which wont be included
> in any sane buidls) will force bbappends to be removed and then possibly
> reintroduced when the original recipe is fixed and moved back to
> appropriate layer.

I like to meta-broken proposal however I think it should still have
the blacklist. It helps highlight a possible cause and allow for easy
development of fixup patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

