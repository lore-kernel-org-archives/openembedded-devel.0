Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4914EC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:30:14 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1777.1787160609786855626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g95ghZ8H;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5050; q=dns/txt;
  s=iport01; t=1787160609; x=1788370209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ZQ0+1Kq8/R5l8fLIo3v1j7ha3CD76GYOcrlpaLStYs=;
  b=g95ghZ8HZbEbkvDKEsVKQI5Bpdz3UWd6lgBnUCVn2dPHqOeZ9LSbmv90
   TooO6fsJOESEepmfhLt5LkTu35BbuC3kkscbNBph0qIzjmq+1Ko329DhO
   myUj9Z/cVQaY6t8J6Txb7xq4l2oxaU4TSH/ULMuwlikT6C81Nq1aFHFNw
   eS4HsolzvKlrwvM1LAPvOXYrjpJLo0XPJAx+t6w9LdTGE0C+tUTTKF5Ld
   BneQjuXdWitvEQfsXgcDWi12tu2ACyeDHkLxjtwOC4o3ueqpidEX8AEdS
   TjC3lU+HdgjriDk/kpFEihR2Jb3vFyLb8FwTU0wVHKbcjqfe0mgSv5Gd8
   w==;
X-CSE-ConnectionGUID: 0Wl7phuGTTC9eqXmKlSBGw==
X-CSE-MsgGUID: Vml8JXkqQGWfxzB5nMRSCg==
X-IPAS-Result: =?us-ascii?q?A0BHAgBa54Vq/5QQJK1aglmCV3ReQ0mVXmyLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASoLARgBLSwDAQJPCx0BBSGDAgGCOgM3AxHEEYF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNhLDYJYAQsUAYE4hT+Cf4UjXRgBhHwnGxuBcoR+gQWBGkIBAYEnh?=
 =?us-ascii?q?lwiBIIiehKBWpFpSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFg?=
 =?us-ascii?q?R2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFDgkMCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB45KIII5EgF6EwErVD1ULxhOkmeSQaAecQoog3aMIY8+hXwaM4QElBeSU?=
 =?us-ascii?q?QuYfY4KhAmSR4RpgWg8gUcLB3AVgyIJShkPH44PCguDYIF/yjonMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:rMyHJ6g+wG90TWqTZWEhDLArX161MREKZh0ujC45NGQN5FlHY01je
 htvXWqAPv2NamD9f913Ooiwpk5XuZXWz9U2SlZrqStnFC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVAxeIoGWFT2
 sAkA2EAdyCGpOaN6p2kH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFI4zRGJ0Fwx7wS
 mTuwWH9UjMqN8Wm5gWL4mCG2+nqpxjQV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:sy4yganirgwZtyENfyzun5pPFv3pDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3ASUR9KmqpbghiVucC6Iu6F17mUZgadiLFzGr/H3O?=
 =?us-ascii?q?TWGtweLi2TWS617wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOqj7oA36xg44SHu56LreMa+CNzUj3aGqWGI9kow?=
 =?us-ascii?q?/lPaKJT5aZjG4tg+cTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="818350850"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:30:08 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id C98FD18006F01;
	Wed, 19 Aug 2026 17:30:08 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 67FA3CCA79B; Wed, 19 Aug 2026 10:30:08 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/2] python3-filelock: fix CVE-2025-68146
Date: Wed, 19 Aug 2026 10:30:04 -0700
Message-ID: <20260819173005.814360-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 17:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129363

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/tox-dev/filelock/commit/4724d7f8c3393ec1f048c93933e6e3e6ec321f0e
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-68146

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2025-68146.patch     | 88 +++++++++++++++++++
 .../python/python3-filelock_3.13.4.bb         |  3 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch
