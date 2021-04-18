Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15329.1618771865169200269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Apr 2021 11:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHt4EOO+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so4776559wmi.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Apr 2021 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MK5eb4m2R4qx9FjxHme/juClAgAqyMbQcNaYsEWGFB4=;
        b=gHt4EOO+wTqlg9OqvUcMNSoNP+HC9HF/jkut13VtbCx5eR4gZ+uP3xc5AfidZMM5vX
         22JlzPuwW4+Cxy7Q9gUTQI7D9Nap2iwTaP8aVGZ1k32dnbr4u6mh2OD1Tw8rgw3vReDh
         igkW6lffQyQWFBgtg/j5Xogy1rj8OPz1haglSzu6oJJbR41v5sVs7skDybyUv874DOar
         DwScoXVLp02QuxNLvQgJCknBpbue+WdKgF5rCxJb91COEvoZlWPvk2jvM6KAcDdxTDEW
         0NVZcQ74++pxtyENiq4IDnMqNrvHhB6sLvFNPGsZFZTkiSOdgPQi+gLpuSUfti/vpzxG
         BTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MK5eb4m2R4qx9FjxHme/juClAgAqyMbQcNaYsEWGFB4=;
        b=AcMEPF1MyuT8tTiib/+VIc3yOSSVRlObESGM7fXiN3LL99vqJIkROeZ5VqGSh0YhTV
         Lo+msRIJO8qilFui7gQr201dlIhLpkX3Q4bjrelV39FHTn0VU4Rt2JG9WqqfswINkaYj
         wL2FYd4bTWMhHI98hn6H7vGlsrIQqrOt+/Fu9Yg7zKwzMPvPCw0J6Q7pkbphqJOY6pPe
         s2+g3OBPV20Uh5gXLOuqKrFIY7i1OcXeZ4HonYM+Zns8YtldX/3SkMUTtnh79Wu/awtJ
         RvFkegTZix17mbdgGyRIjLaYjaNO/vlotZQf/ZwuYikz734lLMyVB0SBemMmtCEUHdm0
         KmDQ==
X-Gm-Message-State: AOAM531kfcpgPecC7uCWC4OsUqNpNp52wIfacH9ZJbrT3VygO9+imD+d
	3MAdypLuCE/fiU5GYnoK5kuD4t58gk+jPw==
X-Google-Smtp-Source: ABdhPJx48iBS6veqqhyqOHbprTxj+x3kzGoB7vpONd8DlWbtylN+Vz+b0ozO0hsdZeCJfByXwHfy2g==
X-Received: by 2002:a1c:b743:: with SMTP id h64mr17136554wmf.35.1618771863273;
        Sun, 18 Apr 2021 11:51:03 -0700 (PDT)
Return-Path: <rfried.dev@gmail.com>
Received: from localhost.localdomain ([2a00:a040:198:e68a::1002])
        by smtp.gmail.com with ESMTPSA id 2sm15489082wmi.19.2021.04.18.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 11:51:02 -0700 (PDT)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH] bitwise: Upgrade 0.41 -> 0.42
Date: Sun, 18 Apr 2021 21:50:55 +0300
Message-Id: <20210418185055.1642729-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../bitwise/{bitwise_0.41.bb => bitwise_0.42.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/bitwise/{bitwise_0.41.bb => bitwise_0.42.bb} (89%)

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
similarity index 89%
rename from meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
rename to meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
index 037822781..04d4ca6e4 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz \
            file://0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch \
            "
-SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
+SRC_URI[sha256sum] = "d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2"
 
 UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
 
-- 
2.31.1

