Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F76DEFCD9F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 09:05:55 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36146.1773133547096993689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 02:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=So5RBb7V;
 spf=pass (domain: mvista.com, ip: 74.125.82.176, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be27fa54feso10508239eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773133546; x=1773738346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5EnXffucupdSGT+kHPDFVdxm85EoGhcx0Rz1E05gOk=;
        b=So5RBb7Vbp0CXGullO7auPZ//H3XBDIPF3GcULtwJ1Od4FvV3diRmF9/ci2dwEq92t
         7OYgUrCwR+ak4nS3thrv/jiPXlO2CxiCxjnGTgLVSvdvo4ngIKYZnEXPyw3oKwSm42KR
         d5UXf2vu/IWNEtZn594P4GJrNlGEFD/+maK0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133546; x=1773738346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5EnXffucupdSGT+kHPDFVdxm85EoGhcx0Rz1E05gOk=;
        b=XfRwGLZbEvpLHmnR9JefA57e2NNx/Np57oNDwh4Yu/1PaAhckNPAucgsArTXDj8OhB
         NZo1bMa8aB+B76XgtbfqWNCH9qxmkxspa2b2pP9DDDyy0gkgGZ6NUj+3P/pNZgOIkn3F
         uloFmSq/rZE2XNamvjN7KVEa6phttDOx6LCkBIRMWt4vQ7SeNA5e2LdPIWrxoNS/afqO
         LtfYtOauvD6w19T+zmxMdMCAxJ0IHo/RsvLNK4x6vaL69WaETFjOLbs5/MgW2aX/DBqJ
         xGwr0PDR2GKX1U6VYYfI5Dp8nIE3K8KlvsJRTBx7qfR0WVedXb4VRvi0zGH+qH2RlwGX
         OHqA==
X-Gm-Message-State: AOJu0YxYGMx9CcOj82zv3u0QUtjzZU9JrB2Avm+bFstd8hJXSud3TuzT
	Ul6Kf2g8JmkaorQNh6nGwS0PTer8bdgcKV8SQq7EGAdJ2qPQ4QEHog3KYhp0caDBvXta3Z6SFCu
	+sppr
X-Gm-Gg: ATEYQzzzNZilIOBjq5LFc63q3rkfof9HC4TSnh4QIP5J5vV+iI5GQfGmThq9lHro2d0
	yYMjSBMNpaqWoGP4xOxaIfi2EC8YCe1vQI7RjzK7bS9cFGeHTldb5OPu+mu+8l0W2anQx1cx7Nt
	9hkTbC77db4/MXZ3EXDGq1LYBL9uWjKPb387BpUjtSdEeg2M3K5kZC2MuXEGFxyHn8wip03IZ3M
	HVjEf7DGKwRiT2KGQoW02yLzLF/mA94ggl1lcqaXIhqFoNGLptpTwf1Krme5pp2bGBEVRTyCLeN
	XcB4ipDVB/BmiLtgmfJohnb28eQr+MK3g0UpO79Hm9VTYejyca0SVrTYnTZ0xCa8yAp3yu1MtRF
	v2AKwjuP/XURDKqLu5ATD8y0VMi/EsXsZulLKagNKFcq9XZVzKUUoQ3Gr0VHekErSvpE6UQIXnm
	MaGYhAf6CSlJKaVuru2wYzwfBtow8IB4bS4Sy8ZYDC0xF1/EzXEAdMcKZyGCSiTUzwKpj/wv+2s
	A==
X-Received: by 2002:a05:693c:2c96:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-2be4e08a3a1mr4982216eec.29.1773133545658;
        Tue, 10 Mar 2026 02:05:45 -0700 (PDT)
Received: from MVIN00013.mvista.com (103-216-234-140.swc13.starlings.in. [103.216.234.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be7d30fd82sm1847454eec.21.2026.03.10.02.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:05:44 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networkin][scarthgap][PATCH] wireshark: Fix CVE-2026-3201
Date: Tue, 10 Mar 2026 14:35:24 +0530
Message-ID: <20260310090524.271469-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 09:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125022

Pick patch from [1] also mentioned in [2]

[1] https://gitlab.com/wireshark/wireshark/-/issues/20972
[2] https://security-tracker.debian.org/tracker/CVE-2026-3201

More details : https://nvd.nist.gov/vuln/detail/CVE-2026-3201

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2026-3201.patch       | 55 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch
new file mode 100644
index 0000000000..178125fed9
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch
@@ -0,0 +1,55 @@
+From 5e80615ebc95c3f57235ab2699b03e45d8071a1c Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Mon, 26 Jan 2026 16:44:58 +0000
+Subject: [PATCH] USB-HID: Bugfix resource exhaustion in
+ parse_report_descriptor()
+
+Sanity range check was removed in 739666a7f5acc270204980e01b4069caf5060f30, restore it
+
+AI-Assisted: no
+Fixes #20972
+
+(cherry picked from commit 6f753c79b7c8ac382e6383dfabd7d5be6e2b722c)
+
+CVE: CVE-2026-3201
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/5e80615ebc95c3f57235ab2699b03e45d8071a1c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-usb-hid.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-usb-hid.c b/epan/dissectors/packet-usb-hid.c
+index 9a402ee..a27606a 100644
+--- a/epan/dissectors/packet-usb-hid.c
++++ b/epan/dissectors/packet-usb-hid.c
+@@ -3675,6 +3675,7 @@ hid_unpack_signed(guint8 *data, unsigned int idx, unsigned int size, gint32 *val
+     return FALSE;
+ }
+ 
++#define MAX_REPORT_DESCRIPTOR_COUNT 100000 // Arbitrary
+ static gboolean
+ parse_report_descriptor(report_descriptor_t *rdesc)
+ {
+@@ -3856,7 +3857,7 @@ parse_report_descriptor(report_descriptor_t *rdesc)
+                         }
+ 
+                         /* Usage min and max must be on the same page */
+-                        if (USAGE_PAGE(usage_min) != USAGE_PAGE(usage_max)) {
++                        if (USAGE_PAGE(usage_min) != USAGE_PAGE(usage_max))  {
+                             goto err;
+                         }
+ 
+@@ -3864,6 +3865,10 @@ parse_report_descriptor(report_descriptor_t *rdesc)
+                             goto err;
+                         }
+ 
++                        if (wmem_array_get_count(field.usages) + usage_max - usage_min >= MAX_REPORT_DESCRIPTOR_COUNT) {
++                            goto err;
++                        }
++
+                         /* min and max are inclusive */
+                         wmem_array_grow(field.usages, usage_max - usage_min + 1);
+                         for (guint32 j = usage_min; j <= usage_max; j++) {
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index 81c300fcb5..dbf7017514 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2025-13499.patch \
            file://CVE-2026-0959.patch \
            file://CVE-2026-0962.patch \
+           file://CVE-2026-3201.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


