Return-Path: <ub4_clb@yahoo.de>
Received: from sonic304-21.consmr.mail.ir2.yahoo.com
	(sonic304-21.consmr.mail.ir2.yahoo.com [77.238.179.146])
	by mail.openembedded.org (Postfix) with ESMTP id 085227889B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1521018696; bh=OvwddvZTsSEkKcaycmmllViw1JxZgU1U2Wzlg1ut9Mw=;
	h=Subject:From:To:References:Cc:Date:In-Reply-To:From:Subject;
	b=Zu79s+cnnrJuF0/recVqNDRXj4Y66rzxwoQUeiSJiPkOZ/qoes2wo0zZOuBZgGS1WJ6eUAD3eaiSn/VuaZMzfwDg/XwPu/9AJumm9TAcdgakekeh3KlQQ0Wh9aOgmSBvxBdzb6nuXNgh8SGtmja68MpBJjEvMfejBq0m5/vvpJYGrUWPbsF7B7e8TGSeyrDRtqaLiFBz8pI3kneZKWaqV9FJ0zkcKjychyE/VGhLzQ/+/TfgHeTbMAi4M43krRJynNNPk47tbYdE5QzC3wDs8PVvwcGq2X1ObS4lOhT+b27yi29N9FpRg6zMYvHYbMSNAwDhdD5ifjVYEwhrVf4ynQ==
X-YMail-OSG: bLaUb30VM1lGdmtuZ3SINdnC9ybfOOc3ERyIETdH7OYuObgym1GhVb.GyG07W5x
	zrwfsDdKNcUnu5kXmHIQa.ldxNnifWMQa9ZJYuSL5cnOiRilLPOcAluyNULq9VSWmPU8D9D79AMQ
	Lv0HfBr5JJbAtSndbo538T.134ZGpFjqdqEnnSSs23jU8NRXpOC9cF4BH4my8gvHBZxtjOz423Rg
	GBYTBAWkxqsREwQTdTSpsT7G8l5uCVdIPZmoLac48pqrYsRoc8EM4s4ggn5t7N8urgAnxqzj6B3u
	8b_5djagXUjBGWuFG72kz6UQEPno.a8_xNbMV75zyasbdyTbRvyvWamueVfIpNCtibayKJzWtjFk
	pAxTfQH7kBY15QrApb9klwUA1Kuw5ntgjsQLX0MjDZZmFkFt9ut6zALd.bi2w5oOPzyoBT9i67zy
	9hu_5h6PqL7AFgki2mx5rYPYTwspXwfm8vMRZ83IRx2sNY3svdynuilnbNjcmUK8aPxjhSwmGwk.
	2NDtQ2Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic304.consmr.mail.ir2.yahoo.com with HTTP;
	Wed, 14 Mar 2018 09:11:36 +0000
Received: from pD9F9FA27.dip0.t-ipconnect.de (EHLO [192.168.178.166])
	([217.249.250.39])
	by smtp415.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	1ce6ea4f25d4781fabc32d18eb0d8c6b; 
	Wed, 14 Mar 2018 09:11:33 +0000 (UTC)
From: Peter Fink <ub4_clb@yahoo.de>
To: openembedded-devel@lists.openembedded.org
References: <3bb3b96d-c0a5-3133-df50-a75f8f071ed8@yahoo.de>
Message-ID: <45067bd2-d3fa-b3b7-b864-31a6b1183896@yahoo.de>
Date: Wed, 14 Mar 2018 10:11:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <3bb3b96d-c0a5-3133-df50-a75f8f071ed8@yahoo.de>
Cc: meta-freescale@yoctoproject.org
Subject: Re: [meta-qt5] QtWebengine SIGBUS alignment exception
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
X-List-Received-Date: Wed, 14 Mar 2018 09:11:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi!

I made some progress investigating my problem, but still have some 
questions.

When I remove "thumb" from my TUNE_FEATURES qtwebengine runs without any 
issues.

Can somebody acknowledge this behavior? Just to be sure it's not an 
issue of some other part of my setup.

#1) Why could this be an issue? Should we insert a warning or does 
anybody have a clue on how I/we could possibly fix this?
           Is it possible to override thumb/arm mode setting for a 
single package in yocto?

#2) Which TUNE_FEATURES are recommended for i.mx6q/dl?
             I based our distro on fslc-base/framebuffer and our board 
on sabresd which uses "thumb".

#3) What advatages/disadvantages does the (not) using of thumb mode 
cause for my whole system?
             I already discovered, that e.g. 
libQt5WebEngineCore.so.5.9.4 grew from ~50mb to ~120mb.

#4) Do I need -mcpu=cortex-a9 for i.mx6? Or is -march=armv7-a enough?
             GCC doc state it is used to further optimize code for the 
target. Is there a reason why is it not set for imx6q/dl on sabresd?

Thanks in advance,
Peter


