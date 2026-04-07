Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AC4EDB7E3
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:52:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77698.1775555571040651970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dQ/yrsuk;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so26202395e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555569; x=1776160369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCAQq6mWVdvo8sa70KE4Vy1q6SgcHNFfQ6qxj2440qk=;
        b=dQ/yrsukyFIqEhrCksV/xQR3L5FTmv3MkIPmAed4jPVAWiqOcaqGLHisbPZs2fyE2B
         lGHScgDY0biRRgw2av9Z2s311+tu35aWQr8ERD5DjW2qy0ZkOTv/OysI1PpjCyCqs7QP
         PdCkhC7kMFsVCMo0Ce+es3+hxvPZb9wdg2UJBQVSnlFZ2ihcWPBlZYsLNe3zlkAW66hU
         CLFfmeqtDZkLl9Mg26anrSvxIwoxnZur7bd7YzBV9HndaPyPSViy7JhW8XdxJpYJT8Uc
         sVYZNrFBoz8tnQC94UWcRfEd6tvdoSSJnZnp+dJl1/ETs1qls9vhrC7jcsOqDy81Z6Wq
         VrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555569; x=1776160369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCAQq6mWVdvo8sa70KE4Vy1q6SgcHNFfQ6qxj2440qk=;
        b=bhQ3ABceWIuMgKxSMYQ0pxLOKXpSjLDayBsEObgfb3UVz365+aMdb2yeGn0VN2usEV
         pAGq654Py6B18J9hRbbLrIJMG7pbgtBvLYgHtcH/GFsaaygItnPB++p3vCedYzeDoiGw
         lmpazjtCxXKjGSa9m/A9Mhcwpgb9foYLFkwWgUHjpja9ZhpUz+44NJXwMOAvVXgG/SZ2
         7O4jbUlW18PaM+mS8PoJTK60fLg1keiaP3aA5YvrPS8Wr4i9x4XK5Qer1Z5lBjf+YLIy
         x7NorFEDX2vZgMGqQU8q27vqakDqVPJWPtqZSIj/yY244ReXsS7ytWno0gOfUb5lC9jo
         3mnQ==
X-Gm-Message-State: AOJu0YzGzidLRmmMzvoZM6Uq3t4wEJKk4Fb2qlXG2karGNaU67yky6jt
	8PRuewsaB0b0cXmSyWf6t/yfNC+Yda1EhuI32NVSP2L1PkyY2nS6Nbu7Z8fCbg==
X-Gm-Gg: AeBDiesjcEsXDKiph83fSvH8GJr1he/v329quSF+drOtOdvxwBD/7SLRcvAOa00YaQB
	d67vNjzzP//VfyLh9+cO60ZTG/OZ0iivUAGnzDiJp4vwHPqovEGO40EXYdVGbcVafDJg9ZfYB9/
	8NU0cO8GznU1eN0oyUd57/VWdmFAOZ34NrQstf9x3tGY0wtpAuUqNMvLgcr/qc9THLH8fKHZ4Cf
	JFvvRMZHaaRVno1vPCx3WXMDgqsGBMASNAJuHWNVFg3Dzx7C6p09wF35Q19SqS5gnZMlz/g5+xl
	h2jLBnG+7nXQ4P12DJ+Bc8Ttaxd+UdBeV1ZDbqqTe2cwpqETEntf1aHu9w232+gUnT0pnOh3llr
	v1JnXcH2DgmsvfU8foWK12dJ99OO8U5qKo2Q9jfc9rXPUQ/mBOK36kexfG45LbDQpZBiplKR0mr
	SKOiJClqcmDLSiCKltipgfTHWhGAvXbSk=
X-Received: by 2002:a05:600c:3b1e:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-488996ced63mr236891715e9.6.1775555569285;
        Tue, 07 Apr 2026 02:52:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eccecasm113877725e9.34.2026.04.07.02.52.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:52:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] opensc: patch CVE-2025-66038
Date: Tue,  7 Apr 2026 11:52:45 +0200
Message-ID: <20260407095245.3971755-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407095245.3971755-1-skandigraun@gmail.com>
References: <20260407095245.3971755-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126084

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66038

Backport the patch that is referenced by the upstream wiki
page[1] that is related to this vulnerability.

[1]: https://github.com/OpenSC/OpenSC/wiki/CVE-2025-66038

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../opensc/opensc/CVE-2025-66038.patch        | 40 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.26.1.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.patch
new file mode 100644
index 0000000000..185adc338e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.patch
@@ -0,0 +1,40 @@
+From 3d746f77cc886042776a78158c503f0f61421008 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 18 Nov 2025 14:13:59 +0100
+Subject: [PATCH] compacttlv: Fix possible buffer overrun
+
+Fixes: GHSA-72x5-fwjx-2459
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2025-66038
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/a20b91adc2fc66785c0df98abc8ef456c0eaab9d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libopensc/sc.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/sc.c b/src/libopensc/sc.c
+index c6c51fe1b..253bc173d 100644
+--- a/src/libopensc/sc.c
++++ b/src/libopensc/sc.c
+@@ -1064,13 +1064,15 @@ const u8 *sc_compacttlv_find_tag(const u8 *buf, size_t len, u8 tag, size_t *outl
+ 		size_t expected_len = tag & 0x0F;
+ 
+ 	        for (idx = 0; idx < len; idx++) {
+-			if ((buf[idx] & 0xF0) == plain_tag && idx + expected_len < len &&
+-			    (expected_len == 0 || expected_len == (buf[idx] & 0x0F))) {
++			u8 ctag = buf[idx] & 0xF0;
++			size_t ctag_len = buf[idx] & 0x0F;
++			if (ctag == plain_tag && idx + ctag_len < len &&
++					(expected_len == 0 || expected_len == ctag_len)) {
+ 				if (outlen != NULL)
+-					*outlen = buf[idx] & 0x0F;
++					*outlen = ctag_len;
+ 				return buf + (idx + 1);
+ 			}
+-			idx += (buf[idx] & 0x0F);
++			idx += ctag_len;
+                 }
+         }
+ 	return NULL;
diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
index ce982c4aa9..1109499c44 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -15,6 +15,7 @@ SRCREV = "043343d2df7b09d1938bc3dc313d86a96be457cc"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https \
            file://CVE-2025-49010.patch \
            file://CVE-2025-66037.patch \
+           file://CVE-2025-66038.patch \
            "
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"

