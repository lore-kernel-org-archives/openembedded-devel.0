Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28861.1793862504297912303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pl4norz4;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=31935; q=dns/txt;
  s=iport01; t=1793862504; x=1795072104;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nuTdES3VJCkcviYiO4n3MoJVNVeBBjYI1mV8puTnqRg=;
  b=Pl4norz4x5Ahn4wmRqqyRzW1tzAFG21iJoxu0CLaBuVtB6A9nMhEwkrl
   CK5hQd0khvRZjERwMsB+JGBHHvM7hrYHkIWbCZ6wBymnb17kBVBDVKxPo
   7AkPUxtTzqon5Qppw6+47lRGjn1CPI/xqtd2TA9oWfOB79NMrXpU0RmDy
   KajB8IGvD6afjLtlN0TESDl796KkN7l/lIJbKDz4pyzZiHEWktp+x6kMu
   iKO6JAoLp1pJ/9eRQhgwoAV2CMQ+cAlfg0ni2sdBMEalqhqSFEtc+wykj
   bUaRXWJgFwxDBsVUD3Cb0iCCkzirHE3JD1ZsTS0zvrbtNpeIu+rTTWAfT
   Q==;
X-CSE-ConnectionGUID: 9ib+lX2CSDu3xVekiX9RNA==
X-CSE-MsgGUID: j0DrzgI6TxW6WaRPtqkM2g==
X-IPAS-Result: =?us-ascii?q?A0AqAADDKuxq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?QYBAQsBglZ1YENJlCqCIQORTIxVFIFqDwEBAQ9EDQQBAYQ/RgKOHQImNQgOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaAQwLA?=
 =?us-ascii?q?RgBPRwDAQIvKyMIGYMCAYJ0AxG8P4F5M4EBgykBPwJDUNlLgWgBCxQBgTgBh?=
 =?us-ascii?q?T+II10YAUSEOScbgUlEhAh2gQWBXAEBgUcBhl4Egy6BWoEDhT2GWAKBUoZxS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLG?=
 =?us-ascii?q?gVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+CcQ4LBwEeXBMBB?=
 =?us-ascii?q?yICBBwCJggEAikGDHIBBCQeBicDkmBDj2SCIYE1n1yEKowkj0KFeBozhASUG?=
 =?us-ascii?q?ZJUC5h9jgqJEYxYCw0BT4RpgWoDN4FHCwczGggbFTuCZwlKGQ+OOYFzgXiBf?=
 =?us-ascii?q?4JRgRTIdyYyAgkyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:RKcIuK1hQkOahrR5ufbD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzdRy
 zQWWDiDaKqPYWL2fo1/O9zk8E0A6MWAmNZhHgU/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXUA8fokooM1MLXwV5
 cIVKzE9PyqlrrfjqF67YrEEasULNsLnOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiZC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+C3b4SPIYfiqcN9nB60v
 HDJ3jrFEi5EC9Wl8Sac8Vf2ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:jquUDKATMsXKUXHlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:3fdLMG+OVS9hfnmlA5qVvx8VEIMhQif291vNeF+GBGVoeOyvb3bFrQ==
X-Talos-MUID: 9a23:RM03+QRJMDp3lCO7RXTu3B14JshJvZi+Nx4ymK8+p9CHEHZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530276233"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:08:21 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 0AAAC180005D7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:08:21 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id A9132CC12A9; Wed,  4 Nov 2026 23:08:20 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 3/6] python3-tornado: Fix CVE-2026-103263
Date: Wed,  4 Nov 2026 23:08:16 -0800
Message-Id: <20261105070819.2086816-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105070819.2086816-1-yurade@cisco.com>
References: <20261105070819.2086816-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131868
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and dependent commit from [2].

Required companion fix for CVE-2026-103263: The symlink-hardening
backport adds allowed_symlink_directory, but subclasses that
override initialize() without calling the base method do not
set it and fail with AttributeError. Include upstream commit
6bd9c4e0 and its regression tests with the CVE fix.

