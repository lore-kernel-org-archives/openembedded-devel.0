Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDADC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:19:05 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.613.1787203143110982831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fE7b1wOx;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4696; q=dns/txt;
  s=iport01; t=1787203143; x=1788412743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wE42LMCFZwgsLzJNJ27Kh7hXxJ2UnTuIYFbiqHNWCKU=;
  b=fE7b1wOxs/Au7BLUf5Jdw19Aej9Z904U8/XlwwRVr7xu34m1CgtWw9Dj
   bPH0w/YecHy9gRYyuJDuTqmNHoYHuECIt1/fkDSZnDYZd1QKM1nbWvwv1
   xqjHqB90tBzw2+nfhnQhDQ4H73N9nFZv/yzCGS2otnLV1NYX+aGdLV8fD
   x54Og7z4uBC9OsoXETLaPPSiu9OrsfwGXfrIbw08yPCjPsSeWi5iO7aYU
   cPyZYJr6y4zWb7prQV7JLJQ9bEzTHaJrEghjv4Sj6rZPKj44RJczQtY3c
   CJaOObTOhKSQnb2si325wpuus5EqL+fNetT8MWI8jBz/UltmEg8GMfTfp
   Q==;
X-CSE-ConnectionGUID: 8zT0XGBFQkCHUsGkqUIVLg==
X-CSE-MsgGUID: akniEXkYTLmUPbkJdkieJw==
X-IPAS-Result: =?us-ascii?q?A0BIAgADjoZq/5QQJK1aHgEBCxIMggULgld0XkNJlkoDi?=
 =?us-ascii?q?2SSN4F+DwEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvIAsjCBmDAgGCOgM3A?=
 =?us-ascii?q?xHCSIIsgQGDKAE/AkNQ2EsNglgBCxQBBYEzhT+Cf4UjXRgBhHwnGxuBcoEVg?=
 =?us-ascii?q?2mBBYEaQgEBiCUEgiKBDIFakXBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOCRcLG?=
 =?us-ascii?q?A1IESw3FBkEPm4HjlEggksOdgoBK4IFdZJgCpI+gTWeaXEKKIN2jCGPPoV8G?=
 =?us-ascii?q?jOqbAuYfY4KhAmRal2EaYFoPIFHCwdwFYMiCUoZD44tCwuDYIF/yjonMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:1MvatqOER8w3+P3vrR32lsFynXyQoLVcMsEvi/4bfWQNrUp0g2RVz
 2sWWW2GPP+JamujL9FzYdm+90IHu5/dn9JlGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66V8MBkGEqc2w+VcIVxV2
 v8BFREzSh/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFUtgee1aIGNEjCMbcxWmEe1l
 mH3w0D8PykQN/6TyjuI0G3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOfPFyr1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:99+KUK1PVZSzEcv/vWj1pgqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:wRRhC2EL7qt8pVjnqmI35nJMKu8PXETe51ftOGC7EFtIdpmaHAo=
X-Talos-MUID: 9a23:Niht9gT2vhjKzl+hRXTlhzdjGfdr0piKDX01m5Ykt8qFOA5vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="814970030"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:18:13 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id C124418013BF3;
	Thu, 20 Aug 2026 05:16:35 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 5F3C2CC12A6; Wed, 19 Aug 2026 22:16:35 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 3/4] python3-ujson: Fix CVE-2026-44660
Date: Wed, 19 Aug 2026 22:16:29 -0700
Message-Id: <20260820051630.63383-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260820051630.63383-1-hthakar@cisco.com>
References: <20260820051630.63383-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129372

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced in [2], using the
commit shown in [1].

[1] https://github.com/ultrajson/ultrajson/commit/82af1d0ac01d09aa40c887b460d44b9d9f4bccd9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44660

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-ujson/CVE-2026-44660.patch | 112 ++++++++++++++++++
 .../python/python3-ujson_5.9.0.bb             |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch
new file mode 100644
index 0000000000..bfbaaf53b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch
@@ -0,0 +1,112 @@
+From 62fa316b5bdf9b2bb66efa60d1a17b38dc80f946 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Br=C3=A9nainn=20Woodsend?= <bwoodsend@gmail.com>
+Date: Sun, 3 May 2026 12:22:48 +0100
+Subject: [PATCH] Fix failure cleanup paths in ujson.dump()
+
+* Add missing dec-refs for if PyTuple_Pack() or writing the payload to
+  file fails
+
+* Add missing bailout for failed PyTuple_Pack()
+
+* Add tests for all but the PyTuple_Pack() failing (which requires
+  inducing a malloc() failure)
+
+CVE: CVE-2026-44660
+Upstream-Status: Backport [https://github.com/ultrajson/ultrajson/commit/82af1d0ac01d09aa40c887b460d44b9d9f4bccd9]
+
+Backport Changes:
+- Adjusted source paths for ujson 5.9.0's pre-src-layout tree.
+
+(cherry picked from commit 82af1d0ac01d09aa40c887b460d44b9d9f4bccd9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ python/objToJSON.c  |  7 +++++++
+ tests/test_ujson.py | 33 +++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+
+diff --git a/python/objToJSON.c b/python/objToJSON.c
+index 9013205..47e46c1 100644
+--- a/python/objToJSON.c
++++ b/python/objToJSON.c
+@@ -909,6 +909,11 @@ PyObject* objToJSONFile(PyObject* self, PyObject *args, PyObject *kwargs)
+   }
+ 
+   argtuple = PyTuple_Pack(1, data);
++  if (argtuple == NULL)
++  {
++    Py_XDECREF(write);
++    return NULL;
++  }
+ 
+   string = objToJSON (self, argtuple, kwargs);
+ 
+@@ -925,6 +930,7 @@ PyObject* objToJSONFile(PyObject* self, PyObject *args, PyObject *kwargs)
+   if (argtuple == NULL)
+   {
+     Py_XDECREF(write);
++    Py_DECREF(string);
+     return NULL;
+   }
+ 
+@@ -932,6 +938,7 @@ PyObject* objToJSONFile(PyObject* self, PyObject *args, PyObject *kwargs)
+   if (write_result == NULL)
+   {
+     Py_XDECREF(write);
++    Py_DECREF(string);
+     Py_XDECREF(argtuple);
+     return NULL;
+   }
+diff --git a/tests/test_ujson.py b/tests/test_ujson.py
+index 9ba6f55..ccff37f 100644
+--- a/tests/test_ujson.py
++++ b/tests/test_ujson.py
+@@ -8,6 +8,7 @@ import os.path
+ import re
+ import subprocess
+ import sys
++import types
+ import uuid
+ from collections import OrderedDict
+ from pathlib import Path
+@@ -365,6 +366,38 @@ def test_dump_to_file_like_object():
+ def test_dump_file_args_error():
+     with pytest.raises(TypeError):
+         ujson.dump([], "")
++    with pytest.raises(TypeError):
++        ujson.dump([], "", "")
++
++
++def test_dump_non_callable_write():
++    file = types.SimpleNamespace(write="a")
++    with pytest.raises(TypeError):
++        ujson.dump([7] * 100, file)
++
++
++def test_failed_dump():
++    with pytest.raises(TypeError):
++        ujson.dump([[0] * 100, object()], io.StringIO())
++
++
++def test_failed_dump_bogus_file():
++    file = types.SimpleNamespace(write=lambda: None)
++    with pytest.raises(TypeError, match="0 positional arguments"):
++        ujson.dump([0] * 100, file)
++
++
++def test_failed_dump_failed_write():
++    file = types.SimpleNamespace(write=lambda x: 1 / 0)
++    with pytest.raises(ZeroDivisionError):
++        ujson.dump([0] * 100, file)
++
++
++def test_failed_dump_closed_file():
++    file = io.StringIO()
++    file.close()
++    with pytest.raises(ValueError, match="closed file"):
++        ujson.dump([0] * 100, file)
+ 
+ 
+ def test_load_file():
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index 8b970ee564..ed08ede1d9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
     file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
     file://CVE-2026-32875.patch \
     file://CVE-2026-32874.patch \
+    file://CVE-2026-44660.patch \
 "
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6


