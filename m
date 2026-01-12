Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A72C9EC62
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:21:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30044.1768213283099717519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbZ+otE9;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3477027f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213281; x=1768818081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko/J/7jH7b0IyzxxGwWuaV0nVPOYS6B34PxlRffhfA4=;
        b=hbZ+otE9JWrjNaR/SWQBRw08oIi+PKoN17tyOiTxQ/f+dnSbEBKOAcggnrBoDEFT6w
         KGWUGYS3b/Vi4mS3JiMfIaiYdZxhGqBI6p7zWnOReZwsLiWIVGkRZF9YeGn73TGBtF9N
         QUIm6RSn3htI2BaQWhiJYgSRdrmCN3Lob4G8Lbx0zLpkbrW+PmM4SV2bRr74dg0tpmQ4
         bJpFnobc+LoBGYgHUiOBDHzYV6lXaB6qrtRtC1EIycPvUQnsg3nY8zYNJl33CI9tf37J
         GKzK7QK1tVkJsWq9UxHfQ1zpDx8gARNDMrE2C1O9y23IFSSJq3kLlLBVGos+IYct2AGC
         G3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213281; x=1768818081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ko/J/7jH7b0IyzxxGwWuaV0nVPOYS6B34PxlRffhfA4=;
        b=c6WpkRHD0pVh8Y3FaU/1JrmSOS0EonHJDHgBA8KZidyZBClv6Eknsy4PTDvQ080TUC
         s7+ctfmCwnnOftWute3QaCVXFJ5g2h6tRSdH+rZdviJ+cK1VHwlHGfay5s5SOzLuJPrj
         4SyhGxdwpw6ovrhAX+ivzdasywZHf4MpsQlPJeWZa9VnYmHGFRGvxAvJcV80VgwhxURa
         AcJjool/O+c+e4WsBEimKldDh+AslM1r0CF4uSFiBs+U6IdkqBVfG/Zf7QDnn9U7NaJp
         epBRlcpbvLF7YNDppShSOUWx2FwfKq1nlvgFtqO32NKJWjAvJI+GDW2yQYPKqq7F1Sx8
         iGBg==
X-Gm-Message-State: AOJu0Yzvy3lqDo+QRyueikPQLdiiCpogYg3sgqir/xEHg2EQHxshYTMi
	804PYrMEW//MQhSWbNBOiiSjoUAsaamApSUPe+j49Mag2SnwY5Po6BlRcyRtaQ==
X-Gm-Gg: AY/fxX4tRsJfC2Hg57a+hpNCwCu29LUijHFCH6dr3ie28bNvI2nBeokvgEhKNEFAZtZ
	737V8BJoZPAPJgkDTotn0t3R+soCs2Lz+TJ9dFHvVPoKom4Wv4NVvCBliSp70XcJ43PScRg8dNC
	3Uu0IyEFcwUzaujm5Bwao1T6B4j9l+F7AFyLkvidVZd+RidMgdPrNGqEBJ8jjEoGM2tKDm8EzwE
	4e7d28QrqZm9x1AdrVqfYVq6CXgywO+BL91q+vtsbwSHvR+ug+opOn7QrRDK+mYjWSh8EQi+4Ds
	tV2dPFKCRDviyw3x3VZICBJKxJJ4RPu5GC/HDs/JH7cEksXoDk9agrVMLJpTd8uFEPORo7LP9TE
	pOfd7KudbEifNUW9UhBAVTxS2EbfI+byxgG/8OZcxtLCOazPmIc/xYwaldmxK0kXOxxEKgAhj06
	2VlE4TeQd6
X-Google-Smtp-Source: AGHT+IFcuGdV7Zw11fpPIg9hwAGAzbPODGVB7C/QBI2YjVeWqzRV7suQaV9LHCdD7L8aV+PFzkS3Qg==
X-Received: by 2002:a05:6000:2384:b0:430:f97a:6f42 with SMTP id ffacd0b85a97d-432c377586fmr22546408f8f.54.1768213281363;
        Mon, 12 Jan 2026 02:21:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm38112342f8f.36.2026.01.12.02.21.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:21:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] lmdb: patch CVE-2026-22185
Date: Mon, 12 Jan 2026 11:21:06 +0100
Message-ID: <20260112102106.453902-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112102106.453902-1-skandigraun@gmail.com>
References: <20260112102106.453902-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 10:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123376

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22185

Pick the patch that is mentioned as a solution in the related upstream bug[1].

[1]: https://bugs.openldap.org/show_bug.cgi?id=10421

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../lmdb/files/CVE-2026-22185.patch           | 31 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch

diff --git a/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
new file mode 100644
index 0000000000..6c85b2b8ed
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
@@ -0,0 +1,31 @@
+From 94ca20e5aed5d8730e045bb945fa3485b28a7981 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 6 Jan 2026 20:52:25 +0000
+Subject: [PATCH] ITS#10421 mdb_load: check for malicious input
+
+From: Howard Chu <hyc@openldap.org>
+
+CVE: CVE-2026-22185
+Upstream-Status: Backport [https://github.com/LMDB/lmdb/commit/8e1fda85532a3c74276df38a42d234dcdfa1e40d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libraries/liblmdb/mdb_load.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libraries/liblmdb/mdb_load.c b/libraries/liblmdb/mdb_load.c
+index d2a3cec..7eccf40 100644
+--- a/libraries/liblmdb/mdb_load.c
++++ b/libraries/liblmdb/mdb_load.c
+@@ -208,6 +208,12 @@ badend:
+ 
+ 	c1 = buf->mv_data;
+ 	len = strlen((char *)c1);
++	if (!len) {
++		/* This can only happen with an intentionally invalid input
++		 * with a NUL byte after the leading SPACE
++		 */
++		goto badend;
++	}
+ 	l2 = len;
+ 
+ 	/* Is buffer too short? */
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
index 065c8559ff..29bfbb81fa 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
+           file://CVE-2026-22185.patch;striplevel=3 \
            "
 
 SRCREV = "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"