[1] https://github.com/tornadoweb/tornado/commit/437ab5f76565403b3403438d2e555d11f8128d32
[2] https://github.com/tornadoweb/tornado/commit/6bd9c4e0fc10ae743006cd6a97543d15050f9594
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-103263
[4] https://github.com/tornadoweb/tornado/issues/3724

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../CVE-2026-103263-dependent.patch           | 255 +++++++++++
 .../python3-tornado/CVE-2026-103263.patch     | 422 ++++++++++++++++++
 .../python/python3-tornado_6.5.7.bb           |   2 +
 3 files changed, 679 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch
new file mode 100644
index 0000000000..168f91c147
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch
@@ -0,0 +1,255 @@
+From 6bd9c4e0fc10ae743006cd6a97543d15050f9594 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Tue, 15 Sep 2026 12:54:25 +0000
+Subject: [PATCH] web: Fix subclasses that do not set allowed_symlink_directory
+
+allowed_symlink_directory was added in 6.5.9 as an attribute assigned in
+initialize(). Projects that subclass StaticFileHandler with their own
+initialize() that does not call ours never set it, so every static file
+request failed with
+
+    AttributeError: 'FileFindHandler' object has no attribute
+    'allowed_symlink_directory'
+
+Jupyter is the most prominent example, and it also shows why the
+attribute cannot simply default to self.root: its FileFindHandler
+searches a list of directories, so self.root is a tuple of paths, and
+its validate_absolute_path passes the one that matched down to us.
+
+Give allowed_symlink_directory a class-level default of None, which
+subclasses inherit whatever their initialize() does, and resolve that
+default in validate_absolute_path against the root it was given.
+_resolve_symlink_target becomes a static method taking only the values
+its caller settled on, so that it cannot read a directory from self that
+differs from the one the other path checks used.
+
+Fixes #3724
+
+CVE: CVE-2026-103263
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/6bd9c4e0fc10ae743006cd6a97543d15050f9594]
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01Brgh48sZusx4pzHwygor7q
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 97 ++++++++++++++++++++++++++++++++++++++++
+ tornado/web.py           | 40 +++++++++++++----
+ 2 files changed, 128 insertions(+), 9 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 4ac6fb98..fba23a7c 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -1676,6 +1676,103 @@ class StaticFileSymlinkTest(WebTestCase):
+         self.assertEqual(response.body, b"secret")
+ 
+ 
++class MultiRootStaticFileHandler(StaticFileHandler):
++    """A subclass that searches a list of directories.
++
++    It replaces ``initialize`` without calling ``super().initialize()``, so
++    ``allowed_symlink_directory`` is never set, and it puts something other
++    than a string in ``self.root``, passing the directory that matched to
++    ``validate_absolute_path``. The symlink check must run against that
++    directory. Jupyter's ``FileFindHandler`` is built this way.
++    """
++
++    root: tuple  # type: ignore[assignment]
++
++    def initialize(self, path):  # type: ignore[override]
++        self.root = tuple(os.path.abspath(p) + os.path.sep for p in path)
++        self.default_filename = None
++
++    @classmethod
++    def get_absolute_path(cls, roots, path):  # type: ignore[override]
++        for root in roots:
++            candidate = os.path.abspath(os.path.join(root, path))
++            if os.path.exists(candidate):
++                return candidate
++        return os.path.abspath(os.path.join(roots[0], path))
++
++    def validate_absolute_path(self, root, absolute_path):  # type: ignore[override]
++        for candidate in self.root:
++            if (absolute_path + os.path.sep).startswith(candidate):
++                root = candidate
++                break
++        return super().validate_absolute_path(root, absolute_path)
++
++
++@unittest.skipIf(os.name != "posix", "non-posix OS")
++class StaticFileMultiRootTest(WebTestCase):
++    """Subclasses that search several directories and never set
++    ``allowed_symlink_directory`` must keep working (issue #3724).
++    """
++
++    def setUp(self):
++        self.tmpdir = tempfile.mkdtemp()
++        self.addCleanup(shutil.rmtree, self.tmpdir)
++        self.root1 = os.path.join(self.tmpdir, "static1")
++        self.root2 = os.path.join(self.tmpdir, "static2")
++        self.outside = os.path.join(self.tmpdir, "outside")
++        for d in (self.root1, self.root2, self.outside):
++            os.mkdir(d)
++        with open(os.path.join(self.root1, "one.txt"), "w", encoding="utf-8") as f:
++            f.write("one")
++        with open(os.path.join(self.root2, "two.txt"), "w", encoding="utf-8") as f:
++            f.write("two")
++        with open(os.path.join(self.outside, "secret.txt"), "w", encoding="utf-8") as f:
++            f.write("secret")
++        os.symlink(
++            os.path.join(self.root1, "one.txt"),
++            os.path.join(self.root2, "internal.txt"),
++        )
++        os.symlink(
++            os.path.join(self.outside, "secret.txt"),
++            os.path.join(self.root1, "link.txt"),
++        )
++        super().setUp()
++
++    def get_handlers(self):
++        return [
++            (
++                "/multi/(.*)",
++                MultiRootStaticFileHandler,
++                dict(path=[self.root1, self.root2]),
++            )
++        ]
++
++    def get_app_kwargs(self):
++        return dict()
++
++    def test_first_root(self):
++        response = self.fetch("/multi/one.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"one")
++
++    def test_second_root(self):
++        response = self.fetch("/multi/two.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"two")
++
++    def test_symlink_to_other_root_rejected(self):
++        # Each root is validated on its own: a link from one search directory
++        # into another is still an escape from the directory it lives in.
++        with ExpectLog(gen_log, ".*is not in root static directory"):
++            response = self.fetch("/multi/internal.txt")
++        self.assertEqual(response.code, 403)
++
++    def test_symlink_escaping_roots_rejected(self):
++        with ExpectLog(gen_log, ".*is not in root static directory"):
++            response = self.fetch("/multi/link.txt")
++        self.assertEqual(response.code, 403)
++
++
+ class StaticFileSymlinkedRootTest(WebTestCase):
+     """The root itself may be reached through a symlink; that must not make
+     every request look like an escape.
+diff --git a/tornado/web.py b/tornado/web.py
+index 2c8a1e1d..34315220 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2794,6 +2794,13 @@ class StaticFileHandler(RequestHandler):
+     _static_hashes = {}  # type: Dict[str, Optional[str]]
+     _lock = threading.Lock()  # protects _static_hashes
+ 
++    # None means "not set", in which case the symlink check falls back to the
++    # directory being served. The default lives on the class, not in
++    # initialize(), because this attribute was introduced in a security patch
++    # and some projects (notably Jupyter) subclass StaticFileHandler with their
++    # own initialize() that does not call ours.
++    allowed_symlink_directory = None  # type: Optional[str]
++
+     def initialize(
+         self,
+         path: str,
+@@ -2802,8 +2809,6 @@ class StaticFileHandler(RequestHandler):
+     ) -> None:
+         self.root = path
+         self.default_filename = default_filename
+-        if allowed_symlink_directory is None:
+-            allowed_symlink_directory = path
+         self.allowed_symlink_directory = allowed_symlink_directory
+ 
+     @classmethod
+@@ -3016,6 +3021,11 @@ class StaticFileHandler(RequestHandler):
+         # the requested path so a request to root/ will match.
+         if not (absolute_path + os.path.sep).startswith(root):
+             raise HTTPError(403, "%s is not in root static directory", self.path)
++        # Symlinks may point anywhere inside allowed_symlink_directory, which
++        # defaults to the directory being served. Resolve that default here,
++        # against the same root the checks above used, rather than in
++        # _resolve_symlink_target.
++        allowed_symlink_directory = self.allowed_symlink_directory or root
+         # The check above is on the path as written, which is cheap and
+         # rejects traversal without touching the filesystem. Resolve
+         # symlinks only once it has passed, so that the remaining checks -
+@@ -3024,7 +3034,9 @@ class StaticFileHandler(RequestHandler):
+         # cannot be merged: this one must stay on the unresolved path,
+         # because allowed_symlink_directory may be wider than the root and
+         # would then let a ../ traversal through.
+-        absolute_path = self._resolve_symlink_target(absolute_path)
++        absolute_path = self._resolve_symlink_target(
++            absolute_path, allowed_symlink_directory, self.path
++        )
+         if os.path.isdir(absolute_path) and self.default_filename is not None:
+             # need to look at the request.path here for when path is empty
+             # but there is some prefix to the path that was already
+@@ -3049,7 +3061,9 @@ class StaticFileHandler(RequestHandler):
+             # on a path that has already escaped, or the difference between
+             # a redirect and a 403 would reveal whether an out-of-bounds
+             # directory exists.
+-            absolute_path = self._resolve_symlink_target(absolute_path)
++            absolute_path = self._resolve_symlink_target(
++                absolute_path, allowed_symlink_directory, self.path
++            )
+         # Stat the resolved path once and keep the result, instead of
+         # letting os.path.exists, os.path.isfile and the later header
+         # generation each resolve the path again. Every one of those is a
+@@ -3066,15 +3080,23 @@ class StaticFileHandler(RequestHandler):
+         self._stat_result = stat_result
+         return absolute_path
+ 
+-    def _resolve_symlink_target(self, absolute_path: str) -> str:
++    @staticmethod
++    def _resolve_symlink_target(
++        absolute_path: str, allowed_symlink_directory: str, path_message: str
++    ) -> str:
+         """Resolves symlinks in ``absolute_path`` and validates the result.
+ 
+         The path checks in `validate_absolute_path` operate on the path as
+         written, which says nothing about where a symlink points: a symlink
+         inside the static directory can name any file on the system. The
+         resolved path must therefore stay inside
+-        ``allowed_symlink_directory``, which defaults to the directory being
+-        served.
++        ``allowed_symlink_directory``.
++
++        This is a static method so that it can only see the values its
++        caller checked against: ``allowed_symlink_directory`` is the
++        directory `validate_absolute_path` settled on, which is not
++        necessarily ``self.allowed_symlink_directory`` or ``self.root``.
++        ``path_message`` is used only to build the error message.
+ 
+         Raises `HTTPError` (403) if the resolved path escapes that directory.
+ 
+@@ -3089,7 +3111,7 @@ class StaticFileHandler(RequestHandler):
+         # may itself be reached through a symlink (a static directory of
+         # /var/www that links to /srv/www, say). Comparing a resolved path
+         # against an unresolved directory would reject every request.
+-        allowed_directory = os.path.realpath(self.allowed_symlink_directory)
++        allowed_directory = os.path.realpath(allowed_symlink_directory)
+         if not allowed_directory.endswith(os.path.sep):
+             # As in validate_absolute_path, the separator must not be
+             # doubled when the directory is the filesystem root.
+@@ -3105,7 +3127,7 @@ class StaticFileHandler(RequestHandler):
+             # Deliberately the same error as the check on the path as
+             # written, so that a caller cannot tell which way a path left
+             # the served directory.
+-            raise HTTPError(403, "%s is not in root static directory", self.path)
++            raise HTTPError(403, "%s is not in root static directory", path_message)
+         return resolved_path
+ 
+     @classmethod
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch
new file mode 100644
index 0000000000..295f7e00e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch
@@ -0,0 +1,422 @@
+From 437ab5f76565403b3403438d2e555d11f8128d32 Mon Sep 17 00:00:00 2001
+From: Claude <noreply@anthropic.com>
+Date: Sun, 13 Sep 2026 03:42:20 +0000
+Subject: [PATCH] web: Do not follow symlinks out of the static directory
+
+StaticFileHandler.validate_absolute_path checked the requested path
+against the configured root using os.path.abspath, which does not
+resolve symlinks. A symlink inside the static directory could therefore
+point anywhere on the filesystem and its contents would be served: both
+a symlinked file and a symlinked directory were confirmed to expose
+files outside the root.
+
+Resolve the path with os.path.realpath and require the result to remain
+inside a new allowed_symlink_directory, which defaults to the served
+path. Deployments that use such symlinks deliberately can widen it to a
+directory containing all of the intended targets. Both this check and
+the existing one on the path as written raise the same error, so a
+caller cannot tell which way a path left the served directory.
+
+The two checks are not merged, and the resolution stays after the check
+on the unresolved path. That check must operate on the path as written:
+when allowed_symlink_directory is wider than the root, comparing the
+resolved path instead would let a ../ traversal out of the root while
+rejecting the deliberate symlinks the setting exists to permit. Doing
+the cheap string comparison first also avoids walking the filesystem
+for a path that is already out of bounds.
+
+Because default_filename is appended after the path has been resolved,
+the joined path is resolved again: the directory containing an index
+file may be legitimate while the index file itself is a symlink
+pointing elsewhere. Deferring to a single resolution after that block
+would be cheaper, but the isdir() check and the redirect it can trigger
+would then run on a path that had already escaped, and the difference
+between a 301 and a 403 would reveal whether an out-of-bounds directory
+exists. A test pins this. The second resolution only happens for
+directory-index requests; a request for a file resolves once.
+
+realpath() is applied to the allowed directory as well as to the
+requested path, so that serving a directory that is itself reached
+through a symlink continues to work instead of rejecting every request.
+strict=True is not used: it is unavailable on Python 3.9, and a path
+that does not exist resolves to itself and is then reported as a 404.
+
+This check reflects the filesystem at one instant, and a path swapped
+for a symlink afterwards would not be caught; closing that race fully
+would mean holding descriptors across the whole operation. Short of
+that, the validated path is now stat'ed once and the result reused for
+the Content-Length and Last-Modified headers, replacing the separate
+os.path.exists and os.path.isfile calls. That cuts the number of times
+a single request resolves the path from ten to six, and ensures the
+headers describe the file that was validated. The residual race is
+documented rather than papered over.
+
+CVE: CVE-2026-103263
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/437ab5f76565403b3403438d2e555d11f8128d32]
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+Claude-Session: https://claude.ai/code/session_01JD7LUuFMdyPJB1Dwdq6fPg
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 170 +++++++++++++++++++++++++++++++++++++++
+ tornado/web.py           | 100 ++++++++++++++++++++++-
+ 2 files changed, 267 insertions(+), 3 deletions(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 27e7fcfe..8a014d22 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -54,7 +54,9 @@ import itertools
+ import logging
+ import os
+ import re
++import shutil
+ import socket
++import tempfile
+ import typing  # noqa: F401
+ import unittest
+ import urllib.parse
+@@ -1510,6 +1512,14 @@ class StaticFileTest(WebTestCase):
+         response = self.get_and_head("/static/blarg")
+         self.assertEqual(response.code, 404)
+ 
++    def test_static_directory_without_default_filename(self):
++        # Without a default_filename, a directory is not servable. This
++        # shares the stat() that validate_absolute_path performs, so it is
++        # worth pinning the status it produces.
++        with ExpectLog(gen_log, ".*is not a file"):
++            response = self.get_and_head("/static/dir/")
++        self.assertEqual(response.code, 403)
++
+     def test_path_traversal_protection(self):
+         # curl_httpclient processes ".." on the client side, so we
+         # must test this with simple_httpclient.
+@@ -1536,6 +1546,166 @@ class StaticFileTest(WebTestCase):
+         self.assertEqual(response.code, 200)
+ 
+ 
++@unittest.skipIf(os.name != "posix", "non-posix OS")
++class StaticFileSymlinkTest(WebTestCase):
++    """Symlinks must not be followed out of the static directory unless the
++    application opts in with ``allowed_symlink_directory``.
++    """
++
++    def setUp(self):
++        self.tmpdir = tempfile.mkdtemp()
++        self.addCleanup(shutil.rmtree, self.tmpdir)
++        self.root = os.path.join(self.tmpdir, "static")
++        self.outside = os.path.join(self.tmpdir, "outside")
++        os.mkdir(self.root)
++        os.mkdir(self.outside)
++        with open(os.path.join(self.root, "inside.txt"), "w") as f:
++            f.write("inside")
++        with open(os.path.join(self.outside, "secret.txt"), "w") as f:
++            f.write("secret")
++        with open(os.path.join(self.root, "index.html"), "w") as f:
++            f.write("root index")
++        # A symlink to a file outside the root.
++        os.symlink(
++            os.path.join(self.outside, "secret.txt"),
++            os.path.join(self.root, "link.txt"),
++        )
++        # A symlink to a directory outside the root.
++        os.symlink(self.outside, os.path.join(self.root, "linkdir"))
++        # Out-of-bounds symlink targets, one existing and one not, for the
++        # existence-oracle test below.
++        os.mkdir(os.path.join(self.outside, "realdir"))
++        os.symlink(
++            os.path.join(self.outside, "realdir"),
++            os.path.join(self.root, "link_exists"),
++        )
++        os.symlink(
++            os.path.join(self.outside, "nope"),
++            os.path.join(self.root, "link_missing"),
++        )
++        # A symlink that stays inside the root.
++        os.symlink(
++            os.path.join(self.root, "inside.txt"),
++            os.path.join(self.root, "internal.txt"),
++        )
++        super().setUp()
++
++    def get_handlers(self):
++        return [
++            ("/default/(.*)", StaticFileHandler, dict(path=self.root)),
++            (
++                "/permissive/(.*)",
++                StaticFileHandler,
++                dict(path=self.root, allowed_symlink_directory=self.tmpdir),
++            ),
++            (
++                "/default_filename/(.*)",
++                StaticFileHandler,
++                dict(path=self.root, default_filename="index.html"),
++            ),
++        ]
++
++    def get_app_kwargs(self):
++        return dict()
++
++    def test_regular_file(self):
++        response = self.fetch("/default/inside.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"inside")
++
++    def test_symlink_within_root(self):
++        # A symlink is fine as long as it resolves inside the root.
++        response = self.fetch("/default/internal.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"inside")
++
++    def test_symlinked_file_escaping_root(self):
++        with ExpectLog(gen_log, ".*is not in root static directory"):
++            response = self.fetch("/default/link.txt")
++        self.assertEqual(response.code, 403)
++
++    def test_symlinked_directory_escaping_root(self):
++        with ExpectLog(gen_log, ".*is not in root static directory"):
++            response = self.fetch("/default/linkdir/secret.txt")
++        self.assertEqual(response.code, 403)
++
++    def test_served_directory_itself(self):
++        # A request for the served directory itself resolves to the allowed
++        # directory exactly, rather than to something beneath it. That must
++        # still be allowed.
++        response = self.fetch("/default_filename/")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"root index")
++
++    def test_symlinked_default_filename(self):
++        # The default filename is appended after the directory has been
++        # resolved, so it must be checked in its own right.
++        os.mkdir(os.path.join(self.root, "dir"))
++        os.symlink(
++            os.path.join(self.outside, "secret.txt"),
++            os.path.join(self.root, "dir", "index.html"),
++        )
++        with ExpectLog(gen_log, ".*is not in root static directory"):
++            response = self.fetch("/default_filename/dir/")
++        self.assertEqual(response.code, 403)
++
++    def test_no_existence_oracle_for_symlinked_directory(self):
++        # A symlink pointing out of bounds must be rejected identically
++        # whether or not its target exists, so that it cannot be used to
++        # probe the server's filesystem. This pins the ordering in
++        # validate_absolute_path: resolving only after the isdir() check
++        # would let an existing directory trigger a redirect (301) while a
++        # missing one still gave 403.
++        codes = []
++        for name in ("link_exists", "link_missing"):
++            with ExpectLog(gen_log, ".*is not in root static directory"):
++                codes.append(
++                    self.fetch("/default_filename/" + name, follow_redirects=False).code
++                )
++        self.assertEqual(codes, [403, 403])
++
++    def test_allowed_symlink_directory(self):
++        # With an explicit allowed_symlink_directory that contains the
++        # target, the same symlinks are served.
++        response = self.fetch("/permissive/link.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"secret")
++
++        response = self.fetch("/permissive/linkdir/secret.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"secret")
++
++
++class StaticFileSymlinkedRootTest(WebTestCase):
++    """The root itself may be reached through a symlink; that must not make
++    every request look like an escape.
++    """
++
++    def setUp(self):
++        self.tmpdir = tempfile.mkdtemp()
++        self.addCleanup(shutil.rmtree, self.tmpdir)
++        real_root = os.path.join(self.tmpdir, "real")
++        os.mkdir(real_root)
++        with open(os.path.join(real_root, "inside.txt"), "w") as f:
++            f.write("inside")
++        # Serve through a symlink to the real directory.
++        self.root = os.path.join(self.tmpdir, "link")
++        os.symlink(real_root, self.root)
++        super().setUp()
++
++    def get_handlers(self):
++        return [("/static/(.*)", StaticFileHandler, dict(path=self.root))]
++
++    def get_app_kwargs(self):
++        return dict()
++
++    @unittest.skipIf(os.name != "posix", "non-posix OS")
++    def test_symlinked_root(self):
++        response = self.fetch("/static/inside.txt")
++        self.assertEqual(response.code, 200)
++        self.assertEqual(response.body, b"inside")
++
++
+ class StaticDefaultFilenameTest(WebTestCase):
+     def get_app_kwargs(self):
+         return dict(
+diff --git a/tornado/web.py b/tornado/web.py
+index 6f1ae304..2c8a1e1d 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -72,6 +72,7 @@ import numbers
+ import os.path
+ import re
+ import socket
++import stat
+ import sys
+ import threading
+ import time
+@@ -2736,6 +2737,13 @@ class StaticFileHandler(RequestHandler):
+     in your application settings, or add ``default_filename`` as an initializer
+     argument for your ``StaticFileHandler``.
+ 
++    Symlinks are not followed out of the directory being served: if a path
++    resolves to a location outside it, the request is rejected with a 403
++    error. Deployments that deliberately serve content through symlinks
++    pointing elsewhere can set the ``allowed_symlink_directory`` initializer
++    argument to a directory containing all of the intended targets. It
++    defaults to the ``path`` argument.
++
+     To maximize the effectiveness of browser caching, this class supports
+     versioned urls (by default using the argument ``?v=``).  If a version
+     is given, we instruct the browser to cache this file indefinitely.
+@@ -2774,6 +2782,11 @@ class StaticFileHandler(RequestHandler):
+ 
+     .. versionchanged:: 3.1
+        Many of the methods for subclasses were added in Tornado 3.1.
++
++    .. versionchanged:: 6.5.9
++       Symlinks pointing outside the served directory are no longer
++       followed, and the ``allowed_symlink_directory`` argument was added
++       to configure this.
+     """
+ 
+     CACHE_MAX_AGE = 86400 * 365 * 10  # 10 years
+@@ -2781,9 +2794,17 @@ class StaticFileHandler(RequestHandler):
+     _static_hashes = {}  # type: Dict[str, Optional[str]]
+     _lock = threading.Lock()  # protects _static_hashes
+ 
+-    def initialize(self, path: str, default_filename: Optional[str] = None) -> None:
++    def initialize(
++        self,
++        path: str,
++        default_filename: Optional[str] = None,
++        allowed_symlink_directory: Optional[str] = None,
++    ) -> None:
+         self.root = path
+         self.default_filename = default_filename
++        if allowed_symlink_directory is None:
++            allowed_symlink_directory = path
++        self.allowed_symlink_directory = allowed_symlink_directory
+ 
+     @classmethod
+     def reset(cls) -> None:
+@@ -2995,6 +3016,15 @@ class StaticFileHandler(RequestHandler):
+         # the requested path so a request to root/ will match.
+         if not (absolute_path + os.path.sep).startswith(root):
+             raise HTTPError(403, "%s is not in root static directory", self.path)
++        # The check above is on the path as written, which is cheap and
++        # rejects traversal without touching the filesystem. Resolve
++        # symlinks only once it has passed, so that the remaining checks -
++        # and the path this method returns - refer to the file that will
++        # actually be opened rather than to the link. The two checks
++        # cannot be merged: this one must stay on the unresolved path,
++        # because allowed_symlink_directory may be wider than the root and
++        # would then let a ../ traversal through.
++        absolute_path = self._resolve_symlink_target(absolute_path)
+         if os.path.isdir(absolute_path) and self.default_filename is not None:
+             # need to look at the request.path here for when path is empty
+             # but there is some prefix to the path that was already
+@@ -3012,12 +3042,72 @@ class StaticFileHandler(RequestHandler):
+                 self.redirect(self.request.path + "/", permanent=True)
+                 return None
+             absolute_path = os.path.join(absolute_path, self.default_filename)
+-        if not os.path.exists(absolute_path):
++            # The default filename may be a symlink even when the directory
++            # containing it is not. Resolving here rather than deferring a
++            # single resolution until after this block is deliberate: the
++            # isdir() above, and the redirect it can trigger, must not run
++            # on a path that has already escaped, or the difference between
++            # a redirect and a 403 would reveal whether an out-of-bounds
++            # directory exists.
++            absolute_path = self._resolve_symlink_target(absolute_path)
++        # Stat the resolved path once and keep the result, instead of
++        # letting os.path.exists, os.path.isfile and the later header
++        # generation each resolve the path again. Every one of those is a
++        # separate trip through the filesystem that could observe a
++        # different file from the one validated here.
++        try:
++            stat_result = os.stat(absolute_path)
++        except OSError:
++            # Matches the previous os.path.exists() check, which is also
++            # false when the path cannot be stat'ed at all.
+             raise HTTPError(404)
+-        if not os.path.isfile(absolute_path):
++        if not stat.S_ISREG(stat_result.st_mode):
+             raise HTTPError(403, "%s is not a file", self.path)
++        self._stat_result = stat_result
+         return absolute_path
+ 
++    def _resolve_symlink_target(self, absolute_path: str) -> str:
++        """Resolves symlinks in ``absolute_path`` and validates the result.
++
++        The path checks in `validate_absolute_path` operate on the path as
++        written, which says nothing about where a symlink points: a symlink
++        inside the static directory can name any file on the system. The
++        resolved path must therefore stay inside
++        ``allowed_symlink_directory``, which defaults to the directory being
++        served.
++
++        Raises `HTTPError` (403) if the resolved path escapes that directory.
++
++        Note that this is a check against the state of the filesystem at
++        one moment: a path that is replaced by a symlink after this returns
++        but before the file is opened would not be caught. Closing that
++        race entirely would require holding file descriptors across the
++        whole operation. This check is not a substitute for filesystem
++        permissions on a directory that untrusted users can write to.
++        """
++        # realpath() is applied to the allowed directory as well, because it
++        # may itself be reached through a symlink (a static directory of
++        # /var/www that links to /srv/www, say). Comparing a resolved path
++        # against an unresolved directory would reject every request.
++        allowed_directory = os.path.realpath(self.allowed_symlink_directory)
++        if not allowed_directory.endswith(os.path.sep):
++            # As in validate_absolute_path, the separator must not be
++            # doubled when the directory is the filesystem root.
++            allowed_directory += os.path.sep
++        # strict=True is deliberately not used here: it is unavailable on
++        # Python 3.9, and a path that does not exist resolves to itself,
++        # which the caller then reports as a 404.
++        resolved_path = os.path.realpath(absolute_path)
++        # The trailing separator lets the allowed directory itself match, as
++        # well as anything beneath it. This is reachable because the path may
++        # still be a directory at this point (when default_filename is set).
++        if not (resolved_path + os.path.sep).startswith(allowed_directory):
++            # Deliberately the same error as the check on the path as
++            # written, so that a caller cannot tell which way a path left
++            # the served directory.
++            raise HTTPError(403, "%s is not in root static directory", self.path)
++        return resolved_path
++
+     @classmethod
+     def get_content(
+         cls, abspath: str, start: Optional[int] = None, end: Optional[int] = None
+@@ -3077,6 +3167,10 @@ class StaticFileHandler(RequestHandler):
+ 
+     def _stat(self) -> os.stat_result:
+         assert self.absolute_path is not None
++        # validate_absolute_path normally populates this, so that the size
++        # and modification time reported here describe the same file that
++        # was validated. Subclasses that override validate_absolute_path
++        # without calling super() fall back to stat'ing here.
+         if not hasattr(self, "_stat_result"):
+             self._stat_result = os.stat(self.absolute_path)
+         return self._stat_result
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index 2888090884..a84503db51 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -13,6 +13,8 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-91991.patch \
             file://CVE-2026-103261.patch \
             file://CVE-2026-103262.patch \
+            file://CVE-2026-103263.patch \
+            file://CVE-2026-103263-dependent.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.35.6

