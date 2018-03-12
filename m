Return-Path: <ub4_clb@yahoo.de>
Received: from sonic302-19.consmr.mail.ir2.yahoo.com
	(sonic302-19.consmr.mail.ir2.yahoo.com [87.248.110.82])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAC877FC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1520841334; bh=ZJu27EYY7j+97B4dmUgMoI/lf+mOY/E/pw7UvDUm74E=;
	h=From:Subject:To:Date:From:Subject;
	b=kPYbDKTYCcgA3Vc4CNKGXsatONT8JUMOYf1IlNqNtDTL6Lxs6dNzUCNiAYH9ST4WKXYuSpENLOEUKJuricwgcuMEBKJxO5Le/6VyeUe4QhscHqcYijz24MnfAUtewlNJqqeVS4OqPavN7E13+/3JjJVVcMDk2kpu7IggIXl2JJ/mj1QzyU+vM1OXkl6HYobM8SQ6SOpw3SXmsB0yk/c08+A3iam3W9E+n9k5l49U9oVeCbmLAlQ4eV+gP9HU0co9Jf2/1owDZjlwqgVc2/qGI7o0+jDOTjStWL6+2xdKcOPhtrLYakkf2U6QHcwLVnMZtZbln2xSsdH5FENaKz0eSQ==
X-YMail-OSG: CjJFrBYVM1kIJivFC1MQ0IQuQhcco1etnPv1Yd33SZum_C3nwIsnKsi2Gomaqdi
	y_tOlbBhBjIpGE7jw_jCn3N5RU.M17h0xAtwaF5QvpxNojBTIoXsJuRp5efQXJXp59D_gLOxqrqM
	YfxdAfRFVejjP4zfQJ8RY39hjaN5iUHuMJKbDbDcB7dMj3ICr54RCVlRdjFJK73PzDAzxPPHbWrl
	G7XxkESjwuYafK2HwS_6AkVqHG_RtJNpb0CW5Kmq9cNXbss7lj1UK8kytClVJyIXNhUtRnAjTgsh
	Pny5QecLdOrtzo5IeDQdrq89y.oJNIDv9es4RrP_jMfjvplwEKzhka41laXWXe.9xbWI3xEY0e8X
	5v.LnqzC0rSOrj7dsOOSefzrZx328ZzHPvVrZV_q0R8RuNkurPnrdGHc9IFr.3EtiuAVCOrxq2vH
	CJnqnm.ATsz1d27nUCJGS9ZsieZcLqnkrUoNPOyRG9AOY88W86_SBFoFN20nw3LiFRuGOk17tFvy
	eCkjFiEI-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ir2.yahoo.com with HTTP;
	Mon, 12 Mar 2018 07:55:34 +0000
Received: from pD9F9FBB1.dip0.t-ipconnect.de (EHLO [192.168.178.166])
	([217.249.251.177])
	by smtp413.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	2fe95413aedf6ac16bf663cf7bfcbbed; 
	Mon, 12 Mar 2018 07:55:31 +0000 (UTC)
From: Peter Fink <ub4_clb@yahoo.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <3bb3b96d-c0a5-3133-df50-a75f8f071ed8@yahoo.de>
Date: Mon, 12 Mar 2018 08:55:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: [meta-qt5] QtWebengine SIGBUS alignment exception
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
X-List-Received-Date: Mon, 12 Mar 2018 07:55:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi!

Did anybody successfully run a qtwebengine application built with
qt5.9 or 5.10 on rocko?

I'm building for i.mx6 (eglfs) and getting more or less the same errors 
on 5.9 and 5.10.

The problem seems to lie somewhere in 
qtwebengine/3rdparty/chromium/thirdparty/boringssl which makes it quite 
an easy target to debug...

On 5.10 I get a bus errror (SIGBUS) because of an unaligned access:

/usr/sbin/testbrowser http://heise.de/security
Alignment trap: not handling instruction ecd6cb04 at [<734fd3b8>]
Unhandled fault: alignment exception (0x001) at 0x734fcce1
pgd = d9a70000
[734fcce1] *pgd=69a75831, *pte=61c6359f, *ppte=61c63e7e
Received signal 7 BUS_ADRALN 0000734fcce1
#0 0x00007401b66a <unknown>
#1 0x00007401b4e6 <unknown>
#2 0x00007347ae48 <unknown>
#3 0x00007401b8e2 <unknown>
#4 0x00007635bbc0 <unknown>
[end of stack trace]
Calling _exit(1). Core file will not be generated.

If I use https qtwebengine simply complains about the webpage not being 
available and throws the following error on the command line:

[503:523:0309/095037.841842:ERROR:ssl_client_socket_impl.cc(1129)] 
handshake failed; returned -1, SSL error code 1, net_error -126

So I traced the error down to bsaes_ctr32_encrypt_blocks inside the 
boringSSL implementation:


Starting program: /usr/sbin/testbrowser -platform eglfs 
http://heise.de/security
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2 to 
enable double buffering and vsync.
  If this is not desired, you can override this via: export 
QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
[New Thread 0x681d53c0 (LWP 565)]
Unable to query physical screen size, defaulting to 100 dpi.
To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and 
QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
qt.qpa.input: X-less xkbcommon not available, not performing key mapping
[New Thread 0x673603c0 (LWP 566)]
[New Thread 0x64a523c0 (LWP 567)]
[New Thread 0x640ff3c0 (LWP 569)]
[New Thread 0x638ff3c0 (LWP 570)]
[New Thread 0x630ff3c0 (LWP 571)]
[New Thread 0x628ff3c0 (LWP 572)]
[New Thread 0x620ff3c0 (LWP 573)]
[New Thread 0x618ff3c0 (LWP 574)]
[New Thread 0x610ff3c0 (LWP 575)]
[New Thread 0x608ff3c0 (LWP 576)]
[New Thread 0x600ff3c0 (LWP 577)]
[New Thread 0x5f8ff3c0 (LWP 578)]
[New Thread 0x5f0ff3c0 (LWP 579)]
[New Thread 0x5e8ff3c0 (LWP 580)]
[New Thread 0x5e0ff3c0 (LWP 581)]
[New Thread 0x5d8ff3c0 (LWP 582)]
[New Thread 0x5d0ff3c0 (LWP 583)]
[New Thread 0x5c8ff3c0 (LWP 584)]
[New Thread 0x5c0ff3c0 (LWP 585)]
[New Thread 0x5b8ff3c0 (LWP 586)]
[New Thread 0x5b0ff3c0 (LWP 587)]
[New Thread 0x5a81d3c0 (LWP 588)]
[New Thread 0x597ff3c0 (LWP 597)]
[Thread 0x597ff3c0 (LWP 597) exited]
Alignment trap: not handling instruction ecd6cb04 at [<7349b5f8>]
Unhandled fault: alignment exception (0x001) at 0x7349af21
pgd = d8d50000
[7349af21] *pgd=68a4e831, *pte=67c3059f, *ppte=67c30e7e

Thread 19 "Chrome_IOThread" received signal SIGBUS, Bus error.
[Switching to Thread 0x5d0ff3c0 (LWP 583)]
0x7349b5fc in _bsaes_key_convert () from /usr/lib/libQt5WebEngineCore.so.5
(gdb) backtrace
#0  0x7349b5fc in _bsaes_key_convert () from 
/usr/lib/libQt5WebEngineCore.so.5
#1  0x7349b98e in bsaes_ctr32_encrypt_blocks () from 
/usr/lib/libQt5WebEngineCore.so.5
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

I couldn't find an option to use system ssl libs instead of chromium's 
own libs or is there one hidden I'm not aware of?

One possible problem I could imagine is boringssl being built for the 
wrong architecture, as there are multiple asm files for armv4, x86 and 
so on... do you think that's a likely cause or might my toolchain be 
broken somehow?

Thanks in advance & best regards,
Peter

