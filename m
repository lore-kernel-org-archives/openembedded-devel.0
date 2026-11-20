Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4930.1795147168107466593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FeKfRVBw;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-372bdb942dbso576859eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 19:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147167; x=1795751967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7pP57GONC4xTi9kIjfFaGuE/8tUTeCZ41V3QsIjgRE=;
        b=FeKfRVBwRhJT1hWeMNkNDMeksgvZLWtv0yivTjPxKfl8fFDOJvkO+hxlBQpLUoOk1+
         1mjIzXM9v52oAXPLU7Du6RAuMj9dTUjaK2XtEiJU6R9a9eXgRBcESCfar6/e06j89x9Z
         Ru2DYQ/Uu/uH7YnwQ41itT3oq4rTImPnXdTwBnQQqgkIiDSvsnjjGvwyXuXdCGs8rTBx
         hlW+8mjAaqgL/EzZEMpxr5p6Bwzm2ptbjKWbSBPSrzx6AUyBnAo7K+cJjm/tN+CqepJP
         esB1VLds4JjS373cuW+krEhAMdaib29RbBA5ZEJii+g1mFEp9uSwUI69MYF36lK7feT8
         EAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147167; x=1795751967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j7pP57GONC4xTi9kIjfFaGuE/8tUTeCZ41V3QsIjgRE=;
        b=rDX+s+RxFHsSZINcix76MaSYk4OWmTjq12XjJLMGt++6EL8pipee5kaXZDYSZFrRLo
         rJIaJwhBahcGCwbvh4DhH5YRBqtM3mSrL44b2ovrN0wLVSOOIfRMTXWYVKazjOiESsDW
         1eQX/fYWCN11R/zwSmf4mPBMEQjP7KyJmRKfQShvRnszkBe3PhvQt8vsUn+e3tpminwe
         0b478rsOLhIvfo1dPumFU59rs73VSQAkK3pvjXUYrKVLqWVqMe0ycYjtzV4gTNEjyI4B
         WpCYQ2qFLB8K2QuEaVoawz/an4AfgeKplcrOjHU0eZ0aaAwXT0hxiYUqoEIDtf58JiWW
         fXgw==
X-Gm-Message-State: APuU4Z/oLyMloldk/580Pof06zSDDxdkDIKBdvDWYlzdLrHcwD8cWLT+
	3VFEQ86KMrjv/2Y3m8BVUIak/RL/w5mQDKOSXaa16d6nMnX/LA0vdYUBNy483O+S
X-Gm-Gg: AZFdTZcmp3s52agrMnlK/sMRKPAU+NYB4R7IIFqmVwx0Vpd/1mO5bQ2bbKMu1egriuN
	qp0onLtiGeZ8XnRnDMPWWjurdDFNj3wX7Wi4ZqCQAm6QEZjQnI1HVQBq83cb5wfHIQNoV4nyD9X
	3azFkSi/N+KO3EqhXP+Sv6smPM0CGHx1sK5rCrxApWazTPuB7qdEZc/XtUUre7iUyl3PcfHKrPR
	HTNSHtIAZCbKx81eXNL2b/o+hseX+ebixFGfEHbubf9NXM+lQzS6hIKDEnA1d/p/HgeuxLKLvYf
	tn1P9An0s8BBX0ln7JRgqN69H1889zMIQTNy+T8En0OO9ywpfiNuduLlLCJ4Cjln160tr2x07TD
	khKCeJAyTzzpAbZQdH9Xph0OUdUofq2iA+bH82YVbzBPQkI4CNKNd9aAK76NPZqUUIOeBkYGMQW
	BTHzt58UJTuRV3ceY8AQvEpH83WGx07UtNRHCVafmKxlmplk1xNloTXTIr1StegmwehW+K6eM50
	5wV6hE9/OZQ0e0GPXisbiiHVhO5A/zr5y5/sHMOYu4uGWinUbx3OSN2+XMzkQgQDl/bbjU9YPxk
	28hH0IBfCS/9Wn17hXHaZNKQHOn02OwABbuyOhVeoD5UsXwhnTMJdTDQCrUtvZG0osACDPVKZ31
	s17GIJYG4zzzydTJCQoqn2XH1gG3g67rgrXrX4Yv+CrtHsbGNj53ywAS/tn8t9ALt28fOTrGpaK
	PHBzosoOlEcDKkXzrJPGrvRFzq6C1e+u0OL5UvBdJCmVC1ZsHIPs/aDl9qEoGHfj/bL6oLOlOZ/
	PLscgUfBYMRQ45btXVqyAvjv7vyXdW2696kjeV61NSAg+6LSpCGQSuFiLV3173eExtADpDxow08
	W/4s
