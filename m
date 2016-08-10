Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C16D574197;
	Wed, 10 Aug 2016 15:25:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so10244253wme.0;
	Wed, 10 Aug 2016 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6F80sa9l46olzkGuusT+Qd0ozR9JV5NhG2URXZhbVlY=;
	b=sQLWgMJ2BMLkf0UVashTWKd5mQI03o7I8DPJ3RBAOO06npdflbv2pQx9EHSlRv2gYs
	zdVyZQxHb3RTYQLCVvRYFpeWuIjTmxFeue8+rGuPwl1LOFvd+R8depYNc/c3qkZz+QNq
	+PbhDHAV6nwVbXHhQH9Fl7vl6W6wcPn8oYVEzFiXwHpBRL40hOhzqQvCCzC0yYyZC19z
	heO2jKf38HBStGBfc1Ffw+xqXT19O3H0v1dCbXBn/vtN0uBT7diqrWlQ8/zfu9eo4bUx
	ngvAn7QRJLY+n1IXhfzHa/uAuMVfHoTzEjPqofdBrFvgLMrg09EhhaWLM9sx1oHC2Hzu
	1QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6F80sa9l46olzkGuusT+Qd0ozR9JV5NhG2URXZhbVlY=;
	b=AC0+LX5V3moTKi0XnOSBwigSp2rWB399wv5V7uF6E9ug5R5oCTXUCsWRnWbFO6c9+N
	RF8sLp9HTPDTdwkxniTz60KUSS1SYJpy8EQi0Xu3jTUgzpqVsost352ZN+xc865AKfWD
	PIvN0p0FAvEoFmHK0APy08ufwbuSmQbXZOCd/5wFR1jYzf6qlC/hgbo6nJSJVhtsOyT8
	FYFWFhdX+rTra5mXaWK4GHQ1H9i7d0GLgRqBEceWW/T9cXy6MaHQuX4A+wTSfSRFD2A2
	LZZzpSH+6EbQG0jssUWQrBXmLlRzDQShm3Oh5LrUwwPVxEKq7znPNXl/WvgSIhRq24yq
	u7PQ==
X-Gm-Message-State: AEkoousqODlt5SqGOWRo8kvt1FtoOScox7m6MXBDqZ/Sxfd5IMyCyZSd1yuCHNW6c3SDtJ6yDq5chebGpepADw==
X-Received: by 10.25.215.82 with SMTP id o79mr714563lfg.132.1470842757775;
	Wed, 10 Aug 2016 08:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 10 Aug 2016 08:25:56 -0700 (PDT)
In-Reply-To: <1470756255.8166.51.camel@linuxfoundation.org>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
	<ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
	<1470671991.8166.44.camel@linuxfoundation.org>
	<CAJTo0LY-MVSANSLRBzBGTL2ZJ=Ga=Xijps6jwAGosLK3aE4QLg@mail.gmail.com>
	<DC67B803-475F-4992-8DFD-B8F5FA7B1D15@gmail.com>
	<1470756255.8166.51.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Aug 2016 17:25:56 +0200
Message-ID: <CA+chaQcUkSHn6kkNHeo=5cDLhY3mc=Ob6zKs8EGrA2+b59FHtQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] binutils 2.27
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
X-List-Received-Date: Wed, 10 Aug 2016 15:25:59 -0000
Content-Type: text/plain; charset=UTF-8

I'm not sure if it's caused by this binutils upgrade (because openssl in
oe-core is also using version script, imported from debian) or some change
in cmake/openssl, but today all recipes using cmake are failing with:

| DEBUG: Executing shell function do_configure
| cmake: sysroots/x86_64-linux/usr/bin/../lib/libcrypto.so.1.0.0: version
`OPENSSL_1.0.0' not found (required by cmake)
| cmake: sysroots/x86_64-linux/usr/bin/../lib/libssl.so.1.0.0: version
`OPENSSL_1.0.1' not found (required by cmake)
| cmake: sysroots/x86_64-linux/usr/bin/../lib/libssl.so.1.0.0: version
`OPENSSL_1.0.0' not found (required by cmake)
| WARNING: exit code 1 from a shell command.

Maybe it's another symptom of missing openssl-native dependency in
cmake-native (just like libidn-native issue reported here
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9639) - and cmake-native
was originally linked against host's openssl which was built with version
script and binutils-2.24 (Ubuntu-14.04), but then it's executed with libssl
and libcrypto from native sysroot, where the version script didn't work:

$ ldd sysroots/x86_64-linux/usr/bin/cmake
sysroots/x86_64-linux/usr/bin/cmake:
sysroots/x86_64-linux/usr/bin/../lib/libcrypto.so.1.0.0: version
`OPENSSL_1.0.0' not found (required by sysroots/x86_64-linux/usr/bin/cmake)
sysroots/x86_64-linux/usr/bin/cmake:
sysroots/x86_64-linux/usr/bin/../lib/libssl.so.1.0.0: version
`OPENSSL_1.0.1' not found (required by sysroots/x86_64-linux/usr/bin/cmake)
sysroots/x86_64-linux/usr/bin/cmake:
sysroots/x86_64-linux/usr/bin/../lib/libssl.so.1.0.0: version
`OPENSSL_1.0.0' not found (required by sysroots/x86_64-linux/usr/bin/cmake)
        linux-vdso.so.1 =>  (0x00007ffed2fce000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fb631276000)
        libssl.so.1.0.0 =>
sysroots/x86_64-linux/usr/bin/../lib/libssl.so.1.0.0 (0x00007fb63100c000)
        libcrypto.so.1.0.0 =>
sysroots/x86_64-linux/usr/bin/../lib/libcrypto.so.1.0.0 (0x00007fb630bc1000)
        libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
(0x00007fb6308bd000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fb6305b7000)
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
(0x00007fb6303a1000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fb62ffdc000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fb63147a000)

Which is sort of confirmed by removing libssl.so and libcrypto.so from
native sysroot, I can execute cmake binary again.

On Tue, Aug 9, 2016 at 5:24 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2016-08-09 at 07:42 -0700, Khem Raj wrote:
> > I could also see it on ppc. backtrace, shows the segfault is in exit
> > path and happens in libc
> > at this point, I think the problem is how libc is compiled with
> > binutils 2.27, connman itself
> > is ok.
>
> Its the issue here:
>
> https://sourceware.org/ml/glibc-bugs/2015-01/msg00274.html
> https://sourceware.org/bugzilla/show_bug.cgi?id=17908
>
> Basically, if you remove the global _IO_stdin_used symbol, it triggers
> compatibility code which crashes.
>
> I've confirmed that if I add that symbol to the version-script in
> connman, things work again.
>
> Any idea how we raise the priority of this issue. There are no comments
> on the bug despite it having been posted a while ago :(.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

