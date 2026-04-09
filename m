Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7CBEA3C51
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129545.1775733740235674651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HN7AquxG;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82cef263bedso399952b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733739; x=1776338539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LA1xSsPqJxTngjXxTb6dN+SCY62J7aQYxoayaL47oWg=;
        b=HN7AquxGMLE03jlvTAP5DTEqaNe9qnpREZek1ZiI47Hs1QWT9wZoZDqaUQLyij3FmO
         STGZWnYMYmpIrP4ZbgkUpxSDBDbk9ij8XdSITEna5TxUlF/aAegd3nstsGK/vAaxeDci
         Ijdl+9t841lnQxXt7kDcv+iDB0IJmEu+ZwMPCGndPU48ch1ogRT2SaGgAkZ5bbsNFnoX
         gC9BW/6Z9btC0/SK8+XMHaPhy2TSnvIrbM4Yv4ulFWNoeUsjXzXQtq5/zwm52S8lbrJ/
         I7ZxHjMnN6EEAsyQaOpyDtzxyQ9iF/81ONXZiXcc7qzVI9wVgNvDnZadggy8ao0H6062
         Glzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733739; x=1776338539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA1xSsPqJxTngjXxTb6dN+SCY62J7aQYxoayaL47oWg=;
        b=XzZ6VQfwlDCY7yGMEOYdXo76I0x6iiUwW0wHPTSInxw8U+Eqy6uAygcyREki4Zxm5V
         gD93HLlaAUpf2mDiwweKmB/54wlWLuUMlVzpghzlYdzl8j981aw9Qz0ZEKM/8xE/lsuC
         S+frFkyDUlML/d5fOeszdB8MwyihkKU7UF0px4OoSczIAeNNxFduoApVK2EFY/yu8Mwo
         V0BTcQrXSxtf0iACk9EKWbFqlTvXqJp/eMhZDgk1fdmJw6NilQ3gAXdkJxYpKZ/Hp5bA
         FAizgUh4OgSehnImjdJtJwdMjYIhgkoQnYiV+eRtcqxiIOWEY5+7RYAy2z90zyBYP2c0
         1AfA==
X-Gm-Message-State: AOJu0YyNFmqtJnZ91mvD0dgU1ox8GqkF6xKkEl8BYYqB+FENdspwvH0C
	8V2XuEFgWnuimktoHqwSi/nFtIe6HFn5VrGjEWQnYx3cTiX8v1qo23duA8wf8+U8
X-Gm-Gg: AeBDievruVXt8+MSaKJoXzTqpFhaYDsHUkrOn3nVPF9YotBn9Il06dAlWa34OV//LJe
	3uDOsC4tqkzsjUul9EMiXSpIomZXxsHtosQhMQmFcblavFYQBT/O6AWnlm25ZA4JZef5OIfsj69
	IwRyoc6kjdnXLuZDTOR6DmW7Kv/jq8LCFpovlTtaAZ7gamijQovENPJLRAb5azZYkNFSQkNm99S
	Xo2do9DLI5uHGGE1/VdYdUBsy0dWUzMws8AicTvgugpMqHRFP/vW5EeZNri2HMmfDI9aXwcdmfx
	KWgdpAtW3EI/3funsf7+T2wuEU5IK6o2kEUnrPVYy/1cLKD+23l/crrYaJkgXsZc1rCfh3FFmtk
	cGKSzoh0km5Te2Wkn2QSSADsiPqD/TGKZ52nn08YzwstkQhFMIvMxb6s1dfC0ic9zGJR3MyCG2E
	vNDXJJ8UaUpEsDGF84QhtrnyWIlWuQp8kA42I=
X-Received: by 2002:a05:6a00:1785:b0:82a:79d7:cf6 with SMTP id d2e1a72fcca58-82dd8944863mr3244578b3a.2.1775733739324;
        Thu, 09 Apr 2026 04:22:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/8] libvncserver: fix CVE-2026-32853
