Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1949.1795113478586866684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H0W8XA/j;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05b210703so84566b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113478; x=1795718278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JczhozRz3vzKyF+dmJZAfyVNQCPv8vcOXRxLVtrpa20=;
        b=H0W8XA/jccjyrz3GVGDAJJ8ZVWnjY9T8YpF+tXn8Nm351rgkQEASuyUsJ8ahMNTUEz
         iwnWYs6EqKo/GIrKwJfI+IVl2DMG/6esj0sB6kXii7DiWOW06O1uunbAwynBYxReVJhI
         meYGBow88FN279oK046CyK8GYWKtqCNbAy80RPAEqP8laSoS5hRFsBTGsF+BmOLHhYUw
         l97dnFqYk8RvjCLiVqaT9vZzLSHuJ/rAfc1b1ZtS4w6vJKpYBoxlUOC+uDJ5oF6ZBChM
         mKe702/stEnPrW1OcKARiWWPXmL8elCPxrpNnn+bv3Q99rgemwHcdrWDIVF9AgQgNsR+
         4pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113478; x=1795718278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JczhozRz3vzKyF+dmJZAfyVNQCPv8vcOXRxLVtrpa20=;
        b=H0svIPQxCVi6jYGc61CdcRVGA5iTd+qM/fgl1nEodExILxsFlazvxnLPIdIdvgMkMK
         HGs5LGiR+xZUDDuMK9ZAmKKfDVCBcDQ+0CrwGoBbSZtXmkDszj/crgEiKgGXwDsVDFsJ
         KjysyU9B9nAFC0CHLOOHy9GDVPSueY0+uJjqtJj1+MttpAPeaQ9I+F4L+7RZFpyXcGKo
         WBIDQprPi0fFoRQ05y8pO83nAF7CQJXkZIwZ9Djz1mRjSD/oL7lq1FCPTN1NivPPX7+K
         wzmegTTIlXNDPpLXUnZqTsC5+rELDjwHM+aD1Sinrs417D7YZS6uoearS+dxdcNlkJPJ
         bF0A==
X-Gm-Message-State: APuU4Z9zGUEd++jSzbd98IJ8kfr457a4dTlSLatAie1icj7fsTbCnMTu
	9RDUqNVn9WYY5ax96WGUIONaJOX+43xxcx+nWeDLfu5PiuzrEQ9Eh/5sUtL7Ng==
X-Gm-Gg: AYBFou0cP6pLqWdglOtKJqjzTH7A+noU59yF6rYUTMbssas1/FAEFnMVtbqiee2zrXU
	Ka8rhOs0XQDi2uZF14m9pF9rYmVK2K/VsTI2HpkOeTOQ6nBAkTeZpEzlDkbcbaeFGyuVZ+jW6gp
	b7oqVlUQXbujy5vI/2IRFaQhbNm5ZZFK2Vdt/m8N+KEickItRPLTRoZ76G1i8UdUhPf2N6wDVOi
	nqJ9a6dGKeQ54Ltj9rdll1MpDXdjZt5BZ/892J5NRiDPoTPpnwnPkxtKPPEoanx7/PboF4mHxoN
	iTmvIB6r2kWlU6bH6XBBZvOU59QrnRkgemchfH33L83QePtV3zUsYxXnLGPiHu1ujGQ7QaJ6wcM
	VbSA6xU7ovX5mI+mQGMaMgMd+2r3nWDj6MG97/lKsonj5KSXTvJZi1WKEu2riMJotVE+pvAwPzR
	3xA3Ex5RfWltCea6CpjVWQxPPEw6aZSK3q08cs3+MIchEZHJcJOJoRSR6AM1EZkuByDAsC1sAEN
	s3TkFivxPGSM2TnZL88fvRVDI3n4x3oxjMQ3fqZN9FP+JoCjffJGADl2G92P5xOWf08aXAkfqVf
	CUu6Sc2K1YUBMCxCp8ycxKq5o08XWdR8KQtPNV6PvKZJWXyfhZB7xF+cRjn3nw==
