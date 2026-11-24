Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12607.1795500916416027332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OOaUKSUL;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8762; q=dns/txt;
  s=iport01; t=1795500916; x=1796710516;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i5knt9FLG/QAT0r9mEYgcdfPT8EmfcJjlnoHXDrBKQM=;
  b=OOaUKSULi0C3PpuU22wg5j6oaLD5s/YfTpXmEWAOsrX9R8iZC3HGoCk7
   17yg3ie0qBrvBEusZH5Gde1Ui4m2wHdURjp9tGvnFsBXP8/MoeD3hNAfP
   U6UKIsrf7HdF8km+36SI0uTC1VkNXqUTE1W3TInlU0ibJPTOq7o0X9dkg
   JUO4NLnmBBVIsxBlZYP2wsyA7ec8lk+hdVus8KY+fZ+bDwSGtEYt/wWQa
   eSEOtZYWLF0Q/MlPsI8hx2bDxbAfdjyJq3/cT/Qxt/hHxz8+oykDqxavA
   WlBmUvYKvTt16RdcNMp73Iq0HnlYw7hCFBugs1x8n2GizIqhZQV3cRfom
   Q==;
X-CSE-ConnectionGUID: z65WFczpSCWZuVisWRj5ug==
X-CSE-MsgGUID: GToDPTnpTmGi+jCFggpzdA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDyKAVr/9RK/pBaHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iGeLIF+DwEBAQ9EDQQBAYQ/jmoCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBOAEYAVkDAQJaIyGDAgGCdAMRunKCLIEBgykBP?=
 =?us-ascii?q?wJDUNlLgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVg2qBBYFcAoEnEYZuBIMug?=
 =?us-ascii?q?VSNFwKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUFIMZAYEOASsEE2hEZAUeBJNPkgSBNZ9chCuMJJU6GjOqc?=
 =?us-ascii?q?guYfY4KllGEaoFoPIFZMxoIGxWDIgkKQBkPjjmDa4UTUch3JjICCQMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJAAAQEmB4FPAQE?=
IronPort-Data: A9a23:eKqeDK+Mm+VfEbvgJf+sDrUD1X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2RMDDzXbv+KZDDzKNwlaYni/R4Du5eEmNRhTgRlpSpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kkY9An1O1lGVply
 s4FFjEWUSqB2v+5lefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjuCxaIOFJIfiqcN9sXqfi
 lr6+XzFBz4bd9605zWK6mCgr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:8qP7La+0fBe0bCWQNsRuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:435fcm0/FkOJuQ47r+XFM7xfCJ54TVPW3m/rCHCKFFhoU4KvSwKN9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ArmOpJQ1KeBXFbYvz3Myxh7RMazUjzJipJHgxl40?=
 =?us-ascii?q?6vuaFdi5bFTiSlCa7a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60401863"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:15:14 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 113F6180007E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:14 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id BD18CCC12A6; Mon, 23 Nov 2026 22:15:12 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 1/3] python3-tornado: Fix CVE-2026-123535
Date: Mon, 23 Nov 2026 22:15:10 -0800
Message-Id: <20261124061512.1663330-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132928
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [4],
using the commit shown in [1], [2] and [3].

[1] https://github.com/tornadoweb/tornado/commit/ab4953f1262636343bcc1875117f7a8c93d10509
[2] https://github.com/tornadoweb/tornado/commit/1fefc3d3df5146a087a2a879424adaed94f35827
[3] https://github.com/tornadoweb/tornado/commit/fb398638efcf023d09282989184c4f97c64982ca
[4] https://security-tracker.debian.org/tracker/CVE-2026-123535

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-tornado/CVE-2026-123535_p1.patch  | 83 +++++++++++++++++++
 .../python3-tornado/CVE-2026-123535_p2.patch  | 30 +++++++
 .../python3-tornado/CVE-2026-123535_p3.patch  | 31 +++++++
 .../python/python3-tornado_6.5.7.bb           |  3 +
 4 files changed, 147 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p1.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p1.patch