Date: Thu,  9 Apr 2026 23:22:01 +1200
Message-ID: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126188

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32853

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-32853.patch         | 76 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.14.bb       |  4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
new file mode 100644
index 0000000000..be426932db
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
@@ -0,0 +1,76 @@
+From 24cac3821d1665a4ed0501e6056925ef9ee53b99 Mon Sep 17 00:00:00 2001
+From: Kazuma Matsumoto <269371721+y637F9QQ2x@users.noreply.github.com>
+Date: Sun, 22 Mar 2026 20:35:49 +0100
+Subject: [PATCH] libvncclient: add bounds checks to UltraZip subrectangle
+ parsing
+
+HandleUltraZipBPP() iterates over sub-rectangles using numCacheRects
+(derived from the attacker-controlled rect.r.x) without validating
+that the pointer stays within the decompressed data buffer. A malicious
+server can set a large numCacheRects value, causing heap out-of-bounds
+reads via the memcpy calls in the parsing loop.
+
+Add bounds checks before reading the 12-byte subrect header and before
+advancing the pointer by the raw pixel data size. Use uint64_t for the
+raw data size calculation to prevent integer overflow on 32-bit platforms.
+
+(cherry picked from commit 009008e2f4d5a54dd71f422070df3af7b3dbc931)
+
+CVE: CVE-2026-32853
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/009008e2f4d5a54dd71f422070df3af7b3dbc931]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libvncclient/ultra.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/libvncclient/ultra.c b/libvncclient/ultra.c
+index 1d3aaba6..5633b8cb 100644
+--- a/libvncclient/ultra.c
++++ b/libvncclient/ultra.c
+@@ -126,6 +126,7 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   int toRead=0;
+   int inflateResult=0;
+   unsigned char *ptr=NULL;
++  unsigned char *ptr_end=NULL;
+   lzo_uint uncompressedBytes = ry + (rw * 65535);
+   unsigned int numCacheRects = rx;
+ 
+@@ -194,11 +195,18 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   
+   /* Put the uncompressed contents of the update on the screen. */
+   ptr = (unsigned char *)client->raw_buffer;
++  ptr_end = ptr + uncompressedBytes;
+   for (i=0; i<numCacheRects; i++)
+   {
+     unsigned short sx, sy, sw, sh;
+     unsigned int se;
+ 
++    /* subrect header: sx(2) + sy(2) + sw(2) + sh(2) + se(4) = 12 bytes */
++    if (ptr + 12 > ptr_end) {
++      rfbClientLog("UltraZip: subrect %d header exceeds decompressed data bounds\n", i);
++      return FALSE;
++    }
++
+     memcpy((char *)&sx, ptr, 2); ptr += 2;
+     memcpy((char *)&sy, ptr, 2); ptr += 2;
+     memcpy((char *)&sw, ptr, 2); ptr += 2;
+@@ -213,8 +221,13 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ 
+     if (se == rfbEncodingRaw)
+     {
++        uint64_t rawBytes = (uint64_t)sw * sh * (BPP / 8);
++        if (rawBytes > (size_t)(ptr_end - ptr)) {
++          rfbClientLog("UltraZip: subrect %d raw data exceeds decompressed data bounds\n", i);
++          return FALSE;
++        }
+         client->GotBitmap(client, (unsigned char *)ptr, sx, sy, sw, sh);
+-        ptr += ((sw * sh) * (BPP / 8));
++        ptr += (size_t)rawBytes;
+     }
+   }  
+ 
+@@ -222,3 +235,4 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ }
+ 
+ #undef CARDBPP
++
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index 6f271ee0d3..11efd7cc0f 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -44,7 +44,9 @@ FILES:libvncclient = "${libdir}/libvncclient.*"
 
 inherit cmake pkgconfig
 
-SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
+SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https \
+           file://CVE-2026-32853.patch \
+"
 SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
 
 S = "${WORKDIR}/git"