new file mode 100644
index 0000000000..95670f25be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch
@@ -0,0 +1,88 @@
+From 4003a6635c9a429de3f64ce967e8322ecbc6e71a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Mon, 15 Dec 2025 15:52:12 -0800
+Subject: [PATCH] Fix TOCTOU symlink vulnerability in lock file creation (#461)
+
+CVE: CVE-2025-68146
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/4724d7f8c3393ec1f048c93933e6e3e6ec321f0e]
+
+(cherry picked from commit 4724d7f8c3393ec1f048c93933e6e3e6ec321f0e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_unix.py    |  2 +-
+ src/filelock/_windows.py | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/src/filelock/_unix.py b/src/filelock/_unix.py
+index 4ae1fbe..28d3673 100644
+--- a/src/filelock/_unix.py
++++ b/src/filelock/_unix.py
+@@ -36,7 +36,7 @@ else:  # pragma: win32 no cover
+ 
+         def _acquire(self) -> None:
+             ensure_directory_exists(self.lock_file)
+-            open_flags = os.O_RDWR | os.O_TRUNC
++            open_flags = os.O_RDWR | os.O_TRUNC | os.O_NOFOLLOW
+             if not Path(self.lock_file).exists():
+                 open_flags |= os.O_CREAT
+             fd = os.open(self.lock_file, open_flags, self._context.mode)
+diff --git a/src/filelock/_windows.py b/src/filelock/_windows.py
+index 8db55dc..fe3d45c 100644
+--- a/src/filelock/_windows.py
++++ b/src/filelock/_windows.py
+@@ -11,7 +11,38 @@ from ._api import BaseFileLock
+ from ._util import ensure_directory_exists, raise_on_not_writable_file
+ 
+ if sys.platform == "win32":  # pragma: win32 cover
++    import ctypes
+     import msvcrt
++    from ctypes import wintypes
++
++    # Windows API constants for reparse point detection
++    FILE_ATTRIBUTE_REPARSE_POINT = 0x00000400
++    INVALID_FILE_ATTRIBUTES = 0xFFFFFFFF
++
++    # Load kernel32.dll
++    _kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)
++    _kernel32.GetFileAttributesW.argtypes = [wintypes.LPCWSTR]
++    _kernel32.GetFileAttributesW.restype = wintypes.DWORD
++
++    def _is_reparse_point(path: str) -> bool:
++        """
++        Check if a path is a reparse point (symlink, junction, etc.) on Windows.
++
++        :param path: Path to check
++        :return: True if path is a reparse point, False otherwise
++        :raises OSError: If GetFileAttributesW fails for reasons other than file-not-found
++        """
++        attrs = _kernel32.GetFileAttributesW(path)
++        if attrs == INVALID_FILE_ATTRIBUTES:
++            # File doesn't exist yet - that's fine, we'll create it
++            err = ctypes.get_last_error()
++            if err == 2:  # noqa: PLR2004  # ERROR_FILE_NOT_FOUND
++                return False
++            if err == 3:  # noqa: PLR2004 # ERROR_PATH_NOT_FOUND
++                return False
++            # Some other error - let caller handle it
++            return False
++        return bool(attrs & FILE_ATTRIBUTE_REPARSE_POINT)
+ 
+     class WindowsFileLock(BaseFileLock):
+         """Uses the :func:`msvcrt.locking` function to hard lock the lock file on Windows systems."""
+@@ -19,6 +50,13 @@ if sys.platform == "win32":  # pragma: win32 cover
+         def _acquire(self) -> None:
+             raise_on_not_writable_file(self.lock_file)
+             ensure_directory_exists(self.lock_file)
++
++            # Security check: Refuse to open reparse points (symlinks, junctions)
++            # This prevents TOCTOU symlink attacks (CVE-TBD)
++            if _is_reparse_point(self.lock_file):
++                msg = f"Lock file is a reparse point (symlink/junction): {self.lock_file}"
++                raise OSError(msg)
++
+             flags = (
+                 os.O_RDWR  # open for read and write
+                 | os.O_CREAT  # create file if not exists
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
index 4d6d19551a..9fa5f95ff1 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 SRC_URI[sha256sum] = "d13f466618bfde72bd2c18255e269f72542c6e70e7bac83a0232d6b1cc5c8cf4"
 
+SRC_URI += "file://CVE-2025-68146.patch \
+           "
+
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
-- 
2.44.4


