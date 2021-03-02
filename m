Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.155.1614728871603638233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 15:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8A8CNGd;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 18so61179pfo.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 15:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+guXHAiQQaMOiDenvWhG2Y4jEkMz5IUs7lBEA80H8k=;
        b=m8A8CNGd8kfUCQ7xd/Yu1kn0WAyrtjrtQZF9PaBRGPm1Bq7q95bi8Zw3V6ieP/T/Zw
         9tgsJljrYlq8N09JA+buDXCElGJULPklt0TCHZDghKRazL2Cx/c4tXI4SMTpUhtzagP5
         joX3fOb/noN/jZSnOlEB6WFtHYB/I0FBFlcVUo2OifUdUfaVRapuMQYuUxBTvsfipRxB
         wqG2VaYz9BWC3Qd5HCnw/MdDc0AhPU+SSNXBHyzguFDB2Sf+1Z11YbfoqN2XzzrzpL8e
         BiamWsvJerIX0xGVB5naZUEvsvGo1EKv51rAK5tOuMGM8OmYjnmK+cs1mmgnXsU2OB6/
         /lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+guXHAiQQaMOiDenvWhG2Y4jEkMz5IUs7lBEA80H8k=;
        b=stvsdYJWpn8dbH3iXo1I8Q/QPOFz2NJBTmgZuBgc7uHzyNFJjPQufZNZtyPd34Jh9u
         ybwW2UNObx+EIe7u5WCRicLae2bMuCqgSBm0UCXHP4w/r4VY3vqD8xv+jWk2DTw20I9V
         plefARBQxZiS2HKw/LhD5xGiqOj9BHxvY1p7vFMOXdXTQRsXNAVp6oc0y5946eBqQLFg
         G7rsBpA+0xF1XrDBufN9EkZNDWoSD1gr/HlJRK9XJTqKiTqHneljPP+AV4kiKfPtcVoD
         5M67LH4GQRUKO4eS8zUvJC6lwBPjabIiDl/RUGH4Ey42eSlAOyd12Ly8T5zS1U5VPRTD
         nxZg==
X-Gm-Message-State: AOAM532jeyod9h/ktISdWMQpnEk3GAr7JJ7SO8A6CA3fggi5FfVdDx9R
	M3IS/ksG7f1HSz8/kO1A/gR1KUlPX8RhcQ==
X-Google-Smtp-Source: ABdhPJzA4J0aMEjsyF3t9lRsSl5t+6gi5rK52Rhj6Wg9S2EeGBHTijAkRSmzFPYSzJszg9m+f34/6w==
X-Received: by 2002:a62:e413:0:b029:1ee:2b3:488a with SMTP id r19-20020a62e4130000b02901ee02b3488amr21704371pfh.58.1614728870553;
        Tue, 02 Mar 2021 15:47:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id b187sm20152243pgc.23.2021.03.02.15.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 15:47:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Fix build with gcc 11
Date: Tue,  2 Mar 2021 15:47:47 -0800
Message-Id: <20210302234747.1871081-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../vlc/vlc/0001-include-limits-header.patch  | 43 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.12.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch
new file mode 100644
index 0000000000..e1383c826c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch
@@ -0,0 +1,43 @@
+From 1068c7451855c3f9acde9af265b5a790073b1641 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Mar 2021 14:28:27 -0800
+Subject: [PATCH] include <limits> header
+
+Fixes
+SegmentInformation.cpp:397:49: error: '::max' has not been declared; d
+id you mean 'std::max'?
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/demux/adaptive/playlist/SegmentInformation.cpp | 1 +
+ modules/demux/hls/playlist/Parser.cpp                  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/modules/demux/adaptive/playlist/SegmentInformation.cpp b/modules/demux/adaptive/playlist/SegmentInformation.cpp
+index 344e155..8eeb054 100644
+--- a/modules/demux/adaptive/playlist/SegmentInformation.cpp
++++ b/modules/demux/adaptive/playlist/SegmentInformation.cpp
+@@ -34,6 +34,7 @@
+ 
+ #include <algorithm>
+ #include <cassert>
++#include <limits>
+ 
+ using namespace adaptive::playlist;
+ 
+diff --git a/modules/demux/hls/playlist/Parser.cpp b/modules/demux/hls/playlist/Parser.cpp
+index 67110e4..7439699 100644
+--- a/modules/demux/hls/playlist/Parser.cpp
++++ b/modules/demux/hls/playlist/Parser.cpp
+@@ -42,6 +42,7 @@
+ #include <map>
+ #include <cctype>
+ #include <algorithm>
++#include <limits>
+ 
+ using namespace adaptive;
+ using namespace adaptive::playlist;
+-- 
+2.30.1
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
index 046c059fb4..c0074aabb5 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.12.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
+           file://0001-include-limits-header.patch \
 "
 SRC_URI[sha256sum] = "eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879"
 
-- 
2.30.1

