Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36071.1793161548471548115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kQk9aC6D;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso232018a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161548; x=1793766348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=kQk9aC6DvbYnnpYIm+Vi3QJEQTSaqQpHTgr6roFyX0qlv/dZ+ibcVkKJDVDZ3ZdYwa
         Nu8U7EtPs31nwY8BTefA1vRXPEo01znp6497Anv0H++KLtNAL19CXvtf7759EncTuJht
         MAkmGmcr3y5OcXyBiKW19VP7iEjgpWhjz94qicHD3ngT6VeaNfhQr5X7wLY5mAppIJzP
         NY6u6XnYWv4yNlPZQgAeM+q231jA58Ys16qztxKZZ8chIu7JfEFAHipprzlTwcwKxXSn
         QTGSeXFoDSo4EhHJmXZlzCjWYkvieKUkBhRgRrwX0+Cj2IjFyYhbV6HoUjw4ZQrBM0Wv
         hgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161548; x=1793766348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=cYvDVF5LAOWAJNDhCKECr4kCudoitSHbOt7iaNVC9pU/Md7FeCjU7oDwLVW6MawG7t
         lCNHaQ5bNomy2hC/bH91TW+kqAoikux+qEH2/VZeb+PZAtbgDGePoGWvf0YumsygYSW1
         LGDlyJG96VtMxm5VgKVo0OMFXr/hqwqaBh+IHtcGfKxQq/kG5SXXrPPdb+MYtdLvjnGc
         pv8Wy7wBks/kXVFSWyD9eFAfE+TcWqQrpZdscnW0fXFATYJGduAdPZLb02ccJ92p700v
         B6xW7Zo5VKMZKJ+bw92tb3A50Y2AX43V1Mlg6JaeFrQa35ot5vS4VjcPyeJuFxpmWhxb
         F8Qw==
X-Gm-Message-State: AFq9FYJ0gtJ4cr4hBjgmJosx8DggfXMfRPvUtVi62DsucVqmhGgmfpHX
	MEalVcWkM2w2G/0l8h4iMJwSk3e0Sw2jtbWJo1Js0i8NpH7GZRTTEGUY0pLSdw==
X-Gm-Gg: AYBFou1oKvzpZVDhPfHkxPAo7bpl4w4x+zenFztbFsntKjZrwMOb/s6v6h3PyoXfjZd
	gm2seraY++44GVtlqiCeNTWtbzf8zBryNeGREznCjBGRlo+9ITXo53t/VC8qyjKksAFQy6d/uG3
	DqyFEcxyreFbPH0kHEO4fJ5ztt1ioUmnS54KZqU373xgKdtIhLj0lJo1PIoKeh85RY3mbqlb2se
	nXKWDXiEUP+6Lch7G3voYU03vhXmb+47b8niZqE7R7kReaKBjpXL106CpdRv0tkqX5bUlXRJ3tg
	LKMYfBugTtYdzGZLAeMujVw4sH9m+9oI8SSxMg/BiTAn6Hidf5pUL6SU+qXZWwsCYo0W609i/NC
	cbNBiYQrIg7X4wyVotMUWxU32jkm+xuvrMjymSEHl5oTdwI7s8axqt5FTXp+1kL+1wJdmlkkiSG
	wbTuteXynHFQfdvNrNnjYzSJ0eC6e13Xqx5COymxw2gnlCIVhjP9MlbDut20i6eyyzNkpzlZ5Az
	kuIuS7crM4tJedf4Quays4SxfUpPnBQgDNn9EFs0gqPgQK0d4Z6VggCj+b+3h67PC+B5BGFS8Pm
	u7L6v9ThbFoaA1oRYjnsd5Y/F1nCXaLTtNmuIgqpFOKWvT73bupWnCZqmjLMLQ==
X-Received: by 2002:a17:90b:224f:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3ae580a7ac7mr753597a91.23.1793161547854;
        Tue, 27 Oct 2026 21:25:47 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 43/60] libvncserver: patch CVE-2026-50538
Date: Wed, 28 Oct 2026 17:23:41 +1300
Message-ID: <b625e91dcfa260c792bc873b2b1faf198cda41bc.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131595
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50538

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-50538.patch         | 49 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.15.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch
new file mode 100644
index 0000000000..da01736323
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch
@@ -0,0 +1,49 @@
+From e824e7d8ea71feccb81aeb34771eb83e052c3fe2 Mon Sep 17 00:00:00 2001
+From: "Bas.Levering" <45083161+Bazskillz@users.noreply.github.com>
+Date: Fri, 29 May 2026 09:08:28 +0200
+Subject: [PATCH] Merge commit from fork
+
+HandleTightBPP's basic-compression loop wrote each batch of decompressed
+rows straight into client->frameBuffer (via FilterCopy/Palette/Gradient)
+and only compared the running total against the rectangle height rh after
+the loop. A malicious or man-in-the-middle server can send a zlib stream
+that decompresses to more rows than rh, so the writes run past the end of
+the framebuffer allocation: an attacker-controlled heap out-of-bounds
+write reachable in a default build (Tight is advertised when built with
+libz+libjpeg), pre-authentication, from one FramebufferUpdate.
+
+Clamp numRows to the remaining height before calling filterFn, matching
+the existing house style (trle.c and the Tight JPEG path already clamp to
+the rectangle height).
+
+Co-authored-by: Bas Levering <basdaniel3@gmail.com>
+(cherry picked from commit 540332be3e0acc566fa64da6f1b4680c72c724dd)
+
+CVE: CVE-2026-50538
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/540332be3e0acc566fa64da6f1b4680c72c724dd]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libvncclient/tight.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/libvncclient/tight.c b/src/libvncclient/tight.c
+index dad5514f..3ee0d5e0 100644
+--- a/src/libvncclient/tight.c
++++ b/src/libvncclient/tight.c
+@@ -341,6 +341,16 @@ HandleTightBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ 
+       numRows = (bufferSize - zs->avail_out) / rowSize;
+ 
++      /* The decompressed stream is server-controlled and may yield more rows
++         than the rectangle's declared height.  filterFn() writes directly into
++         client->frameBuffer, so clamp here before writing to avoid running past
++         the framebuffer (heap out-of-bounds write).  The post-loop
++         "rowsProcessed != rh" check happens too late. */
++      if (numRows > rh - rowsProcessed) {
++	rfbClientLog("Tight: too many scan lines after decompression.\n");
++	return FALSE;
++      }
++
+       filterFn(client, rx, ry+rowsProcessed, numRows);
+ 
+       extraBytes = bufferSize - zs->avail_out - numRows * rowSize;
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index e2f995947f..ff7327c6cf 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag
            file://CVE-2026-44988.patch \
            file://CVE-2026-32854.patch \
            file://CVE-2026-32853.patch \
+           file://CVE-2026-50538.patch \
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
