Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1868.1795113405646487811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JHsvevSq;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b2f59de176so100512b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113405; x=1795718205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwJeOUwNFMXV3d/91q0xYegAsYLnI7s/rFtLML35r6Y=;
        b=JHsvevSqHE1uuCXVeetUxg4xZhenkR6VT1IsuBgJSC0vRC9ecegPtrnIzO7yDi5LkQ
         xnxsubbD3tN+Lf9SMAk34jTfm3FXss0hMAP3gCcOxbimeW3c48VVs/FSLF8wCgT1YOvr
         139+iokhB5XSiyplYp9Bki6IS3wh7m898o9HlDcaU0A9Bl56Qqw4lRJkIMoAdmo4m4EG
         Qzub5B3mYUcCQ5zmh0JnRwHQXD4RBxc0kxnqz4vYWVaSaCorq6UrVzUxwT+LggJAjOrB
         Y7dou4m7g5PWdXCOVb5xp1wixaVc9fS0vXiu797zWmThl1EtIUl2XotdN8y6fG2gEfNu
         74mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113405; x=1795718205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwJeOUwNFMXV3d/91q0xYegAsYLnI7s/rFtLML35r6Y=;
        b=rKB13IfS+nghlmH4GU/VywXzfJusfEVsDJlyvpu1xqxgHspz/IwJT5l63XMGfmrk+o
         obTny29J2D9LXobhnH/qAWP7WbQXMvGXQ03CUH6D1uh77zKL1cvmSMYBrO0RncH22Rn1
         3J2sXDN2//n7l6LFS11lExq9uxNbGaCDIEUkHPxyd7XRdbUO8GywqCZLhiph499l58VT
         omJ+fRt2WHnXsNs9gIBaSqe9ENEw6oof0sfetuvnMlhIJH48VumAF3DwtqLk8JpELzbX
         HZ73BZJPg45SAULCozdNT3dQIxfL7GgebrI/FDDu+zAaQ+HsTEmW2fqln7kdb0PZQDZz
         gtEg==
X-Gm-Message-State: APuU4Z/tOG0L4G2x9BTmMlRk2Pom3NQFTWhjWo73hgVNgFWCaBHOHDMP
	752pbfmkzihypwv3qo7sDfqpizTRBld2IToTTq210N7ymSlViM2Iigy0o6TGPQ==
X-Gm-Gg: AYBFou15cCe2kvQkOmibxM3Ab1VwJ7CcZ2asqsOcUP19HC5mCm8ip4Dl0zzB5Ik0Cd/
	rXd1qsn0lhaRHY6DARDa+IvBdF406Vz1/4f4KvUw8UbF6mguRFfZSz0Jfs8HLif9HkxHR07qZbg
	HuBJvyw9xiLagOMA32I9aU/xggWcGPwjHVsORtjmnyPBqHchcpVvF+LX9ukFF+z7dtpX+yr1LKd
	XDmiIw3xcMe3s2QH1coUdRyLjgWDXZWOCLN8FIRcMJ8PXY2mw9Ioo4J+j+ytjhMECKIDDYL6SrO
	JYy0BDlvVU5A4LDBV/hA09Xnxe597UIjNKvdQ/bR9PTwFM2FYNE1V3fSXqu9tNYfLjSWGsOGwFt
	nH0wUdqByTqa6Zo5J/BGs5M1Km0VGm9Z0SEL3Am+fn+QX/nT3DSkIrrIYN7LQ9ALA2dAqt4AfPg
	1GXYFT4YmWAXJlj1cJMtvGwuoASgM37fJeLqAwUxf2g2MGa6zCGDFhlpTAwFFZ/3VsvbbTdLIyM
	X0gzS/yJHA11uHCq7gvIpkn8ux7a5H/kSMl9+/Escj9QrCsrI9IVg5+PoUN4r+KF0GsiJ1Wtrqp
	5cwKsHU/mH276tKiImxvN1bq9n9TZXev40Sg2LSeZLxKfYH3ptWZ1fMOdtXYuw==
X-Received: by 2002:a05:6a21:6e82:b0:3e2:1656:b7c9 with SMTP id adf61e73a8af0-4014e949c26mr419899637.66.1795113405007;
        Thu, 19 Nov 2026 10:36:45 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 19/64] libwebsockets: patch CVE-2026-114550
Date: Fri, 20 Nov 2026 07:32:47 +1300
Message-ID: <c2feef6f718635465f5878f4e42b3d86574e4b3e.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132709
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-114550.patch       | 31 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
new file mode 100644
index 0000000000..e398239bda
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
@@ -0,0 +1,31 @@
+From c9e8e1834d7f13038c82963086b90e2ee9c5b44c Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Fri, 17 Jul 2026 05:02:06 +0100
+Subject: [PATCH] ZDI-CAN-31039: enter wrong state
+
+When handling LMQCPP_PUBACK_PROPERTIES_LEN_VBI/COMPLETED
+
+This vulnerability was discovered by:
+Anonymous working with TrendAI Zero Day Initiative
+
+CVE: CVE-2026-114550
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/c9e8e1834d7f13038c82963086b90e2ee9c5b44c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/roles/mqtt/mqtt.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/roles/mqtt/mqtt.c b/lib/roles/mqtt/mqtt.c
+index 85e984015..e743c3812 100644
+--- a/lib/roles/mqtt/mqtt.c
++++ b/lib/roles/mqtt/mqtt.c
+@@ -1238,8 +1238,7 @@ _lws_mqtt_rx_parser(struct lws *wsi, lws_mqtt_parser_t *par,
+ 				 * Otherwise consume the properties before
+ 				 * completing the command
+ 				 */
+-				lws_mqtt_vbi_init(&par->vbit);
+-				par->state = LMQCPP_PUBACK_VH_PKT_ID;
++				par->state = LMQCPP_EAT_PROPERTIES_AND_COMPLETE;
+ 				break;
+ 			default:
+ 				lwsl_notice("%s: puback pr bad vbi\n", __func__);
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 0b612c6f4f..424f5633dd 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://CVE-2026-10650.patch \
     file://CVE-2026-19773.patch \
     file://CVE-2026-78161.patch \
+    file://CVE-2026-114550.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
