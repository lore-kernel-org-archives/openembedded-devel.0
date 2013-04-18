Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USnDZ-0003jB-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 13:41:35 +0200
Received: by mail-vc0-f172.google.com with SMTP id gd11so2332939vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=Gikhd8OBQvoiawupiDPTVd3GD4ly0a/DseiRDfKqO9I=;
	b=vAWWwEegC6v8mWP0adLiCJfHvlsC0CetgvvwLePVg58EDbYXUTBdS/+WjwTKgJyRZD
	q+uc4mvssqgkZDcc66H3FeY1zSoOMYnZ46ZyYFsPZSIYPrFgYXXe/nm9SB4KxzJEU4sW
	D8e0kmsEpjC1tGe64Z576Ao68eR4AjxzD0lunX46JxWr5IURhNm3FoabrW0+jotpUKd7
	gmThQea6tM1zw3TfkVp59o2dxq5PxuZhEqgWwfmwGPqoYhOkrhKNRn3sJqszS5Jv69DJ
	rTbTvJc3LWd5+w/mK4zMYpiykhLuGNMdl20ZN8qLDAKw3FKQ9kuafA6ZToAqAfoOEZ+R
	yQyA==
MIME-Version: 1.0
X-Received: by 10.220.65.1 with SMTP id g1mr7873218vci.63.1366284240308; Thu,
	18 Apr 2013 04:24:00 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 18 Apr 2013 04:24:00 -0700 (PDT)
In-Reply-To: <20130418110026.GO26007@jama>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
	<CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
	<20130418082201.GL26007@jama>
	<CALbNGRTfQh7iBf=8XceW1mJ2mCttp4ccB77p9o9LtMkS0kMYUQ@mail.gmail.com>
	<20130418110026.GO26007@jama>
Date: Thu, 18 Apr 2013 13:24:00 +0200
Message-ID: <CALbNGRSzmogd602cGauf1hE_c=SMQSaEo-R1hJQyn524dLkCaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 11:41:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 1:00 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Apr 18, 2013 at 11:53:45AM +0200, Andreas M=C3=BCller wrote:
>> On Thu, Apr 18, 2013 at 10:22 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Thu, Apr 18, 2013 at 08:58:24AM +0200, Andreas M=C3=BCller wrote:
>> >> On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere.ne=
t> wrote:
>> >> > -----BEGIN PGP SIGNED MESSAGE-----
>> >> > Hash: SHA1
>> >> >
>> >> > Op 17-04-13 15:49, Andreas M=C3=BCller schreef:
>> >> >> removing tests drops dependencies on gtk
>> >> >>
>> >> >> Tested by:
>> >> >>
>> >> >> * building nautilus3 (the only recipe found depending on libnotify=
3) *
>> >> >> running xfce-based image and checked notififations
>> >> >
>> >> > The problem with libnotify was (is?) that it removed some API that =
GNOME 2.x
>> >> > depends on and later introduced API that GNOME 3.x depends on, henc=
e the 2
>> >> > recipes. Do all the GNOME 2.x bits build against this new libnotify=
? The
>> >> > error was a build break, so it things build, they are likely to wor=
k :)
>> >> >
>> >> > regards,
>> >> >
>> >> > Koen
>> >> >
>> >> Martin's world shall let us know
>> >
>> > My slaves are looking forward to serve..
>> >
>> > It's in queue, but still jenkins is 40+ hours behind, so I'll let you =
know later..
>> >
>> I started and additional test. At least zenity fails for API change
>> but seems not a big deal to fix. Will send follow up patches.
>
> I guess that to test this properly I should cleansstate both libnotify
> or do build from scratch, because I cannot know which one won
> into-the-sysroot race during last build.
>
> --
1. I think yes
2. I found build faults for gnome-power-manager zenity
gnome-settings-daemon - hope to fix these until tomorrow.

Andreas


