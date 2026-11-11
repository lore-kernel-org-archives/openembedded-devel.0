Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3364.1794374983916368146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VrmWGz2W;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5776; q=dns/txt;
  s=iport01; t=1794374983; x=1795584583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qPohO+U92fHfJA9TQa9Ww5vCv+51F8nyHpv6RGDilkY=;
  b=VrmWGz2Wgwv9ed07XNeVY524kc+ApXxFX8WsCoNs3JU5KacT9RiBomSW
   6TrLJST4kB/bEt8hWw8jZm2WSt9u50N541Zsc6luksqmxCq5a3GGKZVTf
   jkK1eQwEkW9ilNTtB6eHDt4aQzYlDBGjXWf+KvJgfmGqImY/zmM1EF6NK
   AjyG5ICaBDIO+j6AGNorgRNvXblFHymTNb/rXq+lGOHxF8kaJoB/jO3aY
   0OkyL08u9q4UzxrIzqmKwNJyO04QnaKrKcBnoJtekU7ti6ozQ4z1Dmp99
   +/yKizv1U/aFUXcDWcmtk1xPhGrpSF3R2ghOpNOKVN7s0F2xiocFAHwZs
   w==;
X-CSE-ConnectionGUID: 4CJcE3QUT2uE0clZ8SjdyQ==
X-CSE-MsgGUID: aqAxdrFtQKqJzo/Z1zowMQ==
X-IPAS-Result: =?us-ascii?q?A0BNAgDN/PNq/43/Ja1RCYJZgld1YENJA5VcbAOLZZI9F?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAhYZIAsdAQUIEAmDAgGCO?=
 =?us-ascii?q?gM3AxG5XoF5M4EBgykBgVTYTA2CWgELFAGBOIVCgwCFJF0YAYR9JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBGkICgRkODWuFZSIEgiKBDIFajRoCgU+HJUiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjPheBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCn4YDUgRLDcVGQQ+bgeSboIRgQSBDgEmBVQ9CBYUKUBOkmkIkjegI?=
 =?us-ascii?q?HEKKIN4jCSPPoV8GjOqcguYfY4KhAqRek2EaoFoPIFZcBWDIglKGQ9XjVgKC?=
 =?us-ascii?q?4NgzlsmMgIJAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:4ogClat0w+e0tbCPdKOGEN8qEefnVAZfMUV32f8akzHdYApBsoF/q
 tZmKW2BPPaKYjTxLt1+O4myp0IFu5WAnNY2HFBkqSA0FXlGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwps1VCkwVz
 MEkci0gNhuHtbKNwr6qc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWG5gPzx7C+
 Qoq+UzwGzgKOMax1QOm61C+gaj9xDH8R6crQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Lng+O6PjwzQJIMBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:3mvy22zeCTGanSDTniNYBgVIMeIuXybk8UuKPmLgAmJbGIaXRU6prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Ah1RHOQ+Rv5TufgdT7/kk/AOQf85xyrSiEm4RqLY?=
 =?us-ascii?q?fmduDch4pKTCCqQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546529027"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id F3D87180001B5;
	Wed, 11 Nov 2026 05:29:42 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9E771CBF201; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 1/9] python3-filelock: fix CVE-2026-112939
Date: Tue, 10 Nov 2026 21:29:30 -0800
Message-Id: <20261111052938.3691463-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132113
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the SoftFileLock owner-permission fix [1], as identified by
advisory [2]. Prevent other accounts from modifying the marker's
recorded holder while preserving the existing two-line marker format.
Retain the permission regression adapted to the 3.25.2 test harness.

[1] https://github.com/tox-dev/filelock/commit/eeceaa846cbe4df72718d94c8371ca1ab8f5b3cc
[2] https://github.com/tox-dev/filelock/security/advisories/GHSA-rfpc-qcw5-3pc4

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-112939.patch    | 107 ++++++++++++++++++
 .../python/python3-filelock_3.25.2.bb         |   4 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112939.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112939.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112939.patch
