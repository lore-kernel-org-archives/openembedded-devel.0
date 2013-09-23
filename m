Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 80650610F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:38:54 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so1768747eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Sh3RAjsZI0CUEKgXk0xMjLgigh9CSqITD/IuiG18vTI=;
	b=CFEBvImT9y8KWTv4lgYVz5/Tq8dFdT07z6BisyeMhxVoDMoTn9WxxIibaLBTV9Ikme
	YV5+ln5GT2s2FliAkHNjdAfv2oXDL1ga5EUIEI+IadDlXQeJFnjJfBnIc4QImNJt+gA5
	wIimtzvccNgWFie6x8aZQf1yz50ZgBx0ussTH+a6a/98CghLZHygYX8HmJkvQOGx/mJg
	6uooUV2BARnIj+bSnl+b0xrk9FfA4LbrS5ncfzSqjyeOczmPHoopzqq331cnro6JZLRN
	GKUfLSWk0uY1M8+PtJ6E7mUGNyqlyVIPxSlCGEZ3tGFwysDIgv5wKpzVAhOXEZqdXqJO
	kUWg==
X-Gm-Message-State: ALoCoQl2gRi3xVb4U0sV5XloEiecndSdcJbOzBcYLb5GR8AneT4esP7wthurvmEImTozr6YMb8ws
MIME-Version: 1.0
X-Received: by 10.14.4.1 with SMTP id 1mr37897375eei.21.1379947132229; Mon, 23
	Sep 2013 07:38:52 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Mon, 23 Sep 2013 07:38:52 -0700 (PDT)
In-Reply-To: <20130923080651.GB3631@jama>
References: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
	<20130923080651.GB3631@jama>
Date: Mon, 23 Sep 2013 10:38:52 -0400
Message-ID: <CALmOhgkonsraDVY6TUeE77XscRisOmJkQhw0i3Ymk_aA3pBFbA@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][dylan][PATCH] qtwebkit 5.0.2: fix QA issue (bad RPATH)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 14:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On 23 September 2013 04:06, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Sep 23, 2013 at 12:29:36AM -0400, Trevor Woerner wrote:
>> Building qtwebkit would cause a QA issue (which, in my distro, would cause a
>> build error) such that QtWebPluginProcess and QtWebProcess would contain bad
>> RPATHs which pointed into the build location. This fix adds a patch to not
>> include the rpath.prf which leads to this problem.
>
> Could you send patch for master/dora first and then backport it to
> dylan? Otherwise I'll do it, but it will take a bit more time.

As far as I can tell, qtwebkit on master doesn't even try to compile.
This is what I get in my log.do_compile:

DEBUG: Executing shell function do_compile
NOTE: make -j 6 MAKEFLAGS=-j 6
OE_QMAKE_COMPILER=arm-poky-linux-gnueabi-gcc  -march=armv5te -marm
-mthumb-interwork
--sysroot=/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/qemuarm
OE_QMAKE_CC=arm-poky-linux-gnueabi-gcc  -march=armv5te -marm
-mthumb-interwork
--sysroot=/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/qemuarm
OE_QMAKE_CXX=arm-poky-linux-gnueabi-g++  -march=armv5te -marm
-mthumb-interwork
--sysroot=/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/qemuarm
OE_QMAKE_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
-fpermissive -fvisibility-inlines-hidden
OE_QMAKE_LINK=arm-poky-linux-gnueabi-g++  -march=armv5te -marm
-mthumb-interwork
--sysroot=/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/qemuarm
OE_QMAKE_LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
OE_QMAKE_AR=arm-poky-linux-gnueabi-ar OE_QMAKE_STRIP=echo
OE_QMAKE_WAYLAND_SCANNER=/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/x86_64-linux/usr/bin/wayland-scanner
make: Nothing to be done for `first'.
DEBUG: Shell function do_compile finished

So I am nowhere near being able to see if there is an RPATH issue on
master. I tried this on two different hosts. Bitbake doesn't see any
errors (this compile step returns success!) so the build "succeeds"
even though I don't end up with qtwebkit.

