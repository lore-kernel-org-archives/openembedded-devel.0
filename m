Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B16BC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 13:34:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.129619.1683034462789771170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 06:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UvfrSp3G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4486e13e8b=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342CvefW006123
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 May 2023 06:34:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=UnHT18EpsIN58wo8t+xmbfoa/ungpt5x0oEKNdjnDaI=;
 b=UvfrSp3GIal3TYOg3oEMh1D0Mm68YWpKwFkEJTOqGq5sVvsrUYHswGD4WNNKi6mvIN+I
 WUgsmb0VWIpSXzTpaIzQEOpjc9JgNYQeJQicLlbdNIsbBrZMx76W4dc/B7tWPOhAVTZV
 JAK8YVLzTDdjIiIyVJsJs75lY++QvAmk3wTBeHsRqZ1W3fThyqih+l1hDx3i2ZdCKLAo
 EqfPCB5fM7S+Tl9ZfhJB6DF1E/7DKpbMOrqDEBu0UEUFRW0QZjP6oDGN7DekmaDAzXxP
 BMjgaE1K6ac2XU492RNr6XUz6xAUf6Gww8u2OJ3PUyVM8pz03OJEA2D3grQpBcOsEr/g rw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rnaft1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:34:22 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 06:34:20 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for CVE-2023-25577
Date: Tue, 2 May 2023 13:33:52 +0000
Message-ID: <20230502133352.2074733-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: kJ_6krUB_Y-F3B6SYWIsJ6uKMm46jjY1
X-Proofpoint-GUID: kJ_6krUB_Y-F3B6SYWIsJ6uKMm46jjY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305020115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 13:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102260

From: Narpat Mali <narpat.mali@windriver.com>

Werkzeug is a comprehensive WSGI web application library. Prior to
version 2.2.3, Werkzeug's multipart form data parser will parse an
unlimited number of parts, including file parts. Parts can be a
small amount of bytes, but each requires CPU time to parse and may
use more memory as Python data. If a request can be made to an
endpoint that accesses `request.data`, `request.form`, `request.files`,
or `request.get_data(parse_form_data=False)`, it can cause unexpectedly
high resource usage. This allows an attacker to cause a denial of
service by sending crafted multipart data to an endpoint that will
parse it. The amount of CPU time required can block worker processes
from handling legitimate requests. The amount of RAM required can
trigger an out of memory kill of the process. Unlimited file parts
can use up memory and file handles. If many concurrent requests are
sent continuously, this can exhaust or kill all available workers.
Version 2.2.3 contains a patch for this issue.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-werkzeug/CVE-2023-25577.patch     | 232 ++++++++++++++++++
 .../python/python3-werkzeug_2.1.1.bb          |   2 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
