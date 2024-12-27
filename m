Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E662E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 08:33:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9688.1735288396365997897
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 00:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=209189776c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6Z3jS030823
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 00:33:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pcvyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 00:33:15 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 27 Dec 2024 00:33:14 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 27 Dec 2024 00:33:13 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-werkzeug: Fix CVE-2024-34069
Date: Fri, 27 Dec 2024 08:33:09 +0000
Message-ID: <20241227083309.1928348-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JUP0-BpN7s-v0tK1YMTX7yNd_GxRC1Rm
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=676e664b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=uQOeMoDu6zH8kEQZ8voA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JUP0-BpN7s-v0tK1YMTX7yNd_GxRC1Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114556

From: Soumya Sambu <soumya.sambu@windriver.com>

Werkzeug is a comprehensive WSGI web application library. The debugger in
affected versions of Werkzeug can allow an attacker to execute code on a
developer's machine under some circumstances. This requires the attacker
to get the developer to interact with a domain and subdomain they control,
and enter the debugger PIN, but if they are successful it allows access to
the debugger even if it is only running on localhost. This also requires
the attacker to guess a URL in the developer's application that will trigger
the debugger. This vulnerability is fixed in 3.0.3.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34069

Upstream-patches:
https://github.com/pallets/werkzeug/commit/71b69dfb7df3d912e66bab87fbb1f21f83504967
https://github.com/pallets/werkzeug/commit/890b6b62634fa61224222aee31081c61b054ff01

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../CVE-2024-34069-0001.patch                 | 149 ++++++++++++++++++
 .../CVE-2024-34069-0002.patch                 | 120 ++++++++++++++
 .../python/python3-werkzeug_2.1.1.bb          |   4 +-
 3 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.patch

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.patch
new file mode 100644
index 0000000000..74b39df3a3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.patch
@@ -0,0 +1,149 @@
+From 71b69dfb7df3d912e66bab87fbb1f21f83504967 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Thu, 2 May 2024 11:55:52 -0700
+Subject: [PATCH] restrict debugger trusted hosts
+
+Add a list of `trusted_hosts` to the `DebuggedApplication` middleware. It defaults to only allowing `localhost`, `.localhost` subdomains, and `127.0.0.1`. `run_simple(use_debugger=True)` adds its `hostname` argument to the trusted list as well. The middleware can be used directly to further modify the trusted list in less common development scenarios.
+
+The debugger UI uses the full `document.location` instead of only `document.location.pathname`.
+
+Either of these fixes on their own mitigates the reported vulnerability.
+
+CVE: CVE-2024-34069
+
+Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/71b69dfb7df3d912e66bab87fbb1f21f83504967]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ docs/debug.rst                        | 35 +++++++++++++++++++++++----
+ src/werkzeug/debug/__init__.py        | 10 ++++++++
+ src/werkzeug/debug/shared/debugger.js |  4 +--
+ src/werkzeug/serving.py               |  3 +++
+ 4 files changed, 45 insertions(+), 7 deletions(-)
+
+diff --git a/docs/debug.rst b/docs/debug.rst
+index 25a9f0b..d842135 100644
+--- a/docs/debug.rst
++++ b/docs/debug.rst
+@@ -16,7 +16,8 @@ interactive debug console to execute code in any frame.
+     The debugger allows the execution of arbitrary code which makes it a
+     major security risk. **The debugger must never be used on production
+     machines. We cannot stress this enough. Do not enable the debugger
+-    in production.**
++    in production.** Production means anything that is not development,
++    and anything that is publicly accessible.
+
+ .. note::
+
+@@ -72,10 +73,9 @@ argument to get a detailed list of all the attributes it has.
+ Debugger PIN
+ ------------
+
+-Starting with Werkzeug 0.11 the debug console is protected by a PIN.
+-This is a security helper to make it less likely for the debugger to be
+-exploited if you forget to disable it when deploying to production. The
+-PIN based authentication is enabled by default.
++The debug console is protected by a PIN. This is a security helper to make it
++less likely for the debugger to be exploited if you forget to disable it when
++deploying to production. The PIN based authentication is enabled by default.
+
+ The first time a console is opened, a dialog will prompt for a PIN that
+ is printed to the command line. The PIN is generated in a stable way
+@@ -92,6 +92,31 @@ intended to make it harder for an attacker to exploit the debugger.
+ Never enable the debugger in production.**
+
+
++Allowed Hosts
++-------------
++
++The debug console will only be served if the request comes from a trusted host.
++If a request comes from a browser page that is not served on a trusted URL, a
++400 error will be returned.
++
++By default, ``localhost``, any ``.localhost`` subdomain, and ``127.0.0.1`` are
++trusted. ``run_simple`` will trust its ``hostname`` argument as well. To change
++this further, use the debug middleware directly rather than through
++``use_debugger=True``.
++
++.. code-block:: python
++
++    if os.environ.get("USE_DEBUGGER") in {"1", "true"}:
++        app = DebuggedApplication(app, evalex=True)
++        app.trusted_hosts = [...]
++
++    run_simple("localhost", 8080, app)
++
++**This feature is not meant to entirely secure the debugger. It is
++intended to make it harder for an attacker to exploit the debugger.
++Never enable the debugger in production.**
++
++
+ Pasting Errors
+ --------------
+
+diff --git a/src/werkzeug/debug/__init__.py b/src/werkzeug/debug/__init__.py
+index 49001e0..87e68c4 100644
+--- a/src/werkzeug/debug/__init__.py
++++ b/src/werkzeug/debug/__init__.py
+@@ -290,6 +290,14 @@ class DebuggedApplication:
+             self._pin, self._pin_cookie = pin_cookie  # type: ignore
+         return self._pin
+
++        self.trusted_hosts: list[str] = [".localhost", "127.0.0.1"]
++        """List of domains to allow requests to the debugger from. A leading dot
++        allows all subdomains. This only allows ``".localhost"`` domains by
++        default.
++
++        .. versionadded:: 3.0.3
++        """
++
+     @pin.setter
+     def pin(self, value: str) -> None:
+         self._pin = value
+@@ -475,6 +483,8 @@ class DebuggedApplication:
+         # form data!  Otherwise the application won't have access to that data
+         # any more!
+         request = Request(environ)
++        request.trusted_hosts = self.trusted_hosts
++        assert request.host  # will raise 400 error if not trusted
+         response = self.debug_application
+         if request.args.get("__debugger__") == "yes":
+             cmd = request.args.get("cmd")
+diff --git a/src/werkzeug/debug/shared/debugger.js b/src/werkzeug/debug/shared/debugger.js
+index 2354f03..bee079f 100644
+--- a/src/werkzeug/debug/shared/debugger.js
++++ b/src/werkzeug/debug/shared/debugger.js
+@@ -48,7 +48,7 @@ function initPinBox() {
+       btn.disabled = true;
+
+       fetch(
+-        `${document.location.pathname}?__debugger__=yes&cmd=pinauth&pin=${pin}&s=${encodedSecret}`
++        `${document.location}?__debugger__=yes&cmd=pinauth&pin=${pin}&s=${encodedSecret}`
+       )
+         .then((res) => res.json())
+         .then(({auth, exhausted}) => {
+@@ -79,7 +79,7 @@ function promptForPin() {
+   if (!EVALEX_TRUSTED) {
+     const encodedSecret = encodeURIComponent(SECRET);
+     fetch(
+-      `${document.location.pathname}?__debugger__=yes&cmd=printpin&s=${encodedSecret}`
++      `${document.location}?__debugger__=yes&cmd=printpin&s=${encodedSecret}`
+     );
+     const pinPrompt = document.getElementsByClassName("pin-prompt")[0];
+     fadeIn(pinPrompt);
+diff --git a/src/werkzeug/serving.py b/src/werkzeug/serving.py
+index a19d4bd..84b0664 100644
+--- a/src/werkzeug/serving.py
++++ b/src/werkzeug/serving.py
+@@ -1038,6 +1038,9 @@ def run_simple(
+         from .debug import DebuggedApplication
+
+         application = DebuggedApplication(application, evalex=use_evalex)
++        # Allow the specified hostname to use the debugger, in addition to
++        # localhost domains.
++        application.trusted_hosts.append(hostname)
+
+     if not is_running_from_reloader():
+         s = prepare_socket(hostname, port)
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.patch
new file mode 100644
index 0000000000..37d5ba47c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.patch
@@ -0,0 +1,120 @@
+From 890b6b62634fa61224222aee31081c61b054ff01 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Fri, 3 May 2024 14:49:43 -0700
+Subject: [PATCH] only require trusted host for evalex
+
+CVE: CVE-2024-34069
+
+Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/890b6b62634fa61224222aee31081c61b054ff01]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/werkzeug/debug/__init__.py | 25 ++++++++++++++++++++-----
+ src/werkzeug/sansio/utils.py   |  2 +-
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/src/werkzeug/debug/__init__.py b/src/werkzeug/debug/__init__.py
+index 87e68c4..0302b24 100644
+--- a/src/werkzeug/debug/__init__.py
++++ b/src/werkzeug/debug/__init__.py
+@@ -16,7 +16,9 @@ from zlib import adler32
+
+ from .._internal import _log
+ from ..exceptions import NotFound
++from ..exceptions import SecurityError
+ from ..http import parse_cookie
++from ..sansio.utils import host_is_trusted
+ from ..security import gen_salt
+ from ..utils import send_file
+ from ..wrappers.request import Request
+@@ -331,7 +333,7 @@ class DebuggedApplication:
+
+             is_trusted = bool(self.check_pin_trust(environ))
+             html = tb.render_debugger_html(
+-                evalex=self.evalex,
++                evalex=self.evalex and self.check_host_trust(environ),
+                 secret=self.secret,
+                 evalex_trusted=is_trusted,
+             )
+@@ -359,10 +361,16 @@ class DebuggedApplication:
+         frame: t.Union[DebugFrameSummary, _ConsoleFrame],
+     ) -> Response:
+         """Execute a command in a console."""
++        if not self.check_host_trust(request.environ):
++            return SecurityError()  # type: ignore[return-value]
++
+         return Response(frame.eval(command), mimetype="text/html")
+
+     def display_console(self, request: Request) -> Response:
+         """Display a standalone shell."""
++        if not self.check_host_trust(request.environ):
++            return SecurityError()  # type: ignore[return-value]
++
+         if 0 not in self.frames:
+             if self.console_init_func is None:
+                 ns = {}
+@@ -411,12 +419,18 @@ class DebuggedApplication:
+             return None
+         return (time.time() - PIN_TIME) < int(ts)
+
++    def check_host_trust(self, environ: WSGIEnvironment) -> bool:
++        return host_is_trusted(environ.get("HTTP_HOST"), self.trusted_hosts)
++
+     def _fail_pin_auth(self) -> None:
+         time.sleep(5.0 if self._failed_pin_auth > 5 else 0.5)
+         self._failed_pin_auth += 1
+
+     def pin_auth(self, request: Request) -> Response:
+         """Authenticates with the pin."""
++        if not self.check_host_trust(request.environ):
++            return SecurityError()  # type: ignore[return-value]
++
+         exhausted = False
+         auth = False
+         trust = self.check_pin_trust(request.environ)
+@@ -466,8 +480,11 @@ class DebuggedApplication:
+             rv.delete_cookie(self.pin_cookie_name)
+         return rv
+
+-    def log_pin_request(self) -> Response:
++    def log_pin_request(self, request: Request) -> Response:
+         """Log the pin if needed."""
++        if not self.check_host_trust(request.environ):
++            return SecurityError()  # type: ignore[return-value]
++
+         if self.pin_logging and self.pin is not None:
+             _log(
+                 "info", " * To enable the debugger you need to enter the security pin:"
+@@ -483,8 +500,6 @@ class DebuggedApplication:
+         # form data!  Otherwise the application won't have access to that data
+         # any more!
+         request = Request(environ)
+-        request.trusted_hosts = self.trusted_hosts
+-        assert request.host  # will raise 400 error if not trusted
+         response = self.debug_application
+         if request.args.get("__debugger__") == "yes":
+             cmd = request.args.get("cmd")
+@@ -496,7 +511,7 @@ class DebuggedApplication:
+             elif cmd == "pinauth" and secret == self.secret:
+                 response = self.pin_auth(request)  # type: ignore
+             elif cmd == "printpin" and secret == self.secret:
+-                response = self.log_pin_request()  # type: ignore
++                response = self.log_pin_request(request)  # type: ignore
+             elif (
+                 self.evalex
+                 and cmd is not None
+diff --git a/src/werkzeug/sansio/utils.py b/src/werkzeug/sansio/utils.py
+index 1b4d892..7e7b4d2 100644
+--- a/src/werkzeug/sansio/utils.py
++++ b/src/werkzeug/sansio/utils.py
+@@ -6,7 +6,7 @@ from ..urls import uri_to_iri
+ from ..urls import url_quote
+
+
+-def host_is_trusted(hostname: str, trusted_list: t.Iterable[str]) -> bool:
++def host_is_trusted(hostname: str | None, trusted_list: t.Iterable[str]) -> bool:
+     """Check if a host matches a list of trusted names.
+
+     :param hostname: The name to check.
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index fc0789a73e..12f6dff17d 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 PYPI_PACKAGE = "Werkzeug"
 
 SRC_URI += "file://CVE-2023-25577.patch \
-            file://CVE-2023-23934.patch"
+            file://CVE-2023-23934.patch \
+            file://CVE-2024-34069-0001.patch \
+            file://CVE-2024-34069-0002.patch"
 
 SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
 
-- 
2.40.0