X-Received: by 2002:a05:6a00:1817:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8c87b9cfaaamr412986b3a.12.1795113477807;
        Thu, 19 Nov 2026 10:37:57 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 49/64] python3-aiohttp: patch CVE-2026-111749
Date: Fri, 20 Nov 2026 07:33:17 +1300
Message-ID: <a71080609f447107cfa46ca5b033948e278df2cf.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132739
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111749

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111749.patch     | 262 ++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |   1 +
 2 files changed, 263 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
new file mode 100644
index 0000000000..d1a7c60fb5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
@@ -0,0 +1,262 @@
+From 66405536d4410c7456a52d2b6780e827f4e56d44 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 02:21:06 +0100
+Subject: [PATCH] Fix host-only state on cookie expiration (#13674) (#13676)
+
+(cherry picked from commit 9332972cfcb0f5a2b6677e7307819ab8f13b5d09)
+(cherry picked from commit 6a07c171ef9f3be583e2907dcd1931372efca8d6)
+
+CVE: CVE-2026-111749
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6a07c171ef9f3be583e2907dcd1931372efca8d6]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13674.bugfix.rst     |  1 +
+ aiohttp/abc.py               |  2 +-
+ aiohttp/cookiejar.py         | 29 ++++++++--------
+ docs/client_reference.rst    | 10 ++++--
+ tests/test_client_session.py |  2 +-
+ tests/test_cookiejar.py      | 64 ++++++++++++++++++++++++++++++++++--
+ 6 files changed, 89 insertions(+), 19 deletions(-)
+ create mode 100644 CHANGES/13674.bugfix.rst
+
+diff --git a/CHANGES/13674.bugfix.rst b/CHANGES/13674.bugfix.rst
+new file mode 100644
+index 000000000..5152bceae
+--- /dev/null
++++ b/CHANGES/13674.bugfix.rst
+@@ -0,0 +1 @@
++Fixed host-only cookie state being lost on expiration -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/abc.py b/aiohttp/abc.py
+index b67287318..74ca7216e 100644
+--- a/aiohttp/abc.py
++++ b/aiohttp/abc.py
+@@ -181,7 +181,7 @@ class AbstractCookieJar(Sized, IterableBase):
+ 
+     @property
+     @abstractmethod
+-    def host_only_cookies(self) -> frozenset[tuple[str, str]]:
++    def host_only_cookies(self) -> frozenset[tuple[str, str, str]]:
+         """Return the host-only cookies stored in this jar."""
+ 
+     @abstractmethod
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index b949cc118..1af02144e 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -134,7 +134,8 @@ class CookieJar(AbstractCookieJar):
+         self._morsel_cache: defaultdict[tuple[str, str], dict[str, Morsel[str]]] = (
+             defaultdict(dict)
+         )
+-        self._host_only_cookies: set[tuple[str, str]] = set()
++        # Cookie identity is (domain, path, name).
++        self._host_only_cookies: set[tuple[str, str, str]] = set()
+         self._unsafe = unsafe
+         self._quote_cookie = quote_cookie
+         if treat_as_secure_origin is None:
+@@ -166,7 +167,7 @@ class CookieJar(AbstractCookieJar):
+         return MappingProxyType(self._cookies)
+ 
+     @property
+-    def host_only_cookies(self) -> frozenset[tuple[str, str]]:
++    def host_only_cookies(self) -> frozenset[tuple[str, str, str]]:
+         """Return the host-only cookies stored in this jar."""
+         return frozenset(self._host_only_cookies)
+ 
+@@ -195,7 +196,7 @@ class CookieJar(AbstractCookieJar):
+                     if attr_val:
+                         morsel_data[attr] = attr_val
+                 # Persist or it reloads as a domain cookie and leaks to subdomains.
+-                if (domain, name) in self._host_only_cookies:
++                if (domain, path, name) in self._host_only_cookies:
+                     morsel_data["host_only"] = True
+                 if (exp := self._expirations.get((domain, path, name))) is not None:
+                     morsel_data["expires_timestamp"] = exp
+@@ -358,7 +359,7 @@ class CookieJar(AbstractCookieJar):
+ 
+     def _delete_cookies(self, to_del: list[tuple[str, str, str]]) -> None:
+         for domain, path, name in to_del:
+-            self._host_only_cookies.discard((domain, name))
++            self._host_only_cookies.discard((domain, path, name))
+             self._cookies[(domain, path)].pop(name, None)
+             self._morsel_cache[(domain, path)].pop(name, None)
+             self._expirations.pop((domain, path, name), None)
+@@ -395,18 +396,12 @@ class CookieJar(AbstractCookieJar):
+                 domain = ""
+                 del cookie["domain"]
+ 
+-            if not domain and hostname is not None:
+-                # Set the cookie's domain to the response hostname
+-                # and set its host-only-flag
+-                self._host_only_cookies.add((hostname, name))
+-                domain = cookie["domain"] = hostname
+-
+             if domain and domain[0] == ".":
+                 # Remove leading dot
+                 domain = domain[1:]
+                 cookie["domain"] = domain
+ 
+-            if hostname and not self._is_domain_match(domain, hostname):
++            if domain and hostname and not self._is_domain_match(domain, hostname):
+                 # Setting cookies for different domains is not allowed
+                 continue
+ 
+@@ -422,6 +417,14 @@ class CookieJar(AbstractCookieJar):
+                 cookie["path"] = path
+             path = path.rstrip("/")
+ 
++            if not domain and hostname is not None:
++                self._host_only_cookies.add((hostname, path, name))
++                domain = cookie["domain"] = hostname
++            else:
++                # A cookie with an explicit Domain attribute replaces any
++                # host-only cookie with the same (domain, path, name) identity.
++                self._host_only_cookies.discard((domain, path, name))
++
+             if max_age := cookie["max-age"]:
+                 try:
+                     delta_seconds = int(max_age)
+@@ -522,7 +525,7 @@ class CookieJar(AbstractCookieJar):
+             for name, cookie in self._cookies[p].items():
+                 domain = cookie["domain"]
+ 
+-                if (domain, name) in self._host_only_cookies and domain != hostname:
++                if domain != hostname and p + (name,) in self._host_only_cookies:
+                     continue
+ 
+                 # Skip edge case when the cookie has a trailing slash but request doesn't.
+@@ -672,7 +675,7 @@ class DummyCookieJar(AbstractCookieJar):
+         return MappingProxyType({})
+ 
+     @property
+-    def host_only_cookies(self) -> frozenset[tuple[str, str]]:
++    def host_only_cookies(self) -> frozenset[tuple[str, str, str]]:
+         """Return an empty frozenset."""
+         return frozenset()
+ 
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index a237fb64b..476e6e81f 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2611,11 +2611,17 @@ Utilities
+ 
+    .. attribute:: host_only_cookies
+ 
+-      A :class:`frozenset` of ``(domain, name)`` tuples indicating which
+-      cookies are host-only (not sent to subdomains).
++      A :class:`frozenset` of ``(domain, path, name)`` tuples indicating
++      which cookies are host-only (not sent to subdomains).
+ 
+       .. versionadded:: 3.14
+ 
++      .. versionchanged:: 3.14.4
++
++         The tuples gained the *path* element; host-only state is tracked
++         per ``(domain, path, name)`` cookie identity so that same-named
++         cookies on other paths cannot affect it.
++
+ 
+ .. class:: DummyCookieJar(*, loop=None)
+ 
+diff --git a/tests/test_client_session.py b/tests/test_client_session.py
+index 6b3516879..4481a4bf8 100644
+--- a/tests/test_client_session.py
++++ b/tests/test_client_session.py
+@@ -758,7 +758,7 @@ async def test_cookie_jar_usage(loop: Any, aiohttp_client: Any) -> None:
+             return MappingProxyType({})
+ 
+         @property
+-        def host_only_cookies(self) -> frozenset[tuple[str, str]]:
++        def host_only_cookies(self) -> frozenset[tuple[str, str, str]]:
+             return frozenset()
+ 
+         def clear(self, predicate: abc.ClearCookiePredicate | None = None) -> None:
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index be6da2a5f..4fd2959e1 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -878,7 +878,45 @@ async def test_cookie_jar_host_only_cookies_property() -> None:
+ 
+     host_only = jar.host_only_cookies
+     assert isinstance(host_only, frozenset)
+-    assert ("example.com", "hostonly") in host_only
++    assert ("example.com", "", "hostonly") in host_only
++
++
++async def test_host_only_marker_survives_same_name_expiry_on_other_path() -> None:
++    """Expiring a same-name cookie on another path must not clear host-only state."""
++    jar = CookieJar()
++    origin = URL("http://auth.example.com/")
++    subdomain = URL("http://evil.auth.example.com/")
++
++    jar.update_cookies_from_headers(["sid=secret; Path=/"], origin)
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    # Attacker-controlled descendant expires a same-name cookie on its own path.
++    jar.update_cookies_from_headers(
++        ["sid=gone; Domain=auth.example.com; Path=/attacker; Max-Age=0"],
++        subdomain,
++    )
++
++    assert ("auth.example.com", "", "sid") in jar.host_only_cookies
++    assert "sid" not in jar.filter_cookies(subdomain)
++    assert jar.filter_cookies(origin)["sid"].value == "secret"
++
++
++async def test_explicit_domain_replacement_clears_host_only_marker() -> None:
++    """A replacing cookie with an explicit Domain is a domain cookie."""
++    jar = CookieJar()
++    origin = URL("http://example.com/")
++    subdomain = URL("http://sub.example.com/")
++
++    jar.update_cookies_from_headers(["sid=hostonly; Path=/"], origin)
++    assert ("example.com", "", "sid") in jar.host_only_cookies
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    jar.update_cookies_from_headers(
++        ["sid=domainwide; Domain=example.com; Path=/"], origin
++    )
++
++    assert jar.host_only_cookies == frozenset()
++    assert jar.filter_cookies(subdomain)["sid"].value == "domainwide"
+ 
+ 
+ async def test_cookie_jar_cookies_property_immutable() -> None:
+@@ -1857,7 +1895,7 @@ async def test_save_load_json_preserves_host_only_scope(tmp_path: Path) -> None:
+     jar_load = CookieJar()
+     jar_load.load(file_path=file_path)
+ 
+-    assert jar_load.host_only_cookies == frozenset({("auth.example.com", "sid")})
++    assert jar_load.host_only_cookies == frozenset({("auth.example.com", "", "sid")})
+     assert "sid" not in jar_load.filter_cookies(subdomain)
+     assert "sid" in jar_load.filter_cookies(issuer)
+ 
+@@ -1882,6 +1920,28 @@ async def test_save_load_json_domain_cookie_still_matches_subdomain(
+     assert "sid" in jar_load.filter_cookies(subdomain)
+ 
+ 
++async def test_save_load_json_host_only_per_path(tmp_path: Path) -> None:
++    """Verify save/load keeps host-only state per (domain, path, name)."""
++    file_path = tmp_path / "per_path.json"
++    origin = URL("https://example.com/")
++    subdomain = URL("https://sub.example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["sid=hostonly; Path=/", "sid=domainwide; Domain=example.com; Path=/api"],
++        origin,
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load.host_only_cookies == frozenset({("example.com", "", "sid")})
++    assert "sid" not in jar_load.filter_cookies(subdomain)
++    filtered = jar_load.filter_cookies(URL("https://sub.example.com/api/x"))
++    assert filtered["sid"].value == "domainwide"
++
++
+ async def test_save_load_json_preserves_max_age_deadline(tmp_path: Path) -> None:
+     """Verify save/load restores the absolute deadline without resetting it."""
+     file_path = tmp_path / "max_age.json"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 3654f95532..78845ffb56 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2026-111063.patch \
             file://CVE-2026-111065.patch \
             file://CVE-2026-111066.patch \
             file://CVE-2026-111748.patch \
+            file://CVE-2026-111749.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
