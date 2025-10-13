Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744ADCCD18C
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:00:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.53083.1760382031649315168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZHfkElp;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2680495f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760382030; x=1760986830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMUXo/REbZ9/BfrTiuAJaxA7gUsmKwzDKVcMNom8TwE=;
        b=PZHfkElpRFx0NS8q1pFWg9i5vuPRtM+sqGyk148K8GLGDhZKB+tFrQK9A3Miy6/tX8
         Bjbe+neK+WS2KBISsxphBqPHHBNeLM+UvkYU3z2Uj+gqsXvEsqZTMcgdlxY2YUX7FUK1
         qPwfarb45VhUwdeWfSg2u/Qr1xGgJG0l6wXY9Z/zfKkM9IvKgwX89321DMtgXq1IbnPa
         mzROelqDy6NBJtq6AOND0XGVxjiX0Q4ypQLqa5QOVcJH5eMtnFZxhrR+aXofKZ7ry4m6
         ayfYwpBlwj12Cs9mTpN5/zfwIoz1vYwF3IrooiYTx1q0NiS/gRw22Iw9r1AFrA7LLggl
         06yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760382030; x=1760986830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMUXo/REbZ9/BfrTiuAJaxA7gUsmKwzDKVcMNom8TwE=;
        b=ZRnukgjw1dZYl28MpJBzIFs6+WotxD+Chl3s0yzfJGrz5mH45T/TqKsTLXT2adWpfO
         WMTVo56kkpqoFdRxy55H4tjKMSZVrObsrIEM07VeiXGQnpK3OLtz8kWro3qo5Asiw9Ai
         3jpnlM94h9Oc7of6j4e1u7YM/LaPqZlb3twlIKDFcKKQTwfWSQJPJe2Hqwx1BvSGBUb9
         3J+5preCYz6EyBvFWcQmiCh9vWg3Bb05NLSvMANnC7QmQdZDn5FKs/t1ytjpO9bEOhUP
         0nenyVFdVZWuaMcQBfVZxzw13O9sF8vDekgQSIzPmNod3uYSMzUX4OgnIO82y8TaCE2M
         n0RA==
X-Gm-Message-State: AOJu0YzPGSJlmlVCNLhWktLVqk4BCn7l6opbI/QXwFEZ/zsd1UfYrW64
	s7ZyciGjurQbCsU/YaQY/0lpmPA80BUVFixvRpM5FgR79Xwu79/xgHK5zvzZuA==
X-Gm-Gg: ASbGncs6JHZKXw9MxblK0kns+BeNWH+eRu3Lk1G2+N8JBpaLZNNhx52ZkMY7sNvIAme
	0RuHMyT4Ra5kgTNJ7ypL/gN8jM32hEM+OGRAnX00assuJGrPvUB5irfotfZnueRm/isSpVoP05t
	cKdzqYXEsD4eXif+Ml30wuZ7m0k9gyRAaTIW/csZyEHLzpTMYR2TKunRyi2IF2FqlKeOuw5ug1V
	20LiCMA4iQQiqZBZTLLiilrYRlF48Wcf8r/2gvSbrhDGS/lDUbNQjorxqIFQ4eeaPNmxzUie05X
	ZGaqwb08rkKzR+Wx8Ylb8BmyxdWba6M8byarwG/tMW9sGwjV3hyC08PGzd9JVYUxkssarDY+kT6
	fZBkEIlNhF23dw8kJ902F8Tf2zd7x9P7krd4m+NU=
X-Google-Smtp-Source: AGHT+IH/uw6YfngjcXRuetNsLuXr+LHMD9/cvyTXKyCrPPxahZRT/hCn+S4yWWK3giroPtG9D0s4Uw==
X-Received: by 2002:a5d:5c8a:0:b0:415:7a6c:6a38 with SMTP id ffacd0b85a97d-4266e8e6ebemr14018790f8f.59.1760382029773;
        Mon, 13 Oct 2025 12:00:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm19599227f8f.44.2025.10.13.12.00.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 12:00:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] zlog: patch CVE-2021-43521
Date: Mon, 13 Oct 2025 21:00:28 +0200
Message-ID: <20251013190028.486509-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120547

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-43521

Pick the patch that resolves the issue linked in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-overflow-at-zlog_conf_build_with_fi.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.15.bb  |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch

diff --git a/meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch b/meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch
new file mode 100644
index 0000000000..b7ae8a883e
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch
@@ -0,0 +1,25 @@
+From 2f6083e78c4142449580247da470a774d3b2afde Mon Sep 17 00:00:00 2001
+From: XiangfeiCH <chenthrone@163.com>
+Date: Tue, 12 Apr 2022 00:13:35 +0800
+Subject: [PATCH] Fix stack-buffer-overflow at zlog_conf_build_with_file
+
+CVE: CVE-2021-43521
+Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/a5be8b3a8ddc498de4ad041757285136a55d97e3]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/conf.c b/src/conf.c
+index c592153..9eae63c 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -305,7 +305,7 @@ static int zlog_conf_build_with_file(zlog_conf_t * a_conf)
+ 				/* Oops the buffer is full - what now? */
+ 				pline = line;
+ 			} else {
+-				for (p--; isspace((int)*p); --p)
++				for (p--; p >= line && isspace((int)*p); --p)
+ 					/*EMPTY*/;
+ 				p++;
+ 				*p = 0;
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
index 0fda3e6756..7930c234d1 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRCREV = "876099f3c66033f3de11d79f63814766b1021dbe"
-SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
+SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https \
+           file://0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_fi.patch \
+           "
 
 S = "${WORKDIR}/git"
 