On 2018/03/12 at 08:55 Peter wrote:
> Hi!
>
> Did anybody successfully run a qtwebengine application built with
> qt5.9 or 5.10 on rocko?
>
> I'm building for i.mx6 (eglfs) and getting more or less the same 
> errors on 5.9 and 5.10.
>
> The problem seems to lie somewhere in 
> qtwebengine/3rdparty/chromium/thirdparty/boringssl which makes it 
> quite an easy target to debug...
>
> On 5.10 I get a bus errror (SIGBUS) because of an unaligned access:
>
> ./quicknanobrowser -platform eglfs http://heise.de/security
> Alignment trap: not handling instruction ecd6cb04 at [<734fd3b8>]
> Unhandled fault: alignment exception (0x001) at 0x734fcce1
> pgd = d9a70000
> [734fcce1] *pgd=69a75831, *pte=61c6359f, *ppte=61c63e7e
> Received signal 7 BUS_ADRALN 0000734fcce1
> #0 0x00007401b66a <unknown>
> #1 0x00007401b4e6 <unknown>
> #2 0x00007347ae48 <unknown>
> #3 0x00007401b8e2 <unknown>
> #4 0x00007635bbc0 <unknown>
> [end of stack trace]
> Calling _exit(1). Core file will not be generated.
>
> If I use https qtwebengine simply complains about the webpage not 
> being available and throws the following error on the command line:
>
> [503:523:0309/095037.841842:ERROR:ssl_client_socket_impl.cc(1129)] 
> handshake failed; returned -1, SSL error code 1, net_error -126
>
> So I traced the error down to bsaes_ctr32_encrypt_blocks inside the 
> boringSSL implementation:
>
>
> Starting program: ./quicknanobrowser -platform eglfs 
> http://heise.de/security
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/libthread_db.so.1".
> QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to 
> '/tmp/runtime-root'
> QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2 
> to enable double buffering and vsync.
>  If this is not desired, you can override this via: export 
> QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
> [New Thread 0x681d53c0 (LWP 565)]
> Unable to query physical screen size, defaulting to 100 dpi.
> To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and 
> QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
> qt.qpa.input: X-less xkbcommon not available, not performing key mapping
> [New Thread 0x673603c0 (LWP 566)]
> [New Thread 0x64a523c0 (LWP 567)]
> [New Thread 0x640ff3c0 (LWP 569)]
> [New Thread 0x638ff3c0 (LWP 570)]
> [New Thread 0x630ff3c0 (LWP 571)]
> [New Thread 0x628ff3c0 (LWP 572)]
> [New Thread 0x620ff3c0 (LWP 573)]
> [New Thread 0x618ff3c0 (LWP 574)]
> [New Thread 0x610ff3c0 (LWP 575)]
> [New Thread 0x608ff3c0 (LWP 576)]
> [New Thread 0x600ff3c0 (LWP 577)]
> [New Thread 0x5f8ff3c0 (LWP 578)]
> [New Thread 0x5f0ff3c0 (LWP 579)]
> [New Thread 0x5e8ff3c0 (LWP 580)]
> [New Thread 0x5e0ff3c0 (LWP 581)]
> [New Thread 0x5d8ff3c0 (LWP 582)]
> [New Thread 0x5d0ff3c0 (LWP 583)]
> [New Thread 0x5c8ff3c0 (LWP 584)]
> [New Thread 0x5c0ff3c0 (LWP 585)]
> [New Thread 0x5b8ff3c0 (LWP 586)]
> [New Thread 0x5b0ff3c0 (LWP 587)]
> [New Thread 0x5a81d3c0 (LWP 588)]
> [New Thread 0x597ff3c0 (LWP 597)]
> [Thread 0x597ff3c0 (LWP 597) exited]
> Alignment trap: not handling instruction ecd6cb04 at [<7349b5f8>]
> Unhandled fault: alignment exception (0x001) at 0x7349af21
> pgd = d8d50000
> [7349af21] *pgd=68a4e831, *pte=67c3059f, *ppte=67c30e7e
>
> Thread 19 "Chrome_IOThread" received signal SIGBUS, Bus error.
> [Switching to Thread 0x5d0ff3c0 (LWP 583)]
> 0x7349b5fc in _bsaes_key_convert () from 
> /usr/lib/libQt5WebEngineCore.so.5
> (gdb) backtrace
> #0  0x7349b5fc in _bsaes_key_convert () from 
> /usr/lib/libQt5WebEngineCore.so.5
> #1  0x7349b98e in bsaes_ctr32_encrypt_blocks () from 
> /usr/lib/libQt5WebEngineCore.so.5
> Backtrace stopped: previous frame identical to this frame (corrupt 
> stack?)
>
> I couldn't find an option to use system ssl libs instead of chromium's 
> own libs or is there one hidden I'm not aware of?
>
> One possible problem I could imagine is boringssl being built for the 
> wrong architecture, as there are multiple asm files for armv4, x86 and 
> so on... do you think that's a likely cause or might my toolchain be 
> broken somehow?
>
> Thanks in advance & best regards,
> Peter


