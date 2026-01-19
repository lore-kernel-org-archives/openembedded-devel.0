Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79F8CCF2D5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:59 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32507.1768817151721197676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AvRuLvMD;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d0788adaso26443075ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817151; x=1769421951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Pe+yXGLB/uFstZZq8n/RQbwz8nrP2UoiUb2W0/gToM=;
        b=AvRuLvMDuzaS1gastM+41b8+00zdoYJyxx22mmQUBLW5Y0A2WO+uACy/z0raz5KbDY
         vVupPxnlnRIkAqLL275mjqtOEnEA6F26nIA3FjvixR7Qjs39S/Qg1HGUgm38+j4UWkVS
         2nLSCCKNjSVqbhOIzntx3gfIbUhntAWxKAFfveQyUaIgI+i9gLmvWfeveK6CqwfWCRCS
         CRJiRkyE17AUVegr0dPRfKBhbB7PX9UWxXEr/AsvW/8DN+uEjkU/rb4ogrUkh+1JF+Ei
         qiQf471Gbr1K32rzmRXjGjFXxTNeBi4yWoa1H2nRxV1EmURhZVOk8lUhj5Z1VEUBprqw
         XK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817151; x=1769421951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Pe+yXGLB/uFstZZq8n/RQbwz8nrP2UoiUb2W0/gToM=;
        b=AGumRObj4MvKG8Ah2p4uK0O6ay1SYute2uelftlBQL8krC58d3K4Wnh901OTyPo5BT
         90pxCZ0S1PUe+U62PJAc5OZV0nA/HAXsWBtSLJXud5XyRT+PcGjTrVOATYP2+i8R2fu1
         EpeP0hlr3NNVygoiGc2Bli+2/biQ5Muw8QAzj0y0o4EXI30ohl2VwyPM6soB3kDz2qVY
         pRNk6WA1j9rqKAp2g1xvaEyj2Y9oLW788mYXV5+uWE/aZh2dfql9oeRHEapA2e0+1QCm
         gGTVITu/fcMG/aoa4b2bUV5U6zxdJ+Vl14yKUtvhnkeXDYxAd6zVtK22vLG4HrgjxjFO
         pCZw==
X-Gm-Message-State: AOJu0YzP5OsZbuLhIvvGCXBgrwYhQPsyJaySbisLYsX1D/mNQRuTs0h2
	wYC9Sb5C21Jwe191LGEUfC3XOBb4Hri2tAA6zwi0cMtm6ubH6ssUGeAyjEfIZw==
X-Gm-Gg: AZuq6aIS2epPeUJc9HJB/IwhyIl+fbV137sgTWfzNeHnQ+fwFOfWlltYHowCF0bLxUn
	0wFLaueXB8UJsPtX77Tgdz13gHOZumZsLbYUjE+qlPMIn1CYpRRtf6hzYoTMVrAY4Umd5g4PiuN
	OgF4/eT/S6a/hENEBEtlv17n2xNtphSAmT/0OjtXPaxmxfUuAlJ/Z/1n+rmcoREfmTcltzqW9YY
	1xSkciV5zpqwTRJeNefPGncVShG/O/3JHcEyvS+uXe66oWnigEGTyIF8nfbtLE89vxsDxeJUrpH
	MouSICSZCwFEFKHTdcB4fcoPR0HM7DeBgIpdYcoSrQXRyqzdiPGXX9fT9r5Ic9YurEZS/+vfRRK
	lRaB2eZfEQMEm5FZV6PEQVpZB61u1kn/Gr4ptlplnGPsryOvsHVccK/AL64xCd0lDxAD8lbOhnL
	sPmA6EMp8SwG16ZGhhfZnJe8s=
X-Received: by 2002:a17:902:ce08:b0:295:6d30:e25f with SMTP id d9443c01a7336-2a7177e5ddfmr95458675ad.53.1768817150869;
        Mon, 19 Jan 2026 02:05:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a718f79f40sm90109935ad.0.2026.01.19.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:05:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 4/5] tinyproxy: patch CVE-2025-63938
Date: Mon, 19 Jan 2026 23:05:14 +1300
Message-ID: <20260119100515.95275-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
References: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123628

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-63938

Pick the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7981f52062d444aed1759c674bd3ec024a4f232c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  | 43 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.2.bb             |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
new file mode 100644
index 0000000000..e06e0d3eae
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
@@ -0,0 +1,43 @@
+From cee659d2ac1e4e9d1ce388338f46df6c4bae8278 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+From: rofl0r <rofl0r@users.noreply.github.com>
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index a65ed54..1e5895c 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
index 5b8e9dcd7a..e386d39cdc 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2025-63938.patch \
            "
 
 SRC_URI[sha256sum] = "2c8fe5496f2c642bfd189020504ab98d74b9edbafcdb94d9f108e157b5bdf96d"

