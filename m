Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E15CC636D4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:16 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.13426.1676135165782082607
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=by+MpImL;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id dt8so7080897oib.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSjG0IBpi8FkDbjsaZsTZOf9Ezjg9OoSEXaxuT50RmI=;
        b=by+MpImLPYtIIe2zUsZUmpo1VQMijDSM9V8gHbxxHNNDkX6FkBYzouk9DL1m32+p+k
         udo5SOm6ZX77MO32n+FeZ5s2wr0q5luicIivtN70ED4u1rdTdR+3gBdIwi3dE4GLublK
         iIwg8mG8NkCGINngRxvHSweomkKzYfkp8BdzVSwiXr6t0W4JIqPDbFQi+iotA5uiKSwV
         JoRsWCGPZyfE/hc0fd4ZbSB3K5pnaKf66jevdiMkb5B6IRcCyfK1cNje7CZKx8DwuE/h
         38GbyrHh4tmz0Iwivd2mN0N5088v4ETrMXLK3qD/QD3G9Te8tB9pxRUilyYmef+R3ZUu
         oHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSjG0IBpi8FkDbjsaZsTZOf9Ezjg9OoSEXaxuT50RmI=;
        b=M7Qm/btAwTmAYi5y1BXfb9sCo/xK1/EE0VY1xUkXJJnpdEpuNgFCP91ACFuwQMW35O
         S/UG/H6pC5Nh0STnUSJ541gNi2OVGSXB3jcpKb3upmOoewOO1eHajsifQ6HKQrw7DroB
         1ROI7U1s1Pd8Hn3k71hTtKwveGbnesBSMahiF8HnXDGS4grjev4n9yRU4LCKGESiKyeh
         93UrY/dBovCyqSXGyR5VYpf60fVP/vreLwlWQx30vm/ulgFkzilZdS6E7Z8ajYoB2jK+
         iTmYQaXBn0HlDWMS88gQUGmw5sNHLUu8vYspGlwmBNM1fx0PejtJxt3yv+6MStzCeNSA
         7aqw==
X-Gm-Message-State: AO0yUKW4ipKqoAK5AwqAuAFULjg+N6A+ZnDTfeQIk6O6LXBQkMjbOlnu
	VcUIwjFO4/Wz/6SkoCP4jUE2pUrbFS4=
X-Google-Smtp-Source: AK7set8rWS8Tu++FK1RFYScw7WS3QiPaH811AoX9IlapbPWQkBnocDFKEdZorwUGducxJU8GjGhawA==
X-Received: by 2002:a54:470a:0:b0:37a:fcd6:5c09 with SMTP id k10-20020a54470a000000b0037afcd65c09mr7770744oik.49.1676135171233;
        Sat, 11 Feb 2023 09:06:11 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chee Yang Lee <chee.yang.lee@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 6/6] tinyproxy: fix CVE-2022-40468
Date: Sat, 11 Feb 2023 12:06:01 -0500
Message-Id: <20230211170601.3988339-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211170601.3988339-1-akuster808@gmail.com>
References: <20230211170601.3988339-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101041

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 795ccdd86cad05c425adae15af27797f42f33c56)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
new file mode 100644
index 0000000000..4e2157ca75
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
@@ -0,0 +1,33 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7
+Upstream-Status: Backport
+CVE: CVE-2022-40468
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 86f57d88ff..999deff4de 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2022-40468.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"
-- 
2.25.1


