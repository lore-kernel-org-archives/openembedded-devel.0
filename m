Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643A6C43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 12:18:17 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.6881.1656073093016348504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jun 2022 05:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gfNYKV1k;
 spf=pass (domain: mvista.com, ip: 209.85.216.45,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id w24so2573100pjg.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jun 2022 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+IKA7PuTJ90uBhZunGReOiRJeKvB4ZLKo6wCTRLjsw=;
        b=gfNYKV1kdmuazB6Cr6q2DOe00H5Dnz1zFLrpFSx0byYgjP1HhIzR1IrNsXCxzl9ME8
         g12LWKcEKHh5zDXnCk4luuuMvmRrSoqMmbBXtC+UdGyUDazxGlVtN8xCbRM5W+2k/uv8
         fQWRzpUH0bs+8hg03aX87YPMF/leopzdozSsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+IKA7PuTJ90uBhZunGReOiRJeKvB4ZLKo6wCTRLjsw=;
        b=N9fQ8koFF2oovlg3sBqR+5z8lVMm6+163aS5GsV61fHsC/KJcAbH1iXuGrmFUKwqlw
         mOTKiF72hSxVT9lcoKesi2C9oGtjC91s2seQC1bOjMrU5Bky1/p2hCwoeryIc9UTgMaX
         LGGcB9ff8q5tP55uZzMIDWFIcuzkZ725JzQLd0RX/nesDE/BlO0rc7dbZsA96FLZwwYm
         OSx4l5tZwxN5vj/Wj1DvPmsoSqc1J03cBpGgJysux+HQyzVepj+0dp+Y5xNIHa+P3Z/q
         1foXED5nY8XMVlQEIWQeakDf/xZ7hRUzsP6Tz1ypuhC8Vz4P3G6tGsRYTG4rGmuamybr
         TiJA==
X-Gm-Message-State: AJIora8Is52jYKLDAhlCDsoA0q4s8amqCOc90xQbKyZQ0lI7qT8//U1W
	n0Jp2dyWeD7SVfw3d5UDUtjYTQi4SvisAQ==
X-Google-Smtp-Source: 
 AGRyM1s4e/qgvyOyDdmjjbXgrVPh48hgGDCjdFfPSFqk0tre3TD9YKSgX+bCH1bjy8lZ1+0iIwJcjQ==
X-Received: by 2002:a17:902:d58d:b0:16a:1aaa:bfad with SMTP id
 k13-20020a170902d58d00b0016a1aaabfadmr28716686plh.24.1656073092221;
        Fri, 24 Jun 2022 05:18:12 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.225])
        by smtp.gmail.com with ESMTPSA id
 p21-20020a62ab15000000b0051853e6617fsm1542897pff.89.2022.06.24.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 05:18:11 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 24 Jun 2022 17:48:07 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] xterm: CVE-2022-24130 Buffer overflow in
 set_sixel in graphics_sixel.c
Date: Fri, 24 Jun 2022 17:48:02 +0530
Message-Id: <20220624121802.23761-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jun 2022 12:18:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97589

Source: https://github.com/ThomasDickey/xterm-snapshots/
MR: 115675
Type: Security Fix
Disposition: Backport from https://github.com/ThomasDickey/xterm-snapshots/commit/1584fc227673264661250d3a8d673c168ac9512d
ChangeID: 6ad000b744527ae863187b570714792fc29467d9
Description:
         CVE-2022-24130 xterm: Buffer overflow in set_sixel in graphics_sixel.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../xorg-app/xterm/CVE-2022-24130.patch       | 84 +++++++++++++++++++
 .../recipes-graphics/xorg-app/xterm_353.bb    |  2 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch
new file mode 100644
index 000000000..b7a5f297a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch
@@ -0,0 +1,84 @@
+From 85666286473f2fbb2d4731d4e175f00d7a76e21f Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 21 Jun 2022 10:53:01 +0530
+Subject: [PATCH] CVE-2022-24130
+
+Upstream-Status: Backport [https://github.com/ThomasDickey/xterm-snapshots/commit/1584fc227673264661250d3a8d673c168ac9512d]
+CVE: CVE-2022-24130
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Description: Cherry-pick sixel graphics fixes from xterm 370d and 370f
+ Check for out-of-bounds condition while drawing sixels, and quit that
+ operation (report by Nick Black, CVE-2022-24130).
+Bug-Debian: https://bugs.debian.org/1004689
+
+---
+ graphics_sixel.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/graphics_sixel.c b/graphics_sixel.c
+index 00ba3ef..6a82295 100644
+--- a/graphics_sixel.c
++++ b/graphics_sixel.c
+@@ -141,7 +141,7 @@ init_sixel_background(Graphic *graphic, SixelContext const *context)
+     graphic->color_registers_used[context->background] = 1;
+ }
+ 
+-static void
++static Boolean
+ set_sixel(Graphic *graphic, SixelContext const *context, int sixel)
+ {
+     const int mh = graphic->max_height;
+@@ -162,7 +162,10 @@ set_sixel(Graphic *graphic, SixelContext const *context, int sixel)
+ 	   ((color != COLOR_HOLE)
+ 	    ? (unsigned) graphic->color_registers[color].b : 0U)));
+     for (pix = 0; pix < 6; pix++) {
+-	if (context->col < mw && context->row + pix < mh) {
++	if (context->col >= 0 &&
++	    context->col < mw &&
++	    context->row + pix >= 0 &&
++	    context->row + pix < mh) {
+ 	    if (sixel & (1 << pix)) {
+ 		if (context->col + 1 > graphic->actual_width) {
+ 		    graphic->actual_width = context->col + 1;
+@@ -175,8 +178,10 @@ set_sixel(Graphic *graphic, SixelContext const *context, int sixel)
+ 	    }
+ 	} else {
+ 	    TRACE(("sixel pixel %d out of bounds\n", pix));
++	    return False;
+ 	}
+     }
++    return True;
+ }
+ 
+ static void
+@@ -451,7 +456,10 @@ parse_sixel(XtermWidget xw, ANSI *params, char const *string)
+ 		init_sixel_background(graphic, &context);
+ 		graphic->valid = 1;
+ 	    }
+-	    set_sixel(graphic, &context, sixel);
++	    if (!set_sixel(graphic, &context, sixel)) {
++	      context.col = 0;
++	      break;
++	    }
+ 	    context.col++;
+ 	} else if (ch == '$') {	/* DECGCR */
+ 	    /* ignore DECCRNLM in sixel mode */
+@@ -529,8 +537,12 @@ parse_sixel(XtermWidget xw, ANSI *params, char const *string)
+ 		graphic->valid = 1;
+ 	    }
+ 	    for (i = 0; i < Pcount; i++) {
+-		set_sixel(graphic, &context, sixel);
+-		context.col++;
++		if (set_sixel(graphic, &context, sixel)) {
++		  context.col++;
++		} else {
++		  context.col = 0;
++		  break;
++		}
+ 	    }
+ 	} else if (ch == '#') {	/* DECGCI */
+ 	    ANSI color_params;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 264320212..1862b250e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b1
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
            file://CVE-2021-27135.patch \
+           file://CVE-2022-24130.patch \
           "
-
 SRC_URI[md5sum] = "247c30ebfa44623f3a2d100e0cae5c7f"
 SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac9bb768"
 PACKAGECONFIG ?= ""
-- 
2.25.1


