Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B0EC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 03:49:36 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.1426.1686196168550366909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 20:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=OBxAukTx;
 spf=pass (domain: mvista.com, ip: 209.85.210.48, mailfrom: hprajapati@mvista.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b2b7ca1cb8so28790a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 20:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686196167; x=1688788167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LulUMJEUuA/VI25GkvprFyqZ4pa7yN2FUokIIM/XT5g=;
        b=OBxAukTx+eBronaymZhge1k94T/ebT6S325oR13lA3Z0sAvFWyofca7JQosi+LeZFu
         h2O9bg0XNj2M6ttRH0X6DoW4XTQQTaJ5rfA0uww10gQw+wYrJ5V6H2IAmT0X0eLnMGu+
         FVZgGKZCMGAUOZL+fPDF3HA7bBA9681mhK9vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686196167; x=1688788167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LulUMJEUuA/VI25GkvprFyqZ4pa7yN2FUokIIM/XT5g=;
        b=AsGw0L1s2mcxrWZFHESluOzw6Mm4e1aqSoK1NF8TAB3F8F3ubxSCDR9/4HoaHwf8Km
         RvhLEJWK7AsYczEwAEPGOHRslnnfHH/9pNEErjkIvJ482bRCJecEVJod2OBzJ3mPtWSb
         C/HNKSBuwpJTo+xogH5gL8+2SeBb+ecub34EfZ5GucrQyt8zzyOyVeww4QS7VayXBr+k
         UBBMV6RubX6K6swgffc1lQLVVn1efWgDxSiklMNbMNjscYouZksESSjOmhFTjZkkFT0Q
         vSlt8C4BaQBKovrZ27zcIoos+M/16m6Nc2yFSEw1wBAtU1fTP5LEHkkpRAPqg/H9wF/G
         fPpQ==
X-Gm-Message-State: AC+VfDya0Mg1olSkprwJt16Eauezem7/lPG+eLsFMm+z5mIDYgTBMQOJ
	6qrU2ZxkvBBITJYu6EfeMBBLPTuaOF0s8PTqX6Y=
X-Google-Smtp-Source: ACHHUZ5qyddzb1gFQBnBz2ZY839Q6tz5odCdEUy7CF9nzw1dVz8es4xIYmso88JNI5bcefKkZ+jM4g==
X-Received: by 2002:a05:6359:3a4:b0:127:f9d1:a3a7 with SMTP id eg36-20020a05635903a400b00127f9d1a3a7mr5597455rwb.23.1686196167305;
        Wed, 07 Jun 2023 20:49:27 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.249])
        by smtp.gmail.com with ESMTPSA id 2-20020a630b02000000b0051b7d83ff22sm204848pgl.80.2023.06.07.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 20:49:26 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Jun 2023 09:19:21 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][master][mickledore][PATCH] wireshark: Fix CVE-2023-2858 & CVE-2023-2879
Date: Thu,  8 Jun 2023 09:19:20 +0530
Message-Id: <20230608034920.10928-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 03:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103180

Backport fixes for:
* CVE-2023-2858 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/cb190d6839ddcd4596b0205844f45553f1e77105
* CVE-2023-2879 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/118815ca7c9f82c1f83f8f64d9e0e54673f31677

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2858.patch       | 95 +++++++++++++++++++
 .../wireshark/files/CVE-2023-2879.patch       | 37 ++++++++
 .../wireshark/wireshark_3.4.12.bb             |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
