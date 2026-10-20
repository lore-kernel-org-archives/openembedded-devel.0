Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4902.1792494254817517730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 04:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yn+48HEw;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1779826a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494254; x=1793099054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=Yn+48HEwi3zQ9M8o2BtcYvo3gCTsq8b45JglDNHkDhyzknMYwR7tPvnz6iRSuEGyA0
         rDMIOAKO+SAa9FVanFuGcV8Kn9sv8/iJgXyoXkKufs4SHzR24P1OL01aLZDofWenMsL1
         GIvvk57tFHcxepj02e9xkk338NUobhBXMZxdDoZ+/QG6RU5l6t/BMEMSAJyEl2bYWzfa
         DFZAAfErjRSBSMZkdxkhquDLJRQAtSNQvw757Bz5C6KmT22ilnuiKY3mb0gijyqv1iKd
         UN9dHPTud/zB/OMXF0n6SMNy21Z3KTTopuPqzTrHAE8AeACI5RWlhROwrHu7v+x5qEKG
         /uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494254; x=1793099054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMZWrUxPiD/DZ3eOTZX4K9oNsIWXpZlaHqLpM/3qtvg=;
        b=iHNoemQFZS3tnf1EBYOdam9WH8GjENgIvo3X+0o5NteVr/ykdqCfsdXqPtz2IwBd9K
         A2qjHRRdPZ26OiqFOiSOqW8zqPHlsJpT8BScTfmTDJVN9LtH9o25GROoTMyZsHTJumkM
         JLs/L3dqSZmUI8c4KhHfC4T4inAsS5EI4zUKYf+mgnRDhXb9ZdZ0zJWBlG7rpdS41VcP
         S6qWp+WqI/ZDfaJb8C4CgIT7SqLMCM1QpQYliY9mfGs4PCCfCJaUBnxrHtXwRjQn+AWT
         TOKWxJk3ro8Mk8938S+F5/BgliJSqolakSfVtHGZs3NONok58KQHNvE0BRfL2GlJJIEm
         sEyg==
X-Gm-Message-State: AFq9FYIP0Lt9p/o8Z2nTvwan7ITgTHr5Z4M5lXxALmUGCL4XsN5agOoD
	gFu2aI51Yg132Q8y5rdMdzTROf6CIX4pancBXCAsOpD3SqBpSWSPx+1KCbZhyg==
X-Gm-Gg: AYBFou13k28xm4gBxUU9nTFXFRMrG51nmX3YCEApEf7WAGMlzOgSaWR/DiESTLwY4lX
	fUaauexw8tCVuO/YiSqUO9iP2xanIixn4tp8GdjrsEu/x4KGJX1fukWmqSXiFtIW1U3NxrW9ySj
	eW0wh4V7qCHJt4dGxqZJ85UTdbTKjC4WEmo7aoVGcur9uO8y+2QpiVVteE3HumbGGiaZhVuFkpP
	CcHgBNN7r/6mG1Pg1MM0ZZWUELMLYBdWzBIGKuxXeiFQGyYp10x0RJq/5eiol/J5lwCctlAlO5g
	Za0RR0vNrvEt535mVg55COW5FFE+YG2txGMAOZ0q6TGk2UyN2ejS0JrqqvpCF6fg5K1yIeoBqzw
	ChwCs4kMYNuqJS6WxpSSm0o4rM3uTY/1szt6+pvmSgUBIbkBUyB6zcs1xNINDR79DCvPfw46fSQ
	RIV+pCgOcE+xqB9Lyq4ekS+xNC4QyzvN1Ov+5ZfSrMDPTcNpEhQiRCa31JKxC9Csr9AM904DICi
	nKNtkCpHpl+wA8SyTOc3pVeKct4SrmNkz+kgds=
X-Received: by 2002:a17:90b:4c4c:b0:3ac:a491:3cf8 with SMTP id 98e67ed59e1d1-3acef52ae1emr9165540a91.43.1792494254095;
        Tue, 20 Oct 2026 04:04:14 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f2c785sm3046683a91.7.2026.10.20.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:04:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/4] libvncserver: patch CVE-2026-50538
Date: Wed, 21 Oct 2026 00:03:57 +1300
Message-ID: <20261020110357.1995120-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
References: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 11:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131158
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
 
