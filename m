Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4748AD1356C
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 15:15:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.31393.1730042134040785802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 08:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QO8apzep;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso32859645e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730042132; x=1730646932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bum22WnyTksV3KoJTMcnzxkgJPfqamSymo1x2t4YE4o=;
        b=QO8apzepMuL0qWMjxCnZ3qmLZdTPWzZK/jfuFFd6UrM9FSC0cvjRakHoCFZy6lZGC1
         AZyziLceIoUIe+43h1Rl8TPxEfmD0NJnhufltLrFR9djJvYw+Ykd30rhNoToqztPL1tD
         PUCkP6KleqfEx8cDiETRjjK9oXCH8KOtpMtQLBnerhQ4/ThwnH0WH+eFoOdZgLP2rym6
         5j22hrqEep7xQFfSyfvGAVPKllpZmB8vT0YKLqPOY6hJp8D2YA5AygIp9ISL5G3gtU/r
         MDdNvEgpBbOt32HujAeOlvFIqu3i1OAa1aF5C9+5pH+JYU9hzx1VEY2Jf11d7AV1t7XE
         Xs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730042132; x=1730646932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bum22WnyTksV3KoJTMcnzxkgJPfqamSymo1x2t4YE4o=;
        b=jPUyoSeJKkzTDkDMAV9yqT7LFna05nXsAqVtTEGMQSynVMEnITq02Ez4hjER/f6kTd
         aEKZjtETlSQmyYyNbfUVL9BoHymHcfZDcM93YYq7JAoQdv7CsO8m6OynfZdsRpo8eMdc
         FC7FIAckwNUcos+2so2qrfPppKJxVH/ecQWDnwth5FC6pHjQonrScXFMn7dLVNRfldeo
         wJhmboHqgmKD90zswJKAknmdxwbgjtm76O4Qr7/wAjkQUWWygCgxzivroaIICRlQDDt0
         56rMOBgqR/2an/Eu/rWUcMGeIqmNk4Zn4OSvurGH8iergDIB4GiquCbYCqknm9dahnE6
         6BPg==
X-Gm-Message-State: AOJu0Yw9QBuifonFFIS/S/T/dRMqT3bNPyCA2EgJ4aQ2LXOa7Ol9VID6
	gy26+vYHsRoMoSzVjeacQknHpI54kFRdP+Fc3U1RjtFuVFmRsQLXxNWh6g==
X-Google-Smtp-Source: AGHT+IH8ShgJsdvCn6CmHfEsmDJFtCVN8+hWS5yUVMnN50UTvJk3x8420vNXlgrqE+8zAEWxd1kPWQ==
X-Received: by 2002:a05:600c:354b:b0:431:508a:1a7b with SMTP id 5b1f17b1804b1-4319ad335c9mr52937375e9.34.1730042131785;
        Sun, 27 Oct 2024 08:15:31 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm6998460f8f.32.2024.10.27.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:15:31 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-bleak: upgrade 0.22.2 -> 0.22.3
Date: Sun, 27 Oct 2024 15:15:21 +0000
Message-ID: <20241027151521.6034-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 15:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113244

- Don't change ctypes' global state bleak.backends.winrt.util.
- Improved performance of BlueZ backend when there are many adapters.
- Added support for Python 3.13.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../python/{python3-bleak_0.22.2.bb => python3-bleak_0.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_0.22.2.bb => python3-bleak_0.22.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
rename to meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
index bb1d7c2b1..c0150c790 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "c746071a3fcc3b5e69db6d6b23445ec3505d7730"
+SRCREV = "2e6890f68f6718b4f92e602b9b926aa3d107b556"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
 
 inherit pypi python_poetry_core ptest
-- 
2.43.0


