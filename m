Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D424471DA1
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:04:47 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id h123so18802971qke.0
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=23X4LwhXHaiv5x1KYaf8bGtKH7UD7A1MfEZYIqN/lvg=;
	b=VyIvsrIpTncmKc9M5b7ZSRQ+7B/tLWap3zv2oHJ4NeuGaPwIXpDRwOddC1HlNpd3+d
	8/rMV6jJzQvXt0S2NpDo5i6Qv+QR3kzLiUKp7Js7X9jCEaHQ4Akb6omgvKzMx3Iw5wWX
	FdnKuSEi720SN4HZSn8n/qmJWEt3bOHWEQhMsZXrPf0fNwPdRBKiRUwDzdVAYyOb+XJq
	Gxkmow/fr5/LqPFUt8Qdb6XQe0rKQOfIqDQlGa3Az35sVo6xRRknethW59P1iUBqBdkq
	FqJKA7CM38tcmw6aeFSGt29DuV9iVeydlErj59EuF64ArcXMj2uZPS35CJjkZ8DU/WZ3
	O9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=23X4LwhXHaiv5x1KYaf8bGtKH7UD7A1MfEZYIqN/lvg=;
	b=SiKq/O8B1TRwZqG5d+/u5si1FG+lTqGE6MnSpvKX3HjaTp0SNe7a9LvfjL4vShW+CI
	EJ0ckYpy657DZAIxcpLFlPVJoI6vjG/hNDRONNiXwgH0fn96C4vAs0M/1jqoRlpcgBlB
	mAPG9mMa/i2muj+P+Hwv1DODXFiz0OiYVvGkT/++dp/oV5kTj+Jro3/YhsjQ5jHwMJnm
	PCpHwHDVMiq503lU5OzyX2Rz5PJHEE2N8VcUGWgYV6hnoyR5Co9V4W/yDyl2F1VufjoN
	lho++lcYficbTPYv/BvS4GBo2lzrDzT9keQ+4t65VjDpL6dTVZasX2ucVewapTPSq6YI
	Rl9g==
X-Gm-Message-State: AN3rC/51RwHTUsU7mCCy4NE6vJGmIPeFMBG7H+HITXqrFC0ap3zVF4ZF
	8qwXbDraS+ylacXTMk6xUatORrizegQt
X-Received: by 10.55.115.65 with SMTP id o62mr22087191qkc.26.1492985088526;
	Sun, 23 Apr 2017 15:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sun, 23 Apr 2017 15:04:28 -0700 (PDT)
In-Reply-To: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 23 Apr 2017 23:04:28 +0100
Message-ID: <CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
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
X-List-Received-Date: Sun, 23 Apr 2017 22:04:48 -0000
Content-Type: text/plain; charset=UTF-8

On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:

> I have put together recipes for upcoming gcc-7 major release as well
> as glibc 2.26 release, which we would target for next release ( 2.4 )
>

I threw these at the autobuilder and the errors are starting to appear:

http://errors.yoctoproject.org/Errors/Latest/?filter=
eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit

Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
have your grub fix already).

Ross

