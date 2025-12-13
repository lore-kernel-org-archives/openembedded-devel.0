Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DD4D5B164
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 20:18:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12774.1765657104775743347
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 12:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abEb2pbt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1321001f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 12:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765657103; x=1766261903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+xHkpeJl2Q1X0cX1mznYx7CCzXxta0S7XvC7ydqpT0=;
        b=abEb2pbtdWjku8GBHJBw5XkWdHIH1kVz7uuQZg0FsRcH2kGZ5tIftqKOhEMA04/78M
         RFVsLUPEZys595b7ypE8id87Hyt795CKP+kP6a8/tD9Cf9NaZnll61RzklLLXu/5grg6
         MTeHNJc9N16UIij6/GeSBlpvfM9dPnUchiRYGqik1jzAbel3ouhKGJf1i58hV6oISNIM
         ZCZ1EaTZ2BnepWTN7U8sciJG18Sz5+T1Bl6mkyddQnkvfLbl2Pil24MtJao0NSc1VIvf
         F88HEj3eChoOGxqzzlwC+waU6thjiYtkK+c0eHgeXhL4U63RwRyW/2U1v7rpLdQfRRge
         Z8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765657103; x=1766261903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+xHkpeJl2Q1X0cX1mznYx7CCzXxta0S7XvC7ydqpT0=;
        b=WgzU4nZ+v6XJC/1512AjQxRFhLuUkMsYO2Dlw1g7FEbl2tNmq4vTeC7lEdgWwcQ7xX
         hBdSZ0i6PvB0GzIh/qvu4iuuSewkE0QVOgp73r8IWADVubFj6TDclsP+Q3Xg3iG6yGSt
         be0skiMAlbkdzMHudVBwSY+emts3JDDCJCqRyVQI50W7i4Tnm3uOiH7LjzrLfdHjkEB7
         fkkJsYO9EibtdOsM3AMzP6Ryu21hHv6ZSp0Ck7DYAC6afE9fFKYzJit/jTAeZV96KuO5
         bgjgnFXUVExcto3AzHqco98aYvnXD8VuxrbEV9s691qJLEDbBTMUP3z/fjnOWMXq8xLm
         iCPA==
X-Gm-Message-State: AOJu0Yw54XzcEzI2OPKGnd1dxLo2tyoZ3ZtopXRjXZbljSJ3RIPjb39M
	Il8FFYJhKy/cAwUGIlP15FlIYgzwidIvXVyKCmxBuZGVlOSMYKBmYxMWaYqnbQ==
X-Gm-Gg: AY/fxX4ixA3h2y/K3pJPPaJJLgAMc2ay0rlGhZxc5fQgKolvc17zHPrUsChPy7VG0L4
	8T1HxzMxx0Xtf1DkdCdWr6dNv2bwhtc/yGyBaAgLmkRqaw9WhuOwAv9+UkAJroSsEzjskAoRr2Q
	vwiOdrAV7Tmo4xA3/yxs8qb9HcAuBE7BZosnkBBWmA/QEFETPSOroqpRhLu/+1wsuMhW671q4eT
	8jDepa1mP9fE0c+ck04oXm/RrYl8J3M7aeEV41IugzJvDwD8LAsXkTGrrqo4vUm4jynVMgYlLAc
	9NajH38UQuGSFC4Z2zMCyHTpUouQchC9aXiiaFHRhT3CxS+g8rcQS5uvHO62au7ETkE7Fb/k2Ez
	gMYFPCbCZEvErTNb0Uu0BFB5EzLhF0mgFboui7IvkWwlRdHo4Up//oDKND/0vsgmBBwCqSINuG4
	QU+DqF0K5K
X-Google-Smtp-Source: AGHT+IGOK4vF1oopB0ZEAr86eUjviGRv0HKeUe7Uf8st4hxbOF3Rj4bQdiZcvYoCY8tSaIubGWKKnQ==
X-Received: by 2002:a05:6000:2508:b0:42b:41dc:1b61 with SMTP id ffacd0b85a97d-42fb49001c2mr6102079f8f.35.1765657103080;
        Sat, 13 Dec 2025 12:18:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm4309160f8f.38.2025.12.13.12.18.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:18:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] zlog: patch CVE-2024-22857
Date: Sat, 13 Dec 2025 21:18:18 +0100
Message-ID: <20251213201820.3214133-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213201820.3214133-1-skandigraun@gmail.com>
References: <20251213201820.3214133-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 20:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122643

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-22857

Pick the patch from the PR mentioned by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zlog/zlog/CVE-2024-22857.patch            | 31 +++++++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.15.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/CVE-2024-22857.patch

diff --git a/meta-oe/recipes-extended/zlog/zlog/CVE-2024-22857.patch b/meta-oe/recipes-extended/zlog/zlog/CVE-2024-22857.patch
new file mode 100644
index 0000000000..d5db6a12fe
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog/CVE-2024-22857.patch
@@ -0,0 +1,31 @@
+From 68c712b401538abc3028ecc5071fa787f87afa7f Mon Sep 17 00:00:00 2001
+From: Ali Raza <elirazamumtaz@gmail.com>
+Date: Thu, 29 Feb 2024 11:36:25 +0500
+Subject: [PATCH] buffer overflow patched (#251)
+
+Thank you for the PR
+
+CVE: CVE-2024-22857
+Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/c47f781a9f1e9604f5201e27d046d925d0d48ac4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/rule.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/rule.c b/src/rule.c
+index ae3d74f..38d3fdc 100644
+--- a/src/rule.c
++++ b/src/rule.c
+@@ -866,8 +866,10 @@ zlog_rule_t *zlog_rule_new(char *line,
+ 		}
+ 		break;
+ 	case '$' :
+-		sscanf(file_path + 1, "%s", a_rule->record_name);
+-			
++		// read only MAXLEN_PATH characters from the file_path + 1
++		strncpy(a_rule->record_name, file_path + 1, MAXLEN_PATH);
++		a_rule->record_name[MAXLEN_PATH] = '\0';
++		
+ 		if (file_limit) {  /* record path exists */
+ 			p = strchr(file_limit, '"');
+ 			if (!p) {
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
index 7930c234d1..74a394bf52 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRCREV = "876099f3c66033f3de11d79f63814766b1021dbe"
 SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https \
            file://0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch \
+           file://CVE-2024-22857.patch \
            "
 
 S = "${WORKDIR}/git"

