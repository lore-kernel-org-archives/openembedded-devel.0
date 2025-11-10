Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C960CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 08:42:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44132.1762764150173249994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 00:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DCT/I+sW;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47721743fd0so12737505e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762764148; x=1763368948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypOBpu5uq+rx22/2tLyFI0nqprjR8f86JtmjKdrGTic=;
        b=DCT/I+sWFDJrmyWAfCcMcuQKMGmuim6hF3Mp53TTBIjMAi99ks0n844ow84DYjI0Jb
         aWwr6Wa073MsDv+ivUbyCLjx7ehiD0yGogJHwcs1lD86Iw6IYTVKdniELftRiTVVmcLJ
         pIWKZja46/P5m3MhDMsjoStj9PNYk2iI6nCb3BnGOh1yvjkICeil1ffrjgT1EjU5b1+6
         UfGFleHNQkbWKZsr9oJgOuBRWza69tpcopTAiyaW60Uux8veQdUpSNDq6MZEatOeiren
         nEzKM06oH2j97GIwaB/ShTo7vccTWHNFo3tjdDpU7Wbxs9OuZFlnUuFSGpDL66PeLeuQ
         A2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764148; x=1763368948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypOBpu5uq+rx22/2tLyFI0nqprjR8f86JtmjKdrGTic=;
        b=Gxy9MsBHrOc5/IzcYOfaJ6jPFbMkdJj5iHwOCsWWmLTai9eG7HG96yFrHlIycNKmCL
         myv4tMu3/YaKR4si3VscFoPz0iQq10vBrAIo6XXH8H1qlxM1JE5FKNHQr/XJJjXsH9Ic
         aF4E3IliHQXJCOjBHenIN87u5lh1fGq7U739bZGSxdSLUCIuLcMQoIOPfs/QM717uy6p
         7IoZ8EGq2pIrBCEvx/30sJZH4U4TkqJCh5JcTvkSkzW4AS9aVFJlz2AlxGISwU+yycXC
         0zUMU7QtZLbitbmMP71+zTWnnAtk2u6oBGnhv+68SivKmw2e5GUyl5bBr+AQlfKjpPky
         f9yQ==
X-Gm-Message-State: AOJu0YzMLjh+7l69X+ldsSJZVqYmkqyWHM9Ld3coBDghXq/EGZsGdFTD
	ONSzAaWWrPoxes/dIOcJH5vEiDn7Et1tP6scB/2DO9g8EaX4tLZQVfIdSR6f0pje
X-Gm-Gg: ASbGnctpaUEGPTa0LYvMJopzvgl9UeBe9W889nCuD/BfFyN7KbkiaG4jvP+gAMj4VBe
	KBtmLTwmMS+0EQjIkg45C+1ZT4iH4y8LkYEZxCtZgXeqrl/fXw9i4jKUu9oF+W0DV+/GIDZvfPQ
	E/QqaZCCXYndQrSREyHTJtEWTpp32vLHOCflww0iXicc/lE6I2diGapxY1Kd4poZOx/N8nQwOov
	4MxzhK6ISdIEhAnVGx5MjMA5PurDUVzsJUTJFWZkU3559n/8IRaf7rLEoa9V/+abqveCCSQtiJ9
	wjNqKmp6ARfvE0msNfVsuohVyv9FlwWbcoLte6wRTJ46HHLzFoZEIV98Wh2U8KID6yOCVDoDocE
	EKwhrdUKJAn8cQvWdSSxxBI+BxGP//BPdbFJmFB/1+oZ6cu4JOwi3UTrbXa+Osxd2VxWyhxxByi
	425oM+LfATzuatLGJcrulrjQ4eRPFeGWO5sUuGLBNVH1RUcvC9Wm/aMm4zkfHjxl4V3xYC1WGCH
	eqJSutoIS5FzNNnhSwKHAPRVUq0Qpvk3kZO3TcwpFZC/OkI564=
X-Google-Smtp-Source: AGHT+IFyal6QBZKPhgmm9d7KtHNAr3ma8SSwO6dOhbYtTPNGPwD81R2EzULpZg127MCdnMpvoG9hXw==
X-Received: by 2002:a05:600c:4ed2:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-4777d945f1dmr11604365e9.27.1762764148084;
        Mon, 10 Nov 2025 00:42:28 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776c2aff72sm195721145e9.4.2025.11.10.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:42:27 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] tk: disable zipfs in configuration
Date: Mon, 10 Nov 2025 09:42:14 +0100
Message-ID: <20251110084214.6433-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 08:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121452

The tk.tcl file was missing on the rootfs.

  File "/usr/lib/python3.13/tkinter/__init__.py", line 2459, in __init__
    self.tk = _tkinter.create(screenName, baseName, className, interactive, wantobjects, useTk, sync, use)
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  _tkinter.TclError: Can't find a usable tk.tcl in the following directories:
    //zipfs:/app/tk_library //zipfs:/lib/tk/tk_library //zipfs:/lib/tk /usr/lib/tk9.0 /usr/lib/tcl9.0/tk9.0 /usr/lib/tk9.0 /usr/lib/tk9.0 /lib/tk9.0 /usr/library

By disabling the zipfs options the tk.tcl is in the rootfs.

Debian did also disable this option.
@see: https://sources.debian.org/src/tk9.0/9.0.2-1/debian/rules#L39

Tested on Walnascar.  But master does have the same version of Tk.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
index fc2dde497f..16feb1182f 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
@@ -44,6 +44,7 @@ EXTRA_OECONF = "\
     --with-x \
     --with-tcl=${STAGING_BINDIR}/crossscripts \
     --libdir=${libdir} \
+    --disable-zipfs \
 "
 
 export TK_LIBRARY = '${libdir}/tk${VER}'
-- 
2.47.3