new file mode 100644
index 0000000000..02109c2050
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
@@ -0,0 +1,232 @@
+From 5a56cdcbaec2153cd67596c6c2c8056e1ea5ed56 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Tue, 2 May 2023 11:31:10 +0000
+Subject: [PATCH] Merge pull request from GHSA-xg9f-g7g7-2323
+
+limit the maximum number of multipart form parts
+
+CVE: CVE-2023-25577
+
+Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/517cac5a804e8c4dc4ed038bb20dacd038e7a9f1]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ CHANGES.rst                      |  5 +++++
+ docs/request_data.rst            | 37 +++++++++++++++++---------------
+ src/werkzeug/formparser.py       | 12 ++++++++++-
+ src/werkzeug/sansio/multipart.py |  8 +++++++
+ src/werkzeug/wrappers/request.py |  8 +++++++
+ tests/test_formparser.py         |  9 ++++++++
+ 6 files changed, 61 insertions(+), 18 deletions(-)
+
+diff --git a/CHANGES.rst b/CHANGES.rst
+index a351d7c..6e809ba 100644
+--- a/CHANGES.rst
++++ b/CHANGES.rst
+@@ -1,5 +1,10 @@
+ .. currentmodule:: werkzeug
+ 
++-   Specify a maximum number of multipart parts, default 1000, after which a
++    ``RequestEntityTooLarge`` exception is raised on parsing. This mitigates a DoS
++    attack where a larger number of form/file parts would result in disproportionate
++    resource use.
++
+ Version 2.1.1
+ -------------
+ 
+diff --git a/docs/request_data.rst b/docs/request_data.rst
+index 83c6278..e55841e 100644
+--- a/docs/request_data.rst
++++ b/docs/request_data.rst
+@@ -73,23 +73,26 @@ read the stream *or* call :meth:`~Request.get_data`.
+ Limiting Request Data
+ ---------------------
+ 
+-To avoid being the victim of a DDOS attack you can set the maximum
+-accepted content length and request field sizes.  The :class:`Request`
+-class has two attributes for that: :attr:`~Request.max_content_length`
+-and :attr:`~Request.max_form_memory_size`.
+-
+-The first one can be used to limit the total content length.  For example
+-by setting it to ``1024 * 1024 * 16`` the request won't accept more than
+-16MB of transmitted data.
+-
+-Because certain data can't be moved to the hard disk (regular post data)
+-whereas temporary files can, there is a second limit you can set.  The
+-:attr:`~Request.max_form_memory_size` limits the size of `POST`
+-transmitted form data.  By setting it to ``1024 * 1024 * 2`` you can make
+-sure that all in memory-stored fields are not more than 2MB in size.
+-
+-This however does *not* affect in-memory stored files if the
+-`stream_factory` used returns a in-memory file.
++The :class:`Request` class provides a few attributes to control how much data is
++processed from the request body. This can help mitigate DoS attacks that craft the
++request in such a way that the server uses too many resources to handle it. Each of
++these limits will raise a :exc:`~werkzeug.exceptions.RequestEntityTooLarge` if they are
++exceeded.
++
++-   :attr:`~Request.max_content_length` Stop reading request data after this number
++    of bytes. It's better to configure this in the WSGI server or HTTP server, rather
++    than the WSGI application.
++-   :attr:`~Request.max_form_memory_size` Stop reading request data if any form part is
++    larger than this number of bytes. While file parts can be moved to disk, regular
++    form field data is stored in memory only.
++-   :attr:`~Request.max_form_parts` Stop reading request data if more than this number
++    of parts are sent in multipart form data. This is useful to stop a very large number
++    of very small parts, especially file parts. The default is 1000.
++
++Using Werkzeug to set these limits is only one layer of protection. WSGI servers
++and HTTPS servers should set their own limits on size and timeouts. The operating system
++or container manager should set limits on memory and processing time for server
++processes.
+ 
+ 
+ How to extend Parsing?
+diff --git a/src/werkzeug/formparser.py b/src/werkzeug/formparser.py
+index 10d58ca..bebb2fc 100644
+--- a/src/werkzeug/formparser.py
++++ b/src/werkzeug/formparser.py
+@@ -179,6 +179,8 @@ class FormDataParser:
+     :param cls: an optional dict class to use.  If this is not specified
+                        or `None` the default :class:`MultiDict` is used.
+     :param silent: If set to False parsing errors will not be caught.
++    :param max_form_parts: The maximum number of parts to be parsed. If this is
++        exceeded, a :exc:`~exceptions.RequestEntityTooLarge` exception is raised.
+     """
+ 
+     def __init__(
+@@ -190,6 +192,8 @@ class FormDataParser:
+         max_content_length: t.Optional[int] = None,
+         cls: t.Optional[t.Type[MultiDict]] = None,
+         silent: bool = True,
++        *,
++        max_form_parts: t.Optional[int] = None,
+     ) -> None:
+         if stream_factory is None:
+             stream_factory = default_stream_factory
+@@ -199,6 +203,7 @@ class FormDataParser:
+         self.errors = errors
+         self.max_form_memory_size = max_form_memory_size
+         self.max_content_length = max_content_length
++        self.max_form_parts = max_form_parts
+ 
+         if cls is None:
+             cls = MultiDict
+@@ -281,6 +286,7 @@ class FormDataParser:
+             self.errors,
+             max_form_memory_size=self.max_form_memory_size,
+             cls=self.cls,
++            max_form_parts=self.max_form_parts,
+         )
+         boundary = options.get("boundary", "").encode("ascii")
+ 
+@@ -346,10 +352,12 @@ class MultiPartParser:
+         max_form_memory_size: t.Optional[int] = None,
+         cls: t.Optional[t.Type[MultiDict]] = None,
+         buffer_size: int = 64 * 1024,
++        max_form_parts: t.Optional[int] = None,
+     ) -> None:
+         self.charset = charset
+         self.errors = errors
+         self.max_form_memory_size = max_form_memory_size
++        self.max_form_parts = max_form_parts
+ 
+         if stream_factory is None:
+             stream_factory = default_stream_factory
+@@ -409,7 +417,9 @@ class MultiPartParser:
+             [None],
+         )
+ 
+-        parser = MultipartDecoder(boundary, self.max_form_memory_size)
++        parser = MultipartDecoder(
++            boundary, self.max_form_memory_size, max_parts=self.max_form_parts
++        )
+ 
+         fields = []
+         files = []
+diff --git a/src/werkzeug/sansio/multipart.py b/src/werkzeug/sansio/multipart.py
+index 2d54422..e7d742b 100644
+--- a/src/werkzeug/sansio/multipart.py
++++ b/src/werkzeug/sansio/multipart.py
+@@ -83,10 +83,13 @@ class MultipartDecoder:
+         self,
+         boundary: bytes,
+         max_form_memory_size: Optional[int] = None,
++        *,
++        max_parts: Optional[int] = None,
+     ) -> None:
+         self.buffer = bytearray()
+         self.complete = False
+         self.max_form_memory_size = max_form_memory_size
++        self.max_parts = max_parts
+         self.state = State.PREAMBLE
+         self.boundary = boundary
+ 
+@@ -113,6 +116,7 @@ class MultipartDecoder:
+             % (LINE_BREAK, re.escape(boundary), LINE_BREAK, LINE_BREAK),
+             re.MULTILINE,
+         )
++        self._parts_decoded = 0
+ 
+     def last_newline(self) -> int:
+         try:
+@@ -177,6 +181,10 @@ class MultipartDecoder:
+                         name=name,
+                     )
+                 self.state = State.DATA
++                self._parts_decoded += 1
++
++                if self.max_parts is not None and self._parts_decoded > self.max_parts:
++                    raise RequestEntityTooLarge()
+ 
+         elif self.state == State.DATA:
+             if self.buffer.find(b"--" + self.boundary) == -1:
+diff --git a/src/werkzeug/wrappers/request.py b/src/werkzeug/wrappers/request.py
+index 57b739c..a6d5429 100644
+--- a/src/werkzeug/wrappers/request.py
++++ b/src/werkzeug/wrappers/request.py
+@@ -83,6 +83,13 @@ class Request(_SansIORequest):
+     #: .. versionadded:: 0.5
+     max_form_memory_size: t.Optional[int] = None
+ 
++    #: The maximum number of multipart parts to parse, passed to
++    #: :attr:`form_data_parser_class`. Parsing form data with more than this
++    #: many parts will raise :exc:`~.RequestEntityTooLarge`.
++    #:
++    #: .. versionadded:: 2.2.3
++    max_form_parts = 1000
++
+     #: The form data parser that should be used.  Can be replaced to customize
+     #: the form date parsing.
+     form_data_parser_class: t.Type[FormDataParser] = FormDataParser
+@@ -246,6 +253,7 @@ class Request(_SansIORequest):
+             self.max_form_memory_size,
+             self.max_content_length,
+             self.parameter_storage_class,
++            max_form_parts=self.max_form_parts,
+         )
+ 
+     def _load_form_data(self) -> None:
+diff --git a/tests/test_formparser.py b/tests/test_formparser.py
+index 5fc803e..834324f 100644
+--- a/tests/test_formparser.py
++++ b/tests/test_formparser.py
+@@ -127,6 +127,15 @@ class TestFormParser:
+         req.max_form_memory_size = 400
+         assert req.form["foo"] == "Hello World"
+ 
++        req = Request.from_values(
++            input_stream=io.BytesIO(data),
++            content_length=len(data),
++            content_type="multipart/form-data; boundary=foo",
++            method="POST",
++        )
++        req.max_form_parts = 1
++        pytest.raises(RequestEntityTooLarge, lambda: req.form["foo"])
++
+     def test_missing_multipart_boundary(self):
+         data = (
+             b"--foo\r\nContent-Disposition: form-field; name=foo\r\n\r\n"
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index 476a3a5964..324a4b7996 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
+SRC_URI += "file://CVE-2023-25577.patch"
+
 SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
 
 inherit pypi setuptools3
-- 
2.40.0