X-Received: by 2002:a05:7300:c7c4:b0:376:13e5:e8fe with SMTP id 5a478bee46e88-3856c4b839cmr1375311eec.3.1795147167290;
        Thu, 19 Nov 2026 19:59:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm3190201eec.23.2026.11.19.19.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/4] python3-geojson: Allow building with Python 3.15
Date: Thu, 19 Nov 2026 19:59:20 -0800
Message-ID: <20261120035922.3013969-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
References: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132761
Content-Type: text/plain; charset="utf-8"

setup.py exits unless the interpreter is 3.10 - 3.14, so do_compile
fails now that oe-core ships Python 3.15. Upstream main still has the
same bound; raise it to 3.15.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-setup.py-Allow-Python-3.15.patch     | 38 +++++++++++++++++++
 .../python/python3-geojson_3.3.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson/0001-setup.py-Allow-Python-3.15.patch

diff --git a/meta-python/recipes-devtools/python/python3-geojson/0001-setup.py-Allow-Python-3.15.patch b/meta-python/recipes-devtools/python/python3-geojson/0001-setup.py-Allow-Python-3.15.patch
new file mode 100644
index 0000000000..e61ef33abf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-geojson/0001-setup.py-Allow-Python-3.15.patch
@@ -0,0 +1,38 @@
+From b0ebb91bc05e240a1acee4133662e3cc2127a9e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Nov 2026 10:21:40 -0800
+Subject: [PATCH] setup.py: Allow Python 3.15
+
+setup.py refuses to run on anything newer than 3.14, so the package
+cannot be built with Python 3.15. Raise the upper bound and add the
+classifier.
+
+Upstream-Status: Submitted [https://github.com/jazzband/geojson/pull/264]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 05ce9cd..427c434 100644
+--- a/setup.py
++++ b/setup.py
+@@ -17,8 +17,8 @@ else:
+
+
+ major_version, minor_version = sys.version_info[:2]
+-if not (major_version == 3 and 10 <= minor_version <= 14):
+-    sys.stderr.write("Sorry, only Python 3.10 - 3.14 are "
++if not (major_version == 3 and 10 <= minor_version <= 15):
++    sys.stderr.write("Sorry, only Python 3.10 - 3.15 are "
+                      "supported at this time.\n")
+     exit(1)
+
+@@ -52,6 +52,7 @@ setup(
+         "Programming Language :: Python :: 3.12",
+         "Programming Language :: Python :: 3.13",
+         "Programming Language :: Python :: 3.14",
++        "Programming Language :: Python :: 3.15",
+         "Topic :: Scientific/Engineering :: GIS",
+     ]
+ )
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
index 8b3d5cfd81..7d866cac37 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.3.0.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://pypi.org/project/geojson/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=127b4a863485faf7c57d12dc2c1f60b3"

+SRC_URI += "file://0001-setup.py-Allow-Python-3.15.patch"
 SRC_URI[sha256sum] = "92e83b9cb378a450b42f1207bb9b2a031f9fc89185f335153c44369b8b8b71fd"

 inherit pypi setuptools3 ptest-python-pytest
