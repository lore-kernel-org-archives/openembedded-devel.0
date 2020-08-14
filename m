Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.12572.1597383436762417898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RBjbEaVY;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id k18so4013935pfp.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vu8iqQNsJ+JWORotX7GjpmCwrOJmzDnpGTtfgkNAvT8=;
        b=RBjbEaVYnpPLf6mV6y2Dc5x4GpGcGuHEjNcXu2XiJ3lvptIdEwaiNmWx0iH0MeTYlI
         2qc6hZJguSc5317STRzj1snHM4w1ojJdu5adD8m5HLQua0NZ1LpYxVBZTiV6B/Ruu53z
         x2vTGRCtRadlLLRGPfDkXyCG+rHCdQuS/Tdv9Uq+qmt0BkYpg7igccWIN/Vtu2T+JvG2
         Drz+oawp1fyWeHXZNFpXbEoTZifOX+g0kK316qegwgnZNMVyZwcUhfNd1RjzwzneAsPq
         RDf3iQOqTdCoxZfC7SNLBpZy3+kcE5Cw4eL4jQkOmZhIkwbcG7VXKK/q5RpZnwk2lZm7
         V2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vu8iqQNsJ+JWORotX7GjpmCwrOJmzDnpGTtfgkNAvT8=;
        b=tx5ufoZ9NuyBJ2WjmOlVgSA/LHjYDGjkK+qjsV3wyKISMGBP0gmqtaVd6M1Ud4CXuw
         2bBNZZsVP+tdsV5zaL82BgE1BhSHNdqy1HbyRuC2U6yS+KC+bd/wAgiUBRYF9CWYWbJb
         XphU5utDcqzP35tywiU+/eDBGUqu5SYY/jjWj/Q0XqWVI8kjXHfHvlx7AjXIzLmZxpYI
         jeLa4Z1tpewI8tMQBmE1PyXo8vQXWz9DDW/6pcI2dgcFUXxAHXlE2RNaF4Ag4hQkmgbn
         TAOE6ElTwxWUOkL20xjnoXRBg2ROtgN3jPKt8lZ03ocysajesHRcK2w3bTrBlDNyGOUE
         rpWA==
X-Gm-Message-State: AOAM532xnEeg2cmJNwXsIO0Y53KeFBcuR4YtAKZBTkK0MQ6O3vekSQuC
	Gf6VBhBq39vfp7pI+UsBgjnn8AknvoGqAA==
X-Google-Smtp-Source: ABdhPJzMIA3cycIE4x2yAmRIoGrSahE2fPpbZ+RgaoepDs0VCJIA8kutamUMVDLGea77VE+w2/GvIw==
X-Received: by 2002:a63:565d:: with SMTP id g29mr755795pgm.220.1597383435979;
        Thu, 13 Aug 2020 22:37:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/21] tcsh: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:52 -0700
Message-Id: <20200814053657.1701247-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...move-defining-handle_interrupt-twice.patch | 28 +++++++++++++++++++
 meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch

diff --git a/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch b/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch
new file mode 100644
index 0000000000..d6d6ae06de
--- /dev/null
+++ b/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch
@@ -0,0 +1,28 @@
+From 2c77b61506aa867a873e3691214983b3eb7f652d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 19:49:35 -0700
+Subject: [PATCH] Remove defining handle_interrupt twice
+
+Fixes build with -fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tc.sig.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tc.sig.c b/tc.sig.c
+index 77659ca..576605a 100644
+--- a/tc.sig.c
++++ b/tc.sig.c
+@@ -56,7 +56,6 @@ int alrmcatch_disabled; /* = 0; */
+ int phup_disabled; /* = 0; */
+ int pchild_disabled; /* = 0; */
+ int pintr_disabled; /* = 0; */
+-int handle_interrupt; /* = 0; */
+ 
+ int
+ handle_pending_signals(void)
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
index b30c3434e4..541f5505f3 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     https://astron.com/pub/${BPN}/${BP}.tar.gz \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
+    file://0001-Remove-defining-handle_interrupt-twice.patch \
 "
 SRC_URI[md5sum] = "f34909eab33733aecc05d27adc82277b"
 SRC_URI[sha256sum] = "ed287158ca1b00ba477e8ea57bac53609838ebcfd05fcb05ca95021b7ebe885b"
-- 
2.28.0

