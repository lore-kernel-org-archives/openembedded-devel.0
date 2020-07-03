Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4985.1593801092708302676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 11:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CimsRYjC;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: paulohefagundes@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id l6so11083571pjq.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2020 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvBGlvVvrd7YDKC7HsEq2oNdyEaLTgZY18O0Si3SDfg=;
        b=CimsRYjCA6hSqXWQxGEsVywXv4KrvfMkw8z09888kmAOZAidQA0SGD0wpNCHxA7GYo
         eAqKDcRDSIAHl0qYVji/TOSzWCPN/i95th8sIFEQwrtSwRdeWXeJJjSQcZzTAW85iemR
         Vh0ZkioBfNpz5FTAg8mez/namwV2hNqfpnGC4Rcn5OYnDAJ5PFtmFY9HeXAK9dQQnD9N
         KX21Qg28kX7vPGNQLafpowpytK4sMjqYGBcwXHCdsPCHbjHBOt19VHLnl5clHe8ik+Fb
         /2JoaSOc06DyQnau5p35MlOyFNKi4Kymed1hfkw0ShgUo6eAwQmmu8Ltozr5Hf0TTm4F
         feyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvBGlvVvrd7YDKC7HsEq2oNdyEaLTgZY18O0Si3SDfg=;
        b=Al8NHvBn0zjgXyua1fsl+zZ613NO3t6oTmSkRmKRqDnpJkymT8sOHpm7FJNr/IH/Z+
         JRl9V/gMIkhB8bFNtCn+K5aljnn1tg9Dyy5Pd9DgRo17n94BFdCjGU5RKNBKO5pP3rUl
         vGCWSzWhQbjX3DEG+vC6yTMqs9u8AnDaKLj/geIQ5L93NOyyWRtgTxhMMkHQQ4Pnyi0X
         2WT0Am6jQFNEOBlxr/RafaZEb4My6ZNdh/165QKorEQkwLf+SuuHYFLJaibZ+RRBET22
         R1vEnxQItiUt20TG/UoHRJ26rL9RJABuz+xQ7XLZfMqn2r9V9mDT9PNAGanIDjmPr1YY
         /HUQ==
X-Gm-Message-State: AOAM531Ap4GLqmvZTPuEqZReBtUNkN49aaMzZFbsrKtBe6A3zPLTOE2a
	5DnOQH88s2Z7tq+cAv5sQ1a6BvQ7
X-Google-Smtp-Source: ABdhPJyVGUGp5phmsMwNbw0sSnwPJqXANFx21EUr5JfWWdBz601M1n+oFXgD/4HoOSLn/3Qie58xvg==
X-Received: by 2002:a17:902:fe8f:: with SMTP id x15mr30752939plm.249.1593801091916;
        Fri, 03 Jul 2020 11:31:31 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from daemon.og.opengear.com (c-24-11-33-45.hsd1.ut.comcast.net. [24.11.33.45])
        by smtp.gmail.com with ESMTPSA id nh14sm5460489pjb.4.2020.07.03.11.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:31:31 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-oe][PATCH] redis-plus-plus: add recipe
Date: Fri,  3 Jul 2020 12:31:15 -0600
Message-Id: <20200703183115.45146-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

redis-plus-plus is a redis client written in C++ and based on hiredis

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../redis-plus-plus/redis-plus-plus_1.1.2.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
new file mode 100644
index 0000000000..c6b64af432
--- /dev/null
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "C++ client for Redis based on hiredis"
+LICENSE = "Apache-2.0"
+HOMEPAGE = "https://github.com/sewenew/redis-plus-plus"
+
+SRC_URI = "https://github.com/sewenew/redis-plus-plus/archive/1.1.2.tar.gz"
+SRC_URI[sha256sum] = "9ff6050a948907ed7a7670296e6926f2bcc413555fc514adfb3b78ea11faa332"
+
+DEPENDS += "hiredis"
+RDEPENDS_${PN} += "hiredis"
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += " ${libdir}/libredis++.so"
+
+inherit cmake
-- 
2.27.0

