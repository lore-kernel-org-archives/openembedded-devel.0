Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id EF5B773216
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:39:51 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id t7so64554800qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=XcCuz+Vx/qt/BGD05rEeclgPmnekUL/mtpyG/3m4wdA=;
	b=QNLbasWUrjSOxXJcCl+mbfx1yoCaHl0OIWRlSIE8msXXuiXGwwIUEzM8bZeIBEvL1b
	bGCBQXyjEZHmh8mMlZAouPWjAd/D7a2riWyuxxZsz8QFqi9PSfHmIOcGu1XfQ1HPM5qb
	lkWSxszrBO+GZsnjNX0PlLsfFUho3hhHGvgKMI0VsrzT7w/GOZlJi1vBqx+StD7Q3Ov3
	yxoxpgSlkEwa4eruyLOqK1v6dicBh+YTg7Y3TGcjGJ1CUxIM4v18R1UjFt9m6jt0Lx6F
	VBw7OIv//Ok5R/B/KnZpIGgAMq16YmlV4f70Rg/rIQ8s51zFL8HT2cAdnk/6TfdfjWOX
	ydvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XcCuz+Vx/qt/BGD05rEeclgPmnekUL/mtpyG/3m4wdA=;
	b=HRsoUhMXQ4aLBdDU5kHnpWd5tLQ3vtIlrrTs3uNNRfkfNgJPogxrIOKf/YNS4FnT7M
	3VmxX4S8hIHeBOOY2WY75Ho2nuO9L8aKM1isT6Uijn4kT9BLocRqM6m62Nf7O/EA2QMC
	gKu6GyWRa5bSPaW12JlI+rgnFL5HWdBwd2D7mn08qEiXnUgnmAyTBOXBrPGsDL9n6+vC
	G1ycdjY3/3T5UedLZf62ZeNGz2S+w3ydm1kwpMSuGMf6KM4QPZXqpH7XCMpiOEKDvdps
	v07uvCwj8OciAjisEd9G1nQl796v1uk/29/djMoxd4+rF6i6NbcwihpHfxHXx4O93UyC
	Q90Q==
X-Gm-Message-State: AE9vXwMxtw+xnwOwLc16LHKFSaxAAC8wk60KXRMD9y3rKec9iYiOhAt3IfkM4BQdOWsNYvQB0KaKhkp0V7Mvdw==
X-Received: by 10.194.101.40 with SMTP id fd8mr1445322wjb.215.1473961190912;
	Thu, 15 Sep 2016 10:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.137.202 with HTTP; Thu, 15 Sep 2016 10:39:50 -0700 (PDT)
In-Reply-To: <CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
	<CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2016 19:39:50 +0200
Message-ID: <CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 17:39:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

and
http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/10666=
1.html

On Thu, Sep 15, 2016 at 7:38 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Does your log.do_package show that it was actually linked with libpam?
>
> more details in:
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-March/106583.html
>
> On Thu, Sep 15, 2016 at 6:57 PM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
>
>> On Thu, Sep 15, 2016 at 10:03 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > WARN: samba: samba rdepends on libpam, but it isn't a build dependency=
?
>> >
>> > is reported in every report (where samba was successfully built)
>> > http://www.openembedded.org/wiki/Bitbake_World_Status for more than a
>> year
>> > - pam isn't in typical 'crowded' sysroot unless you have pam in
>> > DISTRO_FEATURES and it might be always detected when you have pam in
>> > DISTRO_FEATURES.
>> >
>> Just checked: libpam was in my sysroot and I received no warnings.
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

