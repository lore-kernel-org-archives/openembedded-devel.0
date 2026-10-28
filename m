Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36214.1793161536600299625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gNeqtf6h;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea138a3497so2535915ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161536; x=1793766336; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hjeCtskHSjIF9aPE/8nL6w960jXKHNYNGpyi4T+0cI=;
        b=gNeqtf6h81CwCUbuQP3s1KI4O2tluStUint1Zns/yQDPardvsGPDIq/WPSkff6Qvb2
         QVG4NGDVAHfGF2RLl879Ok1Yswh0ZLMRsUCQx0HXSVXgEsE96nsk4PM35/d0gfhC0nkj
         q7BYFNyK5UsXR1gfgGuVxKWzXqYxsHNq9h/wK6SeVwfYEeXAFVs0j9JvPNyQQRZSoYWm
         QVpCmoP/I532tK1hfDnhCt6Bcl9nxPrK5hAhA/pDTQBRW4UejPoDU1clOREs7PhY5003
         sKX0nf2yd/0p4Q0cBVpYXsA7dQzsE6J7WzSZ785SkgBGBPIj5yWunrhTgeh6z0LfLR3a
         +LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161536; x=1793766336;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hjeCtskHSjIF9aPE/8nL6w960jXKHNYNGpyi4T+0cI=;
        b=sN4HXzPB1VhatYCnjWmnQic0gfJrrBszTbtn9/MgSU85NfaXoMz03PYe993r3d9qhK
         J+IFMcqOB6bNIA2TlrSmeHxqhD1NwPN6GWeLkV1tit/jfFZhIYQM0vpZObXsb0JNXRcm
         /n6Bmv1RAZXMsQXy+3ag2UNQ0MJiq2kmtOOp3vD9X7JVHi6f0iibIjFbDccHBXmnCC2y
         ewd1ckRvY97+CBiCiOB6wgc7L/XyLt3d3+CcZiRLlv3xkB0p8+GxFrkswEcCOWXVpfJu
         RjSTg+XLTratilKgz2PUyHT1nh3NQYmRk2xm16FDTfv1RceIibprnzyC6ICBCoqEqeSF
         TfuA==
X-Gm-Message-State: AFq9FYJzf7wmcEfK/PvhiMLb3LE+WFUVLqbzKTO5T8v6a6ZAjoIG0iSJ
	7Y5ZoCbyH3WQU2GYTwo0sXB0aXHAT2da+iuK0UIkxOlb7WkD5SVh2Hh7D6vm0A==
X-Gm-Gg: AYBFou1F3u1/f11biK7wv4quHzsx2pTp7O38WdDKqkqCu6UCNKG/H31CWIagXmMqmkp
	SWvCdDenmmH/YCwlCnH3ijM0nAGyxOQA7+41f4I+sc0u8j1q0HCQ613zCWLsHBMY5PXsGNBziCf
	wDYDry9XgSwjVHA1IEZNXAeYSHGA1mExQlNOJZKJfj0L8iLGQrpVsnyAtgSR5NwKqV4yinpgmtH
	rrQ4nRbes/kyhgaXn06i0bivO6YAoc7oCaUuB1ulU2/UQug4OPz2QBesSC5Uk2W5aTs5NS+4ECt
	MPruLVusYLNdBVNedEMLLkpJCjAOEKqYRW+UNi2g2tJnxdWbXtgJWebV2H/Cx6CHTkRmyFB+n5F
	qM9k9MYX7tKFCOBGstsIMhw9oexeYbtLxK4RFfUUVergF93EkYsaFYnUKGM0xf8PNhB7C8vAtoC
	QUkttYrKdLquuHDH58HOhX1mlZeavn4I+TIOOFCxr8U8Z7VyCl8/+ku1nBbUr7CDGDWvyyWPKhb
	Qq6tG3bUwOLktn2anqiYnRhb9JCP9lnN3tuPqmksziEPJftlgHueGiEPTDWDYE14uMz+iI73LjE
	O+ZVyi/Ul/sbHdXp+JsEb/1ohIq+sYqEqDR5HmGld91EAjvInZWwEpvPXM25zg==
X-Received: by 2002:a17:90b:5201:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae58289e21mr899150a91.65.1793161535939;
        Tue, 27 Oct 2026 21:25:35 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 38/60] mtr: patch CVE-2026-14461
Date: Wed, 28 Oct 2026 17:23:36 +1300
Message-ID: <60a1ac73cbd979d2a6e26ac93b091973bbc831f5.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131590
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-14461

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mtr/mtr/CVE-2026-14461.patch              | 32 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.96.bb           |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
new file mode 100644
index 0000000000..6628d9d7be
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
@@ -0,0 +1,32 @@
+From 4c75fae93d9515f3ecdfecc966b8c6471efb7ea5 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Tue, 16 Jun 2026 11:03:39 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20possible=20buffer=20overrun=20in=20asn?=
+ =?UTF-8?q?=20code--=20Micha=C5=82=20Majchrowicz?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 48e1794414d338ce47abc0f27c25ade8788af9c3)
+
+CVE: CVE-2026-14461
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/48e1794414d338ce47abc0f27c25ade8788af9c3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ui/asn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ui/asn.c b/ui/asn.c
+index 111c394..487d9e8 100644
+--- a/ui/asn.c
++++ b/ui/asn.c
+@@ -94,6 +94,8 @@ static char *ipinfo_lookup(
+             DEB_syslog(LOG_INFO, "Malloc-txt: %s", UNKN);
+         return xstrdup(UNKN);
+     }
++    // Clip len to PACKETSZ. -- Michał Majchrowicz
++    if (len > PACKETSZ) len = PACKETSZ;
+ 
+     pt = answer + sizeof(HEADER);
+ 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.96.bb b/meta-networking/recipes-support/mtr/mtr_0.96.bb
index 9008223264..2716ca92aa 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.96.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.96.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "f392168771570b0fdc104c38dea6bbc2ce585710"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-14461.patch \
+"
 
 
 inherit autotools pkgconfig
