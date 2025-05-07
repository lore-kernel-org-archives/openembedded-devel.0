Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00104C3ABC5
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:50:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3965.1746607796987197307
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 01:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f4agVlGw;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf680d351so3517845e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746607795; x=1747212595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6nCcSFd/XIMqRfLDKIjoSKG+l0/xbK0ien3R+Bo5PDo=;
        b=f4agVlGwzNFFx4gFqx8TES5OP0zDBV9Hlnn1X0FwNVY9Mx12c+CrKzstcjseg1KOn0
         bXRN6LgN62gPzYKj5UeSP7MOtkQai4jdu3Mv/+NSvMvQcrMMwPvTXaYM/rEAmCChNSiD
         LEUY4S9PaSnbmJG4PXgcK7wzWgamZwCx7Y5cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607795; x=1747212595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nCcSFd/XIMqRfLDKIjoSKG+l0/xbK0ien3R+Bo5PDo=;
        b=RQUZZEjz3Tf0cwQao6FYS4jbaYaztIp8YqxX6LBSLyZFykUzcc3OoqGXeYQnMwhei6
         KUSn6XTtNis85Ign0gs8RO75BZJJD/9/qicfoX8B/5UH/6ICmrN9xt7Ctu8qWjZR2Xo1
         423bauoEOqe/oQKCb3fKrjcxEpKf7j72t0o11Io69YHU+8Lc5CO8QVG9b3BBAbt/nJ3l
         pqvL5adLlgB6ms2F8XVMniM8ZlMmGeCQT8t2zqV96i4kBvfC+6AKb6zCaIaHT4fHb+it
         Su04uAi1mzfI3z840N30WWQy8okQuUexzvbyf6Dt+eshUmvraM1XqFWF9tll6PA70y2f
         BslA==
X-Gm-Message-State: AOJu0Yybp4BV/ytCKdO2GrEkZh6tYuYs/ML6VhNDnSoyN1LUG8mK2QjU
	J5PIwc2J2yPssntQ2BlR2vI029twiFUIo8N76wDFU03rfoJ31WEsIwsNjuunHOZxtGRMbEhOEHE
	H
X-Gm-Gg: ASbGncsuBrVO+SlGMlEQZ8qa9x3XENf99sP/wZQ8cm80NGp92VZiYBhr7BqHfOMHN0y
	JMnH9uDJLizy7Rx+5nqkCNlQk0CNQ1japVY2rIHy0coMS5lKu10GXAloikYPWeoTfxD96ZynQVi
	g2U09mJ4o+eXRPMN7AaqbIbc9lmUkvevqfihPAgxgr/xxqwPp5U+HcJlG1l/r4EJSfeRYsYpQKC
	YV1AbdK5gnkVdNJeIlgkGi8G6dqDYbqQDyxHjWRGv4FJdsjqKkkTOApWF+s64SBmz4oQRlY2pnK
	5EhrKhwokKtJV7WCKGh1PNbG/tcBZmZe/00r0QNHo0CbWmiPavbAA3ZCkaSt9SBjZ+6DMrGjtxZ
	YEvStqiewCSXLv/wsYWcNy1RiYRSEOIor0CTo3jjkYa1vxNDF
X-Google-Smtp-Source: AGHT+IFlD3A7kpaaACHzlVBFWI2iA6FC9O4u95qEMS6TJFqdnBoyLLz46Sig2mI4Ps5PnI/fAK2g9g==
X-Received: by 2002:a05:600c:378c:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-441d3a6e198mr20501445e9.12.1746607794969;
        Wed, 07 May 2025 01:49:54 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa001f337aee3c499519.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1f33:7aee:3c49:9519])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d434644asm24008615e9.9.2025.05.07.01.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:49:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] sblim-sfcb: use -std=gnu17 for compilation
Date: Wed,  7 May 2025 10:49:38 +0200
Message-Id: <20250507084938.714258-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 08:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117357

From: Yoann Congal <yoann.congal@smile.fr>

sblim-sfcb does not build under -std=gnu23 which is the default of
gcc15. Forcing -std=gnu17 fixes these build errors:
|../sblim-sfcb-1.4.9/providerMgr.c: In function 'lookupProviders':
|../sblim-sfcb-1.4.9/providerMgr.c:374:11: error: too many arguments to function 'UtilFactory->newList'; expected 0, have 2
|  374 |     lst = UtilFactory->newList(NULL, NULL);
|      |           ^~~~~~~~~~~          ~~~~
|In file included from ../sblim-sfcb-1.4.9/providerRegister.h:31,
|                 from ../sblim-sfcb-1.4.9/providerMgr.c:29:
|.../tmp/work/core2-64-poky-linux/sblim-sfcb/1.4.9/recipe-sysroot/usr/include/sfcCommon/utilft.h:202:23: note: declared here
|  202 |     UtilList       *(*newList) ();
|      |                       ^~~~~~~
|../sblim-sfcb-1.4.9/providerMgr.c: In function 'getAssocProviders':
|../sblim-sfcb-1.4.9/providerMgr.c:661:11: error: too many arguments to function 'UtilFactory->newList'; expected 0, have 2
|  661 |     lst = UtilFactory->newList(NULL, NULL);
|      |           ^~~~~~~~~~~          ~~~~
| [...]
|../sblim-sfcb-1.4.9/providerMgr.c: In function '_getConstClassChildren':
|../sblim-sfcb-1.4.9/providerMgr.c:1896:12: error: too many arguments to function 'UtilFactory->newList'; expected 0, have 2
| 1896 |       ul = UtilFactory->newList(NULL, NULL);
|      |            ^~~~~~~~~~~          ~~~~
| [...]
|../sblim-sfcb-1.4.9/providerMgr.c: In function '_getAssocClassNames':
|../sblim-sfcb-1.4.9/providerMgr.c:1945:12: error: too many arguments to function 'UtilFactory->newList'; expected 0, have 2
| 1945 |       ul = UtilFactory->newList(NULL, NULL);
|      |            ^~~~~~~~~~~          ~~~~
| [...]
|make[2]: Leaving directory '.../tmp/work/core2-64-poky-linux/sblim-sfcb/1.4.9/build'
|make[2]: *** [Makefile:1853: libsfcBrokerCore_la-providerMgr.lo] Error 1
|make[1]: Leaving directory '.../tmp/work/core2-64-poky-linux/sblim-sfcb/1.4.9/build'
|make[1]: *** [Makefile:2060: all-recursive] Error 1
|make: *** [Makefile:1112: all] Error 2
|ERROR: oe_runmake failed

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 622c5ce07c..591321b7e9 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -44,6 +44,8 @@ SYSTEMD_AUTO_ENABLE = "enable"
 
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--allow-shlib-undefined ', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OECONF = '--enable-debug \
                 --enable-ssl \
                 --enable-pam \

