Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D66ED715D5
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14207.1769236214123213541
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEu3xyre;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d21c411so15235455e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236212; x=1769841012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3UYq1webEq96XVEauGYnu63wao1pBSE1evbJ5lMMI0=;
        b=AEu3xyrezKh8l+A1XIrdLH1gDujjKZPlQKb/T6zDkPm2mHVkwaRk6CfZWXvHJNpNwC
         xis50spTichocnqgP8W3krKNXmbfZMOFnITFK+IXBkGEihuTGUJQkfeIzIKw3CpQ6u5I
         2n1S/VapjBdzufQHq2Z9MYMyDWLqZbiexbu/NlkvIcJA+gz/RfOJcM84LAfisbpwR+M4
         s5XEvwHyoTT/DCk9CJSkhIC6hY7WhbLSF7vFwcquzvP0OjFY+wtih9AxjE+lvCtHd31i
         dCkwCmsiaeXE3fvhEsDli/dC9m+lYjIAsqraP8TJetRftW7bJsQqNSsR70gGr35Ubk+h
         K0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236212; x=1769841012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3UYq1webEq96XVEauGYnu63wao1pBSE1evbJ5lMMI0=;
        b=MhgB/OPeLkM4AuvoPKRUx5Y2R2ZEygv8vv29fyL/fxXazWFPkyHk5S9Sgs68DRlBhP
         ehLyeNXFWt0h45GWNoE2CdBwnex4+lzG1xYVy8ltTpYeYY/6kNF3K4NdN0Lby8DH3gGx
         6oEyS3Q69N+DiSonMt7SF9Nj7ItRmB6S3HVPDHl14/eKbIJJDw8tUX13LTmHmwpYIMGK
         KTuW7lkoPj9IclRittHfp1sQ7GaEC9Kzw0kESXn8cMezmRyg419dLTKh5Ysy2iIjZKgM
         570cf9Cpi1TJN3M4QkfLoef64QTSIq0iGbwz595iFg0JMdOoB0PWaTWG5YFSG+YV6Igk
         eo0Q==
X-Gm-Message-State: AOJu0YzawPxl0e/cx8kJXjGcJCx/NAR5yFXGbquIxl+k5QaPSkco+fHV
	I6Qx9wES75q/l4Yr6QsBEv9PHC7gW/oZf7PmwCS50rZTxlJwOttZu2STuHt24Q==
X-Gm-Gg: AZuq6aIZuxR6garkm7SiwDBMopprxfC6Lo6qIxtOKEASSWu0N1/qEK2SIM+vv7tSIxE
	8HeGb++0rOuQ2fALiFjj+l9qDGZ6iDfU1f/bN1nyP6hnPes3z81Ho3cD1Ck5TN9gsYAfXhPtge8
	ND5Rev69CIRCFrTLicWfP0YESlXIhvLbc10EhYmuTXnRfY0SHoDKaLBEqUJprT5zA+Wtgu/gw/5
	zClRNNeETbf3mMruovW1Q/MSapS1YmFsjyPs8/6A7mZb+NBoSX5tj3bBYCrmrr17R2VQajpHYtw
	QV1DE1gvgZK3J76lJgjlrkDITkqltzOk5P3X/MULmcFZjbr9NKo81BC6f4VIe/CH8yAbPiRi8aP
	f+sgSxqBe+cijt6N3IrKNjJzHb9o7koVGdzMq2H6q/9M5WNDaFqHqeggL3Ore5iBlW7zjWed1Zp
	VnUgCeAc6U
X-Received: by 2002:a05:600c:198d:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-4804c9af7f2mr84222715e9.22.1769236212365;
        Fri, 23 Jan 2026 22:30:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 07/13] xrdp: patch CVE-2022-23481
Date: Sat, 24 Jan 2026 07:30:01 +0100
Message-ID: <20260124063007.28313-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123813

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23481

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 64ee8f84c4edfb4d0b9b2e299e1a1afe6a6168e0)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23481.patch            | 46 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
new file mode 100644
index 0000000000..bb2d3c8cfa
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
@@ -0,0 +1,46 @@
+From c77e974080da8267d902f99ca5ab7d22ea02d98c Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:40:25 +0000
+Subject: [PATCH] CVE-2022-23481
+
+Add length checks to client confirm active PDU parsing
+
+CVE: CVE-2022-23481
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c77e974080da8267d902f99ca5ab7d22ea02d98c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_caps.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/libxrdp/xrdp_caps.c b/libxrdp/xrdp_caps.c
+index 5c5e74a579..ac21cc0a18 100644
+--- a/libxrdp/xrdp_caps.c
++++ b/libxrdp/xrdp_caps.c
+@@ -667,13 +667,27 @@ xrdp_caps_process_confirm_active(struct xrdp_rdp *self, struct stream *s)
+     int len;
+     char *p;
+ 
++    if (!s_check_rem_and_log(s, 10,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header"))
++    {
++        return 1;
++    }
+     in_uint8s(s, 4); /* rdp_shareid */
+     in_uint8s(s, 2); /* userid */
+     in_uint16_le(s, source_len); /* sizeof RDP_SOURCE */
+     in_uint16_le(s, cap_len);
++
++    if (!s_check_rem_and_log(s, source_len + 2 + 2,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header2"))
++    {
++        return 1;
++    }
+     in_uint8s(s, source_len);
+     in_uint16_le(s, num_caps);
+     in_uint8s(s, 2); /* pad */
++
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU "
+               "shareID (ignored), originatorID (ignored), lengthSourceDescriptor %d, "
+               "lengthCombinedCapabilities  %d, sourceDescriptor (ignored), "
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index e50accfe17..308822e8f5 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23479.patch \
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
+           file://CVE-2022-23481.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

