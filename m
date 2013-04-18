Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USloE-0003E0-EE
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 12:11:19 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so2124444vbg.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=tvp9uIDtZltjclRxjKMo7whE1iSldfODG++B0yeKKjs=;
	b=SQ1xGqBTUvS0wOPp3gNw93sF41T/Hz38KXNZQ9esn5Ba57E3GD0FZSFecyceYczVSG
	O1Itoe2OBqM0hOAntIWQpZzN9/2MF8EKQ+YmdltuQLXu1B0WjYj71EiGl34c5vig1+G/
	8+IFHIO0U17qMZSsxmVUeJNpEy3FcZ1dyqe74+nideMW2+afqxd5L2cnRwaBH4+FkpTD
	54MDxsHQ2fW9ZW9GrWfVvUk6yBDNZFRdUF6B3bXGMbw37gfeAsMegU2cIuuxrs1Kjruh
	MsqOIzVTOsQ6dS+MnM+PjHuVLk/qaHqjASmfE/vlJUUOY2nX4LZEhJvyUqhK41T5ukAJ
	PN4g==
MIME-Version: 1.0
X-Received: by 10.58.232.98 with SMTP id tn2mr7473271vec.57.1366278825219;
	Thu, 18 Apr 2013 02:53:45 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 18 Apr 2013 02:53:45 -0700 (PDT)
In-Reply-To: <20130418082201.GL26007@jama>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
	<CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
	<20130418082201.GL26007@jama>
Date: Thu, 18 Apr 2013 11:53:45 +0200
Message-ID: <CALbNGRTfQh7iBf=8XceW1mJ2mCttp4ccB77p9o9LtMkS0kMYUQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Apr 2013 10:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 10:22 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Apr 18, 2013 at 08:58:24AM +0200, Andreas M=C3=BCller wrote:
>> On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > Op 17-04-13 15:49, Andreas M=C3=BCller schreef:
>> >> removing tests drops dependencies on gtk
>> >>
>> >> Tested by:
>> >>
>> >> * building nautilus3 (the only recipe found depending on libnotify3) =
*
>> >> running xfce-based image and checked notififations
>> >
>> > The problem with libnotify was (is?) that it removed some API that GNO=
ME 2.x
>> > depends on and later introduced API that GNOME 3.x depends on, hence t=
he 2
>> > recipes. Do all the GNOME 2.x bits build against this new libnotify? T=
he
>> > error was a build break, so it things build, they are likely to work :=
)
>> >
>> > regards,
>> >
>> > Koen
>> >
>> Martin's world shall let us know
>
> My slaves are looking forward to serve..
>
> It's in queue, but still jenkins is 40+ hours behind, so I'll let you kno=
w later..
>
I started and additional test. At least zenity fails for API change
but seems not a big deal to fix. Will send follow up patches.

Andreas


