Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id D283777AF0
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:13:40 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id c45so122351510qtb.1
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y6icM+6XYgYxNBu1hn9z5l9MbZxOCAe+0o7E4Yf2XG4=;
	b=AXu7Ue3nUsjvVIRxonCIHD0D8wwnA5HeBtmi6Y6JvB4Kucv/SUrPjcf5NrY+Z/eiyN
	782ENf3YuBnhg4Rbn+md57sJRs6AsU0d1vycArUDJNHdKFVNxPJTKDJ/Pp8w91ievMHY
	0K2YbwirnfJA+1mUkNImDGBDBCZNAP3vd1mT5xwSdqR1HsiryNEPmYV5lARKL1KXKi7Y
	uSNtEERqDpV206nAB178SNzGYJwPFIQkEbJKIpxZsB7OdPajqrVILo2E26ShFtuDH99z
	9w4llQHhUilq9/joFO/gvp5yAc+iHs4iEHf2WvRW0mV9dZU3mWwr2/WiOHAoFsuzTOPm
	YQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y6icM+6XYgYxNBu1hn9z5l9MbZxOCAe+0o7E4Yf2XG4=;
	b=Ps/KrKrXJSd+yzK8f0rJIu+tLIq/wDSnDc8a1F4qPZk1jIHz9w9lqeqrClktCdPxV3
	r6rWFRLy+sQ8ko87Uv7rMREsy4xgqgxOnyFYZFkG/SCKE2JifuXelW5pC9bxLDzXMxN6
	l2ZXzkcWXyNY8lncmNHCk65BmyjYsTYgPK2MGcKW7Jj3gDX2kGQFW8tl8jXQqwtbbxRg
	4UgnrnXgMrxLmDNCBoPnxDvQFjm779QyKiUypAgameAqSMyM6BDp6P0NcRnBNroaFg2k
	LCE8GeaYq6bfS0rdzvLvCkDftl5pX+xhbvbhvl23sVfP+ykKE55lxcsXn+mqpenopLCl
	Nq/A==
X-Gm-Message-State: AN3rC/5q5Ojv425ITVwKCSvomDhIcVN12PM3lglJ7TxDUmC1qTqVkRGN
	BbNg8HRuRStZIgTbPJZBKemPvoWkcWDn
X-Received: by 10.200.3.105 with SMTP id w41mr26145901qtg.188.1493061221376;
	Mon, 24 Apr 2017 12:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 12:13:20 -0700 (PDT)
In-Reply-To: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 20:13:20 +0100
Message-ID: <CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 19:13:41 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:

> All merged, I'll fire in a moment.
>

lttng-modules fails:

In function 'lib_ring_buffer_align',
    inlined from 'lib_ring_buffer_try_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:118:3,
    inlined from 'lib_ring_buffer_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:179:6,
    inlined from 'lttng_event_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lttng-ring-buffer-metadata-client.h:317:6:
TOPDIR/tmp/work-shared/qemumips/kernel-source/include/linux/compiler.h:518:38:
error: call to '__compiletime_assert_269' declared with attribute error:
BUILD_BUG_ON failed: (size_of_type) == 0 || ((size_of_type) &
((size_of_type) - 1))
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^

Suggestions welcome :)

Ross

