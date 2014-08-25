Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 074896ACBA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 08:08:00 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pn19so12440163lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4bues6XMSvDYotz3nfXB3HGdBYdobfw/mhHFn2sYRcc=;
	b=bcNR5HRQbYv198mcbc2AGWjvuV9uizgvQlSKkK5J6aymNHRtX8G9A03ucK7SUqMGyl
	q46hv7BpFjjYE2zhdXhuUjVCxtUgfvvZLpWoPe271eG51GLkL+/xvCdnx1jA8nVb1pcB
	Z50RKMcC8CgYKJqQhKxeTaC3yIIgWmo71ZrqsulgtW1ANnSXVepkwHsaWgaEsjkaG4Gj
	UE/g470763VWqtro94kI/r+SqUZVNEPnAny+ijwAHImOGNeqYruLLwT64ra5wMTmcLqZ
	CzPwprmI2EAMtYJHvqVztfOF2iTvHRwzaZJJ3YhHpqxA8FLCVIiNafebtNTh3Lu977t7
	H3JA==
MIME-Version: 1.0
X-Received: by 10.152.120.38 with SMTP id kz6mr19955465lab.8.1408954080699;
	Mon, 25 Aug 2014 01:08:00 -0700 (PDT)
Received: by 10.112.88.130 with HTTP; Mon, 25 Aug 2014 01:08:00 -0700 (PDT)
Date: Mon, 25 Aug 2014 10:08:00 +0200
Message-ID: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: klibc: armv4 bx strikes again
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
X-List-Received-Date: Mon, 25 Aug 2014 08:08:04 -0000
Content-Type: text/plain; charset=UTF-8

I've recently discovered that the static klibc binaries produced for
armv4 contain Illegal instructions.

Eglibc armv4 binaries are ok.

I verified it happens to kexec-tools-klibc and kexecboot-klibc:

andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
./arm-oe-linux-gnueabi-objdump -S ./kexecboot-armv4 | grep bx
   110dc:       012fff1e        bxeq    lr
   11154:       e12fff1e        bx      lr
   11160:       e12fff1e        bx      lr
   11170:       e12fff1e        bx      lr
   1119c:       e12fff1e        bx      lr
   11234:       e12fff1e        bx      lr
   11240:       e12fff1e        bx      lr
   11250:       e12fff1e        bx      lr
   11268:       e12fff1e        bx      lr
   11298:       e12fff1e        bx      lr
   112b4:       e12fff1e        bx      lr
   112f0:       e12fff1e        bx      lr
   115f4:       e12fff1e        bx      lr
andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$

The binaries end-up compiled with following flags:

arm-oe-linux-gnueabi-klcc -march=armv4 -mthumb-interwork -Wall    -o
kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o gui.o menu.o
xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o

This is rather unexpected because klibc carries one specific patch to fix that:

http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch

and in fact looking at the produced klibc.config I see indeed LDFLAGS=
--fix-v4bx and that goes in  *arm-oe-linux-gnueabi-klcc.

There have been big toolchain changes recently so I suspect something
got broken in oe-core.
Then there is a patch touching armv4/thumb but it doesn't look
suspicious at first:

http://cgit.openembedded.org/openembedded-core/commit/meta/conf/machine/include?id=1250d3e009363d20f15bbfaced622c5912a7fb93

As for klibc sources, I see only minor changes in the last versions so
I would say version is irrelevant.

Any hint?

Thanks in advance

Andrea

