Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3D561489
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 19:47:20 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id q16so714455vbe.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=U6wAP5GU6a2PyM0O+b14FfNh4VK5k3nTWLDWy1js0t0=;
	b=NE0J3M/UAubjrg+bsVfg1VIknvXQiu2KSiiCIeq9KqW3wSK8MXNRX89z+AKDUU9OSy
	MwBKDz2+7SU8wQwRCzQb5CEvsIA1gIjmIJJCmfiHnEeLBBqAuj885XmFiWPsDRh19BQj
	FXyr6lBCG93hm+mOOTV7x4xhY0tpmCW5CTqXpDmjhRacJ6Mys1It+Xdu/K0aglv7NiIO
	eJIbsMSRQGjaXzjrXkrrxINxwzCLFw+EPMlq829Xs56k0L8oM5WpIyc9F/5FXfcX6mv3
	yDWs7IERaoYAVT1OcrNSm1DqCJZEIGgG7IsaDX88eIC94Le2Lgw7uqujMQWgJQBW4g8B
	qvYA==
MIME-Version: 1.0
X-Received: by 10.58.171.167 with SMTP id av7mr1451762vec.15.1369165641187;
	Tue, 21 May 2013 12:47:21 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Tue, 21 May 2013 12:47:21 -0700 (PDT)
In-Reply-To: <20130521193204.GD32431@jama>
References: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
	<CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
	<20130521193204.GD32431@jama>
Date: Tue, 21 May 2013 21:47:21 +0200
Message-ID: <CALbNGRTwzk+d+C2y_-PSKD4kWpkG_DEgDfCTGusSeCm6Wjz3qw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: world build on angstrom-next
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
X-List-Received-Date: Tue, 21 May 2013 19:47:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 9:32 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, May 21, 2013 at 09:20:26PM +0200, Andreas M=C3=BCller wrote:
>> On Tue, May 21, 2013 at 8:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Hi All
>> >
>> > I have run world build on angstrom and here are results if anyone is i=
nterested and provide fixes.
>> >
>> > http://sakrah.dontexist.org/files/eglibc.beaglebone.world.log
>> >
>> > There are a lot of parsing errors especially from meta-opie
>> >
>> > Thanks
>> > -Khem
>> >
>> Few errors should be fixed by my last series not yet applied (gtkhtml2
>> / evince - this is not a ping :)
>
> I plan to push it today anyway, I was just waiting for khem's reply
> about .inc merge :).
>
>> For chromium I have fixed some (not yet all) errors which came up with
>> gcc 4.8 update. Looking into webkit-efl error messages I think there
>> are similar issues (webkit). Hope to find the time to fix both next
>> week.
>
> current webkit-efl revision was failing near the end while linking, but
> I wanted to upgrade it anyways (I was using old revision mostly because
> we didn't have harfbuzz when I was upgrading it for last time), but
> it's hard to find newer working revision and what's even worse is that
> only test app for webkit-efl (I know of) is eve which is quite abandoned
> in upstream and every webkit-efl upgrade in the past required couple of
> fixes in eve to support new APIs :/.
>
> Interestingly last revision I was building today r141868 fails in
> different places for armv4t, armv5te+armv7a and qemux86-64 :).
>
I was also wondering of the passed chromium in the last logs you sent.
Was this build performed with gcc 4.8 - or was there an update fixing
builds with gcc 4.8 which I have missed?

Andreas

