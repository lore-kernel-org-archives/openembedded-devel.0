Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.23940.1598547921528978635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RigMA91j;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id t2so5870391wma.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRPwCcxP+5490rK9Uv4dpCVLE59s0tvNO9U615Anv/4=;
        b=RigMA91jzPQb5CZa2/ZIN+yv+2P6Wj3Km3ktxULLPxxkjWfHUjYjH46r/QMn71C/Fv
         8VUDIs/OtOTlMJpxsMNE40XiaGhgSzxjDnkPcOKq+OqyKFzROd2i7tTY6s9udBPgbY3r
         yd/KZKWXyjGwbZabxqe5Nps4aHCNoGfoktYft3EvolRDxyKt8KYg720DKSnKWH/sQMA9
         +nuMIsBLQF9cslo8GNcGpye1hLTkg3bC2YI5UofruAxvRe9YbcmKkv5+A1EOx9ii1dLX
         aXPG2ar6nrZ+4dg5sKGxSFRuUcZqJX39jPqlu1nZVTw1bnJwN0bDwITYLeHEeD3n7ioX
         V6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRPwCcxP+5490rK9Uv4dpCVLE59s0tvNO9U615Anv/4=;
        b=Im134NiZH8YdRJ+so+0wsSXIAqNxblfbaR20ewCsUvjBuYyrKrcyekAaO73VQrV1/r
         blt5aeKFjV+ROXVRsqc3na1udbE0ypmYZZ6DroyHV0Wx20BUTtZxtWp025Ik/xr5f45Z
         JHNOc0MvDUUM61ALoc5JPUQl57v+QQ607vFVWJQSIw4N8MdoFIImdCJ38nf2zg9ir38F
         0YmaxsqkOKRNai40xaOg1Q7W7Xb5pMILGFF2hib1pVpObcwOhrvioejAF2vt+X8ALC6U
         4M5+dkQbsudEkLINzVr8AoiEZetFMgI6jGhnvLR9eBDqOwADCbAMyaGDKuiqg0njGEDU
         JDZg==
X-Gm-Message-State: AOAM532L8z9ADa1CL0OrDpaY5Z4fW6BvUp3J4HGwpcm/SlGpVIa/gRDg
	GHtEdO5ILNGUPRLZT0wIGZkIhT8vXaY=
X-Google-Smtp-Source: ABdhPJxBOqkow6WbrCGwT0Wp2fuh2eyxUouEOrGecrwqCPjRN9V1fNB8OuO+TzYnp0ufFBJCIc36QA==
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr12874950wmj.33.1598547919622;
        Thu, 27 Aug 2020 10:05:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v4sm5774775wml.46.2020.08.27.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:05:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][zeus][PATCH] miniupnpd: Build config.h before full build
Date: Thu, 27 Aug 2020 19:05:15 +0200
Message-Id: <20200827170515.2751823-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This fixes a race condition e.g.

testminissdp.c:15:10: fatal error: config.h: No such file or directory
   15 | #include "config.h"
      |          ^~~~~~~~~~
compilation terminated.
<builtin>: recipe for target 'testminissdp.o' failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
index 6b8fdca4c3..e029266541 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
@@ -26,6 +26,7 @@ do_configure_prepend() {
 
 do_compile() {
     cd ${S}
+    CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux config.h
     CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
 }
 
-- 
2.25.1

