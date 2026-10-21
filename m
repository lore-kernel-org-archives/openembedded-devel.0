Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7571.1792575046885626284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p6HvgOHC;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so947867c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575046; x=1793179846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=p6HvgOHCcGCC2b5Bvkwzi3gOOg8yBSYpE4HzCugmrtzAl7Eo6i1aIpWmr6BUJZPjyB
         egY9TPkqqT5kywl0Cp7EeUUR1F+7w1epC63qpzNwwLNSh1JyUpIpYVLHl+7ysg2Gg4o0
         39N4Ap4DPivOdC3DP8jw5QnUlViymiy8P2cGY2oY2FrrZEtrraIZtcyvsjHt+Itwi9ov
         exLI+qm6qJyQ4X12KubXxEDYtnPajr4aN7OeXSnMSyIBfzJwJoIHv1Y1Gr8BkhsQFrHk
         CRPUiCiZydvKowayUoMQF0sxZubMvB+JnR3JPchJ16askGjhMEIzUe3cy9x4rtfWu//P
         77iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575046; x=1793179846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=RVKgS21M6eJr+onVTpyQGoIqUyC12DuH1NTBYVKv5Ex3mm2tDb9mBsgbLlaVpqvuej
         ufzFlMe6rGTO5hrYHhhlnkgEy3eA251rmhtxF7t6o22C9vinpH3DXiZHW0dYXIne+5MS
         ed+yd2GruXTYcZoVulz/YTgftFvOG+dibLpBELX78SVScGF1PAD1ITFLfNBPakD8cSAC
         J6bU6S9EYWv1o6gc5R+rBl10jWCtPN0qEA4+dcMhzrlL43OQ0Rju9m23/TMQCackcaT+
         AUTQdkEpiX30HQ9jJTa3ledTHZNkf1y7Zt2owoya60G9sa9+X2hyr7vlp2kf809XNhGa
         GkwQ==
X-Gm-Message-State: AFq9FYLxSGACStG32b4Kk8ffmW21z3Xd/vlOk20xflrBz8oRFMf8KTRe
	h8qvNWKd6viMdZh8cATdeiOMSxmRQmgXsrQ8owRn9d0wJHh7Rr0aeoH8VuYkzA==
X-Gm-Gg: AYBFou3OXMZHEyxkQeXz9kOR9wTWDyIM1tewxNTdo6fsl69W7O+HarbWWDmDVdTgbXQ
	3WX2xy/h8sAXveKiNKFoxQzWs+S6wcP75zImcgoreo/UsOIzmZYrgca8ZUw4/PXw9c18boVJn7j
	dsDTuqNX5zokS88IeEmQoO9cR6PEji/0rIqw/ppzXrrajnObnFVckyB7UTeKiVDKDnNvIXLCxCf
	icYH1CAmNJekC4ZK9VWbYhuWrrh04+renvcl0oapbm1EAD8ByxoNjamGfwGDrs2daxvKyeqJBow
	308ooa69Xfuu8o/d6ogM4GOg72aKnr/lzpObdLfCvL1LkZf1H1yh7aw/LU1/NzfcI0370456SoI
	xpEgzJk305XR/CDeCfrxqosKtyaTMeFMHId4tlpHxM/5jdggc2NPbNInSX7ILhZaPLW8WqvuYUZ
	awfjP0pLYCv8FGoz0Y+y1zoIGKs4zUxeMkEU4iZhPQcV03nypmGFaBz0qx6CpsA0bF+qa8Fv+eT
	XUQgrU8/blo8yHJuzv0mUPd8dIJd2a2C3XX+TGfxT04GtV5D+fD0m9pReqpEIRxWxhEREH4GiAw
	7QpVTNa5E5LZ9zHEtXbcdMSFUNOy5n7FqucoLhpk7P+XcVHuJvwg
X-Received: by 2002:a05:701b:4284:10b0:14a:9dc3:dd11 with SMTP id a92af1059eb24-190a5999e7fmr2248861c88.18.1792575045991;
        Wed, 21 Oct 2026 02:30:45 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 43/44] libvncserver: patch CVE-2026-50538
Date: Wed, 21 Oct 2026 22:28:56 +1300
Message-ID: <20261021092857.3585453-43-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131230
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
 
