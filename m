Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B3FD277C5
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1251.1768002241537875755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhXZFh6v;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c03e8ac1da3so2052910a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768002241; x=1768607041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HqM0gy9FG+RlYdWk2NTJn+UEfT7aQ950ML+Nr5jcZA=;
        b=bhXZFh6vNhLvVPlmq8Yw70y6cVNfya1ReNbDID8TInPVN4QEBYwKBFPMZjCR+06Ba8
         wTZIbVXzVBZC+2or0wLIo+8bBYfirqCh8vaFeuDMd1ON3ldK8G2gD7Z9JrgL9tI6DUcK
         7tP/ynuTkgewrPoixfsB2cA26wSVxDP9kgF+4eRvpI+v0iragv9EJ54T7mEVyANZT4/U
         uYouRk/M9KMBGYXYxBAbmitjxoYIR0REBu26MX+26ZTp3VnavgZjYaWkx7is0sR8JLuk
         Dv8rClRhvmadjQ+V1s8/I3UyrXpiWnYk7Ek4uOgMZW3BUwlv3LUacEtE2295f34eC5Ra
         ZKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002241; x=1768607041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HqM0gy9FG+RlYdWk2NTJn+UEfT7aQ950ML+Nr5jcZA=;
        b=HiJxFgwgObGwYBp2G0zvi5tUTYkEMY7QhVFC6L0ODFFNm2kKC5cxcWh3qVV8jJLyiL
         A14MitggRTubqyxXlAh1i8QrC15Ezz8/8y/NJ7Fg9uPmrsYnO3uCJ98HTUXF9AiZLiaG
         dpXm8j8+LDTETytV3GLfOeKah+QoikG2SWfHva+4FS1EYdSdicx8oIBXpNzAbgF7GBVo
         YJMYE+JR3Ydvu9NrYVNliNXwzqh9QMN4k1PP35s5qlhCmKG3MdEuw2AERgP9AXiDnAEj
         JwDPlXo3tlk9pTZjqijBLpgGkz7iuyXsCfDLFDVFHE14QbAN41wQr8jF/wJZ6rmKIWJB
         9t8g==
X-Gm-Message-State: AOJu0YxPEvvqJufh0e/5zCKBtoh03O642wGbnomqG/bWayJs6LsnqK2i
	1EmkcywQsVbIN/FoRVzSzmZRZDSXt0LH8qdLHrwQky4iGXZ6JEig3OXg6ztOKg==
X-Gm-Gg: AY/fxX5RtEChV0kwNyQeIRqvdjRVeFEMSaNMP8w0sVD79JetBJO0uEUBkZHCmrBKBpg
	ftKbuh709+d5v8N3tSIvLO+4KYTCo7gBmFVoFtVdF+Q1EWwvhsjxLJeTihPS+7LfoS68hlS6C1M
	EIii2DAt6/45aMWkUJ/ZSKpkmPs3zLJv6SXcAvxyebSaWkwoV/XtdONA578zUYvZnFUs1WM9GlB
	gglwwczjUjPmuomWzsTG117cduYfU1pYYUrDZDuBmSpgZUY+PqtdTM1oRy+tt7N7mtSSaK2XcMX
	sqKWXCkW/OQMIdl35l4vY0WUodavnR74uKwM0yFfBM3tpXkFXcF5HCtPZJX5mLsS7fIGjoFEHvB
	B5MaswW+nYEradYvKjeV1KYFPN53+kGiK9kwkbr7r9XqEcD5Ajw2W0+ltj3rs2tLgFlFcUD3yBo
	UkbZtFhrFJl1vz++zxJY3r+j4=
X-Google-Smtp-Source: AGHT+IGCLeA4+kOZ2pwJhV2OKIXORK4otnAQl02dRhTrOXV881JTOxBpOB10O8G99/9iKJ1AOxGoxQ==
X-Received: by 2002:a17:903:3884:b0:295:290d:4afa with SMTP id d9443c01a7336-2a3ee46179fmr103257645ad.23.1768002240599;
        Fri, 09 Jan 2026 15:44:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm113934675ad.9.2026.01.09.15.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 15:44:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 2/5] libde265: patch CVE-2023-47471
Date: Sat, 10 Jan 2026 12:43:43 +1300
Message-ID: <20260109234346.3098858-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
References: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123314

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-47471

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2023-47471.patch    | 42 +++++++++++++++++++
 .../libde265/libde265_1.0.12.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
new file mode 100644
index 0000000000..3d66758e49
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
@@ -0,0 +1,42 @@
+From 78bd5752157f34e822cefd8ff8959a96a26b4841 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Sat, 4 Nov 2023 15:20:50 +0100
+Subject: [PATCH] null-pointer check in debug output (fixes #426)
+
+CVE: CVE-2023-47471
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/e36b4a1b0bafa53df47514c419d5be3e8916ebc7]
+(cherry picked from commit e36b4a1b0bafa53df47514c419d5be3e8916ebc7)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/slice.cc | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libde265/slice.cc b/libde265/slice.cc
+index 280b7417..435123dc 100644
+--- a/libde265/slice.cc
++++ b/libde265/slice.cc
+@@ -1277,14 +1277,23 @@ void slice_segment_header::dump_slice_segment_header(const decoder_context* ctx,
+ #define LOG3(t,d1,d2,d3) log2fh(fh, t,d1,d2,d3)
+ #define LOG4(t,d1,d2,d3,d4) log2fh(fh, t,d1,d2,d3,d4)
+ 
++  LOG0("----------------- SLICE -----------------\n");
++
+   const pic_parameter_set* pps = ctx->get_pps(slice_pic_parameter_set_id);
++  if (!pps) {
++    LOG0("invalid PPS referenced\n");
++    return;
++  }
+   assert(pps->pps_read); // TODO: error handling
+ 
+   const seq_parameter_set* sps = ctx->get_sps((int)pps->seq_parameter_set_id);
++  if (!sps) {
++    LOG0("invalid SPS referenced\n");
++    return;
++  }
+   assert(sps->sps_read); // TODO: error handling
+ 
+ 
+-  LOG0("----------------- SLICE -----------------\n");
+   LOG1("first_slice_segment_in_pic_flag      : %d\n", first_slice_segment_in_pic_flag);
+   if (ctx->get_nal_unit_type() >= NAL_UNIT_BLA_W_LP &&
+       ctx->get_nal_unit_type() <= NAL_UNIT_RESERVED_IRAP_VCL23) {
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
index 3466d37317..b082faa3b9 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https \
            file://CVE-2023-43887.patch \
+           file://CVE-2023-47471.patch \
 "
 SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
 

