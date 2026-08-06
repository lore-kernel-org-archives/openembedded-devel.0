Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05667C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:38:04 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12998.1785994679881119639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VfBSyIzj;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10729; q=dns/txt;
  s=iport01; t=1785994679; x=1787204279;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IO4I9+RHFE6uYJM7DUlrZi50Cbm5MwR2kyWN0i1JEDA=;
  b=VfBSyIzj7NtY30WCuuNkXhgBG/6PxGE1qvV1guDQZswKjAJ3i+SkL/MY
   HUouo42v3Ri2dRzZMXYmfl/VY3FDx3tkzOy5yZ6mSdS3S6nLXKKdJfJV7
   KYORL1rTTL9QGXb5Y+BwIqTgau7CISyl78zbzfh5ruvc16PuDxC3UWoGE
   DJ0JkhmsQp6o9MeMf0WoMLjNAar/dh12CziRus9dqdzTi+tghmrTJ2v1q
   tsUvWxZdGiJ40vRTUR7kXBZ6VXh5vfc8XhByCPs7duhfVa9BYjddJhsrC
   OFXKVDo1das9PcvGM30v+Ijtq16hHWHebPOAcOrvEhrJoJbbCMzppiuHP
   w==;
X-CSE-ConnectionGUID: F/FSpTnmRwWqu+JoaSLrOw==
X-CSE-MsgGUID: yhCkDdseQgSU7wpBjJdoYQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgCjHHRq/5AQJK1aHgEBCxIMggULgld0XkNJA5ZHi?=
 =?us-ascii?q?2eOCYQugX4PAQEBD0QNBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBKgsBGAEtLAMBAk8LIyGDAgGCOgM3AxG8f?=
 =?us-ascii?q?IF5M4EBgygBMQWBHthJDYJYAQsUAQWBM4U/gn6FI10YAUSEOCcbG4FygRWDa?=
 =?us-ascii?q?YEFgRpCAgOBFYcNBIIigQyBWh6BLYFzjVhIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBwWBHYEohGgjGTZ6gQlegS0qZAESF4EJgm8CgnqBKQsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeNfyCBOYEIdAcTAQohBIENIxw0KA4QgkKQX5AWgiGgHnEKK?=
 =?us-ascii?q?IN1jCGPPoV8GjOEBIFXkkCSUQuYfYwJggGECZErTFCEaYFoPIFZcBU7gmcJS?=
 =?us-ascii?q?hkPjjiDa4VkxjQhJzICCQMHKAEBBwIHDgMLgWiQEYFtAQE?=
IronPort-Data: A9a23:WvBSk6K+sxe7NGwOFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0z1Vy
 GYXWGiCPPeIYWr0fIh+bIi+8RhSsZ/Um9BmSFEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Ypajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1AS28NJbEe/9xoPnhTt
 t4fIQspdDec0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhiOC1bIqKJ4HiqcN9j0azp
 U7K5GnADSona8OH4zin/nWdv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:beX4sKoaCF79A0raWI9XmeAaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:mMONKWGv3NR+VA+zqmJJs2AvAvwjd0fC827NYG2/AF1NUpqKHAo=
X-Talos-MUID: 9a23:6MkKWQnAvwudQ/4ML+MkdnpzNOxrz6i1BXkCqqhZpNGuNw58PAak2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="800048755"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:37:58 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 988FA180001EB;
	Thu,  6 Aug 2026 05:37:58 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3D287CD02BC; Wed,  5 Aug 2026 22:37:58 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH] python3-flask: fix CVE-2026-27205
Date: Wed,  5 Aug 2026 22:37:54 -0700
Message-Id: <20260806053754.2932456-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128831

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/pallets/flask/commit/c17f379390731543eea33a570a47bd4ef76a54fa
[2] https://github.com/pallets/flask/security/advisories/GHSA-68rp-wp8r-4726

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-flask/CVE-2026-27205.patch | 260 ++++++++++++++++++
 .../python/python3-flask_3.0.3.bb             |   2 +
 2 files changed, 262 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch

