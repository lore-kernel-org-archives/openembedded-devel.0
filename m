Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF37F36C26
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13770.1776666481873144863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VaZLJEwg;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso4550275e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666480; x=1777271280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQ4Xqz+CG9hYGcpbF6OFVgmu8oxQzBPkgUKsoIIOg/4=;
        b=VaZLJEwgeHk3hkl8U5bCFzuIkch1RjTsi3h+pqHa5VYztVyNK1Y77sUZt8Ri79a87l
         6roLU61TmRvjHYqWHgYRTD9Gp0M1h0olo4NvGeCkXs0AO+NNCr/YAOAt9LDYjwjlh3eC
         YpNaCl3QrE6aGd0cIRlha1vLBS6L5UanwFjA7n18nJHi2vQVZ5VUsSjQ7aQuUxIp1op8
         iFSy5GRvnLOvaERXI4yakt4glouvdVayT1rUmgkANf491QaS7u21bhrP85kcwO3rKQwv
         z3MPTUTGo41+1mVHG5pyliCBkaFWgy/so/Zr/o1sdtENCc+ES7vJcql7rCiUjvqxU/FO
         6psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666480; x=1777271280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQ4Xqz+CG9hYGcpbF6OFVgmu8oxQzBPkgUKsoIIOg/4=;
        b=hjZddcljrSMBbsoRrN+lHPsz7vTxIvxd2uuHvD085/0/3nfT4/XILvq+P6v2pKCsTf
         9FO1kp+Y6NNnaEHJBjbNNa7yP67WMpcEVv91Th7x0H5e2iItZbnTh/Uf8wqrrayoUV6h
         S79eE447TmThJl1XIAwNChQruw15d3OJdmxC5x5i8nUYLyFyN5EJoAPeM0Gf/Zdd7LAd
         tyw0dU9ZzqPhGWDagdVD4EmqcdqeSn2oDHzVJguFZ0xyUywJuvt0Md5sIL9iBvOyeY72
         vZbsf6sGlh+uuJxMVw9mByG7vQ/cedhdnwYXx1gxzvDhp7dkJNs8UTt0ldtI9OsyslI+
         7tyg==
X-Gm-Message-State: AOJu0YzzIDeF2JPjQ6ll/kOJGDltQE7UX+V5JcFNTmDeSsKSeU4/6BBH
	NnWbf30Ov5KXoBkJusvh7U5uSuCBCPReZLxVPcjRFCcw4GpJYS+RLHGhx5Mi/w==
X-Gm-Gg: AeBDietx6omprtniUCrq9EDPpL40ERbr+G14FI3CFEdjEpTIS2GLciGrdarflKiR6lX
	TcejYT0MpInOTNkliAJKveBaTj+7r+Ar41Gs+UlcQ84b3NwSgk20K/1eQsxzmXBbiNAV/LhgPjr
	YqKJFI9fjZklGyDC0JWCg4Z4K51/WuztCCKfQpP2C7LRVYeOQHM7qn/Bxwn5VYp6Jl2rXfLxIZb
	YdVtXYVGpcE4snWI9+gpIHgb9sUMNSLVkvY0l2ovaQx86iUHj+xHwQnytCde4pYjChn0I4OElhr
	Ck674/CEflQNFyrSeJBavup4QM6VpeciFPx1cozsDK/YETARaNQCCkefTDKQmTs9M2icT6t9hIw
	YBhrTlp1KaBqP3+PPydxWDqDwhaeSW6R/OWis8/zJrQyH8oGh3gc8EmGmrfX3L2QWEow1tNYQ4L
	4jHdTZiDeh7yUyOInH+HuFBkXaupmh06k=
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr166078045e9.7.1776666480188;
        Sun, 19 Apr 2026 23:28:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 12/17] libgphoto2: patch CVE-2026-40336
Date: Mon, 20 Apr 2026 08:27:44 +0200
Message-ID: <20260420062750.3795917-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126476

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40336

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40336.patch   | 44 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
new file mode 100644
index 0000000000..1a809b4f25
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
@@ -0,0 +1,44 @@
+From e19c45d3530f1585805711e14aa4ea788e499f46 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:13:51 +0200
+Subject: [PATCH] Fixed Sony DPD Secondary Enum List Memory Leak
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Finding 4: Sony DPD Secondary Enum List Memory Leak (CWE-401) — LOW
+
+File: ptp-pack.c:884-885
+
+When processing a secondary enumeration list (2024+ Sony cameras), line
+884–885 overwrites dpd->FORM.Enum.SupportedValue with a new calloc()
+without freeing the previous allocation from line 857. The original
+array and any string values it contains are leaked.
+
+CVE-2026-40336
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40336
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/404ff02c75f3cb280196fc260a63c4d26cf1a8f6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 7fc120d..fc51d77 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -879,6 +879,11 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
+ 		/* check if we have a secondary list of items, this is for newer Sonys (2024) */
+ 		if (val < 0x200) {	/* if a secondary list is not provided, this will be the next property code - 0x5XXX or 0xDxxx */
+ 			if (dpd->FormFlag == PTP_DPFF_Enumeration) {
++				/* free old enum variables */
++				for (i=0;i<dpd->FORM.Enum.NumberOfValues;i++)
++					ptp_free_propvalue (dpd->DataType, dpd->FORM.Enum.SupportedValue+i);
++				free (dpd->FORM.Enum.SupportedValue);
++
+ 				N = dtoh16o(data, *poffset);
+ 				dpd->FORM.Enum.SupportedValue = calloc(N,sizeof(dpd->FORM.Enum.SupportedValue[0]));
+ 				if (!dpd->FORM.Enum.SupportedValue)
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 269731731b..bb5470fa7a 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40333.patch \
            file://CVE-2026-40334.patch \
            file://CVE-2026-40335.patch \
+           file://CVE-2026-40336.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

