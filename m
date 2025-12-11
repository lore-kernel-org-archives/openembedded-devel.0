Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFABD3E797
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 06:05:50 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2780.1765433141432743245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 22:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hpeDNrAP;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343d73d08faso318114a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 22:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765433141; x=1766037941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keN2wxAAlET7KDaSKMY4zWk5SsF6zv8FbttN5Yg0RbI=;
        b=hpeDNrAPQuwmJCMSzWYntJyAfDtMShsiaEbmcex2oD3eeYeeaZV/KK3cugvFjPoaVR
         Tm8uEur6U+6BKH9jKIrQWz9V1Vye15WlpNO0c69gukjbBKGvd0XsBwOmHpjhS6uOpZ0t
         PcBa9swMGljLhLvN9sYGiYC0sa7cS7L8B8ER4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433141; x=1766037941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keN2wxAAlET7KDaSKMY4zWk5SsF6zv8FbttN5Yg0RbI=;
        b=HFA7NMH2zr/fjdFtUliO6XmKXG3fxXSCj+OpMCzpBQ0K1fxJUzn1O1LDIiOTrQ8CWH
         UuS85EG4yfTad+jg9r2cgmCZTNqOs54ctn+1FubpYMHr8CGYw1fgSOtLYLcTu27avKmg
         Py1BJWKLppbTxbCzZz3Gj/DjYAixcc8xGTlH8Rd5u1Ebndd6ltfd4EKyLhT9cFbsU6iN
         FI8EYkwSjW/1Z8etFhT4ejoOrePf6Hx12W8ACq+NeDaqRniB9J+mzIG7EKQacbcvFDww
         Z+yLu9f+s5bl80kXXa7/l4vEKYe3kBJeLmLzdRXFZjsECyTxUaF7ZOiwkSOkf0pXn9Jm
         3csw==
X-Gm-Message-State: AOJu0YxYksxxF3N0Q9TGHHPkGprvaYgXYav8Jg4Z2RARouFGzeSKj2PV
	G3l1AD4XQwV3hSkhxfeo9STmxrRMn7ykPB1Dj/Ln9B86ujgikmyhqFRJ44uQ+RcPEPPM8kxDn/y
	ZspjJ
X-Gm-Gg: AY/fxX5v2iIn5EjmVRXkw9+PM1FQHS8yHxbxNrcq07uO9ZBCSlsjaosYEyWC1QLh6sM
	E03LjOY7HuQAQYmNmuny3j1fAoTa6K3GyfLwO2uFC2mI+Sl3hdpcvY9sGk9bwurxUVZY0RTHmSj
	3W+qRYZMamFESGSfWlPTtfswGZqJsNJUpo7nRLTFE0vV0C6IroMGDpACt6VcDvN3NSzfW99UUQU
	5JYHmcq9p4QsmvxlGkX81VuMOOwgkmi3mmRKgtP3itwBtxO1BNxBhZg+W/OHpluc5FizXOiwFI2
	a1TNwcR5EJfum/6Y4AjzQiwcksBRbtDAxkVcJ97nWpR0ZprZVCQyShecO+sdpQooFy3VCTP/CQ0
	ozF0JTP0mUiFCPbtKbvxTgZfak4NKZtPGVj6oihykwBXAD4JkIK29Q+R9H+vaOA/e4Jcsr8UGLO
	v2rfEoKhJNhUCxvCux+h8c7XpY
X-Google-Smtp-Source: AGHT+IE6n49Er4oi7d8eIVtNYlq0TD75kFaXZBwUHbRWL4PZEICCFJxXsLtVAsJdhb/yE7JlqsOK4w==
X-Received: by 2002:a17:90b:5289:b0:343:7711:127d with SMTP id 98e67ed59e1d1-34a926aa223mr851982a91.9.1765433140628;
        Wed, 10 Dec 2025 22:05:40 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9275601dsm740139a91.0.2025.12.10.22.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:05:40 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: fix CVE-2025-13499
Date: Thu, 11 Dec 2025 11:35:11 +0530
Message-ID: <20251211060511.192116-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 06:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122582

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-13499.patch      | 41 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
new file mode 100644
index 0000000000..cfae581608
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
@@ -0,0 +1,41 @@
+From e180152d3dae668249f78c72a55a4ba436b57af7 Mon Sep 17 00:00:00 2001
+From: Darius Davis <darius-wireshark@free-range.com.au>
+Date: Sat, 25 Oct 2025 15:01:34 +1000
+Subject: [PATCH] Kafka: Fix decompress_snappy with no xerial chunks.
+
+Instead of returning true without setting outputs, report a failure to
+decompress and return false to the caller.
+
+Fix #20823
+
+(cherry picked from commit 49137f8ce93c9f7ac55b69c8e089ba6a422f633e)
+
+CVE: CVE-2025-13499
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-kafka.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-kafka.c b/epan/dissectors/packet-kafka.c
+index 5fe32f7..7b5ac03 100644
+--- a/epan/dissectors/packet-kafka.c
++++ b/epan/dissectors/packet-kafka.c
+@@ -1788,12 +1788,12 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinfo, int offset, guint32 length,
+         if (rc != SNAPPY_OK) {
+             goto end;
+         }
++        ret = composite_tvb != NULL;
+ 
+         *decompressed_tvb = tvb_new_child_real_data(tvb, decompressed_buffer, (guint)uncompressed_size, (gint)uncompressed_size);
+         *decompressed_offset = 0;
+-
++	ret = TRUE;
+     }
+-    ret = TRUE;
+ end:
+     if (composite_tvb) {
+         tvb_composite_finalize(composite_tvb);
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 0a523013ca..0cc0dfa3d7 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -31,6 +31,7 @@ SRC_URI += " \
     file://CVE-2023-4511.patch \
     file://CVE-2023-6175.patch \
     file://CVE-2024-2955.patch \
+    file://CVE-2025-13499.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.50.1


