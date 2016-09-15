Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3362373189
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 19:25:08 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id i66so40910249yba.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0911NG40/PTVp+kWM9BLWPnHdnZa54uKoHW18qzt518=;
	b=Spk3/HF0HsqBcx7oOkI4/JVn8x/hn5klBQ0NyliSt91lyErjiyCyHZ5hpjVH76Qr/P
	CcZd7GlD0FXEeu6ADRbEEM0peeqZwGI36jEs+II4xrzhIsC6Tp8QoJ5wsmGbbH4SVLuK
	u/ereOm2NpO7KauWaoWNI8pYgYKOFhgEGWWN5R87u4EoIZV9OVuBbyDrLsMDjdAREXQ0
	T8RJ2w4I5LEtTDiWT7hRCvt/MSlPfODW+gzJWK4bdtB2JMScrapHa7qHrFV9pcHScK3c
	FO3aDWDv8m931VM4yhvQ0XT0SeNUnyXvoSs0afbE5Z0dmi1PqV7c9GYWcrr9elpcXhux
	Q7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0911NG40/PTVp+kWM9BLWPnHdnZa54uKoHW18qzt518=;
	b=m3jAxwZg8ndi8sUZuJah3kkpBQOtUDL3GOp5Vk4Ym3f0Twc6p4diZT+7Voz0E1ztOG
	37XAjY87aurCHYOTwYEYR3cJQClceHJhyIZ8KJiK80spFUmSSMsMHfxOSq7MnQ4dzwYc
	rGe/aJ5G6SfeFgOPOdc9G0zQ0D3veN72p//yHp43IGh/Re0qmbHRcuCstA6HmtME2YzL
	wLZHWOCMJPAF1jcUIFOT07BHZ1EI6x262HmmrIuaalByVj1FJBD4X/6q/BtfMVU5Ptn3
	2lyV82Hzb8qWwlMP4gI/wkkRXxLdA7qEr/cSlQVgWosyxW+tlP4+FyvqnAhf7FiqyMVw
	48GA==
X-Gm-Message-State: AE9vXwNEqPI+fq5fQuuCytJekCgm2ZOWUncnffordinFXsUhKRj6jZmBDdWZNfXeHOAycKL49GF5WvbTI5TXLQ==
X-Received: by 10.37.10.202 with SMTP id 193mr7003380ybk.174.1473967508513;
	Thu, 15 Sep 2016 12:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 15 Sep 2016 12:25:08 -0700 (PDT)
In-Reply-To: <CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
	<CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
	<CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 21:25:08 +0200
Message-ID: <CALbNGRQV1ttB8zyX+MPp4eLOKE4nezA9cQ4Js5rPjfVgRQ4nGA@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Sep 2016 19:25:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 15, 2016 at 7:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> and
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106661.html
>
> On Thu, Sep 15, 2016 at 7:38 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Does your log.do_package show that it was actually linked with libpam?
>>
I think I got it now: Problem does not occur to me as I have pam in
DISTRO_FEATURE -> pam in PACKAGECONFIG -> libpam in DEPENDS. To get
'your' problem, I have to remove pam from PACKAGECONFIG explicitly.

Will report...

Andreas

