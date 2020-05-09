Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.6512.1589012888766052021
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 01:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RdIEc7MG;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: net147@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q124so2011894pgq.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2020 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4Rfnrkd//D4ph93rmujbWBKtafOi0At1iJzoc5pNWA=;
        b=RdIEc7MGbHIu/JIuO4SMZtHnRXmIGWvJ6eCSergP7kgmU/kxG/fz5hP8CUXFwTNGOY
         yRBRWILTTcJp8mapdfql1sqrkNJwJWhdInMw4bSRBNPTEJmpido52timhwLj3MDw90Hr
         mdPtU815WZ0YMH/7E6NSi1TRlSiYIWc/DTfjCfcnC4OwpFepHzdtU34udIaeC1TXyEhe
         rbXjQ97+5/l0/kYMiioBeHHXZ2bRaJzPCM7Ul6OFxGK2b5z3ubEaly+meLcZUsbzF0Qw
         7V+qAoQIkaBtn/LoQTYm3gd6iItBH/lh0nMlfmiWqFbwZmcuFheDBEZB80/NLvKmlAwa
         kCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4Rfnrkd//D4ph93rmujbWBKtafOi0At1iJzoc5pNWA=;
        b=aFQVM/fz6edbcsR/hwswSRVs+OGHP5/1lFJnNyitJbXOG3LFIiK1oydWWf7j6wnnM0
         eKcpZhcYapOr4DNIEYT3C4Dcyqhf5viKM5h3dotwf2In2OlXwK397Ktwia8LQE++E/RN
         vnW6JAdGqWf7m84QObk6Rh48Lwm71s7WlF01k3iA4nK13izZnWjK/w5D/+c/el0PLjGp
         MxO0RIcktu/sPA927fS/kFg6RSfvg/zKw/FVIq8dLLDn5+o8tb8ogS8gik9DRtFoYz92
         55VB+pH4/NiG0aQqfRqS/qwAGFGw4Wi5wZ+3Agyzl4AU93RRuonbl5L3INnmudOdHOeh
         suvA==
X-Gm-Message-State: AGi0PuYsfsDhCXWEJRkfnIJTyoyQzCaMmDUoSenecn8F9wJI4CqKWrvc
	sE8HCovyQIQcQfjUU/Hf7gg=
X-Google-Smtp-Source: APiQypLBD2Ya4sGXnmPA41D+8P8036EQqBOIqhcyNisZaVcDueEpCbLx37ABQ2T5U0Sxv6o/WAyuFw==
X-Received: by 2002:a65:611a:: with SMTP id z26mr5395953pgu.341.1589012888259;
        Sat, 09 May 2020 01:28:08 -0700 (PDT)
Return-Path: <net147@gmail.com>
Received: from 119-18-5-146.771205.syd.nbn.aussiebb.net (119-18-5-146.771205.syd.nbn.aussiebb.net. [119.18.5.146])
        by smtp.gmail.com with ESMTPSA id y8sm4103361pfg.216.2020.05.09.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 01:28:07 -0700 (PDT)
From: "Jonathan Liu" <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jonathan Liu <net147@gmail.com>
Subject: [meta-oe][PATCH] x11vnc: fix xfc NULL pointer dereference
Date: Sat,  9 May 2020 18:26:31 +1000
Message-Id: <20200509082631.2096739-1-net147@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...sor-fix-xfc-NULL-pointer-dereference.patch | 30 +++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch b/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
new file mode 100644
index 000000000..a571ba283
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
@@ -0,0 +1,30 @@
+From 95a10ab64c2dbbec2c8dad91a5ffb73a0d68474b Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 16 Mar 2020 20:04:06 +1100
+Subject: [PATCH] src/cursor: fix xfc NULL pointer dereference
+
+xfc->width and xfc->height for the XFixes cursor image returned from
+XFixesGetCursorImage(dpy) are accessed without first checking that xfc
+is not NULL. This can result in the server sometimes crashing when
+moving a Google Chrome window.
+
+Fixes: 37c946191a0f ("Broken cursor bugfix for 64 bit systems (#49)")
+Upstream-Status: Accepted
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/cursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cursor.c b/src/cursor.c
+index 39e73a6..74a08c6 100644
+--- a/src/cursor.c
++++ b/src/cursor.c
+@@ -1311,7 +1311,7 @@ static int get_exact_cursor(int init) {
+ 
+ 		/* retrieve the cursor info + pixels from server: */
+ 		xfc = XFixesGetCursorImage(dpy);
+-		{
++		if (xfc) {
+ 			/* 2017-07-09, Stephan Fuhrmann: This fixes an implementation flaw for 64 bit systems.
+ 			 * The XFixesCursorImage structure says xfc->pixels is (unsigned long*) in the structure, but
+ 			 * the protocol spec says it's 32 bit per pixel
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 0d84c420a..e3a1914fe 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LibVNC/x11vnc \
            file://starting-fix.patch \
            file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://src-cursor-fix-xfc-NULL-pointer-dereference.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.26.0

