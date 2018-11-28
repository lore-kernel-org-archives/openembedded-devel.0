Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF086B5AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:30:17 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o10so22736342edt.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 09:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Kuu3LXQgQu3pTrByX3N2zPJIF6YPj8j+kKK67Mmv6C8=;
	b=aLNIuD1JyLs1pgTOR67+pRa0QEmDfShwdYfkJm+WwspwWfLs7cj+5zIEuaPCt+0CPA
	f2RQyoqysIjg/SqSBB83THGxjp2W3kFMr/IuFjsvx2jD8hXjFBdZ+15yvbVzBBt1KFI0
	kR2HrwRyz/HepsfTRzs9E0AR0lmoxOTn2Z4t9V61qSRsa+krrh1Y52XyIHPrLU9EZCIH
	xVbSmjeOdivluXZuKNHNGXNNUVUc6THUUF868YG31hOlKM7gK5WpOQ2YgPfd685QkZyt
	ZcphmsiAHfuW4L+HBjCzMwV4L4vH0Zq9VcqfXAyFdUZs8p8Mmo8XsnM8A63U5BW6K1el
	yQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Kuu3LXQgQu3pTrByX3N2zPJIF6YPj8j+kKK67Mmv6C8=;
	b=oM418arLqnYUBJuTWZeR52jA71TvSyi2SzGXJ7R6QKUYIS9iJczrq0qGctFZ6hTadC
	oPrENgDL+3OXBH2eaMt6ip9IjAwCIuCkhylDlSJ3IaGd+v74TsOMzkNp/T21YB0t0Z9A
	6kNiyiXKmqULSrmAKEEFU70ka6zbLV1cr+NJC6o+MqK7VjAXw2xSUfIH900fz5PNx0NT
	EzoPzYd1R7e/pHAh2yuKYgGxI1k4ioAc2BKsBlUu7rgAawuwa09Dm1S5a7KmJRZS5oJW
	vB6jkXFigRF969zy3+GyI2sfu9LXTvU48YM6oHuxt2AI13wRMRDX51gARR78Bsae0pjT
	9xGA==
X-Gm-Message-State: AGRZ1gLdNyBT+TclaxNqAMT2gJvH5dCJSsw6EXAGtSxmiJgw9EvuOSXH
	mJadLKL+sa0GmiN/SojOoYEHjrYm8CFnO2MV/kwA755PT4M=
X-Google-Smtp-Source: AJdET5ffebrTej/00XtDYb7Y8olxvMvCgUhoi6++jvYvSpu8A/1JnJyPJRDBF/+jpwudJiCsL04CSTBvYZrviyRsAAE=
X-Received: by 2002:a17:906:7b97:: with SMTP id
	s23-v6mr27560529ejo.57.1543426217771; 
	Wed, 28 Nov 2018 09:30:17 -0800 (PST)
MIME-Version: 1.0
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Wed, 28 Nov 2018 17:30:08 +0000
Message-ID: <CAAsqSTdTCM+ivCvfAahNqY35x7QDhC--j=+dR=-xSU+CwkW8=A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OpenJDK 8 Segfault on i.MX6
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
X-List-Received-Date: Wed, 28 Nov 2018 17:30:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been trying to get OpenJDK 8 162-b12 running on Linux on an ARM
platform (i.MX6), using the Yocto Sumo recipes from meta-java [1].

Unfortunately, the result is a java executable that cannot startup
without hitting a SIGSEGV. Even running "simple" things like `java` or
`java -help` result in a segmentation fault.

I've tried to investigate it, but I don't have the insight into the
project to really be able to debug the issue properly myself.

I've been in contact with jdk-dev [2], who have been helpful so far,
but we're starting to wonder about the patches applied as part of the
Yocto build.

After enabling fastdebug, I still get a segfault with little insight
into the issue - a fatal error log is available here [3].

Investigating with GDB shows that the segfault is in libjvm.so, but
there are no symbols in this region of memory, and the stack has been
destroyed (I suspect as part of the VM's operation).

We've confirmed that another build of OpenJDK 8 runs on this platform
[4] (currently jdk8u191-b12).

I've spent some time trying to update to 191-b12, but a number of the
patches appear to be necessary for Yocto's build environment, while
others require major rework to apply cleanly.

I see that Thud is using 172b11 [5] which is somewhere in between...
so I could give those recipes a try - though there is a Sumo / Thud
dependency issue with xorg-proto.

Has anyone seen this before, or have any insight into the patches / Yocto build?

Aleksey (from jdk-dev) mentioned [6] a user on IRC called hitendra had
a similar sounding issue with Yocto Sumo / i.MX6 / OpenJDK 8 162-b12,
and I've also come across a brief / frutiless IRC log in #yocto [7].

Regards,
Attie

[1]: https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk?h=sumo
[2]: http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002246.html
[3]: https://pastebin.com/raw/iXTz8v9z
[4]: https://builds.shipilev.net/openjdk-jdk8-redhat/openjdk-jdk8-redhat-latest-linux-arm32-hflt-zero-fastdebug.tar.xz
[5]: https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk?h=master-next
[6]: http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002251.html
[7]: https://www.yoctoproject.org/irc/%23yocto.2018-10-23.log.html#t2018-10-23T09:46:21

