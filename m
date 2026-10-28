Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36211.1793161523939576299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LsSp4uNa;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so457156a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161523; x=1793766323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wDoYXBWDgdtTs8yzVacPsTRlcJX+k9H2JnfxSGfVbM=;
        b=LsSp4uNap7XS9ml4g7L89NheXpxCnMTpdYZiHU2Td0nJ+F2lx7TyHyCJle1YW08rki
         h43WR9JGrCFmEyitO7X3nBhKRhxGYUD45800fRMqiG4yWf4RY3Anst6oDoC0Nb+/EQE/
         4WM1iVKR2GOJ7pWwbU/B0MTNOd+KnJAAvFSR7XVMNZkKO5H39iUJc46XF4zAtO2WA0KH
         /NqHxTgXrvyxW4NGVeL8rBO09btl0m3Xhn2Rp9zXUISGQ9CasRq4rhXrGFsnYfLSA6Ox
         REUCvbbZMOjRoi11kuHlPCS1mfr2X3IhWxSj3Z89cUpk4c4ZEfJc7RUqX5fDtcyhNrrS
         5LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161523; x=1793766323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wDoYXBWDgdtTs8yzVacPsTRlcJX+k9H2JnfxSGfVbM=;
        b=tHBEn0cHC8N0XtZ9/VBl/FPYbh7Uam9cUoaV6IoHlxpagaKhd6IodVCDMMQelGLfbl
         ywi8oqmZcNdrRTUAIUZy7lEMOTYdLFNCk6cuJQnlNnulqcTczQvQ85AILy6Fl1OWjNAg
         1FyY2c/Rb0FaxM3IZC41regg/KdnFhckgdM4ShsrletmQbDGHPrtAu9ALmZmBwgJt8hd
         TUrUmUQLPeyVW2J+jjhIFt7HTRhvyPEj/ZXXBK9zLJ9z0NdQpRxgUvO9JhbXZxXlPM5b
         Klp3jiAup9mQQ2gv3cYR3LL+VJX5Cr50Yh3pXv2UDfMPHSJknD0enEMp18QdhUqp8gJh
         gOxg==
X-Gm-Message-State: AFq9FYJNINsUOWQ8x2a2c6HSuD1RKlkYqt8NU4JkfBNKoNTt1Ox3M8+k
	GBDndMU/nHmdvmALSwUYBgsEGaXYUkeKIBwpS6ziyVvEJ+VnFXgrk//AvTLB5w==
X-Gm-Gg: AYBFou1OdqAIm6ntLvAfE+kczqnchHZbUh4QWkM7Q6YFF0wgP4aFhtMWetphx9oY9Ks
	sWJj+COi9dmUpt6LuiDFzZuT3fhfZxgiBTXJqKW0C57K8aNWHmqfLfTHtim/LW2giLp9wyjzTsJ
	UZcTQsUP1SaQAhZZgceaBuqJBfC4pxAI0rE8nVGVQ2bcLre9AnklUDdkUiKyTFUuN1K+USsYcGe
	YfhjWVNcNgftr8ttqkUDgLk6BeFhpuX1aw7arShqHN1b6kLZMG/4rb4gEzwG1ijvVq53zZ1jWlU
	N7YTFQvm/t6GlcLcBbN1uDqKm/f57gA86Jh/t5JK1JgCXis/paEJxiugw89f/2v6Xl6Qcu3dNBn
	O7toHFmIdAugfd4d8XWfY6hepTx3IMMnnrxxdnEf4tnT0C+AydB4rgzEvsJms/jYq48R6ksb4pA
	yukohIJ0/2dpeHTWoqQ0lnkJZto6LjLsqNVCfe2ud8d+MBuNPFohtwwvG1Ov0AGDyHVlDlK/eem
	voebkoXeJTgG7znYNfMynAccETL31TVKV5DfBeu06dOEr+VPklsUHLH2zfy5pjvBnCemctRBU3D
	+KnRbjo5Rc9pXec6GBtN5E1ifLjm1Oi7IO85/SyfIij5voiZPh6ZoxeZVQr6rA==
X-Received: by 2002:a17:90b:4d83:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3ae57e47be0mr933975a91.3.1793161523347;
        Tue, 27 Oct 2026 21:25:23 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 33/60] nmap: patch CVE-2026-58058
Date: Wed, 28 Oct 2026 17:23:31 +1300
Message-ID: <e3266bede8539bf66e3d3464c98e7b367592cb56.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131585
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-58058

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nmap/files/CVE-2026-58058.patch           | 34 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
new file mode 100644
index 0000000000..3717d37b5d
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
@@ -0,0 +1,34 @@
+From 63815f6a8865d8c99a1f3abb9d7383a2be0ea67e Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 25 Jun 2026 21:58:49 +0000
+Subject: [PATCH] Fix extension header parsing. Credit: Himanshu Anand
+
+(cherry picked from commit bb6754e76bb1686315008e1aa1c40202a513fb83)
+
+CVE: CVE-2026-58058
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/bb6754e76bb1686315008e1aa1c40202a513fb83]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libnetutil/netutil.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libnetutil/netutil.cc b/libnetutil/netutil.cc
+index 6e81f558c..0adf18b8e 100644
+--- a/libnetutil/netutil.cc
++++ b/libnetutil/netutil.cc
+@@ -615,11 +615,13 @@ static const void *ipv6_get_data_primitive(const struct ip6_hdr *ip6,
+   *nxt = ip6->ip6_nxt;
+   p += sizeof(*ip6);
+   while (p < end && ipv6_is_extension_header(*nxt)) {
+-    if (p + 2 > end)
++    if (p + 8 > end)
+       return NULL;
+     *nxt = *p;
+     p += (*(p + 1) + 1) * 8;
+   }
++  if (p >= end)
++    return NULL;
+ 
+   *len = end - p;
+   if (upperlayer_only && !ipv6_is_upperlayer(*nxt))
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
index ea792d30f6..515623d63d 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0002-Fix-building-with-libc.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
+           file://CVE-2026-58058.patch \
            "
 SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
 
