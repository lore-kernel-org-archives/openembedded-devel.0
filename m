Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBB210706F4
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:26:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15225.1773512771656726387
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AW4h9IWg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so3099629f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773512770; x=1774117570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7jL39dVWB01BD73nskwabglW6FGNryn7hY6uBrixA4=;
        b=AW4h9IWgaxc6qLfZgWSA7SV03DMerJ2BRbUQHt/J/QeovdcwmRXC3KeXnCtZcqomhL
         eWiBs8cNbd99apzEtPCLZqLvRtwSx3I1/Q7u5fX4prMOVZlQUFnwbg3vq3wxgkJUrqZZ
         +mCbth65DnfF4G/D9KJNDdSgTD3PSUdQVYRernKLY42PBCv0YF+NGYUNqC18zeY/h1GV
         K1L5VhI4vcUEyVWagkYtO/81ZCEYOcbx0C/qMB8mmdmoB+8srt9Sx8C+vdB4jyVmnLvM
         rEEGzTn5R5HB/0pOT6vRhBtRfc9xzmXK96XvOX/6STmc2roxlHLohOeswa4LytmRGJyj
         4Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773512770; x=1774117570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7jL39dVWB01BD73nskwabglW6FGNryn7hY6uBrixA4=;
        b=Wpx2anio30GdTyfWWhTTdv+rcjI8bvfbjuqB7vtUT1EhyaNYxUggfLzDkbJbrHoCgQ
         SePmjXw/cxoAGz/ARMt3nVkIWdyn7Q1uxoxyeyxLq97wXYc4b1bFEQ47wziyzHyymh8j
         13O6ZsLEBa2RgZRNX90e8eFRLJmxZKtUmoTvaXvM0FgTqIigQ4D03B9PkjJ9Y2Fj7pTP
         xwNZsp80yYUXTwXkYtbOVJZa16Pawdq/o4qySecmY3S9wm30gw7qPM+/txcXn0T+WKzF
         ouEakruNtN6ADBLBcdCtmn9H1zq9PeWC7WXJllhCA1f4EJADLDKtNTHUgnYUgUuf9OaU
         h66Q==
X-Gm-Message-State: AOJu0YxB1TDNO2R9BuQqat2qa0iq/B6At/I1FS95MY0UYsl/LsyhNUc4
	G1n7pQEtTzt4bFHypllSZY2W0RnhA1elG9Ey3GxDdP1Sc+IyzhkDgw/hAktYmQ==
X-Gm-Gg: ATEYQzw4SHwIRZB3yRG3inkBltlN3229PFd3UFadhJu641wk/FwxCYch8blGHtSp2Wv
	9wMLAJcTuIEW/CC66CKiqwbofgkDaDi3IshYnTYTSAKzReJ40wcB1KMWQFs8EI0xgjJQ5vc247N
	qhAlxElyHkR/g+JVj9822YNfFwWduhWyZJYiO3TmMcWfKnR1JojSFDWqvRt1M6EpdpuOvplvX+O
	FJNSJjtFIr32fXK7xutYtAO3vP2s9kCML7wezgH1AeMlSUobTMcMFwX9AUZAl+4B5P7JatwY8Ju
	icNyEo9CH0kkuTFTo2ZHuyOqnOmPVGzKVgPb/1k/BLCAcEKOFKEgUPQNPhEc9MVGuidf4EZ2dQH
	fK37ZAlFPzniKGcIvnr/p3QdzHzUg/57WrWRdWYOP1ThGOk52ifqVL8ai/AcKzwwyzsApp/mXGp
	PLbwEBdTWz6dDJ82lUrA3G
X-Received: by 2002:a05:6000:2c01:b0:439:8da3:d77e with SMTP id ffacd0b85a97d-43a04d87fbfmr13661709f8f.20.1773512769861;
        Sat, 14 Mar 2026 11:26:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22e9ddsm26042236f8f.37.2026.03.14.11.26.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:26:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH RFC] nftables: build with native python instead of host python
Date: Sat, 14 Mar 2026 19:26:03 +0100
Message-ID: <20260314182603.482152-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 18:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125211

Using old Python on the build host with SetupTools 82 results in an error
message during building:
| error: invalid command 'egg_info'
|
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: exit code 1 from a shell command.

To avoid it, use the native Python environment built by OE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index 505dfc12d0..d27e60a18d 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
           "
 SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
 
-inherit autotools manpages pkgconfig ptest
+inherit autotools manpages pkgconfig ptest python3native
 
 PACKAGECONFIG ?= "python readline json"
 PACKAGECONFIG[editline] = "--with-cli=editline, , libedit, , , linenoise readline"