new file mode 100644
index 0000000000..621f704837
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-112939.patch
@@ -0,0 +1,107 @@
+From eeceaa846cbe4df72718d94c8371ca1ab8f5b3cc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:21:17 -0700
+Subject: [PATCH] =?UTF-8?q?=F0=9F=90=9B=20fix(soft):=20keep=20live=20holde?=
+ =?UTF-8?q?rs=20when=20owner=20identity=20differs=20(#836)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-112939
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/eeceaa846cbe4df72718d94c8371ca1ab8f5b3cc]
+
+Backport Changes:
+- Retain the 3.25 mode-opening API and mask group/other write bits.
+- Omit newer identity, namespace and Windows helper changes because
+  those interfaces are absent from the older two-line marker protocol.
+- Omit their newer tests and documentation; adapt the upstream mode
+  regression to the existing platform checks.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_soft.py  |  7 ++++++-
+ tests/test_filelock.py | 31 ++++++++++++++++---------------
+ 2 files changed, 22 insertions(+), 16 deletions(-)
+
+diff --git a/src/filelock/_soft.py b/src/filelock/_soft.py
+index 8e2cde5..3a535ea 100644
+--- a/src/filelock/_soft.py
++++ b/src/filelock/_soft.py
+@@ -2,15 +2,20 @@ from __future__ import annotations
+ 
+ import os
+ import socket
++import stat
+ import sys
+ import time
+ from contextlib import suppress
+ from errno import EACCES, EEXIST, EPERM, ESRCH
+ from pathlib import Path
++from typing import Final
+ 
+ from ._api import BaseFileLock
+ from ._util import ensure_directory_exists, raise_on_not_writable_file
+ 
++#: Contenders act on the record in the marker, so no other account may write it, whatever the mode or umask.
++_OTHERS_WRITE: Final[int] = stat.S_IWGRP | stat.S_IWOTH
++
+ _WIN_SYNCHRONIZE = 0x100000
+ _WIN_ERROR_INVALID_PARAMETER = 87
+ 
+@@ -41,7 +46,7 @@ class SoftFileLock(BaseFileLock):
+         if (o_nofollow := getattr(os, "O_NOFOLLOW", None)) is not None:
+             flags |= o_nofollow
+         try:
+-            file_handler = os.open(self.lock_file, flags, self._open_mode())
++            file_handler = os.open(self.lock_file, flags, self._open_mode() & ~_OTHERS_WRITE)
+         except OSError as exception:
+             if not (
+                 exception.errno == EEXIST or (exception.errno == EACCES and sys.platform == "win32")
+diff --git a/tests/test_filelock.py b/tests/test_filelock.py
+index b7751c5..38c7b90 100644
+--- a/tests/test_filelock.py
++++ b/tests/test_filelock.py
+@@ -586,27 +586,28 @@ def test_lock_mode(tmp_path: Path) -> None:
+     lock.release()
+ 
+ 
+-def test_lock_mode_soft(tmp_path: Path) -> None:
+-    # test soft lock permissions are dependent of umask
++@pytest.mark.skipif(sys.platform == "win32", reason="POSIX marker permission bits")
++@pytest.mark.parametrize(
++    ("mode", "umask"),
++    [
++        pytest.param(0o666, 0o022, id="explicit-mode"),
++        pytest.param(None, 0, id="default-mode-open-umask"),
++    ],
++)
++def test_lock_mode_soft_lets_only_the_owner_write_the_marker(
++    mode: int | None, umask: int, tmp_path: Path
++) -> None:
++    # Contenders act on the record inside, so no other account may rewrite it.
+     lock_path = tmp_path / "a.lock"
+-    lock = SoftFileLock(str(lock_path), mode=0o666)
++    lock = SoftFileLock(str(lock_path)) if mode is None else SoftFileLock(str(lock_path), mode=mode)
+ 
+-    # set umask so permissions can be anticipated
+-    initial_umask = os.umask(0o022)
++    initial_umask = os.umask(umask)
+     try:
+-        lock.acquire()
+-        assert lock.is_locked
+-
+-        mode = filemode(lock_path.stat().st_mode)
+-        if sys.platform == "win32":
+-            assert mode == "-rw-rw-rw-"
+-        else:
+-            assert mode == "-rw-r--r--"
++        with lock:
++            assert filemode(lock_path.stat().st_mode) == "-rw-r--r--"
+     finally:
+         os.umask(initial_umask)
+ 
+-    lock.release()
+-
+ 
+ def test_umask(tmp_path: Path) -> None:
+     lock_path = tmp_path / "a.lock"
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 9308674f9a..03c23092b9 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 CVE_PRODUCT = "tox-dev:filelock"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += " file://run-ptest \
+    file://CVE-2026-112939.patch \
+"
 SRC_URI[sha256sum] = "b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6