new file mode 100644
index 000000000..7174e9155
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
@@ -0,0 +1,95 @@
+From cb190d6839ddcd4596b0205844f45553f1e77105 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Fri, 19 May 2023 16:29:45 -0700
+Subject: [PATCH] netscaler: add more checks to make sure the record is within
+ the page.
+
+Whie we're at it, restructure some other checks to test-before-casting -
+it's OK to test afterwards, but testing before makes it follow the
+pattern used elsewhere.
+
+Fixes #19081.
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/cb190d6839ddcd4596b0205844f45553f1e77105]
+CVE: CVE-2023-2858
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/netscaler.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/wiretap/netscaler.c b/wiretap/netscaler.c
+index 01a7f6d..4fa020b 100644
+--- a/wiretap/netscaler.c
++++ b/wiretap/netscaler.c
+@@ -1091,13 +1091,13 @@ static gboolean nstrace_set_start_time(wtap *wth, int *err, gchar **err_info)
+ 
+ #define PACKET_DESCRIBE(rec,buf,FULLPART,fullpart,ver,type,HEADERVER) \
+     do {\
+-        nspr_pktrace##fullpart##_v##ver##_t *type = (nspr_pktrace##fullpart##_v##ver##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Make sure the record header is entirely contained in the page */\
+-        if ((nstrace_buflen - nstrace_buf_offset) < sizeof *type) {\
++        if ((nstrace_buflen - nstrace_buf_offset) < sizeof(nspr_pktrace##fullpart##_v##ver##_t)) {\
+             *err = WTAP_ERR_BAD_FILE;\
+             *err_info = g_strdup("nstrace: record header crosses page boundary");\
+             return FALSE;\
+         }\
++        nspr_pktrace##fullpart##_v##ver##_t *type = (nspr_pktrace##fullpart##_v##ver##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Check sanity of record size */\
+         if (pletoh16(&type->nsprRecordSize) < sizeof *type) {\
+             *err = WTAP_ERR_BAD_FILE;\
+@@ -1162,6 +1162,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 case NSPR_ABSTIME_V10:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1175,6 +1177,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 case NSPR_RELTIME_V10:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1192,6 +1196,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 default:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1475,14 +1481,14 @@ static gboolean nstrace_read_v20(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+ #define PACKET_DESCRIBE(rec,buf,FULLPART,ver,enumprefix,type,structname,HEADERVER)\
+     do {\
+-        nspr_##structname##_t *fp = (nspr_##structname##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Make sure the record header is entirely contained in the page */\
+-        if ((nstrace->nstrace_buflen - nstrace_buf_offset) < sizeof *fp) {\
++        if ((nstrace->nstrace_buflen - nstrace_buf_offset) < sizeof(nspr_##structname##_t)) {\
+             *err = WTAP_ERR_BAD_FILE;\
+             *err_info = g_strdup("nstrace: record header crosses page boundary");\
+             g_free(nstrace_tmpbuff);\
+             return FALSE;\
+         }\
++        nspr_##structname##_t *fp = (nspr_##structname##_t *) &nstrace_buf[nstrace_buf_offset];\
+         (rec)->rec_type = REC_TYPE_PACKET;\
+         TIMEDEFV##ver((rec),fp,type);\
+         FULLPART##SIZEDEFV##ver((rec),fp,ver);\
+@@ -1589,7 +1595,6 @@ static gboolean nstrace_read_v30(wtap *wth, wtap_rec *rec, Buffer *buf,
+                 g_free(nstrace_tmpbuff);
+                 return FALSE;
+             }
+-
+             hdp = (nspr_hd_v20_t *) &nstrace_buf[nstrace_buf_offset];
+             if (nspr_getv20recordsize(hdp) == 0) {
+                 *err = WTAP_ERR_BAD_FILE;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
new file mode 100644
index 000000000..0a8247923
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
@@ -0,0 +1,37 @@
+From 118815ca7c9f82c1f83f8f64d9e0e54673f31677 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 13 May 2023 21:45:16 -0400
+Subject: [PATCH] GDSDB: Make sure our offset advances.
+
+add_uint_string() returns the next offset to use, not the number
+of bytes consumed. So to consume all the bytes and make sure the
+offset advances, return the entire reported tvb length, not the
+number of bytes remaining.
+
+Fixup 8d3c2177793e900cfc7cfaac776a2807e4ea289f
+Fixes #19068
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/118815ca7c9f82c1f83f8f64d9e0e54673f31677]
+CVE: CVE-2023-2879
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-gdsdb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-gdsdb.c b/epan/dissectors/packet-gdsdb.c
+index 75bcfb9..950d68f 100644
+--- a/epan/dissectors/packet-gdsdb.c
++++ b/epan/dissectors/packet-gdsdb.c
+@@ -480,7 +480,7 @@ static int add_uint_string(proto_tree *tree, int hf_string, tvbuff_t *tvb, int o
+ 	int ret_offset = offset + length;
+ 	if (length < 4 || ret_offset < offset) {
+ 		expert_add_info_format(NULL, ti, &ei_gdsdb_invalid_length, "Invalid length: %d", length);
+-		return tvb_reported_length_remaining(tvb, offset);
++		return tvb_reported_length(tvb);
+ 	}
+ 	return ret_offset;
+ }
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index ff99a7508..758c5e57d 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -18,6 +18,8 @@ SRC_URI += " \
     file://CVE-2022-3190.patch \
     file://CVE-2023-2855.patch \
     file://CVE-2023-2856.patch \
+    file://CVE-2023-2858.patch \
+    file://CVE-2023-2879.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


