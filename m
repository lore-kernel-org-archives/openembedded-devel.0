Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12365.1795500917189834209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ysyqt1zR;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=34977; q=dns/txt;
  s=iport01; t=1795500917; x=1796710517;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AzPuUcGnoarBPjkyAhKXGR3VzW6iF+fwC3ooQJu7pF4=;
  b=Ysyqt1zR5orfU6MYNYBLrKDt19fCquYt4YyH0c2Oa5FyV0+oxVnYOQON
   h/PTpaBN2CYEVoq61p3hwD7bjA/rRU2+elFj5z2lajICNuIZmj9FCU3v1
   EmDHierJEh/uiuHaMsCQjoiSL+d50heHEYvcyrVtti4Rk12IYPP6u350d
   Vhlllt5rWHBxbpK8sE/FiJnZqYOSD1GgLg4SP5zD/1fF1pPsH4Bw/p/sF
   4/rgNDe1EqH+1W5UCOLQhqN++YCe6A8P6oAXhbga3CFJqSGhpSgafjRLq
   Eccx9Ms5Rsad3MmnDtgvyMJnZis/yUU1POP30BfHKev8QvMoIPDV37wl7
   Q==;
X-CSE-ConnectionGUID: mwRta7EkRhCLj2YimvZ8fA==
X-CSE-MsgGUID: +bskLJBtSpuJ63itoP1dGg==
X-IPAS-Result: =?us-ascii?q?A0AaAADrKQVr/8tK/pBUBhwBAQEBAQEHAQESAQEEBAEBg?=
 =?us-ascii?q?XwHAQELAYIXP3VgQ0kDjG+HOIIhA4ETkD2MWRSBag8BAQEPRA0EAQGEP0YCj?=
 =?us-ascii?q?iICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBA?=
 =?us-ascii?q?gEDGgEMCwEYAT0cAwECLysdAQUIGYIqWAGCdAMRunaBeTOBAYMpAT8CQ1DZS?=
 =?us-ascii?q?4FoAQsUAYE4AYVBiCRdGAFEhDknG4FJRIEVgnR2gQWBXAICgSkBEgEICYZWB?=
 =?us-ascii?q?IINgSGBVIEri2wCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfE?=
 =?us-ascii?q?AYWIQsbGA1IESw3FRkEPm4HlBSCehkGAQEwKAoYEwEjCCACKwMEAikSDzoRE?=
 =?us-ascii?q?gcBAyQREyqSQyQKkBWCIaERhCuMJI9ChXgaM4QElBqRLoEmC5h9glmLMYkRj?=
 =?us-ascii?q?CQ0Cw0BGDeEaoFoPDcycDMaCBsVgyIJCkAZD44rAgELC4FogXiEUENRyHcmM?=
 =?us-ascii?q?gIJAy8BAQcCBw4DC4FokAACJgQDgU8BAQ?=
IronPort-Data: A9a23:v6F1vKOpWIZLbAzvrR3wlsFynXyQoLVcMsEvi/4bfWQNrUok02EPy
 WsaCm2FPq6ONDDyf9Bza4+w8BsCvpHTzYRrTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWIsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/BxNl0/YqAbwOZcJWMUx
 P0dNgJdYDnW0opawJrjIgVtrs0uNozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I0BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCNllMsjOW1bLI5fPTJT95WumSyu
 lne4kanWRAGM+TGxRWKpyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgaWEW2pdG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnXjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:+BgMJaOLKpOJ5sBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:EOt8vmGC5lqbe0w0qmJi63QIE58IcUfd51PSeX65DHhbGLO8HAo=
X-Talos-MUID: 9a23:Rh1mwwiep4oNJ6hrfBJkPcMpd81z4ICMIlw2iYgk5ZKFKStIYjuyg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62754504"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:15:14 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 1E88F180005C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:14 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id C5ED7CC12A7; Mon, 23 Nov 2026 22:15:12 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 2/3] python3-tornado: Fix CVE-2026-123534
Date: Mon, 23 Nov 2026 22:15:11 -0800
Message-Id: <20261124061512.1663330-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124061512.1663330-1-yurade@cisco.com>
References: <20261124061512.1663330-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132929
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], [2] and [3].

[1] https://github.com/tornadoweb/tornado/commit/6371c4b67a19766b86d0eb7c7b0c913fc37722fe
[2] https://github.com/tornadoweb/tornado/commit/2b230bf89604fa7cfaf7e1d0922aeb2ed919f3a4
[3] https://github.com/tornadoweb/tornado/commit/c433feb3b2bca6f69f9b30e98af6a66069f1edd4
[4] https://security-tracker.debian.org/tracker/CVE-2026-123534

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-123534_p1.patch  | 268 +++++++++++
 .../python3-tornado/CVE-2026-123534_p2.patch  | 425 ++++++++++++++++++
 .../python3-tornado/CVE-2026-123534_p3.patch  |  59 +++
 .../python/python3-tornado_6.5.7.bb           |   3 +
 4 files changed, 755 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p1.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p1.patch
