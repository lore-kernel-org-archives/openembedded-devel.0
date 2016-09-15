Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 23EEB731AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:23:22 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id t67so70223328ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=pf4XLNVrwLrTcUHJLWYlpdkcnnG2KDI+rHmjm/cxr6o=;
	b=H3rD7n1yLWLEJvkznc1oIC9cELq9dTnaNgDZftfEfnLJhRbiYFHEvbqFrTyiVNoUyY
	2NuYkGglY+Ezljm32Boye0aoBE/9HRpMvuWdjfg7FFcuFvMsec45kgtKPqm5AWDTtJzp
	jNmaCn8+YKm1Jzo89Uysx5uVBYDvMJjHzblliKralKeKRDbzeK8ocEW6E9DVA9um+BXm
	CQBNo9JFptzREuVMWziEYyCWofHh7LeWe4n0n4BZM1P4Me1hmQV2XDnGQwz78bVKi2yS
	yUl3K+XSEqzJJPBRYkSDi0oJlwZY8M5BiqYUj1N79Ztarr8XhiA/LVVnfDqBV2y1ZQdD
	V40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=pf4XLNVrwLrTcUHJLWYlpdkcnnG2KDI+rHmjm/cxr6o=;
	b=PZzPgaEXbfBciDB26/JIeK9sUN1De+2SEDAl6HoRz//FPMt5CrlFyPv5hpzu0RtPuW
	IpQtYAO5cQJkIqCHqRY7M4Pcu/qRTJHxISxNUmnz3kPW7JUwPaGjgv89jMqoA2NxFCKK
	jaO6pzQbl39Uga97Q911hXS2txqjfc2dVDuGkt5Dk6Tih1ptZ7Gw7v7gcliIusjj6406
	YS1hb6JFZTkJYbfbBoayGvtfaAw8HU2xPMU1D9T/T92OOxYBNJwET3MIZ3ChNzA81f4F
	n4z/Ts77PckQeBbr9W3mWwnnJchLPmdkFvyobYXFsPJ+oCADX8fbs98eDEe5XK7zJwDJ
	zEpQ==
X-Gm-Message-State: AE9vXwPETOPO31+I2bRpw0gKwg6Xt7h94NBAmGPnb66KASiYDjNX2yHskZX+m5Hk/WFSjwoOeqcW59+uODuZlg==
X-Received: by 10.129.105.139 with SMTP id e133mr2608462ywc.327.1473971003186; 
	Thu, 15 Sep 2016 13:23:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 15 Sep 2016 13:23:22 -0700 (PDT)
In-Reply-To: <20160915193118.GE2641@jama>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
	<CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
	<CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
	<CALbNGRQV1ttB8zyX+MPp4eLOKE4nezA9cQ4Js5rPjfVgRQ4nGA@mail.gmail.com>
	<20160915193118.GE2641@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 22:23:22 +0200
Message-ID: <CALbNGRQTv3L7hx0r1CE1fTn=Jb9n1aWWQor6v+85HSrm9nDsBg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 15 Sep 2016 20:23:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Sep 15, 2016 at 09:25:08PM +0200, Andreas M=C3=BCller wrote:
>> On Thu, Sep 15, 2016 at 7:39 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > and
>> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/=
106661.html
>> >
>> > On Thu, Sep 15, 2016 at 7:38 PM, Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> >> Does your log.do_package show that it was actually linked with libpam=
?
>> >>
>> I think I got it now: Problem does not occur to me as I have pam in
>> DISTRO_FEATURE -> pam in PACKAGECONFIG -> libpam in DEPENDS. To get
>> 'your' problem, I have to remove pam from PACKAGECONFIG explicitly.
>
> Right, that's what I meant by "and it might be always detected when you h=
ave pam in DISTRO_FEATURES."
>
> Sorry that I wasn't clear.
>
>> Will report...
>
> Thanks
>
OK in same environment I did remove samba from PACKAGECONFIG, did
cleansstate / build -> no warnings.

Just to be sure I checked do_package and samba still links against
libpam. Where is my warning???

Have no secret appends for samba (checked with bitbake-layers
show-appends). Strange

Apart from this mystery: I found [1] and will play around with it.

[1] https://lists.samba.org/archive/samba-technical/2011-May/077532.html

Andreas

