Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18974D37E25
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9448.1768395704886291230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YG21XSdu;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4668599b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395704; x=1769000504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob0DqfaYCC3IC3/4Y47C4Bon43v7jtDsj8qMFwPa45c=;
        b=YG21XSduagEplkdtWDOXCSRKwuzYJgzvfo9Irko/JrqGpVnv97u8Eb55SyzQQdL+2k
         ggnPqX0yu/juNuXUteEgAJKykdUQ8NSOhjOrTAr4i5tuPWMWFlthIXIucBPoaO/Ha6Gq
         fBVW2xpZQAdMIq/OC4s9XuRBrn5b9PiJfD1TxXspVVEgnokFOyu/BBuXkWhcuq8i7QT+
         DcoBR/rSOVaXUi9i2ctH8OCniDDDq9r3LkqwuHenhC/tCihSEg7mKUDnlClHWBTrHVEk
         H20MRWmUrHLm2su/84Cm292TCz7TkXa4+jZzkLaIXLF3fR+YrkxJ+yphqiw6grza4JRV
         uzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395704; x=1769000504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ob0DqfaYCC3IC3/4Y47C4Bon43v7jtDsj8qMFwPa45c=;
        b=Urk2NAZeOTqzA3cJDBEWd40cpD5u2X3jOialOIHn0PGEivH2f77RqTXw920V+RoA0O
         Tkqu39o+WWHPDBgVmVy5KhvksHISMbioUtHVyzVmwx2txsvaNFZh4dYc+xBYS7kzLraT
         hjTuMb9NjUNkYICnGWoiTBKJmt4YLwD/vMODkJolmK0s1JKJhaoCRzB9LIuH+nS0mHhu
         DioUkM1YvIs5ZXXpXfaanycuLaFwWIbhMgCcTVwv5281xkt4pqdU1KwwbOQfosBii+qX
         vfSXybkHd3JLCxpjz2gA1ZbJIVVL/kz2wVEqeshPsmstnG88NKYxs/khTcllAKURuQCI
         3eJA==
X-Gm-Message-State: AOJu0YyWk8nU7Soxl6ox1UCW9NDCjyXM9wdKhEAjny27OBbdneRDE/Df
	dwTDG/qiwPOZVVGg6mHT9AqaNETH1ZP3UXXzeX34rRSeqN2wTh62cZ0sc38OzQ==
X-Gm-Gg: AY/fxX4R52P3+tP4JWT2oPGWWlIElCMjXjkDCcBSdYHfR5tSlQW5L4/RlViZJsLW+dx
	Nqhoj8dM1rDD5q+3gR4Y5LO9YSejiO1cJaSfF+DEjP0z5mWXSe0JGrDcc0YB5g9LGpY+BTXgofw
	Vca0afLQ8+MLYF0cwfZyBsNwFEWISKb7muDARsh7sL7f221Pern3LFrQ6YTCe2a6zjBK7p1NRJC
	VVPA+wxoL3lY8VDjGfkX3IYzK3MjgwBbXRX5gHSPjePcpuJwq/iVFuADPQHW4GQoD3ltUbfduDh
	VX44PN4fs8U5oW9DlbiVClSibv8FEaoiy4iH77zXOkiBuum27mt1ylMvZFPx3hwQmz6Y2KQ85XM
	c339W/kE9q0QavlIrtZaMo1bq+liDXulu5K3zyynER6LOTqnpei8hn5+OvPjUBUoSeLa0sM+v3E
	GprjhANnITGjM2XjM0hNwMWK4=
X-Received: by 2002:a05:6a00:4144:b0:81e:6d2d:90cc with SMTP id d2e1a72fcca58-81f81fffd7dmr2428522b3a.61.1768395702371;
        Wed, 14 Jan 2026 05:01:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 16/20] python3-twisted: patch CVE-2024-41810
Date: Thu, 15 Jan 2026 02:00:53 +1300
Message-ID: <20260114130100.1016416-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123469

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-41810

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-twisted/CVE-2024-41810.patch      | 33 +++++++++++++++++++
 .../python/python3-twisted_24.3.0.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
new file mode 100644
index 0000000000..0c195be23a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
@@ -0,0 +1,33 @@
+From 50ddc840e1518edacbd8b26d246f15255bb5498e Mon Sep 17 00:00:00 2001
+From: Adi Roiban <adiroiban@gmail.com>
+Date: Mon, 29 Jul 2024 14:28:03 +0100
+Subject: [PATCH] Merge commit from fork
+
+Added HTML output encoding the "URL" parameter of the "redirectTo" function
+
+CVE: CVE-2024-41810
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33]
+(cherry picked from commit 046a164f89a0f08d3239ecebd750360f8914df33)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/twisted/web/newsfragments/12263.bugfix | 1 +
+ src/twisted/web/newsfragments/9839.bugfix  | 1 +
+ 2 files changed, 2 insertions(+)
+ create mode 100644 src/twisted/web/newsfragments/12263.bugfix
+ create mode 100644 src/twisted/web/newsfragments/9839.bugfix
+
+diff --git a/src/twisted/web/newsfragments/12263.bugfix b/src/twisted/web/newsfragments/12263.bugfix
+new file mode 100644
+index 0000000000..b3982ca0fb
+--- /dev/null
++++ b/src/twisted/web/newsfragments/12263.bugfix
+@@ -0,0 +1 @@
++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fallback response body it returns (GHSA-cf56-g6w6-pqq2). The issue is being tracked with CVE-2024-41810.
+\ No newline at end of file
+diff --git a/src/twisted/web/newsfragments/9839.bugfix b/src/twisted/web/newsfragments/9839.bugfix
+new file mode 100644
+index 0000000000..1e2e7f7298
+--- /dev/null
++++ b/src/twisted/web/newsfragments/9839.bugfix
+@@ -0,0 +1 @@
++twisted.web.util.redirectTo now HTML-escapes the provided URL in the fallback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-41810).
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 272aecb8b0..d90bdb227f 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 SRC_URI += " \
     file://CVE-2024-41671-0001.patch \
     file://CVE-2024-41671-0002.patch \
+    file://CVE-2024-41810.patch \
 "
 
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"

