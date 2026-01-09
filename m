Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6132FD277C6
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1248.1768002239254724393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWogsWA8;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so35133595ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768002238; x=1768607038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOH+43RQ6BYrc7UFsX9kR8YvVGUjGlQ1/Ejm8au3NwE=;
        b=OWogsWA8oyqMwOPTdSgSLBS35O4/IyflD2qEiaK1RQ7w9nsdnpolCt5U96ZxXQlkjP
         8bUxWTf6bxb1bBfLaHpCprNcCIX1B+Zb8XdawjJdwL3krCMtgsk23P1Eg2i+RcpHc/u6
         NhSCW22MZjtKAodK165tg8ppgmBRi5z850y34hGaY3APiFc8US/9op8wPK8oTlyjiQZe
         3eumDhhfaSa6dTPGgWmUr4m1WpmnmzBOm1R8ZHVzNg7XrH93DaUzZ5ixx9dpA17fIcFP
         ZFJQcTuzNVFzyuYaruJkae708xqnRg4HHzX04if+5V7xLC3H6kGPmA6MpJGGMyhSwEW+
         Hibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002238; x=1768607038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOH+43RQ6BYrc7UFsX9kR8YvVGUjGlQ1/Ejm8au3NwE=;
        b=vejoekLWHRmL85LNmVCuzHccvoUpGybv3ELfjdSI0mp2htqPa72QcL+CKUJ2Y2eBGc
         4HcU1bn5F+UgQnn0T+4Gv19b4srqH7McnLLW9PNjkJFeDAo7Stuz72rVu5BTW4JZb+UM
         TX4Q2OCRkJWuirWItInFe5KKgHC7kQFO4G5ag5wyOeVjf+VPzxVhgpOK43GtPp8A+BVV
         3wM8Lq3oVUPCCznSxehpvKySOLMnK7iAWGO1iofbuMjZgRU9TV2UE/tJFoQUufLy2oUF
         lWU9wj8KUgObgIWBQnErpPRE2n+0c+icZR7/N1y+2aw5ysK4mB6sr9qG4khSxl4NyNeL
         lL7g==
X-Gm-Message-State: AOJu0Yx1nEq5jPQ3bBjsU901RB7NRitISlzmu1lENMBj3YTYgeNvBq8b
	2Whw/94q+YmyqVD8bJcDgpl1GlqIxMHUhmHj5TFY0tqDfVCvY1bgn1bYrxrPIw==
X-Gm-Gg: AY/fxX6/WOzROnnRnHHqyXzurCIpjxYVbqeGmWo+eNc9G7WscaAdXEMoAC6R3nOTe7G
	EUyfnb6dAcxU5LKKQvBzGj42L2l0ShI3mG50AHaia3jQnaOx2Maq5BVoIwxqpygay+hRIMnO+XW
	1TqwLXJ46AiD7oTvJ0NHiW1hNmKy97NzDqTt2mmlpaHJSmV9Wgdl59JyIGBl26vIwDT2xP/H1MZ
	2/fqw6Wb2DZ0mMxxniSo56JN3i6VnMx/2gSlnKRCXH/7tkbqChNlV2ck2da2BaJVWEcsOngTy8+
	2qFhiJJ1viCSVvf+GPThViO/pKawRHxMyr5/0jcgtMja+PI9uZ0RJlByhKVPMi8rWdNO++Ceo8H
	51riTiACuHu3wM6R1x3MymrHRZTg1+jFSEt/vhCyU7A5118V+BBZjpWIJYPTOAfcOAAtzVhx8d7
	SEkzw3qSmcH1GMTgSysWZGlAg=
X-Google-Smtp-Source: AGHT+IH2ZX7IS5YhHjtJi/GaTrH18TKJd4gNQUd+M796KNCPDWr85381/xp9B3QIXAwQaJUKsHq75g==
X-Received: by 2002:a17:902:ef0c:b0:2a0:9e9d:e8cf with SMTP id d9443c01a7336-2a3ee4bb973mr115506185ad.57.1768002238366;
        Fri, 09 Jan 2026 15:43:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm113934675ad.9.2026.01.09.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 15:43:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 1/5] libde265: patch CVE-2023-43887
Date: Sat, 10 Jan 2026 12:43:42 +1300
Message-ID: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123313

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-43887

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2023-43887.patch    | 39 +++++++++++++++++++
 .../libde265/libde265_1.0.12.bb               |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
new file mode 100644
index 0000000000..f8ab0e1e40
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
@@ -0,0 +1,39 @@
+From e31a5389f2a4967b9ca298a3435d1af2f9a04cda Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Fri, 1 Sep 2023 21:18:48 +0200
+Subject: [PATCH] fix #418
+
+CVE: CVE-2023-43887
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/63b596c915977f038eafd7647d1db25488a8c133]
+(cherry picked from commit 63b596c915977f038eafd7647d1db25488a8c133)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/decctx.cc | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/libde265/decctx.cc b/libde265/decctx.cc
+index 223a6aaf..350f7e7a 100644
+--- a/libde265/decctx.cc
++++ b/libde265/decctx.cc
+@@ -582,16 +582,17 @@ de265_error decoder_context::read_pps_NAL(bitreader& reader)
+   std::shared_ptr<pic_parameter_set> new_pps = std::make_shared<pic_parameter_set>();
+ 
+   bool success = new_pps->read(&reader,this);
++  if (!success) {
++    return DE265_WARNING_PPS_HEADER_INVALID;
++  }
+ 
+   if (param_pps_headers_fd>=0) {
+     new_pps->dump(param_pps_headers_fd);
+   }
+ 
+-  if (success) {
+-    pps[ (int)new_pps->pic_parameter_set_id ] = new_pps;
+-  }
++  pps[ (int)new_pps->pic_parameter_set_id ] = new_pps;
+ 
+-  return success ? DE265_OK : DE265_WARNING_PPS_HEADER_INVALID;
++  return DE265_OK;
+ }
+ 
+ de265_error decoder_context::read_sei_NAL(bitreader& reader, bool suffix)
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
index 3c9f899491..3466d37317 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https \
+           file://CVE-2023-43887.patch \
+"
 SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
 
 S = "${WORKDIR}/git"

