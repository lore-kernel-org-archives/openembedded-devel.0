Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD87CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:50 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32874.1792043141821927505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hycAaxvk;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e831e86ebfso9646305ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043141; x=1792647941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=hycAaxvkNg2arM+DRjW7/vkoN38WeLsH5u00HhskCXx8w3ixniGPbAqdr2xJbP4ziC
         qJWW0Us/z6hW2ag8FpYlVA5Ns+GackrRHpw8QIAKIVfUoopZCv2LZvQ7vSW2MsvTqD6c
         SGZz56vR5+gZfuflotZSvo2EYb5wQEkieoy5e6yG1N6LmuVgCW/YACJKT/9FP6xdX/kx
         LH+aERSCrCMpk1F2cMrXktshfS2QsDApCA93hC7P7Jim4Th/dVbtshhqlyEEBHPZhscU
         gJEG4g3vWsSkRPe/Vn+yO5DaALKPkCmiIsAtBB4V+spyGY6ZCLXfyEJ5ZwNbB7c8CkkA
         MP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043141; x=1792647941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=HmFKsLZ/pJDoWvbESUUd8dIQ+WxUYbc9PbtB+Zf/pXHB0lg5HDwOevgj57th933q66
         oUls3OhE0XY8W5A8xHox8/KGNYrA15X27XniwgsD8lUyTQ7cwowzt7KhNPEa2FMw12Zs
         rbgSybff7DVO7qXP+tn74QOnX+2k73gpMDJhHyVSCny71T6k+mQv1IjZU8DzhiwJY9L5
         +BgsgNHRs59FXSIdd934yjok9J8KmX4eMdWnzLYeLwQZfS8sNDDZJtSvhTkUC47nHU1u
         LCsIVy/kgMmG3h8wOwkjRqwlnWYo8zqToBf95Q6KvGZxz7pIcMt4uW60AuokqUd7Eg9A
         Ar2g==
X-Gm-Message-State: AFq9FYIyCW+sJxnImkKtizCry6BbIjp4naoIPhBN8L9AeIdjsxQF5cj8
	cofxhn0ElDITXlW1BejiLy//qzxQEPUUzU4J4OmszuAXLxsHPuHxkDjQZxUSsQ==
X-Gm-Gg: AYBFou22gDBd5NwAu09hwOazMKKpjYQePi49BE+WYMOPXLhMECQ/sNMMyHzl9Sut6pI
	esN9REdTRz9Df4Qq0KRu2kX8xc/uPr1PpJ8rtoOYFLZBpw4l5e2aVjiCS9t2qb58d8qm5M8TbsE
	j6EjWj4l3ml+80Evi4l+OApfmwCYt7ramdsZR9A1VNd8tQEYI86SuFEwUMcSoo2x+4WbPS6KnH8
	qFB7jN2Y/QjwTCjpGxSmDMtvp24kM6kF60KtngT5/PADQtfYvtizvkpeNkB5rMM8WCeFG26iRRp
	99/L66GqfBbSBt+m+vRe2mWEHZ4Z1TefIIySpgicw+gZn37dWGxqny8OezyuhTiXEYnwcDrqsdQ
	rYNpYgu9wvozGlR8G9BnXkHfQk9CQ3efKHd59ngqliE11IhG3HqPMMwPdcz2KBBBQLwsTGcweEA
	wmfeKM8mu4beeAzDPk+7dO2jIlf8k8ln9u1OJbiKNnTSPSMxxJkravhnIc2JBEpMMkan+lCX7tL
	udaH3M6H8jp3Z28dIGhOCPGcw==
X-Received: by 2002:a17:903:a8f:b0:2e6:20fa:b414 with SMTP id d9443c01a7336-2e842cfbc14mr159658075ad.45.1792043141054;
        Wed, 14 Oct 2026 22:45:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 80/82] gpsd: patch CVE-2026-60122
Date: Thu, 15 Oct 2026 18:42:08 +1300
Message-ID: <c7f1f03d1bf02ef9be29ea1bd4adb9a36441b590.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131000

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-60122

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit da527bb6ba21025da9ff5eafc758156d659f6c9f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2026-60122.patch            | 45 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
new file mode 100644
index 0000000000..da8fa5f4d2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
@@ -0,0 +1,45 @@
+From 50bf98d0240b94bbec6ce06be33cdaf99e2f6214 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Mon, 20 Jul 2026 20:12:16 -0700
+Subject: [PATCH] clients/gpsprof.py.in: ensure sats.used is boolean.  Issue
+ 406
+
+Prevfent command injection by sates.used.  Force to boolean.
+
+(cherry picked from commit 5a9c44a42136b9bb98d460a8a716e9fd344a8d93)
+
+CVE: CVE-2026-60122
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5a9c44a42136b9bb98d460a8a716e9fd344a8d93]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index e91367ee3..07123d417 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -334,8 +334,11 @@ class spaceplot(plotter):
+             # get sat used count
+             sats_used = 0
+             for sat in self.session.satellites:
+-                if sat.used:
++                if sat.used is True:
+                     sats_used += 1
++                else:
++                    # ensure it is boolean.
++                    sat.used = False
+ 
+             if 'altHAE' not in self.session.data:
+                 self.session.data['altHAE'] = gps.NaN
+@@ -783,6 +786,10 @@ class polarplot(plotter):
+                     used += 1
+                     if 'polarunused' == self.name:
+                         continue
++                else:
++                    # ensure it is boolean.
++                    sat['used'] = False;
++
+                 if (('polarused' == self.name and
+                      sat['used'] is False)):
+                     continue
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
index 52d86503a1..2bb70aca46 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://CVE-2026-58459-1.patch \
            file://CVE-2026-58459-2.patch \
            file://CVE-2026-58459-3.patch \
+           file://CVE-2026-60122.patch \
            file://gpsd.init \
            "
 SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"

