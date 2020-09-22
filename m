Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.2593.1600758759573748399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2020 00:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h5SzV8FE;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id k14so11191402pgi.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2020 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BPJviFC5qUbC4WPeCcZOzUCKX05e3FOI9pKTeXtyQQM=;
        b=h5SzV8FEYv2YxOwPM2CDja/egRMDoUntgv6cAqQL+ZgNAXVUvBN3BHS31lXn/1nJcs
         i4/5MrMy9J9s0AAWEB62ogYmqgQVurrzR096oMTL7jz1KsMEroQ3Z89kXv8UGT7Ne6jC
         Pugh6XDJ7CBI6Vp0VeWBR3wJDsoRzM2R6OfICin472GF1lH4i7mIhspco6AqUAXd8jVt
         eYjPp1VC98WndK2wPdiiQYLQxOIC2tdePymcpRaerZe9e8aKVfXhGM01qZjfWQsLim0q
         eDbaEJ79MTTSUtWLItHfBwyn/HfLE2Vu+0bJO/cpBlVw0mCQkQ/HDz8iIcZroamum7SU
         c4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BPJviFC5qUbC4WPeCcZOzUCKX05e3FOI9pKTeXtyQQM=;
        b=Kp10+u3DRZQ6RsM6V1F1HSEfCRmd1cucznjP7SLBeIdHzdPMiyXNdd43rc1wSvS9IG
         aTZ0xICVjdKlOrMiLVTT39r+WMygyyLd9zr5s94QFx7c5KktDCYlMnh3nlVl1Lo69C0/
         bjcyo0b5Q3PGh47lFLWFMM/ZUt5Jm9ZiBEBCTY/3y/h75MgaKIob2EtDLOasFfoQfzD+
         cMxgU8vtq/TTEQ5ConPERQd3+ooSe/eQka2GUiEkVVcnoh8LVrC8ry1qtLy2S+oL6Ymu
         x4nwhNNXqeNObRN0dkP/bu0lu8NJruCO39coljjnZZvhmkNindZ8eAyFGepZ9H0v0KAK
         R0lw==
X-Gm-Message-State: AOAM532Jk9xyrAHIz6fwd5V21TpAXxOS67vhz/XUN6B+zjLpvgJ2FGYt
	vXpC/oRky+3bam3BCMOKSPO/a1Xz78I=
X-Google-Smtp-Source: ABdhPJyawTqxx3NZ0ktMJ/sSJS1M+FA0xMo8dW8SOcxohkj5QzlibDTJ1jTuSxLS3S5DQqTiXK50WA==
X-Received: by 2002:aa7:8e54:0:b029:142:2501:34d2 with SMTP id d20-20020aa78e540000b0290142250134d2mr2879662pfr.43.1600758758655;
        Tue, 22 Sep 2020 00:12:38 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8176:7362:ce41:2f0c])
        by smtp.gmail.com with ESMTPSA id q4sm1578119pjl.28.2020.09.22.00.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:12:38 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH v2] packagegroup-meta-python: -jinja2 -markupsafe => ptest
Date: Tue, 22 Sep 2020 00:12:28 -0700
Message-Id: <20200922071228.28210-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

The main recipes for python3-jinja2 and python3-markupsafe
have moved to oe-core. No need to duplicate them here.

Instead, we add them to meta-python3-ptest sub-package, since
we do enable ptest with bbappends.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 914359a868e..caf3b211656 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -228,7 +228,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-mccabe \
     python3-kconfiglib \
     python3-grpcio-tools \
-    python3-jinja2 \
     python3-jsmin \
     python3-greenlet \
     python3-idna \
@@ -455,6 +454,8 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-cryptography-ptest \
+    python3-jinja2-ptest \
+    python3-markupsafe-ptest \
     "
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.25.0

