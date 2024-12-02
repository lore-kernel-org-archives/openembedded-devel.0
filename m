Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A3BD10DB5
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 07:51:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.168431.1733125897467924474
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 23:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2066993530=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B27D32q009559
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Dec 2024 23:51:37 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7shaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 23:51:36 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 1 Dec 2024 23:51:35 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 1 Dec 2024 23:51:34 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-python][kirkstone][PATCH] python3-aiohttp: fix CVE-2023-49081/CVE-2024-30251/CVE-2024-52304/CVE-2023-49082/CVE-2024-27306
Date: Mon, 2 Dec 2024 16:49:23 +0800
Message-ID: <20241202084924.2064149-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Wa9ZbDWDf-0pSTBwKvQwuIyckAfdzhUr
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674d6708 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=48vgC7mUAAAA:8 a=ekYV4lpRAAAA:8 a=t7CeM3EgAAAA:8
 a=0lhnMm1FAAAA:8 a=pGLkceISAAAA:8 a=v90GV_Y8AAAA:8 a=VlckX9PKAAAA:8 a=pIMtKCVDeNLomotfWAoA:9 a=4AMJtBEf4HbnZVMp:21 a=mrCxpU6zTNQDHnudu_9Q:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9CHbX8HeWodPCPcMgNm7:22 a=fBD7mPJ_7mWCjuCAFpJ4:22 a=ZmiM9RdZ4sPD_HvZpKn1:22
X-Proofpoint-ORIG-GUID: Wa9ZbDWDf-0pSTBwKvQwuIyckAfdzhUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_04,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412020068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 07:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114135

From: Jiaying Song <jiaying.song.cn@windriver.com>

CVE-2023-49081:
aiohttp is an asynchronous HTTP client/server framework for asyncio and
Python. Improper validation made it possible for an attacker to modify
the HTTP request (e.g. to insert a new header) or create a new HTTP
request if the attacker controls the HTTP version. The vulnerability
only occurs if the attacker can control the HTTP version of the request.
This issue has been patched in version 3.9.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-49081

Upstream patches:
https://github.com/aio-libs/aiohttp/commit/1e86b777e61cf4eefc7d92fa57fa19dcc676013b

CVE-2024-30251:
aiohttp is an asynchronous HTTP client/server framework for asyncio and Python.
In affected versions an attacker can send a specially crafted POST
(multipart/form-data) request. When the aiohttp server processes it, the server
will enter an infinite loop and be unable to process any further requests. An
attacker can stop the application from serving requests after sending a single
request. This issue has been addressed in version 3.9.4. Users are advised to
upgrade. Users unable to upgrade may manually apply a patch to their systems.
Please see the linked GHSA for instructions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-30251

Upstream patches:
https://github.com/aio-libs/aiohttp/commit/cebe526b9c34dc3a3da9140409db63014bc4cf19
https://github.com/aio-libs/aiohttp/commit/7eecdff163ccf029fbb1ddc9de4169d4aaeb6597
https://github.com/aio-libs/aiohttp/commit/f21c6f2ca512a026ce7f0f6c6311f62d6a638866

CVE-2024-52304:
aiohttp is an asynchronous HTTP client/server framework for asyncio and Python.
Prior to version 3.10.11, the Python parser parses newlines in chunk extensions
incorrectly which can lead to request smuggling vulnerabilities under certain
conditions. If a pure Python version of aiohttp is installed (i.e. without the
usual C extensions) or `AIOHTTP_NO_EXTENSIONS` is enabled, then an attacker may
be able to execute a request smuggling attack to bypass certain firewalls or
proxy protections. Version 3.10.11 fixes the issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-52304

Upstream patches:
https://github.com/aio-libs/aiohttp/commit/259edc369075de63e6f3a4eaade058c62af0df71

CVE-2023-49082:
aiohttp is an asynchronous HTTP client/server framework for asyncio and Python.
Improper validation makes it possible for an attacker to modify the HTTP
request (e.g. insert a new header) or even create a new HTTP request if the
attacker controls the HTTP method. The vulnerability occurs only if the
attacker can control the HTTP method (GET, POST etc.) of the request. If the
attacker can control the HTTP version of the request it will be able to modify
the request (request smuggling). This issue has been patched in version 3.9.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-49082

Upstream patches:
https://github.com/aio-libs/aiohttp/pull/7806/commits/a43bc1779892e7014b7723c59d08fb37a000955e

CVE-2024-27306:
aiohttp is an asynchronous HTTP client/server framework for asyncio and Python.
A XSS vulnerability exists on index pages for static file handling. This
vulnerability is fixed in 3.9.4. We have always recommended using a reverse
proxy server (e.g. nginx) for serving static files. Users following the
recommendation are unaffected. Other users can disable `show_index` if unable
to upgrade.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-27306

Upstream patches:
https://github.com/aio-libs/aiohttp/commit/28335525d1eac015a7e7584137678cbb6ff19397

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-aiohttp/CVE-2023-49081.patch      |  96 ++++
 .../python3-aiohttp/CVE-2023-49082.patch      | 105 ++++
 .../python3-aiohttp/CVE-2024-27306.patch      |  81 +++
 .../python3-aiohttp/CVE-2024-30251.patch      | 522 ++++++++++++++++++
 .../python3-aiohttp/CVE-2024-52304.patch      |  46 ++
 .../python/python3-aiohttp_3.8.6.bb           |   5 +
 6 files changed, 855 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch
new file mode 100644
index 0000000000..503b001445
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch
@@ -0,0 +1,96 @@
+From 67bf97cd1dfa513c8b6374905ee225b4d46cdf20 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Mon, 13 Nov 2023 22:13:06 +0000
+Subject: [PATCH] Disallow arbitrary sequence types in version (#7835)
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/1e86b777e61cf4eefc7d92fa57fa19dcc676013b]
+
+CVE: CVE-2023-49081
+
+Co-authored-by: pre-commit-ci[bot] <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/7835.bugfix          |  1 +
+ aiohttp/client_reqrep.py     |  4 ++--
+ tests/test_client_request.py | 18 +++++++++++++++---
+ 3 files changed, 18 insertions(+), 5 deletions(-)
+ create mode 100644 CHANGES/7835.bugfix
+
+diff --git a/CHANGES/7835.bugfix b/CHANGES/7835.bugfix
+new file mode 100644
+index 0000000..4ce3af4
+--- /dev/null
++++ b/CHANGES/7835.bugfix
+@@ -0,0 +1 @@
++Fixed arbitrary sequence types being allowed to inject headers via version parameter -- by :user:`Dreamsorcerer`
+diff --git a/aiohttp/client_reqrep.py b/aiohttp/client_reqrep.py
+index 987d68f..d3cd77e 100644
+--- a/aiohttp/client_reqrep.py
++++ b/aiohttp/client_reqrep.py
+@@ -661,8 +661,8 @@ class ClientRequest:
+             self.headers[hdrs.CONNECTION] = connection
+ 
+         # status + headers
+-        status_line = "{0} {1} HTTP/{2[0]}.{2[1]}".format(
+-            self.method, path, self.version
++        status_line = "{0} {1} HTTP/{v.major}.{v.minor}".format(
++            self.method, path, v=self.version
+         )
+         await writer.write_headers(status_line, self.headers)
+ 
+diff --git a/tests/test_client_request.py b/tests/test_client_request.py
+index 9eeb933..009f1a0 100644
+--- a/tests/test_client_request.py
++++ b/tests/test_client_request.py
+@@ -20,6 +20,7 @@ from aiohttp.client_reqrep import (
+     _merge_ssl_params,
+ )
+ from aiohttp.helpers import PY_311
++from aiohttp.http import HttpVersion
+ from aiohttp.test_utils import make_mocked_coro
+ 
+ 
+@@ -576,18 +577,18 @@ async def test_connection_header(loop, conn) -> None:
+     req.headers.clear()
+ 
+     req.keep_alive.return_value = True
+-    req.version = (1, 1)
++    req.version = HttpVersion(1, 1)
+     req.headers.clear()
+     await req.send(conn)
+     assert req.headers.get("CONNECTION") is None
+ 
+-    req.version = (1, 0)
++    req.version = HttpVersion(1, 0)
+     req.headers.clear()
+     await req.send(conn)
+     assert req.headers.get("CONNECTION") == "keep-alive"
+ 
+     req.keep_alive.return_value = False
+-    req.version = (1, 1)
++    req.version = HttpVersion(1, 1)
+     req.headers.clear()
+     await req.send(conn)
+     assert req.headers.get("CONNECTION") == "close"
+@@ -1113,6 +1114,17 @@ async def test_close(loop, buf, conn) -> None:
+     await req.close()
+     resp.close()
+ 
++async def test_bad_version(loop: Any, conn: Any) -> None:
++    req = ClientRequest(
++        "GET",
++        URL("http://python.org"),
++        loop=loop,
++        headers={"Connection": "Close"},
++        version=("1", "1\r\nInjected-Header: not allowed"),
++    )
++
++    with pytest.raises(AttributeError):
++        await req.send(conn)
+ 
+ async def test_custom_response_class(loop, conn) -> None:
+     class CustomResponse(ClientResponse):
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch
new file mode 100644
index 0000000000..cfcb980317
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch
@@ -0,0 +1,105 @@
+From a2200dc43d9fe0ee19b9185b30749c204a4dfd45 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 8 Nov 2023 19:25:05 +0000
+Subject: [PATCH] Add HTTP method validation (#6533) (#7806)
+
+(cherry picked from commit 75fca0b00b4297d0a30c51ae97a65428336eb2c1)
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/pull/7806/commits/a43bc1779892e7014b7723c59d08fb37a000955e]
+
+CVE: CVE-2023-49082
+
+Co-authored-by: Andrew Svetlov <andrew.svetlov@gmail.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/6533.feature         | 1 +
+ aiohttp/client_reqrep.py     | 9 ++++++++-
+ tests/test_client_request.py | 5 +++++
+ tests/test_web_request.py    | 9 +++++++--
+ 4 files changed, 21 insertions(+), 3 deletions(-)
+ create mode 100644 CHANGES/6533.feature
+
+diff --git a/CHANGES/6533.feature b/CHANGES/6533.feature
+new file mode 100644
+index 0000000..36bcbeb
+--- /dev/null
++++ b/CHANGES/6533.feature
+@@ -0,0 +1 @@
++Add HTTP method validation.
+diff --git a/aiohttp/client_reqrep.py b/aiohttp/client_reqrep.py
+index d3cd77e..a8135b2 100644
+--- a/aiohttp/client_reqrep.py
++++ b/aiohttp/client_reqrep.py
+@@ -78,6 +78,7 @@ if TYPE_CHECKING:  # pragma: no cover
+     from .tracing import Trace
+ 
+ 
++_CONTAINS_CONTROL_CHAR_RE = re.compile(r"[^-!#$%&'*+.^_`|~0-9a-zA-Z]")
+ json_re = re.compile(r"^application/(?:[\w.+-]+?\+)?json")
+ 
+ 
+@@ -266,10 +267,16 @@ class ClientRequest:
+         proxy_headers: Optional[LooseHeaders] = None,
+         traces: Optional[List["Trace"]] = None,
+     ):
+-
+         if loop is None:
+             loop = asyncio.get_event_loop()
+ 
++        match = _CONTAINS_CONTROL_CHAR_RE.search(method)
++        if match:
++            raise ValueError(
++                f"Method cannot contain non-token characters {method!r} "
++                "(found at least {match.group()!r})"
++            )
++
+         assert isinstance(url, URL), url
+         assert isinstance(proxy, (URL, type(None))), proxy
+         # FIXME: session is None in tests only, need to fix tests
+diff --git a/tests/test_client_request.py b/tests/test_client_request.py
+index 009f1a0..d0f208b 100644
+--- a/tests/test_client_request.py
++++ b/tests/test_client_request.py
+@@ -89,6 +89,11 @@ def test_method3(make_request) -> None:
+     assert req.method == "HEAD"
+ 
+ 
++def test_method_invalid(make_request) -> None:
++    with pytest.raises(ValueError, match="Method cannot contain non-token characters"):
++        make_request("METHOD WITH\nWHITESPACES", "http://python.org/")
++
++
+ def test_version_1_0(make_request) -> None:
+     req = make_request("get", "http://python.org/", version="1.0")
+     assert req.version == (1, 0)
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index c6aeaf8..2bb0cd5 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -43,7 +43,10 @@ def test_base_ctor() -> None:
+ 
+     assert "GET" == req.method
+     assert HttpVersion(1, 1) == req.version
+-    assert req.host == socket.getfqdn()
++    # MacOS may return CamelCased host name, need .lower()
++    # FQDN can be wider than host, e.g.
++    # 'fv-az397-495' in 'fv-az397-495.internal.cloudapp.net'
++    assert req.host.lower() in socket.getfqdn().lower()
+     assert "/path/to?a=1&b=2" == req.path_qs
+     assert "/path/to" == req.path
+     assert "a=1&b=2" == req.query_string
+@@ -66,7 +69,9 @@ def test_ctor() -> None:
+     assert "GET" == req.method
+     assert HttpVersion(1, 1) == req.version
+     # MacOS may return CamelCased host name, need .lower()
+-    assert req.host.lower() == socket.getfqdn().lower()
++    # FQDN can be wider than host, e.g.
++    # 'fv-az397-495' in 'fv-az397-495.internal.cloudapp.net'
++    assert req.host.lower() in socket.getfqdn().lower()
+     assert "/path/to?a=1&b=2" == req.path_qs
+     assert "/path/to" == req.path
+     assert "a=1&b=2" == req.query_string
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch
new file mode 100644
index 0000000000..f87ef92679
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch
@@ -0,0 +1,81 @@
+From d05042f1a35ec0adb797c056024d457ac1fd7088 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Thu, 11 Apr 2024 15:54:45 +0100
+Subject: [PATCH] Escape filenames and paths in HTML when generating index
+ pages (#8317) (#8319)
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/28335525d1eac015a7e7584137678cbb6ff19397]
+
+CVE: CVE-2024-27306
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+(cherry picked from commit ffbc43233209df302863712b511a11bdb6001b0f)
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/8317.bugfix.rst      |  1 +
+ aiohttp/web_urldispatcher.py | 11 ++++++-----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+ create mode 100644 CHANGES/8317.bugfix.rst
+
+diff --git a/CHANGES/8317.bugfix.rst b/CHANGES/8317.bugfix.rst
+new file mode 100644
+index 0000000..b24ef2a
+--- /dev/null
++++ b/CHANGES/8317.bugfix.rst
+@@ -0,0 +1 @@
++Escaped filenames in static view -- by :user:`bdraco`.
+diff --git a/aiohttp/web_urldispatcher.py b/aiohttp/web_urldispatcher.py
+index e8a8023..791ab94 100644
+--- a/aiohttp/web_urldispatcher.py
++++ b/aiohttp/web_urldispatcher.py
+@@ -1,7 +1,9 @@
+ import abc
+ import asyncio
+ import base64
++import functools
+ import hashlib
++import html
+ import inspect
+ import keyword
+ import os
+@@ -87,6 +89,7 @@ PATH_SEP: Final[str] = re.escape("/")
+ _ExpectHandler = Callable[[Request], Awaitable[None]]
+ _Resolve = Tuple[Optional["UrlMappingMatchInfo"], Set[str]]
+ 
++html_escape = functools.partial(html.escape, quote=True)
+ 
+ class _InfoDict(TypedDict, total=False):
+     path: str
+@@ -706,7 +709,7 @@ class StaticResource(PrefixResource):
+         assert filepath.is_dir()
+ 
+         relative_path_to_dir = filepath.relative_to(self._directory).as_posix()
+-        index_of = f"Index of /{relative_path_to_dir}"
++        index_of = f"Index of /{html_escape(relative_path_to_dir)}"
+         h1 = f"<h1>{index_of}</h1>"
+ 
+         index_list = []
+@@ -714,7 +717,7 @@ class StaticResource(PrefixResource):
+         for _file in sorted(dir_index):
+             # show file url as relative to static path
+             rel_path = _file.relative_to(self._directory).as_posix()
+-            file_url = self._prefix + "/" + rel_path
++            quoted_file_url = _quote_path(f"{self._prefix}/{rel_path}")
+ 
+             # if file is a directory, add '/' to the end of the name
+             if _file.is_dir():
+@@ -723,9 +726,7 @@ class StaticResource(PrefixResource):
+                 file_name = _file.name
+ 
+             index_list.append(
+-                '<li><a href="{url}">{name}</a></li>'.format(
+-                    url=file_url, name=file_name
+-                )
++                f'<li><a href="{quoted_file_url}">{html_escape(file_name)}</a></li>'
+             )
+         ul = "<ul>\n{}\n</ul>".format("\n".join(index_list))
+         body = f"<body>\n{h1}\n{ul}\n</body>"
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch
new file mode 100644
index 0000000000..20226eb754
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch
@@ -0,0 +1,522 @@
+From 44108afc0c0460d154216cab9aaa1d8f57edc3cc Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sun, 7 Apr 2024 13:19:31 +0100
+Subject: [PATCH] Fix handling of multipart/form-data (#8280) (#8302)
+
+https://datatracker.ietf.org/doc/html/rfc7578
+(cherry picked from commit 7d0be3fee540a3d4161ac7dc76422f1f5ea60104)
+
+The following commits are also included:
+7eecdff1 [PR #8332/482e6cdf backport][3.9] Add set_content_disposition test (#8333)
+f21c6f2c [PR #8335/5a6949da backport][3.9] Add Content-Disposition automatically (#8336)
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/cebe526b9c34dc3a3da9140409db63014bc4cf19
+https://github.com/aio-libs/aiohttp/commit/7eecdff163ccf029fbb1ddc9de4169d4aaeb6597
+https://github.com/aio-libs/aiohttp/commit/f21c6f2ca512a026ce7f0f6c6311f62d6a638866]
+
+CVE: CVE-2024-30251
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/8280.bugfix.rst      |   1 +
+ CHANGES/8280.deprecation.rst |   2 +
+ CHANGES/8332.bugfix.rst      |   1 +
+ CHANGES/8335.bugfix.rst      |   1 +
+ aiohttp/formdata.py          |  12 +++-
+ aiohttp/multipart.py         | 128 ++++++++++++++++++++++++-----------
+ tests/test_multipart.py      |  87 ++++++++++++++++++++----
+ tests/test_web_functional.py |  27 ++------
+ 8 files changed, 182 insertions(+), 77 deletions(-)
+ create mode 100644 CHANGES/8280.bugfix.rst
+ create mode 100644 CHANGES/8280.deprecation.rst
+ create mode 100644 CHANGES/8332.bugfix.rst
+ create mode 100644 CHANGES/8335.bugfix.rst
+
+diff --git a/CHANGES/8280.bugfix.rst b/CHANGES/8280.bugfix.rst
+new file mode 100644
+index 0000000..3aebe36
+--- /dev/null
++++ b/CHANGES/8280.bugfix.rst
+@@ -0,0 +1 @@
++Fixed ``multipart/form-data`` compliance with :rfc:`7578` -- by :user:`Dreamsorcerer`.
+diff --git a/CHANGES/8280.deprecation.rst b/CHANGES/8280.deprecation.rst
+new file mode 100644
+index 0000000..302dbb2
+--- /dev/null
++++ b/CHANGES/8280.deprecation.rst
+@@ -0,0 +1,2 @@
++Deprecated ``content_transfer_encoding`` parameter in :py:meth:`FormData.add_field()
++<aiohttp.FormData.add_field>` -- by :user:`Dreamsorcerer`.
+diff --git a/CHANGES/8332.bugfix.rst b/CHANGES/8332.bugfix.rst
+new file mode 100644
+index 0000000..70cad26
+--- /dev/null
++++ b/CHANGES/8332.bugfix.rst
+@@ -0,0 +1 @@
++Fixed regression with adding Content-Disposition to form-data part after appending to writer -- by :user:`Dreamsorcerer`/:user:`Olegt0rr`.
+diff --git a/CHANGES/8335.bugfix.rst b/CHANGES/8335.bugfix.rst
+new file mode 100644
+index 0000000..cd93b86
+--- /dev/null
++++ b/CHANGES/8335.bugfix.rst
+@@ -0,0 +1 @@
++Added default Content-Disposition in multipart/form-data responses -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/formdata.py b/aiohttp/formdata.py
+index e7cd24c..2b75b3d 100644
+--- a/aiohttp/formdata.py
++++ b/aiohttp/formdata.py
+@@ -1,4 +1,5 @@
+ import io
++import warnings
+ from typing import Any, Iterable, List, Optional
+ from urllib.parse import urlencode
+ 
+@@ -53,7 +54,12 @@ class FormData:
+         if isinstance(value, io.IOBase):
+             self._is_multipart = True
+         elif isinstance(value, (bytes, bytearray, memoryview)):
++            msg = (
++                "In v4, passing bytes will no longer create a file field. "
++                "Please explicitly use the filename parameter or pass a BytesIO object."
++            )
+             if filename is None and content_transfer_encoding is None:
++                warnings.warn(msg, DeprecationWarning)
+                 filename = name
+ 
+         type_options: MultiDict[str] = MultiDict({"name": name})
+@@ -81,7 +87,11 @@ class FormData:
+                     "content_transfer_encoding must be an instance"
+                     " of str. Got: %s" % content_transfer_encoding
+                 )
+-            headers[hdrs.CONTENT_TRANSFER_ENCODING] = content_transfer_encoding
++            msg = (
++                "content_transfer_encoding is deprecated. "
++                "To maintain compatibility with v4 please pass a BytesPayload."
++            )
++            warnings.warn(msg, DeprecationWarning)
+             self._is_multipart = True
+ 
+         self._fields.append((type_options, headers, value))
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index 73801f4..9cd49bb 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -255,13 +255,22 @@ class BodyPartReader:
+     chunk_size = 8192
+ 
+     def __init__(
+-        self, boundary: bytes, headers: "CIMultiDictProxy[str]", content: StreamReader
++        self,
++        boundary: bytes,
++        headers: "CIMultiDictProxy[str]",
++        content: StreamReader,
++        *,
++        subtype: str = "mixed",
++        default_charset: Optional[str] = None,
+     ) -> None:
+         self.headers = headers
+         self._boundary = boundary
+         self._content = content
++        self._default_charset = default_charset
+         self._at_eof = False
+-        length = self.headers.get(CONTENT_LENGTH, None)
++        self._is_form_data = subtype == "form-data"
++        # https://datatracker.ietf.org/doc/html/rfc7578#section-4.8
++        length = None if self._is_form_data else self.headers.get(CONTENT_LENGTH, None)
+         self._length = int(length) if length is not None else None
+         self._read_bytes = 0
+         # TODO: typeing.Deque is not supported by Python 3.5
+@@ -329,6 +338,8 @@ class BodyPartReader:
+         assert self._length is not None, "Content-Length required for chunked read"
+         chunk_size = min(size, self._length - self._read_bytes)
+         chunk = await self._content.read(chunk_size)
++        if self._content.at_eof():
++            self._at_eof = True
+         return chunk
+ 
+     async def _read_chunk_from_stream(self, size: int) -> bytes:
+@@ -444,7 +455,8 @@ class BodyPartReader:
+         """
+         if CONTENT_TRANSFER_ENCODING in self.headers:
+             data = self._decode_content_transfer(data)
+-        if CONTENT_ENCODING in self.headers:
++        # https://datatracker.ietf.org/doc/html/rfc7578#section-4.8
++        if not self._is_form_data and CONTENT_ENCODING in self.headers:
+             return self._decode_content(data)
+         return data
+ 
+@@ -478,7 +490,7 @@ class BodyPartReader:
+         """Returns charset parameter from Content-Type header or default."""
+         ctype = self.headers.get(CONTENT_TYPE, "")
+         mimetype = parse_mimetype(ctype)
+-        return mimetype.parameters.get("charset", default)
++        return mimetype.parameters.get("charset", self._default_charset or default)
+ 
+     @reify
+     def name(self) -> Optional[str]:
+@@ -533,9 +545,17 @@ class MultipartReader:
+     part_reader_cls = BodyPartReader
+ 
+     def __init__(self, headers: Mapping[str, str], content: StreamReader) -> None:
++        self._mimetype = parse_mimetype(headers[CONTENT_TYPE])
++        assert self._mimetype.type == "multipart", "multipart/* content type expected"
++        if "boundary" not in self._mimetype.parameters:
++            raise ValueError(
++                "boundary missed for Content-Type: %s" % headers[CONTENT_TYPE]
++            )
++
+         self.headers = headers
+         self._boundary = ("--" + self._get_boundary()).encode()
+         self._content = content
++        self._default_charset: Optional[str] = None
+         self._last_part: Optional[Union["MultipartReader", BodyPartReader]] = None
+         self._at_eof = False
+         self._at_bof = True
+@@ -587,7 +607,24 @@ class MultipartReader:
+             await self._read_boundary()
+         if self._at_eof:  # we just read the last boundary, nothing to do there
+             return None
+-        self._last_part = await self.fetch_next_part()
++
++        part = await self.fetch_next_part()
++        # https://datatracker.ietf.org/doc/html/rfc7578#section-4.6
++        if (
++            self._last_part is None
++            and self._mimetype.subtype == "form-data"
++            and isinstance(part, BodyPartReader)
++        ):
++            _, params = parse_content_disposition(part.headers.get(CONTENT_DISPOSITION))
++            if params.get("name") == "_charset_":
++                # Longest encoding in https://encoding.spec.whatwg.org/encodings.json
++                # is 19 characters, so 32 should be more than enough for any valid encoding.
++                charset = await part.read_chunk(32)
++                if len(charset) > 31:
++                    raise RuntimeError("Invalid default charset")
++                self._default_charset = charset.strip().decode()
++                part = await self.fetch_next_part()
++        self._last_part = part
+         return self._last_part
+ 
+     async def release(self) -> None:
+@@ -623,19 +660,16 @@ class MultipartReader:
+                 return type(self)(headers, self._content)
+             return self.multipart_reader_cls(headers, self._content)
+         else:
+-            return self.part_reader_cls(self._boundary, headers, self._content)
+-
+-    def _get_boundary(self) -> str:
+-        mimetype = parse_mimetype(self.headers[CONTENT_TYPE])
+-
+-        assert mimetype.type == "multipart", "multipart/* content type expected"
+-
+-        if "boundary" not in mimetype.parameters:
+-            raise ValueError(
+-                "boundary missed for Content-Type: %s" % self.headers[CONTENT_TYPE]
++            return self.part_reader_cls(
++                self._boundary,
++                headers,
++                self._content,
++                subtype=self._mimetype.subtype,
++                default_charset=self._default_charset,
+             )
+ 
+-        boundary = mimetype.parameters["boundary"]
++    def _get_boundary(self) -> str:
++        boundary = self._mimetype.parameters["boundary"]
+         if len(boundary) > 70:
+             raise ValueError("boundary %r is too long (70 chars max)" % boundary)
+ 
+@@ -726,6 +760,7 @@ class MultipartWriter(Payload):
+         super().__init__(None, content_type=ctype)
+ 
+         self._parts: List[_Part] = []
++        self._is_form_data = subtype == "form-data"
+ 
+     def __enter__(self) -> "MultipartWriter":
+         return self
+@@ -803,32 +838,38 @@ class MultipartWriter(Payload):
+ 
+     def append_payload(self, payload: Payload) -> Payload:
+         """Adds a new body part to multipart writer."""
+-        # compression
+-        encoding: Optional[str] = payload.headers.get(
+-            CONTENT_ENCODING,
+-            "",
+-        ).lower()
+-        if encoding and encoding not in ("deflate", "gzip", "identity"):
+-            raise RuntimeError(f"unknown content encoding: {encoding}")
+-        if encoding == "identity":
+-            encoding = None
+-
+-        # te encoding
+-        te_encoding: Optional[str] = payload.headers.get(
+-            CONTENT_TRANSFER_ENCODING,
+-            "",
+-        ).lower()
+-        if te_encoding not in ("", "base64", "quoted-printable", "binary"):
+-            raise RuntimeError(
+-                "unknown content transfer encoding: {}" "".format(te_encoding)
++        encoding: Optional[str] = None
++        te_encoding: Optional[str] = None
++        if self._is_form_data:
++            # https://datatracker.ietf.org/doc/html/rfc7578#section-4.7
++            # https://datatracker.ietf.org/doc/html/rfc7578#section-4.8
++            assert (
++                not {CONTENT_ENCODING, CONTENT_LENGTH, CONTENT_TRANSFER_ENCODING}
++                & payload.headers.keys()
+             )
+-        if te_encoding == "binary":
+-            te_encoding = None
+-
+-        # size
+-        size = payload.size
+-        if size is not None and not (encoding or te_encoding):
+-            payload.headers[CONTENT_LENGTH] = str(size)
++            # Set default Content-Disposition in case user doesn't create one
++            if CONTENT_DISPOSITION not in payload.headers:
++                name = f"section-{len(self._parts)}"
++                payload.set_content_disposition("form-data", name=name)
++        else:
++            # compression
++            encoding = payload.headers.get(CONTENT_ENCODING, "").lower()
++            if encoding and encoding not in ("deflate", "gzip", "identity"):
++                raise RuntimeError(f"unknown content encoding: {encoding}")
++            if encoding == "identity":
++                encoding = None
++
++            # te encoding
++            te_encoding = payload.headers.get(CONTENT_TRANSFER_ENCODING, "").lower()
++            if te_encoding not in ("", "base64", "quoted-printable", "binary"):
++                raise RuntimeError(f"unknown content transfer encoding: {te_encoding}")
++            if te_encoding == "binary":
++                te_encoding = None
++
++            # size
++            size = payload.size
++            if size is not None and not (encoding or te_encoding):
++                payload.headers[CONTENT_LENGTH] = str(size)
+ 
+         self._parts.append((payload, encoding, te_encoding))  # type: ignore[arg-type]
+         return payload
+@@ -886,6 +927,11 @@ class MultipartWriter(Payload):
+     async def write(self, writer: Any, close_boundary: bool = True) -> None:
+         """Write body."""
+         for part, encoding, te_encoding in self._parts:
++            if self._is_form_data:
++                # https://datatracker.ietf.org/doc/html/rfc7578#section-4.2
++                assert CONTENT_DISPOSITION in part.headers
++                assert "name=" in part.headers[CONTENT_DISPOSITION]
++
+             await writer.write(b"--" + self._boundary + b"\r\n")
+             await writer.write(part._binary_headers)
+ 
+diff --git a/tests/test_multipart.py b/tests/test_multipart.py
+index cc3f5ff..1d036fb 100644
+--- a/tests/test_multipart.py
++++ b/tests/test_multipart.py
+@@ -942,6 +942,58 @@ class TestMultipartReader:
+             assert first.at_eof()
+             assert not second.at_eof()
+ 
++    async def test_read_form_default_encoding(self) -> None:
++        with Stream(
++            b"--:\r\n"
++            b'Content-Disposition: form-data; name="_charset_"\r\n\r\n'
++            b"ascii"
++            b"\r\n"
++            b"--:\r\n"
++            b'Content-Disposition: form-data; name="field1"\r\n\r\n'
++            b"foo"
++            b"\r\n"
++            b"--:\r\n"
++            b"Content-Type: text/plain;charset=UTF-8\r\n"
++            b'Content-Disposition: form-data; name="field2"\r\n\r\n'
++            b"foo"
++            b"\r\n"
++            b"--:\r\n"
++            b'Content-Disposition: form-data; name="field3"\r\n\r\n'
++            b"foo"
++            b"\r\n"
++        ) as stream:
++            reader = aiohttp.MultipartReader(
++                {CONTENT_TYPE: 'multipart/form-data;boundary=":"'},
++                stream,
++            )
++            field1 = await reader.next()
++            assert field1.name == "field1"
++            assert field1.get_charset("default") == "ascii"
++            field2 = await reader.next()
++            assert field2.name == "field2"
++            assert field2.get_charset("default") == "UTF-8"
++            field3 = await reader.next()
++            assert field3.name == "field3"
++            assert field3.get_charset("default") == "ascii"
++
++    async def test_read_form_invalid_default_encoding(self) -> None:
++        with Stream(
++            b"--:\r\n"
++            b'Content-Disposition: form-data; name="_charset_"\r\n\r\n'
++            b"this-value-is-too-long-to-be-a-charset"
++            b"\r\n"
++            b"--:\r\n"
++            b'Content-Disposition: form-data; name="field1"\r\n\r\n'
++            b"foo"
++            b"\r\n"
++        ) as stream:
++            reader = aiohttp.MultipartReader(
++                {CONTENT_TYPE: 'multipart/form-data;boundary=":"'},
++                stream,
++            )
++            with pytest.raises(RuntimeError, match="Invalid default charset"):
++                await reader.next()
++
+ 
+ async def test_writer(writer) -> None:
+     assert writer.size == 7
+@@ -1228,6 +1280,25 @@ class TestMultipartWriter:
+         part = writer._parts[0][0]
+         assert part.headers[CONTENT_TYPE] == "test/passed"
+ 
++    def test_set_content_disposition_after_append(self):
++        writer = aiohttp.MultipartWriter("form-data")
++        part = writer.append("some-data")
++        part.set_content_disposition("form-data", name="method")
++        assert 'name="method"' in part.headers[CONTENT_DISPOSITION]
++
++    def test_automatic_content_disposition(self):
++        writer = aiohttp.MultipartWriter("form-data")
++        writer.append_json(())
++        part = payload.StringPayload("foo")
++        part.set_content_disposition("form-data", name="second")
++        writer.append_payload(part)
++        writer.append("foo")
++
++        disps = tuple(p[0].headers[CONTENT_DISPOSITION] for p in writer._parts)
++        assert 'name="section-0"' in disps[0]
++        assert 'name="second"' in disps[1]
++        assert 'name="section-2"' in disps[2]
++
+     def test_with(self) -> None:
+         with aiohttp.MultipartWriter(boundary=":") as writer:
+             writer.append("foo")
+@@ -1278,7 +1349,6 @@ class TestMultipartWriter:
+                         CONTENT_TYPE: "text/python",
+                     },
+                 )
+-            content_length = part.size
+             await writer.write(stream)
+ 
+         assert part.headers[CONTENT_TYPE] == "text/python"
+@@ -1289,9 +1359,7 @@ class TestMultipartWriter:
+         assert headers == (
+             b"--:\r\n"
+             b"Content-Type: text/python\r\n"
+-            b'Content-Disposition: attachments; filename="bug.py"\r\n'
+-            b"Content-Length: %s"
+-            b"" % (str(content_length).encode(),)
++            b'Content-Disposition: attachments; filename="bug.py"'
+         )
+ 
+     async def test_set_content_disposition_override(self, buf, stream):
+@@ -1305,7 +1373,6 @@ class TestMultipartWriter:
+                         CONTENT_TYPE: "text/python",
+                     },
+                 )
+-            content_length = part.size
+             await writer.write(stream)
+ 
+         assert part.headers[CONTENT_TYPE] == "text/python"
+@@ -1316,9 +1383,7 @@ class TestMultipartWriter:
+         assert headers == (
+             b"--:\r\n"
+             b"Content-Type: text/python\r\n"
+-            b'Content-Disposition: attachments; filename="bug.py"\r\n'
+-            b"Content-Length: %s"
+-            b"" % (str(content_length).encode(),)
++            b'Content-Disposition: attachments; filename="bug.py"'
+         )
+ 
+     async def test_reset_content_disposition_header(self, buf, stream):
+@@ -1330,8 +1395,6 @@ class TestMultipartWriter:
+                     headers={CONTENT_TYPE: "text/plain"},
+                 )
+ 
+-            content_length = part.size
+-
+             assert CONTENT_DISPOSITION in part.headers
+ 
+             part.set_content_disposition("attachments", filename="bug.py")
+@@ -1344,9 +1407,7 @@ class TestMultipartWriter:
+             b"--:\r\n"
+             b"Content-Type: text/plain\r\n"
+             b"Content-Disposition:"
+-            b' attachments; filename="bug.py"\r\n'
+-            b"Content-Length: %s"
+-            b"" % (str(content_length).encode(),)
++            b' attachments; filename="bug.py"'
+         )
+ 
+ 
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index 5fdfb23..61739e9 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -34,7 +34,8 @@ def fname(here):
+ 
+ def new_dummy_form():
+     form = FormData()
+-    form.add_field("name", b"123", content_transfer_encoding="base64")
++    with pytest.warns(DeprecationWarning, match="BytesPayload"):
++        form.add_field("name", b"123", content_transfer_encoding="base64")
+     return form
+ 
+ 
+@@ -429,25 +430,6 @@ async def test_release_post_data(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
+-async def test_POST_DATA_with_content_transfer_encoding(aiohttp_client) -> None:
+-    async def handler(request):
+-        data = await request.post()
+-        assert b"123" == data["name"]
+-        return web.Response()
+-
+-    app = web.Application()
+-    app.router.add_post("/", handler)
+-    client = await aiohttp_client(app)
+-
+-    form = FormData()
+-    form.add_field("name", b"123", content_transfer_encoding="base64")
+-
+-    resp = await client.post("/", data=form)
+-    assert 200 == resp.status
+-
+-    await resp.release()
+-
+-
+ async def test_post_form_with_duplicate_keys(aiohttp_client) -> None:
+     async def handler(request):
+         data = await request.post()
+@@ -505,7 +487,8 @@ async def test_100_continue(aiohttp_client) -> None:
+         return web.Response()
+ 
+     form = FormData()
+-    form.add_field("name", b"123", content_transfer_encoding="base64")
++    with pytest.warns(DeprecationWarning, match="BytesPayload"):
++        form.add_field("name", b"123", content_transfer_encoding="base64")
+ 
+     app = web.Application()
+     app.router.add_post("/", handler)
+@@ -683,7 +666,7 @@ async def test_upload_file(aiohttp_client) -> None:
+     app.router.add_post("/", handler)
+     client = await aiohttp_client(app)
+ 
+-    resp = await client.post("/", data={"file": data})
++    resp = await client.post("/", data={"file": io.BytesIO(data)})
+     assert 200 == resp.status
+ 
+     await resp.release()
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
new file mode 100644
index 0000000000..a76968c6ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
@@ -0,0 +1,46 @@
+From 27b9925ad3ac716a6db3a3d1214b3fe2a260c5c8 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Wed, 13 Nov 2024 08:50:36 -0600
+Subject: [PATCH] Fix incorrect parsing of chunk extensions with the pure
+ Python parser (#9853)
+
+Upstream-Status: Backport
+[https://github.com/aio-libs/aiohttp/commit/259edc369075de63e6f3a4eaade058c62af0df71]
+
+CVE: CVE-2024-52304
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ CHANGES/9851.bugfix.rst | 1 +
+ aiohttp/http_parser.py  | 7 +++++++
+ 2 files changed, 8 insertions(+)
+ create mode 100644 CHANGES/9851.bugfix.rst
+
+diff --git a/CHANGES/9851.bugfix.rst b/CHANGES/9851.bugfix.rst
+new file mode 100644
+index 0000000..02541a9
+--- /dev/null
++++ b/CHANGES/9851.bugfix.rst
+@@ -0,0 +1 @@
++Fixed incorrect parsing of chunk extensions with the pure Python parser -- by :user:`bdraco`.
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 91e01f4..1ee1269 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -820,6 +820,13 @@ class HttpPayloadParser:
+                         i = chunk.find(CHUNK_EXT, 0, pos)
+                         if i >= 0:
+                             size_b = chunk[:i]  # strip chunk-extensions
++                            # Verify no LF in the chunk-extension
++                            if b"\n" in (ext := chunk[i:pos]):
++                                exc = BadHttpMessage(
++                                    f"Unexpected LF in chunk-extension: {ext!r}"
++                                )
++                                set_exception(self.payload, exc)
++                                raise exc
+                         else:
+                             size_b = chunk[:pos]
+ 
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index c805e17d86..479c2f2064 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -5,6 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI += "file://CVE-2024-23334.patch \
+            file://CVE-2023-49081.patch \
+            file://CVE-2024-30251.patch \
+            file://CVE-2024-52304.patch \
+            file://CVE-2023-49082.patch \
+            file://CVE-2024-27306.patch \
            "
 
 SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
-- 
2.25.1


