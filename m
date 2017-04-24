Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 17A5477AA8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:15:46 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id h123so41076798qke.0
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4JifzCGxE+8Q6ZohpPNp3pWmu6O1liY1eSxcE7tqXng=;
	b=aK1RUQJftg/3i8zOpSiKWfexqZe6eiYQVALWBBAMcmSgdHbG1aJTQWqn4NjfGY8yIJ
	o839vIIaTiII2rZvdbxUyjoFoDJtvITzvq6jwJBIfPbu5LPunLzgtSvgDF8GXuNLSdcv
	b1E1arzZwIwD3p9q66zne+ODz1UlX3eNy1KZd07lL93rcdOTJfSjFS8LDzR0ZTLCcZDt
	iVwhIKkal5bbmG4mt4V65hT4fIsoJYmo3mjFk4O4G5SydY8lJGJ+2Er+5k13pg4J2syV
	CIVuu0PZ8bLPodZJASqN1cY/AlAIlSIMlmoejiuEcVvpsTXZYHroL0lzjkAjDHPiwaHN
	gqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4JifzCGxE+8Q6ZohpPNp3pWmu6O1liY1eSxcE7tqXng=;
	b=OwT7oWbByp1idAA0BIoK6RHbO4PTthZofF6Fv2m1uLPUdIj6n5mP1olHH9us7fbLCg
	sEoLaWgwz6MGKgdR6EP7qKSyijhsYmXPybYLCHIRT+WDr72CWhwptKVLYduxdRprCPwd
	UToG3oz+L4Nu1LRdjUp0H5kvwO7t7g9iZZsehNzNq5IsgdgqNNTS/kK6gSgwXAoxQWP2
	n5V38SIiE3t2r7INHkLU8OeSukqSJwt+TDx5ZhXFngkO9PBlaueAFQqUZT+oKjY3UGhn
	KFwl5Tq8GJ409wvAVXpxWafgHjLrR8WD6MJGyiEM8UIVHLghP7UuYYElEmnyf2fwkGDM
	9Xyw==
X-Gm-Message-State: AN3rC/6HBofwgjE9waxQZO4/Cr7WRs8STZYppkWnxTZ1KYLXgEFgVlZH
	2sBcmMPuqkhnJ3JQGK5g/WzWHlpBT6Zp
X-Received: by 10.55.115.65 with SMTP id o62mr26095676qkc.26.1493061348027;
	Mon, 24 Apr 2017 12:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 12:15:27 -0700 (PDT)
In-Reply-To: <CAMKF1spRYm9yYhOVzOcA+5BPjATW_gLZfKmBCkZgj0MKZX=YmA@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
	<CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
	<CAMKF1spRYm9yYhOVzOcA+5BPjATW_gLZfKmBCkZgj0MKZX=YmA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 20:15:27 +0100
Message-ID: <CAJTo0LbEu_PZ0WRTMK__8gjF-JVULoAA_qfLQXLCwSJpMksbPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 19:15:47 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:

> thanks, yes I haven't been testing SDK yet, whats the gcc version on
> your build host ?
>

It's failing across the autobuilder so I'd suggest it's not specific to a
gcc version.

It also breaks on my personal machine, which is Debian Jessie(ish) with gcc
4.9.2

Ross

