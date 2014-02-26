Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0686F137
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 16:45:21 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so3160246ykb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KaifQWLFGQg4BE6Qceh/brD28dEdQwzAM8VWdUi7y34=;
	b=zTBd/hUR6ef+45Q9KMKMhR53YQPhyVrakWZbpRco3bXcr8gCinIt7O9OpE4lsVzjQU
	912FR3bQ6frUyr2GDvfMBEbdmknqDbqCBrmbdiFnPeYx6sSPMXH5P+d36113sjouao5Q
	A2EsxjlTol9yb6bSlRseTnxILKZbhYIOtUrd2GXBVs5I0qfBAIPG3ptYAMip5Y5HyBt8
	mFzWCKQge4T+nt74qESz3huquYuLBsfAr2cFceZTgEyvQgUd0DSO6BoczJIkPNrjprOi
	ys1raZbvpJQeeOCInqDz0IL9gLq2dNda8bps/Si9SI34mnXKLfQGRENNSw+Wc5k1Fibv
	KRGw==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr8902566yhh.78.1393433122319;
	Wed, 26 Feb 2014 08:45:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Wed, 26 Feb 2014 08:45:22 -0800 (PST)
In-Reply-To: <E5201FDD-3B16-4A7B-8F2D-8884F17DB199@gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
	<CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
	<CAFYUCi7N-M1DVsnnxqcmMy8YJFsocDeYOn5Y3qBt8Ku1GB4_NA@mail.gmail.com>
	<CAP9ODKp0UPWJypF9F6f+bL+xL8eaHYHb9H=RYG_sKV8DMyS=SA@mail.gmail.com>
	<E5201FDD-3B16-4A7B-8F2D-8884F17DB199@gmail.com>
Date: Wed, 26 Feb 2014 13:45:22 -0300
X-Google-Sender-Auth: e7aAvbwSHboZevtJyC2rgzx0jhQ
Message-ID: <CAP9ODKqdY6Xes75HfjD7ukKDo8Z8nGrb0D39rNJoJHkK14LPqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Wed, 26 Feb 2014 16:45:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 1:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 26, 2014, at 4:40 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> Hello Khem,
>>
>> On Wed, Feb 26, 2014 at 9:18 AM, Giulian Vivan <giulian@ossystems.com.br> wrote:
>>> We tested it and when qtcreator tries to connect to the device with
>>> dropbear, it gets "server rejected password". A connection done through a
>>> terminal is accepted normally.
>
> do you have empty password ?

I will let Giulian answer this one.

>> Any specific reason to prefer Dropbear?
>
> it smaller than openssh many embedded platforms have it in their images
> you will have conflicts if you now try to shove hard dep on openssh

Even if we are abow to make it compatible, how would we 'choose' between both?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

