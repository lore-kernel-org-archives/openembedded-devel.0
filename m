Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5170.1793782728342376382
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AyMiGRIj;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso185149a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 00:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782728; x=1794387528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=AyMiGRIjjZ85ycpYxJOADi1A5/w2YM3tEfSBGjsxBu2yGTtINFKmqLevUTLAfPfnNo
         7VxlGYVWutGu64ZNm2AYjR5sNiFPH+sqAmLKLEXTanW42qmmpw0cgiT7FcT6jAF1mQ4L
         aMmQie5qGaW65QZCdENYsWCHlkIzBe/B7k/WBpG37o0f8jHCWW54JomZLqs8wVamVF3D
         2vxJjxZ58Rh1C89O+Pt/RiheGpHanh8+/xYeRHakOdmf9B4Ps4HvTLDji1PJl2PQ2y2Y
         AVVTgJ7qHWyf6NpWGSQ/VtzXNA/8OXg2sJLkaONovX+BJAf5WzSeM+GN/P9Kk3WqFYdO
         fCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782728; x=1794387528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=u2JFXX+kT8wzqh/xV/jbnDc7Hn5/FksnfAWEJsAfSNkz57WStROHd+jfznJlni1BMN
         jgG5SlZfdx5zbi5AuKFZkG3GMW9ChftT4FLg6UJFyv8bWhgjxPzyo4Vr3AWMdDn1bbSc
         wJMCOuWLwiXENu20X2PH+TJUKdfcxEcBpN6YEkl+ern1i6mRJMH7r4XzebNzXuQVQpVR
         Zzgb4GgPmo9ni/9qnYOt7aWboQprobqm5FW46B+/HD3HhwBsja/ut9eykG5mTdCmxzyd
         hae/+WYooo9599SGBzGiSv76T6KqxVHpvwR2NM8bSzZsWHsDWNb0KEfaIA0/iZNQHbCB
         0nVw==
X-Gm-Message-State: APuU4Z9W7cRCpN2nAXbpO6/Um/QnsU+2+4v4rmm2qeu6/VSnbliprsSB
	ieQ8Y10XFho6N7+v4ZkIhLbXPkp204kdrwB/Gw+BeURwHeERYOPvhgL9Ki6sZw==
X-Gm-Gg: AYBFou1yKywYI4gBCdbXaghQm2sXQGxLnVop0AvptPpAOpoCv+XOvKGno+KRDwmUABy
	KtZ9JLx5rvd9g55jo1x2/95OpS/ZeSw3EKXPqVBUIzLgM7LDm09RdFa09lzw0mCS8QfVHFdu2Fa
	iPofqRyP1ibbE/PinLHkg7lK+7uI2cMGaybXFJJ6E72bfqJAo2ybT5Uf/7tI+ZcjcYKRNx4swO7
	+ceD/Ax1IWNz8hp37IGIEOFEFUaVH6CZKUMTfYPJduh0BDWrrzpxKCrhaBjQ4GJSToZcxWJnv31
	xhpl5PnQtG4/+/4d0KpgdQsDWx25p+nWkSwX/2VIUiyqYXndWFNz7mlvZgUPeHZtGQcitFj1HPo
	udjc0Cye5maL2Fn0PyBZjQ8+As4xwMD7FW8/taKE0cT/2hJKTsLENlJqmVrM0pIodfA9jcuda4M
	aFYq4RgmrZSjVw4QynzaQ3GkSqweIM/9uyfbri8MKSxTAxI+U4bOeIDutdEc6VWej4kjEyyvQ79
	pDl6Z7un7g8wdzIADi7vLiTJr9nwj6+fKN2eqExS1tnDiMrIcb/SGQKW6JbfLLA0D5XsJ1JyHYE
	7T9B5Y4Y3L3hlT/wSI/MhlDsUiFEk9bqEOQjmMx3TlKqytrKq52bmQaDOsLldA==
X-Received: by 2002:a17:90b:1e42:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3ae896f8250mr13902108a91.22.1793782727446;
        Wed, 04 Nov 2026 00:58:47 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3139981a91.1.2026.11.04.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:58:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 3/4] flatcc: patch CVE-2026-116734
Date: Wed,  4 Nov 2026 21:58:33 +1300
Message-ID: <20261104085834.1877643-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
References: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131837
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116734

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116734.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
new file mode 100644
index 0000000000..a9e5b59d39
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
@@ -0,0 +1,30 @@
+From 0bdd50b31bfaabaef9cd92c1a3da7413fc091684 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 19:38:52 +0200
+Subject: [PATCH] Fix incorrect overflow guard in verifier
+
+(cherry picked from commit 0df9c097a19badc8bd22d93af8fd47bd291e5d9f)
+
+CVE: CVE-2026-116734
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/0df9c097a19badc8bd22d93af8fd47bd291e5d9f]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/verifier.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/verifier.c b/src/runtime/verifier.c
+index e2d1bb6..19243c1 100644
+--- a/src/runtime/verifier.c
++++ b/src/runtime/verifier.c
+@@ -127,7 +127,7 @@ static inline int check_header(uoffset_t end, uoffset_t base, uoffset_t offset)
+ {
+     uoffset_t k = base + offset;
+ 
+-    if (uoffset_size <= voffset_size && k + offset_size < k) {
++    if (k + offset_size < k) {
+         return 0;
+     }
+ 
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 9defbfac04..330aeccc16 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
 SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
            file://CVE-2026-116733.patch \
+           file://CVE-2026-116734.patch \
 "
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