diff --git a/meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch b/meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch
new file mode 100644
index 0000000000..05d6552d2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch
@@ -0,0 +1,260 @@
+From 40ed97132b22a99bee3c8b7d819c2113a767aabe Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Wed, 18 Feb 2026 19:02:54 -0800
+Subject: [PATCH] request context tracks session access
+
+CVE: CVE-2026-27205
+Upstream-Status: Backport [https://github.com/pallets/flask/commit/c17f379390731543eea33a570a47bd4ef76a54fa]
+
+Backport Changes:
+- Omitted CHANGES.rst because the upstream advisory entry targets the
+  Flask 3.1.3 release section, which is absent from Scarthgap 3.0.3 and
+  is not required for the runtime fix.
+- Retained the Flask 3.0.3 SecureCookieSession.__init__() t.Any
+  annotation because upstream's collections.abc.Mapping typing layout
+  is not present in this version. The session-access behavior and all
+  regression tests are preserved unchanged.
+
+(cherry picked from commit c17f379390731543eea33a570a47bd4ef76a54fa)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/flask/app.py        |  4 +--
+ src/flask/ctx.py        | 22 +++++++++++-----
+ src/flask/sessions.py   | 32 +++++++----------------
+ src/flask/templating.py |  7 ++---
+ tests/test_basic.py     | 57 ++++++++++++++++++++++++++++-------------
+ 5 files changed, 70 insertions(+), 52 deletions(-)
+
+diff --git a/src/flask/app.py b/src/flask/app.py
+index 7622b5e8..d537ad80 100644
+--- a/src/flask/app.py
++++ b/src/flask/app.py
+@@ -1280,8 +1280,8 @@ class Flask(App):
+                 for func in reversed(self.after_request_funcs[name]):
+                     response = self.ensure_sync(func)(response)
+ 
+-        if not self.session_interface.is_null_session(ctx.session):
+-            self.session_interface.save_session(self, ctx.session, response)
++        if not self.session_interface.is_null_session(ctx._session):
++            self.session_interface.save_session(self, ctx._session, response)
+ 
+         return response
+ 
+diff --git a/src/flask/ctx.py b/src/flask/ctx.py
+index 9b164d39..cf285bc0 100644
+--- a/src/flask/ctx.py
++++ b/src/flask/ctx.py
+@@ -324,7 +324,7 @@ class RequestContext:
+         except HTTPException as e:
+             self.request.routing_exception = e
+         self.flashes: list[tuple[str, str]] | None = None
+-        self.session: SessionMixin | None = session
++        self._session: SessionMixin | None = session
+         # Functions that should be executed after the request on the response
+         # object.  These will be called before the regular "after_request"
+         # functions.
+@@ -351,7 +351,7 @@ class RequestContext:
+             self.app,
+             environ=self.request.environ,
+             request=self.request,
+-            session=self.session,
++            session=self._session,
+         )
+ 
+     def match_request(self) -> None:
+@@ -364,6 +364,16 @@ class RequestContext:
+         except HTTPException as e:
+             self.request.routing_exception = e
+ 
++    @property
++    def session(self) -> SessionMixin:
++        """The session data associated with this request. Not available until
++        this context has been pushed. Accessing this property, also accessed by
++        the :data:`~flask.session` proxy, sets :attr:`.SessionMixin.accessed`.
++        """
++        assert self._session is not None, "The session has not yet been opened."
++        self._session.accessed = True
++        return self._session
++
+     def push(self) -> None:
+         # Before we push the request context we have to ensure that there
+         # is an application context.
+@@ -381,12 +391,12 @@ class RequestContext:
+         # This allows a custom open_session method to use the request context.
+         # Only open a new session if this is the first time the request was
+         # pushed, otherwise stream_with_context loses the session.
+-        if self.session is None:
++        if self._session is None:
+             session_interface = self.app.session_interface
+-            self.session = session_interface.open_session(self.app, self.request)
++            self._session = session_interface.open_session(self.app, self.request)
+ 
+-            if self.session is None:
+-                self.session = session_interface.make_null_session(self.app)
++            if self._session is None:
++                self._session = session_interface.make_null_session(self.app)
+ 
+         # Match the request URL after loading the session, so that the
+         # session is available in custom URL converters.
+diff --git a/src/flask/sessions.py b/src/flask/sessions.py
+index ee19ad63..1e70ef7b 100644
+--- a/src/flask/sessions.py
++++ b/src/flask/sessions.py
+@@ -43,10 +43,15 @@ class SessionMixin(MutableMapping):  # type: ignore[type-arg]
+     #: ``True``.
+     modified = True
+ 
+-    #: Some implementations can detect when session data is read or
+-    #: written and set this when that happens. The mixin default is hard
+-    #: coded to ``True``.
+-    accessed = True
++    accessed = False
++    """Indicates if the session was accessed, even if it was not modified. This
++    is set when the session object is accessed through the request context,
++    including the global :data:`.session` proxy. A ``Vary: cookie`` header will
++    be added if this is ``True``.
++
++    .. versionchanged:: 3.1.3
++        This is tracked by the request context.
++    """
+ 
+ 
+ # TODO generic when Python > 3.8
+@@ -66,31 +71,12 @@ class SecureCookieSession(CallbackDict, SessionMixin):  # type: ignore[type-arg]
+     #: will only be written to the response if this is ``True``.
+     modified = False
+ 
+-    #: When data is read or written, this is set to ``True``. Used by
+-    # :class:`.SecureCookieSessionInterface` to add a ``Vary: Cookie``
+-    #: header, which allows caching proxies to cache different pages for
+-    #: different users.
+-    accessed = False
+-
+     def __init__(self, initial: t.Any = None) -> None:
+         def on_update(self: te.Self) -> None:
+             self.modified = True
+-            self.accessed = True
+ 
+         super().__init__(initial, on_update)
+ 
+-    def __getitem__(self, key: str) -> t.Any:
+-        self.accessed = True
+-        return super().__getitem__(key)
+-
+-    def get(self, key: str, default: t.Any = None) -> t.Any:
+-        self.accessed = True
+-        return super().get(key, default)
+-
+-    def setdefault(self, key: str, default: t.Any = None) -> t.Any:
+-        self.accessed = True
+-        return super().setdefault(key, default)
+-
+ 
+ class NullSession(SecureCookieSession):
+     """Class used to generate nicer error messages if sessions are not
+diff --git a/src/flask/templating.py b/src/flask/templating.py
+index 618a3b35..5f7480da 100644
+--- a/src/flask/templating.py
++++ b/src/flask/templating.py
+@@ -22,8 +22,8 @@ if t.TYPE_CHECKING:  # pragma: no cover
+ 
+ 
+ def _default_template_ctx_processor() -> dict[str, t.Any]:
+-    """Default template context processor.  Injects `request`,
+-    `session` and `g`.
++    """Default template context processor.  Replaces the ``request`` and ``g``
++    proxies with their concrete objects for faster access.
+     """
+     appctx = _cv_app.get(None)
+     reqctx = _cv_request.get(None)
+@@ -32,7 +32,8 @@ def _default_template_ctx_processor() -> dict[str, t.Any]:
+         rv["g"] = appctx.g
+     if reqctx is not None:
+         rv["request"] = reqctx.request
+-        rv["session"] = reqctx.session
++        # The session proxy cannot be replaced, accessing it gets
++        # RequestContext.session, which sets session.accessed.
+     return rv
+ 
+ 
+diff --git a/tests/test_basic.py b/tests/test_basic.py
+index 214cfee0..754fe589 100644
+--- a/tests/test_basic.py
++++ b/tests/test_basic.py
+@@ -18,6 +18,8 @@ from werkzeug.routing import BuildError
+ from werkzeug.routing import RequestRedirect
+ 
+ import flask
++from flask.globals import request_ctx
++from flask.testing import FlaskClient
+ 
+ require_cpython_gc = pytest.mark.skipif(
+     python_implementation() != "CPython",
+@@ -229,27 +231,46 @@ def test_endpoint_decorator(app, client):
+     assert client.get("/foo/bar").data == b"bar"
+ 
+ 
+-def test_session(app, client):
+-    @app.route("/set", methods=["POST"])
+-    def set():
+-        assert not flask.session.accessed
+-        assert not flask.session.modified
++def test_session_accessed(app: flask.Flask, client: FlaskClient) -> None:
++    @app.post("/")
++    def do_set():
+         flask.session["value"] = flask.request.form["value"]
+-        assert flask.session.accessed
+-        assert flask.session.modified
+         return "value set"
+ 
+-    @app.route("/get")
+-    def get():
+-        assert not flask.session.accessed
+-        assert not flask.session.modified
+-        v = flask.session.get("value", "None")
+-        assert flask.session.accessed
+-        assert not flask.session.modified
+-        return v
+-
+-    assert client.post("/set", data={"value": "42"}).data == b"value set"
+-    assert client.get("/get").data == b"42"
++    @app.get("/")
++    def do_get():
++        return flask.session.get("value", "None")
++
++    @app.get("/nothing")
++    def do_nothing() -> str:
++        return ""
++
++    with client:
++        rv = client.get("/nothing")
++        assert "cookie" not in rv.vary
++        assert not request_ctx._session.accessed
++        assert not request_ctx._session.modified
++
++    with client:
++        rv = client.post(data={"value": "42"})
++        assert rv.text == "value set"
++        assert "cookie" in rv.vary
++        assert request_ctx._session.accessed
++        assert request_ctx._session.modified
++
++    with client:
++        rv = client.get()
++        assert rv.text == "42"
++        assert "cookie" in rv.vary
++        assert request_ctx._session.accessed
++        assert not request_ctx._session.modified
++
++    with client:
++        rv = client.get("/nothing")
++        assert rv.text == ""
++        assert "cookie" not in rv.vary
++        assert not request_ctx._session.accessed
++        assert not request_ctx._session.modified
+ 
+ 
+ def test_session_path(app, client):
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
index b68946ba0c..6e9db196ae 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
@@ -23,3 +23,5 @@ RDEPENDS:${PN} = " \
     python3-profile \
     python3-werkzeug \
 "
+
+SRC_URI += "file://CVE-2026-27205.patch"
-- 
2.35.6


