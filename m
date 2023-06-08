Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90071C7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 06:57:07 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.3261.1686207418626514337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 23:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=YOJcy1oA;
 spf=pass (domain: mvista.com, ip: 209.85.161.53, mailfrom: hprajapati@mvista.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-541f4ee6f89so183316eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686207417; x=1688799417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6I3a2CiV88BEA86cCcFfDrmBwZhscVrsyXnS8Z25p3w=;
        b=YOJcy1oAyS0uSIejM9HU51mFOUyIJhisJ52HgBfTYw+euHQRwevd68RdRkuXWaM3C7
         e9MDXrQaWlGtjCI9zkJx4iuLrU90PlZjr1F92TBVKvu52jOxaHrTN5WO+YOMIlEX2IN3
         5SS7Dwh2pZz3+jg2kQ1DOkNO88c3I+ms949R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207417; x=1688799417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6I3a2CiV88BEA86cCcFfDrmBwZhscVrsyXnS8Z25p3w=;
        b=PIvUo271/Hn1SSj3ZZpyJGGqkHPpnr7Vfeovam2Zr41QyPvhk88uWNtnYfK0VPENh2
         jqIgHagwF3Llq/d5uP0hViqKRtQ4CVOz1xa5YIMSw6y1u0ZgSFx/NI8IXwycxDylr022
         2qoE8hPlPMGiZmojApPCADMqetz2hveYeTjPKFWQbLUeBMAOH8XH9mmasGkQEvDoNnsg
         W/bR3jPAztD02JRZV5fhikAFEVWZGAhdEnfVE2k9e4icK2NKsiVsq5HzNHV2NBnUomLi
         iRPwxfMV2omZI4Tb99GnlJNmV5fgJNHr6H3hT34OafU8MZORyLpPerYPaLkPVPZFp6go
         pMOw==
X-Gm-Message-State: AC+VfDwz1VQ7Az8LUKL97GocPnayIXp0iJKq3VT2Ki8Xgj8QLgYfvxjC
	E7Xhw2X8ODCgP5N04Ob6LnM7jZG11fI9WL8XEq8=
X-Google-Smtp-Source: ACHHUZ7eaYuQN4GFwGYE5jxI9GNgDoKunT1naDV4sAbYxS4RzfH/KYIvErEBb8b2ssqJCLUbqYElLw==
X-Received: by 2002:a05:6808:30e:b0:396:d10:43a0 with SMTP id i14-20020a056808030e00b003960d1043a0mr7504659oie.46.1686207417372;
        Wed, 07 Jun 2023 23:56:57 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.249])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090a154400b00256395cb599sm2519015pja.38.2023.06.07.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 23:56:56 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Jun 2023 12:26:51 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: Fix CVE-2023-2858 & CVE-2023-2879
Date: Thu,  8 Jun 2023 12:26:50 +0530
Message-Id: <20230608065650.12647-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 06:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103181

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
index f99669a62..9550546e7 100644
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


