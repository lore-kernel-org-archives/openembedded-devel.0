Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id F27B26C648
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 18:35:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o10so22906214edt.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 10:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5XDwE3YU6XQ/Lu/LyRbcEV062Free1GHnML18rtA7KY=;
	b=S+SmtBB6PlkO+m7qESNaDAPNcSQjoiuqgARbSR7Y0BIYNd7DaCWeJj0m2PTahKabse
	2FHlXrhnJy+CeDwjfhFI1MwgO1ujIw+z31S0P+zL4SOyN77x1cFrYCVguVtcf2vD0gJq
	8fItG8fzWd+2FgSJNDjQCcdse9Q/+gIpkWnkCF2hUEWTQyIVfWn3Y3oWViCzgEah+eU2
	txzl1Vs6KQHHtUuEvDbWrUNeCyX/6Po7jZflIKPt5tJUxqQPEp2VOuCBR/uOwMOtqTb5
	YahxjhMiR9IWmgnhFAid1M7oo8K/q1s3LwF1bGZ7runCoYVJVjmLza7NITCR9mSDDGaP
	xl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5XDwE3YU6XQ/Lu/LyRbcEV062Free1GHnML18rtA7KY=;
	b=TYUcJAMwipRqxBtNd8pUrvlhDZ9c6uMUqPR+dZxG/nGZbf8xbHEwC8NIm6w6TFEEES
	p3Otcqcgd49H7Fi+uhAF9j2pxpuZhnscCO0Q0qVseoa7zcFmB1uIzL5PQl7fbGNAZjD5
	3Yfx4DMOU3LJUHmPhT6IzTfg27bLh/8wQZavymX8YYB9T2YXKaWQp1ajEkwIYxQR+kwc
	DYVDztJgF34x+L9e5u2nPAn3k27cuYaqW++I1+aDBIeN/n+hizde4nRLPQ0JumzsLa09
	g3rcmcG4OF9+EOYAWwTV91Acpl+fti2waqE6pqDtoa9NHApJ1Jn9roBXbAV6uUnrQvEM
	tTdw==
X-Gm-Message-State: AGRZ1gInfJaWx07McymuM5geC49dfOJXvkBW1TtGZEE48x+3dtnrzRE9
	4iSCwzNoXA/Z2OSCOIsgCJYLWoyzAwvhe6fkVVFIPgsJiqk=
X-Google-Smtp-Source: AJdET5ccfuFCrlRhcOmlHuXDpG0TaC1gJwPpG/KmHm54KAllgnxCbLuZqKac7MTWrnRZM1FLr+K8olWiwOoOVhP5bAQ=
X-Received: by 2002:a17:906:2dc1:: with SMTP id
	h1-v6mr27413820eji.67.1543430140273; 
	Wed, 28 Nov 2018 10:35:40 -0800 (PST)
MIME-Version: 1.0
References: <CAAsqSTdTCM+ivCvfAahNqY35x7QDhC--j=+dR=-xSU+CwkW8=A@mail.gmail.com>
In-Reply-To: <CAAsqSTdTCM+ivCvfAahNqY35x7QDhC--j=+dR=-xSU+CwkW8=A@mail.gmail.com>
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Wed, 28 Nov 2018 18:35:30 +0000
Message-ID: <CAAsqSTeyCozrxNMrCh4SKLZnTwNz74wSQP=W_Lhcni87r7jWwA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenJDK 8 Segfault on i.MX6
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
X-List-Received-Date: Wed, 28 Nov 2018 18:35:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi again,

As a follow-up (under Aleksey's guidance) I applied the following patches:

- JDK-8202600 [1][2] had no effect, but I'll be keeping it applied.
- JDK-8194739 [3][4] and things have sprung into life.

I'll prepare a patch and submit tomorrow.

Attie

[1]: https://bugs.openjdk.java.net/browse/JDK-8202600
[2]: http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916
[3]: https://bugs.openjdk.java.net/browse/JDK-8194739
[4]: http://hg.openjdk.java.net/jdk/jdk10/rev/69d1a1590485
On Wed, 28 Nov 2018 at 17:30, Attie Grande
<attie.grande@argentum-systems.co.uk> wrote:
>
> Hi all,
>
> I've been trying to get OpenJDK 8 162-b12 running on Linux on an ARM
> platform (i.MX6), using the Yocto Sumo recipes from meta-java [1].
>
> Unfortunately, the result is a java executable that cannot startup
> without hitting a SIGSEGV. Even running "simple" things like `java` or
> `java -help` result in a segmentation fault.
>
> I've tried to investigate it, but I don't have the insight into the
> project to really be able to debug the issue properly myself.
>
> I've been in contact with jdk-dev [2], who have been helpful so far,
> but we're starting to wonder about the patches applied as part of the
> Yocto build.
>
> After enabling fastdebug, I still get a segfault with little insight
> into the issue - a fatal error log is available here [3].
>
> Investigating with GDB shows that the segfault is in libjvm.so, but
> there are no symbols in this region of memory, and the stack has been
> destroyed (I suspect as part of the VM's operation).
>
> We've confirmed that another build of OpenJDK 8 runs on this platform
> [4] (currently jdk8u191-b12).
>
> I've spent some time trying to update to 191-b12, but a number of the
> patches appear to be necessary for Yocto's build environment, while
> others require major rework to apply cleanly.
>
> I see that Thud is using 172b11 [5] which is somewhere in between...
> so I could give those recipes a try - though there is a Sumo / Thud
> dependency issue with xorg-proto.
>
> Has anyone seen this before, or have any insight into the patches / Yocto build?
>
> Aleksey (from jdk-dev) mentioned [6] a user on IRC called hitendra had
> a similar sounding issue with Yocto Sumo / i.MX6 / OpenJDK 8 162-b12,
> and I've also come across a brief / frutiless IRC log in #yocto [7].
>
> Regards,
> Attie
>
> [1]: https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk?h=sumo
> [2]: http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002246.html
> [3]: https://pastebin.com/raw/iXTz8v9z
> [4]: https://builds.shipilev.net/openjdk-jdk8-redhat/openjdk-jdk8-redhat-latest-linux-arm32-hflt-zero-fastdebug.tar.xz
> [5]: https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk?h=master-next
> [6]: http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002251.html
> [7]: https://www.yoctoproject.org/irc/%23yocto.2018-10-23.log.html#t2018-10-23T09:46:21

