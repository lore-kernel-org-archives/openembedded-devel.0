Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EADC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 16:09:17 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.230.1751990951999090138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 09:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/MSslWn;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so7426230a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751990950; x=1752595750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrBF1pnG/LEXyAA7yY+t/TTNNa7fUg9U1s2jtUZT0iQ=;
        b=D/MSslWnVV05vBKtxwpAMt8j97T6Jfkv12ANUi9XUdj5/22Vb5U2dA4RVy9L8P4zFN
         WEtpOxM3cW4qcJ6ZrzJD9ygOZiLE7z6OK8Db+EwF/PuCsOd51YjeulAmO9Rs8HibWJKX
         MQ6exErGMVjYiihHKpfOuSya94k9Gjc8+HsJfsgd2ZYOBex/szAyGIlPcXsWkt1qpGnx
         SLUbKW9zL9L74k+dHco8mQ8sj+z0o1KO/3Cee4fsEEcRLyb7ECm3PbcSR4JME7UOPlsh
         cW5GCgy3Ml8Mo73dbnNhUrYOnPSrEjJjK38aMqDAaZm5xCeoZESt6R/aIAeiGUhu+MQA
         A3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990950; x=1752595750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrBF1pnG/LEXyAA7yY+t/TTNNa7fUg9U1s2jtUZT0iQ=;
        b=CkT2nHv0gGYChruW+qvrDlTxIgbJq2hsX9riWG5m7yZ0ybIjuBZEz4po8AMWH7CQTR
         /iY7aIdvuoCQ03nekYoEXI/yuCJC8a1IZWgz1dnVEepAF+dcXDtJsd5P1G0BXfkkA100
         k06BssOj/o0By2QFRqkr1VkM43dBOZKvPEujCCX+36Df4n/Wy3fr+bppolrBYWSwDUVr
         FTbnLrKNQEQbZKFuBb2tQEOAs/mfJeXojjhtDfHfFXLm/ltJLIuHGscPvKI16/+E2hTE
         9zCrsmjXGCowXZFie0MTHk9fWvfb/ouMBmkdys6/x7CHpBNHU9HDCF7gLrNvUxA2dt0U
         Ax3w==
X-Gm-Message-State: AOJu0YwGedX04ZweSL3H6MrPiT5rmVZ4S6l6jB4x0qtNQi6qKglBX39i
	rS2sia/ylhgcXFpU4Y9qP/dUroJaN16cszYNo0tBPtiKDLsHdcRMUD/b5zwCvA==
X-Gm-Gg: ASbGnctolRJ6qreZsTOVd7aLQgoglxcukta+j9qX2Zdb3mwFk0PAUzq/OAQ2p1dcoxX
	T9JAw/MI87ktLKF9Sremda55g1kJGBF3f0BIc+cZMEez/QcFjNbI6UTvz0ldEvWObeOGDAHyjHW
	RTSl5q6L2afHfnmSl6ouF4EsusUyp5BJYSq4UIMb1csPk2+U428mPNWxCEyecyal4laZImQ0j0P
	Gen59y2TlgTGZJeYKyels7UthVv4PILfcCWwaRebPbtTfeQbl5Nt99MjNCRmhgpD9h88fkymdnQ
	ywLSdNGhgNbHMPOKwZVrQri6g4JxdXlucI7HaZhBeGq8dThxG5q7b9kbLCNHfyK0OUDi2O1UqHo
	gpO9wddh2xIc/7MmlUaU=
X-Google-Smtp-Source: AGHT+IHWz4lz2FiWvJ0NoQwKBIwGblfplqhqWAxmOKPJ0a3iyaHrFjMXUdtSeqL4dRtEq7bQFL+Uaw==
X-Received: by 2002:a17:907:6e8a:b0:ae0:dfa5:3520 with SMTP id a640c23a62f3a-ae3fe6fab4fmr1590991766b.31.1751990949745;
        Tue, 08 Jul 2025 09:09:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b5e737sm912216566b.142.2025.07.08.09.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:09:09 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] python3-h5py: backport fixes for incompatible-pointer-types issues
Date: Tue,  8 Jul 2025 18:09:09 +0200
Message-ID: <20250708160909.3890019-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 16:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118316

From: Martin Jansa <martin.jansa@gmail.com>

Needed in scarthgap for native build on hosts with gcc-14 and newer.

It was in master since:
https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb?id=f0c767407d033e3f39ceeccc2f7e03a1ca7a6443
and then removed as fixed in 3.11.0 by:
https://git.openembedded.org/meta-openembedded/commit/?id=4b990b6dbabaeb65df5bf46546a873c69032a040
but scarthgap has older 3.10.0, backport necessary changes.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ast-arguments-to-H5Lunpack_elink_val.patch | 25 +++++++++++++++++++
 ...002-Use-libc.stdint-instead-of-numpy.patch | 25 +++++++++++++++++++
 .../python/python3-h5py_3.10.0.bb             |  8 ++++--
 3 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
new file mode 100644
index 0000000000..c39d9b1950
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
@@ -0,0 +1,25 @@
+From 30a59c233fbe149109f378837642dc02b2caf3f5 Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <orion@nwra.com>
+Date: Thu, 15 Feb 2024 20:47:50 -0700
+Subject: [PATCH] Properly cast arguments to H5Lunpack_elink_val
+
+Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2380/commits/704e13ac83b42898514610c4df9f32f367e767e4]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ h5py/h5l.pyx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
+index 60b252f..af725bd 100644
+--- a/h5py/h5l.pyx
++++ b/h5py/h5l.pyx
+@@ -184,7 +184,7 @@ cdef class LinkProxy:
+             if info.type == H5L_TYPE_SOFT:
+                 py_retval = buf
+             else:
+-                H5Lunpack_elink_val(buf, buf_size, &wtf, &ext_file_name, &ext_obj_name)
++                H5Lunpack_elink_val(buf, buf_size, &wtf, <const char **>&ext_file_name, <const char **>&ext_obj_name)
+                 py_retval = (bytes(ext_file_name), bytes(ext_obj_name))
+         finally:
+             efree(buf)
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch
new file mode 100644
index 0000000000..35263d8315
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch
@@ -0,0 +1,25 @@
+From 8b4de2f6946b1c1f68279ecadc05c2817ae82189 Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <orion@nwra.com>
+Date: Thu, 22 Feb 2024 08:41:17 -0700
+Subject: [PATCH] Use libc.stdint instead of numpy
+
+Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2382/commits/387a22b8c1513800c0401f496b4ed512c1639798]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ h5py/api_types_ext.pxd | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
+index 91acb12..55a239f 100644
+--- a/h5py/api_types_ext.pxd
++++ b/h5py/api_types_ext.pxd
+@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, strncpy, strcmp,\
+ ctypedef long size_t
+ from libc.time cimport time_t
+ 
+-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_t, int64_t, uint64_t
++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_t, int64_t, uint64_t
+ 
+ IF UNAME_SYSNAME != "Windows":
+     cdef extern from "unistd.h":
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
index 8a9158525e..3ba5ea7396 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
@@ -6,8 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
 SRC_URI[sha256sum] = "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4ba733d099605045c049"
 
-SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch \
-            file://0001-Fix-Cython-3-compatibility.patch"
+SRC_URI += " \
+    file://0001-setup_build.py-avoid-absolute-path.patch \
+    file://0001-Fix-Cython-3-compatibility.patch \
+    file://0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch \
+    file://0002-Use-libc.stdint-instead-of-numpy.patch \
+"
 
 inherit pkgconfig pypi setuptools3
 