new file mode 100644
index 0000000000..b6568fb455
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p1.patch
@@ -0,0 +1,268 @@
+From 6371c4b67a19766b86d0eb7c7b0c913fc37722fe Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Thu, 8 Oct 2026 11:45:42 +0000
+Subject: [PATCH] web: Validate paths in StaticFileHandler.get_version
+
+static_url() hashed whatever file get_absolute_path pointed at without
+the checks validate_absolute_path applies when serving. A path with ../
+or a symlink pointing outside the static directory would be read and
+its SHA-512 included in the URL, and a path resolving to a device such
+as /dev/zero (or a FIFO) would block the event loop indefinitely.
+
+get_version now checks that the path is inside static_path, resolves
+symlinks against allowed_symlink_directory (taken from
+static_handler_args, defaulting to the static root), and requires a
+regular file before reading it. The root and symlink-directory logic is
+factored out of validate_absolute_path so both share it.
+
+CVE: CVE-2026-123534
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/6371c4b67a19766b86d0eb7c7b0c913fc37722fe]
+
+Backport Changes:
+- The Wrynose source already contains the lexical root and symlink checks
+  from its CVE-2026-116578 patches. Adapted the helper refactor to factor
+  the existing root check into _check_in_root and reuse Wrynose's
+  string-valued symlink policy in get_version.
+- Use unittest.TestCase for the new tests because tornado.test.util does
+  not provide TestCase in the target Tornado 6.5.7 source.
+- Keep the existing POSIX-only skip decorator on StaticFileMultiRootTest
+  and add a separate decorator for StaticFileVersionPathTest.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_019nvEV873ZwBncgxPP13Xfd
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
+ tornado/web.py           | 86 ++++++++++++++++++++++++++++----------
+ 2 files changed, 152 insertions(+), 21 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 0dba44a7..ce6e09ef 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -49,6 +49,7 @@ import copy
+ import datetime
+ import email.utils
+ import gzip
++import hashlib
+ from io import BytesIO
+ import itertools
+ import logging
+@@ -1729,6 +1730,92 @@ class MultiRootStaticFileHandler(StaticFileHandler):
+ 
+ 
++@unittest.skipIf(os.name != "posix", "non-posix OS")
++class StaticFileVersionPathTest(unittest.TestCase):
++    """``get_version`` (used by ``static_url``) must apply the same path
++    checks as serving the file, so that it never reads, or leaks a hash of,
++    anything outside the static directory.
++    """
++
++    def setUp(self):
++        self.tmpdir = tempfile.mkdtemp()
++        self.addCleanup(shutil.rmtree, self.tmpdir)
++        self.root = os.path.join(self.tmpdir, "static")
++        self.outside = os.path.join(self.tmpdir, "outside")
++        os.mkdir(self.root)
++        os.mkdir(self.outside)
++        with open(os.path.join(self.root, "inside.txt"), "w", encoding="utf-8") as f:
++            f.write("inside")
++        with open(os.path.join(self.outside, "secret.txt"), "w", encoding="utf-8") as f:
++            f.write("secret")
++        os.symlink(
++            os.path.join(self.outside, "secret.txt"),
++            os.path.join(self.root, "link.txt"),
++        )
++        os.symlink(
++            os.path.join(self.root, "inside.txt"),
++            os.path.join(self.root, "internal.txt"),
++        )
++        StaticFileHandler.reset()
++        self.addCleanup(StaticFileHandler.reset)
++        super().setUp()
++
++    def get_version(self, path, **static_handler_args):
++        settings = dict(static_path=self.root)
++        if static_handler_args:
++            settings["static_handler_args"] = static_handler_args
++        return StaticFileHandler.get_version(settings, path)
++
++    def test_regular_file(self):
++        self.assertEqual(
++            self.get_version("inside.txt"), hashlib.sha512(b"inside").hexdigest()
++        )
++
++    def test_symlink_within_root(self):
++        self.assertEqual(
++            self.get_version("internal.txt"), hashlib.sha512(b"inside").hexdigest()
++        )
++
++    def test_traversal(self):
++        with ExpectLog(gen_log, "Could not open static file"):
++            self.assertIsNone(self.get_version("../outside/secret.txt"))
++
++    def test_symlink_escaping_root(self):
++        with ExpectLog(gen_log, "Could not open static file"):
++            self.assertIsNone(self.get_version("link.txt"))
++
++    def test_allowed_symlink_directory(self):
++        # static_handler_args configures the handler that will serve the
++        # file, so get_version honors its allowed_symlink_directory too.
++        self.assertEqual(
++            self.get_version("link.txt", allowed_symlink_directory=self.tmpdir),
++            hashlib.sha512(b"secret").hexdigest(),
++        )
++
++    def test_allowed_symlink_directory_does_not_allow_traversal(self):
++        with ExpectLog(gen_log, "Could not open static file"):
++            self.assertIsNone(
++                self.get_version(
++                    "../outside/secret.txt", allowed_symlink_directory=self.tmpdir
++                )
++            )
++
++    @unittest.skipIf(not os.path.exists("/dev/zero"), "no /dev/zero")
++    def test_device_file(self):
++        # Hashing /dev/zero would never finish. Reach it through a symlink
++        # that is explicitly allowed, so that only the regular-file check
++        # stands in the way.
++        os.symlink("/dev/zero", os.path.join(self.root, "zero"))
++        with ExpectLog(gen_log, "Could not open static file"):
++            self.assertIsNone(self.get_version("zero", allowed_symlink_directory="/"))
++
++    def test_fifo(self):
++        # Opening a FIFO with no writer would block forever.
++        os.mkfifo(os.path.join(self.root, "fifo"))
++        with ExpectLog(gen_log, "Could not open static file"):
++            self.assertIsNone(self.get_version("fifo"))
++
++
+ @unittest.skipIf(os.name != "posix", "non-posix OS")
+ class StaticFileMultiRootTest(WebTestCase):
+     """Subclasses that search several directories and never set
+     ``allowed_symlink_directory`` must keep working (issue #3724).
+diff --git a/tornado/web.py b/tornado/web.py
+index a61e9594..b4c18113 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -3028,22 +3028,7 @@ class StaticFileHandler(RequestHandler):
+ 
+         .. versionadded:: 3.1
+         """
+-        # os.path.abspath strips a trailing /.
+-        # We must add it back to `root` so that we only match files
+-        # in a directory named `root` instead of files starting with
+-        # that prefix.
+-        root = os.path.abspath(root)
+-        if not root.endswith(os.path.sep):
+-            # abspath always removes a trailing slash, except when
+-            # root is '/'. This is an unusual case, but several projects
+-            # have independently discovered this technique to disable
+-            # Tornado's path validation and (hopefully) do their own,
+-            # so we need to support it.
+-            root += os.path.sep
+-        # The trailing slash also needs to be temporarily added back
+-        # the requested path so a request to root/ will match.
+-        if not (absolute_path + os.path.sep).startswith(root):
+-            raise HTTPError(403, "%s is not in root static directory", self.path)
++        root = self._check_in_root(root, absolute_path, self.path)
+         # Symlinks may point anywhere inside allowed_symlink_directory, which
+         # defaults to the directory being served. Resolve that default here,
+         # against the same root the checks above used, rather than in
+@@ -3103,6 +3088,32 @@ class StaticFileHandler(RequestHandler):
+         self._stat_result = stat_result
+         return absolute_path
+ 
++    @staticmethod
++    def _check_in_root(root: str, absolute_path: str, path_message: str) -> str:
++        """Checks that ``absolute_path`` (as written) is inside ``root``.
++
++        Returns the normalized root, with a trailing separator. Raises
++        `HTTPError` (403) if the path is outside of it. ``path_message``
++        is used only to build the error message.
++        """
++        # os.path.abspath strips a trailing /.
++        # We must add it back to `root` so that we only match files
++        # in a directory named `root` instead of files starting with
++        # that prefix.
++        root = os.path.abspath(root)
++        if not root.endswith(os.path.sep):
++            # abspath always removes a trailing slash, except when
++            # root is '/'. This is an unusual case, but several projects
++            # have independently discovered this technique to disable
++            # Tornado's path validation and (hopefully) do their own,
++            # so we need to support it.
++            root += os.path.sep
++        # The trailing slash also needs to be temporarily added back
++        # the requested path so a request to root/ will match.
++        if not (absolute_path + os.path.sep).startswith(root):
++            raise HTTPError(403, "%s is not in root static directory", path_message)
++        return root
++
+     @staticmethod
+     def _resolve_symlink_target(
+         absolute_path: str, allowed_symlink_directory: str, path_message: str
+@@ -3346,7 +3357,7 @@ class StaticFileHandler(RequestHandler):
+         return url_path
+ 
+     @classmethod
+-    def get_version(cls, settings: Dict[str, Any], path: str) -> Optional[str]:
++    def get_version(cls, settings: dict[str, Any], path: str) -> str | None:
+         """Generate the version string to be used in static URLs.
+ 
+         ``settings`` is the `Application.settings` dictionary and ``path``
+@@ -3358,17 +3369,50 @@ class StaticFileHandler(RequestHandler):
+            This method was previously recommended for subclasses to override;
+            `get_content_version` is now preferred as it allows the base
+            class to handle caching of the result.
++
++        .. versionchanged:: 6.6
++           Paths outside ``static_path`` (including symlinks that point
++           outside of ``allowed_symlink_directory`` as configured in
++           ``static_handler_args``) and paths that are not regular files
++           are no longer read, and get no version.
+         """
+-        abs_path = cls.get_absolute_path(settings["static_path"], path)
+-        return cls._get_cached_version(abs_path)
++        root = settings["static_path"]
++        abs_path = cls.get_absolute_path(root, path)
++        allowed_symlink_directory = settings.get("static_handler_args", {}).get(
++            "allowed_symlink_directory"
++        )
++
++        def validate() -> str:
++            # The same checks validate_absolute_path applies when the file is
++            # served. Without them, static_url() would read (and leak a hash
++            # of) any file on the system named with ../ or reached through a
++            # symlink, and a path like /dev/zero would hang the event loop.
++            checked_root = cls._check_in_root(root, abs_path, path)
++            resolved_path = cls._resolve_symlink_target(
++                abs_path, allowed_symlink_directory or checked_root, path
++            )
++            if not stat.S_ISREG(os.stat(resolved_path).st_mode):
++                raise HTTPError(403, "%s is not a file", path)
++            return resolved_path
++
++        return cls._get_cached_version(abs_path, validate)
+ 
+     @classmethod
+-    def _get_cached_version(cls, abs_path: str) -> Optional[str]:
++    def _get_cached_version(
++        cls, abs_path: str, validate: Callable[[], str] | None = None
++    ) -> str | None:
++        """Returns the (cached) version of the file at ``abs_path``.
++
++        ``validate``, if given, is called before the file is first read; it
++        returns the path to read or raises if the file must not be read.
++        Callers that have already validated ``abs_path`` may omit it.
++        """
+         with cls._lock:
+             hashes = cls._static_hashes
+             if abs_path not in hashes:
+                 try:
+-                    hashes[abs_path] = cls.get_content_version(abs_path)
++                    content_path = abs_path if validate is None else validate()
++                    hashes[abs_path] = cls.get_content_version(content_path)
+                 except Exception:
+                     gen_log.error("Could not open static file %r", abs_path)
+                     hashes[abs_path] = None
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p2.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p2.patch
new file mode 100644
index 0000000000..09037243db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p2.patch
@@ -0,0 +1,425 @@
+From 2b230bf89604fa7cfaf7e1d0922aeb2ed919f3a4 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Thu, 8 Oct 2026 13:41:56 +0000
+Subject: [PATCH] web: Move static_url path checks into the filesystem methods
+
+Rework the previous commit so that get_version is unchanged and keeps
+delegating all filesystem knowledge to the methods documented for
+replacing filesystem access:
+
+- get_absolute_path now rejects paths that lead outside the root as
+  written (e.g. ../), sharing the check with validate_absolute_path.
+- get_content refuses anything that is not a regular file (devices such
+  as /dev/zero or Windows' CON/NUL, FIFOs, directories), sharing the
+  stat check with validate_absolute_path.
+- get_content_version stops hashing after MAX_VERSION_CONTENT_SIZE
+  (64 MiB by default) so a huge file cannot block the event loop.
+
+Symlinks are still only checked by validate_absolute_path, since
+allowed_symlink_directory is per-handler configuration that the class
+methods used by static_url cannot see.
+
+Tests that don't need symlinks or FIFOs now run on all platforms, and
+the Windows special filenames are checked for static_url as well as
+for serving.
+
+CVE: CVE-2026-123534
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/2b230bf89604fa7cfaf7e1d0922aeb2ed919f3a4]
+
+Backport Changes:
+- The Wrynose 6.5.7 source already had path and symlink validation in
+  validate_absolute_path. The p2 conflict was resolved by moving the
+  lexical check into get_absolute_path, reusing the existing regular-
+  file helper, and retaining the target branch's type conventions.
+  The Windows special-filename regression was added because the Wrynose
+  test file did not have that upstream test.
+- Keep unittest.TestCase because tornado.test.util does not define
+  TestCase in the target Tornado 6.5.7 source. Remove the class-level
+  POSIX skip from StaticFileVersionPathTest while preserving the existing
+  POSIX skip on StaticFileMultiRootTest.
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_019nvEV873ZwBncgxPP13Xfd
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 128 ++++++++++++++++++++++++++++++-----------------
+ tornado/web.py           | 118 +++++++++++++++++++++--------------
+ 2 files changed, 152 insertions(+), 94 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 3b7307cb..4d23e14a 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -1198,6 +1198,12 @@ class ErrorResponseTest(WebTestCase):
+             self.assertEqual(b"", response.body)
+ 
+ 
++# Windows has some magic filenames that are special and (in some ways) "exist"
++# in every directory. These filenames are used to access stdio and hardware
++# devices and so must never be read as static files.
++WINDOWS_SPECIAL_FILENAMES = ["CON", "PRN", "AUX", "NUL", "COM1", "LPT1"]
++
++
+ class StaticFileTest(WebTestCase):
+     # The expected SHA-512 hash of robots.txt, used in tests that call
+     # StaticFileHandler.get_version
+@@ -1277,6 +1283,28 @@ class StaticFileTest(WebTestCase):
+             response.headers.get("Content-Type"), {"text/xml", "application/xml"}
+         )
+ 
++    def test_static_windows_special_filenames(self):
++        for filename in WINDOWS_SPECIAL_FILENAMES:
++            with self.subTest(filename=filename):
++                # The 403 below is raised with a log message, so it must be
++                # expected here. It is not required because the 404 path (and
++                # every platform other than windows) does not log anything.
++                with ExpectLog(
++                    gen_log,
++                    ".*is not (in root static directory|a file)",
++                    required=False,
++                    level=logging.WARNING,
++                ):
++                    response = self.fetch(f"/static/{filename}")
++                # The exact behavior of these filenames differs across versions of
++                # Windows and Python.
++                # https://github.com/python/cpython/issues/90520#issuecomment-1093942179
++                # This sometimes hits the "file not in static root directory" or "not a
++                # file" checks (which return 403) and sometimes the "file does not exist"
++                # check (which returns 404).
++                # Either outcome is fine as long as we don't actually try to serve the file.
++                self.assertIn(response.code, (404, 403))
++
+     def test_static_url(self):
+         response = self.fetch("/static_url/robots.txt")
+         self.assertEqual(response.body, b"/static/robots.txt?v=" + self.robots_txt_hash)
+@@ -1729,11 +1757,9 @@ class MultiRootStaticFileHandler(StaticFileHandler):
+         return super().validate_absolute_path(root, absolute_path)
+ 
+ 
+-@unittest.skipIf(os.name != "posix", "non-posix OS")
+ class StaticFileVersionPathTest(unittest.TestCase):
+-    """``get_version`` (used by ``static_url``) must apply the same path
+-    checks as serving the file, so that it never reads, or leaks a hash of,
+-    anything outside the static directory.
++    """``get_version`` (used by ``static_url``) must never read anything
++    outside the static directory, or anything that is not a regular file.
+     """
+ 
+     def setUp(self):
+@@ -1744,79 +1769,87 @@ class StaticFileVersionPathTest(unittest.TestCase):
+         self.outside = os.path.join(self.tmpdir, "outside")
+         os.mkdir(self.root)
+         os.mkdir(self.outside)
++        os.mkdir(os.path.join(self.root, "subdir"))
+         with open(os.path.join(self.root, "inside.txt"), "w", encoding="utf-8") as f:
+             f.write("inside")
+         with open(os.path.join(self.outside, "secret.txt"), "w", encoding="utf-8") as f:
+             f.write("secret")
+-        os.symlink(
+-            os.path.join(self.outside, "secret.txt"),
+-            os.path.join(self.root, "link.txt"),
+-        )
+-        os.symlink(
+-            os.path.join(self.root, "inside.txt"),
+-            os.path.join(self.root, "internal.txt"),
+-        )
+         StaticFileHandler.reset()
+         self.addCleanup(StaticFileHandler.reset)
+         super().setUp()
+ 
+-    def get_version(self, path, **static_handler_args):
+-        settings = dict(static_path=self.root)
+-        if static_handler_args:
+-            settings["static_handler_args"] = static_handler_args
+-        return StaticFileHandler.get_version(settings, path)
++    def get_version(self, path, handler_class=StaticFileHandler):
++        return handler_class.get_version(dict(static_path=self.root), path)
+ 
+     def test_regular_file(self):
+         self.assertEqual(
+             self.get_version("inside.txt"), hashlib.sha512(b"inside").hexdigest()
+         )
+ 
+-    def test_symlink_within_root(self):
+-        self.assertEqual(
+-            self.get_version("internal.txt"), hashlib.sha512(b"inside").hexdigest()
+-        )
+-
+     def test_traversal(self):
+-        with ExpectLog(gen_log, "Could not open static file"):
+-            self.assertIsNone(self.get_version("../outside/secret.txt"))
+-
+-    def test_symlink_escaping_root(self):
+-        with ExpectLog(gen_log, "Could not open static file"):
+-            self.assertIsNone(self.get_version("link.txt"))
++        with self.assertRaises(HTTPError) as cm:
++            self.get_version("../outside/secret.txt")
++        self.assertEqual(cm.exception.status_code, 403)
++
++    def test_directory(self):
++        with ExpectLog(gen_log, "Could not open static file.*is not a file"):
++            self.assertIsNone(self.get_version("subdir"))
++
++    def test_windows_special_filenames(self):
++        # These exist (as devices) in every directory on Windows; elsewhere
++        # they are simply missing. Either way they must get no version.
++        for filename in WINDOWS_SPECIAL_FILENAMES:
++            with self.subTest(filename=filename):
++                with ExpectLog(gen_log, "Could not open static file", required=False):
++                    try:
++                        version = self.get_version(filename)
++                    except HTTPError as e:
++                        # Some versions of Python on Windows turn these into
++                        # paths like \\.\CON, which get_absolute_path
++                        # rejects as being outside the root.
++                        self.assertEqual(e.status_code, 403)
++                    else:
++                        self.assertIsNone(version)
++
++    def test_max_size(self):
++        class SmallStaticFileHandler(StaticFileHandler):
++            MAX_VERSION_CONTENT_SIZE = len(b"inside")
+ 
+-    def test_allowed_symlink_directory(self):
+-        # static_handler_args configures the handler that will serve the
+-        # file, so get_version honors its allowed_symlink_directory too.
+         self.assertEqual(
+-            self.get_version("link.txt", allowed_symlink_directory=self.tmpdir),
+-            hashlib.sha512(b"secret").hexdigest(),
++            self.get_version("inside.txt", SmallStaticFileHandler),
++            hashlib.sha512(b"inside").hexdigest(),
+         )
++        SmallStaticFileHandler.reset()
++        SmallStaticFileHandler.MAX_VERSION_CONTENT_SIZE -= 1
++        with ExpectLog(gen_log, "Could not open static file.*larger than"):
++            self.assertIsNone(self.get_version("inside.txt", SmallStaticFileHandler))
+ 
+-    def test_allowed_symlink_directory_does_not_allow_traversal(self):
+-        with ExpectLog(gen_log, "Could not open static file"):
+-            self.assertIsNone(
+-                self.get_version(
+-                    "../outside/secret.txt", allowed_symlink_directory=self.tmpdir
+-                )
+-            )
++    @unittest.skipIf(os.name != "posix", "non-posix OS")
++    def test_symlink_within_root(self):
++        os.symlink(
++            os.path.join(self.root, "inside.txt"),
++            os.path.join(self.root, "internal.txt"),
++        )
++        self.assertEqual(
++            self.get_version("internal.txt"), hashlib.sha512(b"inside").hexdigest()
++        )
+ 
+     @unittest.skipIf(not os.path.exists("/dev/zero"), "no /dev/zero")
+-    def test_device_file(self):
+-        # Hashing /dev/zero would never finish. Reach it through a symlink
+-        # that is explicitly allowed, so that only the regular-file check
+-        # stands in the way.
++    def test_symlink_to_device(self):
++        # Hashing /dev/zero would never finish.
+         os.symlink("/dev/zero", os.path.join(self.root, "zero"))
+-        with ExpectLog(gen_log, "Could not open static file"):
+-            self.assertIsNone(self.get_version("zero", allowed_symlink_directory="/"))
++        with ExpectLog(gen_log, "Could not open static file.*is not a file"):
++            self.assertIsNone(self.get_version("zero"))
+ 
++    @unittest.skipIf(not hasattr(os, "mkfifo"), "no FIFOs")
+     def test_fifo(self):
+         # Opening a FIFO with no writer would block forever.
+         os.mkfifo(os.path.join(self.root, "fifo"))
+-        with ExpectLog(gen_log, "Could not open static file"):
++        with ExpectLog(gen_log, "Could not open static file.*is not a file"):
+             self.assertIsNone(self.get_version("fifo"))
+ 
+ 
+ @unittest.skipIf(os.name != "posix", "non-posix OS")
+ class StaticFileMultiRootTest(WebTestCase):
+     """Subclasses that search several directories and never set
+     ``allowed_symlink_directory`` must keep working (issue #3724).
+diff --git a/tornado/web.py b/tornado/web.py
+index 4f734aba..0609b4f0 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2814,6 +2814,14 @@ class StaticFileHandler(RequestHandler):
+ 
+     CACHE_MAX_AGE = 86400 * 365 * 10  # 10 years
+ 
++    #: The largest content (in bytes) that `get_content_version` will hash.
++    #: Hashing is synchronous, so this bounds how long
++    #: `~RequestHandler.static_url` can block the event loop. Larger files
++    #: get no version. Subclasses may change it.
++    #:
++    #: .. versionadded:: 6.6
++    MAX_VERSION_CONTENT_SIZE = 64 * 1024 * 1024
++
+     _static_hashes = {}  # type: Dict[str, Optional[str]]
+     _lock = threading.Lock()  # protects _static_hashes
+ 
+@@ -3003,9 +3011,19 @@ class StaticFileHandler(RequestHandler):
+         as long as they are unique and understood by the subclass's
+         overridden `get_content`.
+ 
++        Raises `HTTPError` (403) if ``path`` leads outside of ``root`` (as
++        written, e.g. with ``../``; symlinks are checked later by
++        `validate_absolute_path`). This check is also what keeps
++        `get_version` (and therefore `~RequestHandler.static_url`) from
++        reading files outside of the static directory.
++
+         .. versionadded:: 3.1
++
++        .. versionchanged:: 6.6
++           Paths outside of ``root`` now raise `HTTPError`.
+         """
+         abspath = os.path.abspath(os.path.join(root, path))
++        cls._check_in_root(root, abspath, path)
+         return abspath
+ 
+     def validate_absolute_path(self, root: str, absolute_path: str) -> Optional[str]:
+@@ -3077,6 +3095,20 @@ class StaticFileHandler(RequestHandler):
+         # generation each resolve the path again. Every one of those is a
+         # separate trip through the filesystem that could observe a
+         # different file from the one validated here.
++        self._stat_result = self._stat_regular_file(absolute_path, self.path)
++        return absolute_path
++
++    @staticmethod
++    def _stat_regular_file(absolute_path: str, path_message: str) -> os.stat_result:
++        """Stats ``absolute_path`` and checks that it is a regular file.
++
++        Raises `HTTPError` (404) if the path cannot be stat'ed, or (403) if
++        it is anything other than a regular file. Directories, devices (such
++        as ``/dev/zero``, or ``CON`` and ``NUL``, which exist in every
++        directory on Windows), FIFOs and sockets must never be read: some of
++        them never end, and opening a FIFO blocks until there is a writer.
++        ``path_message`` is used only to build the error message.
++        """
+         try:
+             stat_result = os.stat(absolute_path)
+         except OSError:
+@@ -3084,9 +3116,8 @@ class StaticFileHandler(RequestHandler):
+             # false when the path cannot be stat'ed at all.
+             raise HTTPError(404)
+         if not stat.S_ISREG(stat_result.st_mode):
+-            raise HTTPError(403, "%s is not a file", self.path)
+-        self._stat_result = stat_result
+-        return absolute_path
++            raise HTTPError(403, "%s is not a file", path_message)
++        return stat_result
+ 
+     @staticmethod
+     def _check_in_root(root: str, absolute_path: str, path_message: str) -> str:
+@@ -3181,7 +3212,14 @@ class StaticFileHandler(RequestHandler):
+         as it helps reduce memory fragmentation.
+ 
+         .. versionadded:: 3.1
++
++        .. versionchanged:: 6.6
++           Raises `HTTPError` if ``abspath`` is not a regular file.
+         """
++        # validate_absolute_path has already checked this when serving a
++        # request, but get_content_version (for static_url) reaches this
++        # method with nothing but get_absolute_path in between.
++        cls._stat_regular_file(abspath, abspath)
+         with open(abspath, "rb") as file:
+             if start is not None:
+                 file.seek(start)
+@@ -3210,15 +3248,34 @@ class StaticFileHandler(RequestHandler):
+         This class method may be overridden by subclasses.  The
+         default implementation is a SHA-512 hash of the file's contents.
+ 
++        The hash is computed synchronously, so content larger than
++        `MAX_VERSION_CONTENT_SIZE` is not hashed (and gets no version)
++        rather than blocking the event loop for a long time.
++
+         .. versionadded:: 3.1
++
++        .. versionchanged:: 6.6
++           Content larger than `MAX_VERSION_CONTENT_SIZE` raises `ValueError`.
+         """
+         data = cls.get_content(abspath)
++        chunks = [data] if isinstance(data, bytes) else data
+         hasher = hashlib.sha512()
+-        if isinstance(data, bytes):
+-            hasher.update(data)
+-        else:
+-            for chunk in data:
++        size = 0
++        try:
++            for chunk in chunks:
++                size += len(chunk)
++                if size > cls.MAX_VERSION_CONTENT_SIZE:
++                    raise ValueError(
++                        "content is larger than MAX_VERSION_CONTENT_SIZE (%d bytes)"
++                        % cls.MAX_VERSION_CONTENT_SIZE
++                    )
+                 hasher.update(chunk)
++        finally:
++            # Close the file now, rather than when the generator is collected,
++            # if we stopped early.
++            close = getattr(chunks, "close", None)
++            if close is not None:
++                close()
+         return hasher.hexdigest()
+ 
+     def _stat(self) -> os.stat_result:
+@@ -3369,52 +3426,19 @@ class StaticFileHandler(RequestHandler):
+            This method was previously recommended for subclasses to override;
+            `get_content_version` is now preferred as it allows the base
+            class to handle caching of the result.
+-
+-        .. versionchanged:: 6.6
+-           Paths outside ``static_path`` (including symlinks that point
+-           outside of ``allowed_symlink_directory`` as configured in
+-           ``static_handler_args``) and paths that are not regular files
+-           are no longer read, and get no version.
+-        """
+-        root = settings["static_path"]
+-        abs_path = cls.get_absolute_path(root, path)
+-        allowed_symlink_directory = settings.get("static_handler_args", {}).get(
+-            "allowed_symlink_directory"
+-        )
+-
+-        def validate() -> str:
+-            # The same checks validate_absolute_path applies when the file is
+-            # served. Without them, static_url() would read (and leak a hash
+-            # of) any file on the system named with ../ or reached through a
+-            # symlink, and a path like /dev/zero would hang the event loop.
+-            checked_root = cls._check_in_root(root, abs_path, path)
+-            resolved_path = cls._resolve_symlink_target(
+-                abs_path, allowed_symlink_directory or checked_root, path
+-            )
+-            if not stat.S_ISREG(os.stat(resolved_path).st_mode):
+-                raise HTTPError(403, "%s is not a file", path)
+-            return resolved_path
+-
+-        return cls._get_cached_version(abs_path, validate)
++        """
++        abs_path = cls.get_absolute_path(settings["static_path"], path)
++        return cls._get_cached_version(abs_path)
+ 
+     @classmethod
+-    def _get_cached_version(
+-        cls, abs_path: str, validate: Callable[[], str] | None = None
+-    ) -> str | None:
+-        """Returns the (cached) version of the file at ``abs_path``.
+-
+-        ``validate``, if given, is called before the file is first read; it
+-        returns the path to read or raises if the file must not be read.
+-        Callers that have already validated ``abs_path`` may omit it.
+-        """
++    def _get_cached_version(cls, abs_path: str) -> str | None:
+         with cls._lock:
+             hashes = cls._static_hashes
+             if abs_path not in hashes:
+                 try:
+-                    content_path = abs_path if validate is None else validate()
+-                    hashes[abs_path] = cls.get_content_version(content_path)
+-                except Exception:
+-                    gen_log.error("Could not open static file %r", abs_path)
++                    hashes[abs_path] = cls.get_content_version(abs_path)
++                except Exception as e:
++                    gen_log.error("Could not open static file %r: %s", abs_path, e)
+                     hashes[abs_path] = None
+             hsh = hashes.get(abs_path)
+             if hsh:
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p3.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p3.patch
new file mode 100644
index 0000000000..b549481890
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123534_p3.patch
@@ -0,0 +1,59 @@
+From c433feb3b2bca6f69f9b30e98af6a66069f1edd4 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Thu, 8 Oct 2026 19:32:55 +0000
+Subject: [PATCH] web: Document that static_url does not apply the symlink check
+
+make_static_url runs without a handler instance and cannot see
+allowed_symlink_directory, so a symlink inside the static directory
+can still cause static_url to hash (but not serve) a file outside it.
+Fixing that would need a new overridable hook plus heuristics to avoid
+breaking subclasses that map paths themselves (jupyter_server, voila),
+so document the limitation instead. Also note in static_url the
+behavior changes from the previous commits.
+
+CVE: CVE-2026-123534
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/c433feb3b2bca6f69f9b30e98af6a66069f1edd4]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_019nvEV873ZwBncgxPP13Xfd
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/web.py | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/tornado/web.py b/tornado/web.py
+index 6e6725f0..5cd0ae34 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -1744,6 +1744,15 @@ class RequestHandler:
+         that value will be used as the default for all `static_url`
+         calls that do not pass ``include_host`` as a keyword argument.
+ 
++        In the default implementation, a ``path`` that leads outside of
++        ``static_path`` (e.g. with ``../``) raises `HTTPError` (403).
++        Symlinks inside ``static_path`` are followed when computing the
++        version, even if they point outside of it; see `StaticFileHandler`.
++
++        .. versionchanged:: 6.6
++           Paths outside of ``static_path`` now raise `HTTPError`, and
++           files that are not regular files (or are larger than
++           `StaticFileHandler.MAX_VERSION_CONTENT_SIZE`) get no version.
+         """
+         self.require_setting("static_path", "static_url")
+         get_url = self.settings.get(
+@@ -2785,6 +2795,15 @@ class StaticFileHandler(RequestHandler):
+     argument to a directory containing all of the intended targets. It
+     defaults to the ``path`` argument.
+ 
++    This symlink check applies only when serving files. `make_static_url`
++    (and therefore `RequestHandler.static_url`) runs without a handler
++    instance, so it cannot see ``allowed_symlink_directory``, and it will
++    compute a version hash for any regular file that a symlink inside the
++    static directory points to, wherever that file is. The file's contents
++    are never served this way, but its hash (and whether it exists) is
++    revealed in the URL. Symlinks in the static directory should therefore
++    only be created by people trusted with the files they point to.
++
+     To maximize the effectiveness of browser caching, this class supports
+     versioned urls (by default using the argument ``?v=``).  If a version
+     is given, we instruct the browser to cache this file indefinitely.
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index dd72e683cf..3a131fc382 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -25,6 +25,9 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-123535_p1.patch \
             file://CVE-2026-123535_p2.patch \
             file://CVE-2026-123535_p3.patch \
+            file://CVE-2026-123534_p1.patch \
+            file://CVE-2026-123534_p2.patch \
+            file://CVE-2026-123534_p3.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.53.0