new file mode 100644
index 0000000000..f9ca3e0371
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p1.patch
@@ -0,0 +1,83 @@
+From ab4953f1262636343bcc1875117f7a8c93d10509 Mon Sep 17 00:00:00 2001
+From: R0ck3t <118608719+zhangyan8216@users.noreply.github.com>
+Date: Tue, 6 Oct 2026 21:33:54 +0800
+Subject: [PATCH] set_cookie: normalize max_age through int() to prevent cookie attribute injection
+
+The max_age parameter was assigned to the cookie Morsel outside the
+attribute-allowlist validation loops (added for CVE-2026-35536 and
+CVE-2026-91991), so a non-int max_age containing ";" would inject
+arbitrary cookie attributes into the Set-Cookie header verbatim.
+Normalizing through int() rejects such values.
+
+Refs GHSA-c6v4-qj2h-f748
+
+CVE: CVE-2026-123535
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/ab4953f1262636343bcc1875117f7a8c93d10509]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 20 ++++++++++++++++++++
+ tornado/web.py           |  5 ++++-
+ 2 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 0dba44a7..1a718488 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -381,6 +381,16 @@ class CookieTest(WebTestCase):
+             def get(self):
+                 self.set_cookie("foo", "bar", max_age=10)
+ 
++        class SetCookieMaxAgeSanitizedHandler(RequestHandler):
++            def get(self):
++                # A non-int max_age (e.g. an attacker-controlled string
++                # containing cookie attributes) is rejected instead of being
++                # written into the Set-Cookie header verbatim.
++                try:
++                    self.set_cookie("foo", "bar", max_age="86400; Path=/evil")
++                except ValueError:
++                    self.set_status(400)
++
+         class SetCookieExpiresDaysHandler(RequestHandler):
+             def get(self):
+                 self.set_cookie("foo", "bar", expires_days=10)
+@@ -405,6 +415,7 @@ class CookieTest(WebTestCase):
+             ("/forbidden_char", SetCookieForbiddenCharHandler),
+             ("/set_overwrite", SetCookieOverwriteHandler),
+             ("/set_max_age", SetCookieMaxAgeHandler),
++            ("/set_max_age_sanitized", SetCookieMaxAgeSanitizedHandler),
+             ("/set_expires_days", SetCookieExpiresDaysHandler),
+             ("/set_falsy_flags", SetCookieFalsyFlags),
+             ("/set_deprecated", SetCookieDeprecatedArgs),
+@@ -478,6 +489,15 @@ class CookieTest(WebTestCase):
+         headers = response.headers.get_list("Set-Cookie")
+         self.assertEqual(sorted(headers), ["foo=bar; Max-Age=10; Path=/"])
+ 
++    def test_set_cookie_max_age_sanitized(self):
++        # A max_age that is not a valid int could smuggle extra cookie
++        # attributes past the attribute allowlist (GHSA-c6v4-qj2h-f748);
++        # it must be rejected rather than written to the header verbatim.
++        response = self.fetch("/set_max_age_sanitized")
++        self.assertEqual(response.code, 400)
++        for header in response.headers.get_list("Set-Cookie"):
++            self.assertNotIn("evil", header)
++
+     def test_set_cookie_expires_days(self):
+         response = self.fetch("/set_expires_days")
+         header = response.headers.get("Set-Cookie")
+diff --git a/tornado/web.py b/tornado/web.py
+index a61e9594..277a7bf4 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -744,7 +744,10 @@ class RequestHandler:
+             morsel["path"] = path
+         if max_age:
+             # Note change from _ to -.
+-            morsel["max-age"] = str(max_age)
++            # Normalize through int() so that a non-int max_age (which could
++            # smuggle extra cookie attributes past the attribute allowlist)
++            # is rejected instead of being written to the header verbatim.
++            morsel["max-age"] = str(int(max_age))
+         if httponly:
+             # Note that SimpleCookie ignores the value here. The presense of an
+             # httponly (or secure) key is treated as true.
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p2.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p2.patch
new file mode 100644
index 0000000000..f0d17bc2e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p2.patch
@@ -0,0 +1,30 @@
+From 1fefc3d3df5146a087a2a879424adaed94f35827 Mon Sep 17 00:00:00 2001
+From: R0ck3t <118608719+zhangyan8216@users.noreply.github.com>
+Date: Tue, 6 Oct 2026 22:22:50 +0800
+Subject: [PATCH] Add type: ignore for intentionally invalid max_age in test
+
+The test deliberately passes a non-int max_age (the injection
+payload from GHSA-c6v4-qj2h-f748), which mypy rightly flags
+against the int | None signature.
+
+CVE: CVE-2026-123535
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/1fefc3d3df5146a087a2a879424adaed94f35827]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index 1a718488..b3bf971e 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -387,7 +387,7 @@ class CookieTest(WebTestCase):
+                 # containing cookie attributes) is rejected instead of being
+                 # written into the Set-Cookie header verbatim.
+                 try:
+-                    self.set_cookie("foo", "bar", max_age="86400; Path=/evil")
++                    self.set_cookie("foo", "bar", max_age="86400; Path=/evil")  # type: ignore[arg-type]
+                 except ValueError:
+                     self.set_status(400)
+ 
diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p3.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p3.patch
new file mode 100644
index 0000000000..1ddf513d16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2026-123535_p3.patch
@@ -0,0 +1,31 @@
+From fb398638efcf023d09282989184c4f97c64982ca Mon Sep 17 00:00:00 2001
+From: R0ck3t <118608719+zhangyan8216@users.noreply.github.com>
+Date: Tue, 6 Oct 2026 23:46:18 +0800
+Subject: [PATCH] Shorten test line to satisfy flake8 E501 (100-char limit)
+
+Same injection payload semantics, shorter string.
+
+CVE: CVE-2026-123535
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/fb398638efcf023d09282989184c4f97c64982ca]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ tornado/test/web_test.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tornado/test/web_test.py b/tornado/test/web_test.py
+index f1ec81f2..7a8f5264 100644
+--- a/tornado/test/web_test.py
++++ b/tornado/test/web_test.py
+@@ -388,7 +388,7 @@ class CookieTest(WebTestCase):
+                 # containing cookie attributes) is rejected instead of being
+                 # written into the Set-Cookie header verbatim.
+                 try:
+-                    self.set_cookie("foo", "bar", max_age="86400; Path=/evil")  # type: ignore[arg-type]
++                    self.set_cookie("foo", "bar", max_age="1; Path=/x")  # type: ignore[arg-type]
+                 except ValueError:
+                     self.set_status(400)
+ 
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
index dd61da78be..dd72e683cf 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.7.bb
@@ -22,6 +22,9 @@ SRC_URI += "file://CVE-2026-91990.patch \
             file://CVE-2026-116578_p1.patch \
             file://CVE-2026-116578_p2.patch \
             file://CVE-2026-116578_p3.patch \
+            file://CVE-2026-123535_p1.patch \
+            file://CVE-2026-123535_p2.patch \
+            file://CVE-2026-123535_p3.patch \
 "
 
 inherit pypi python_setuptools_build_meta
-- 
2.53.0

