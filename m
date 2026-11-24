Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12223.1795500040552522772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=L5JOIWd4;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10537; q=dns/txt;
  s=iport01; t=1795500040; x=1796709640;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fJfkSJju4qBcP/psoaa+0Dlp29jj+Ai+tNKjW7RVtRQ=;
  b=L5JOIWd4egDA6I1eZa8I4KYmOlCLDIbEmWlXfkvnLzMFdKUYMPT/Wn03
   8ibuneg57C5o0pYwveYqUpcu6xnZ0AIfk8lmfHdnxKSiqGWoZV1EWNW/F
   MPn2rnH93ydSe+zopAM4RdRNQaKFSqsXKQjWjYOTMbzkk7itIyx2H6TE6
   x+/t+eIWXPIqG2pIQDAJvtoBZxFnJRNxs6X+Ac9Bf1LF15Ozi0aQIUJKw
   NUTvxAvWZrY7/BdhqhdRFOop2UszfI54jiANg0jNpeHxIbTAO5KXYiW3p
   M7u0UZFbmRdj2gEjEAjBfijw1qbl+gI0ig3n6sqWmm28NqHjfCJQBpIpU
   w==;
X-CSE-ConnectionGUID: RRRFFFonTB6w9HNDs9yIjg==
X-CSE-MsgGUID: +xt5gwuvT+e6isdufZrTow==
X-IPAS-Result: =?us-ascii?q?A0ATBABBJgVr/9NK/pBaglmCV3VgQ0kDlCeCIQOKTIhYi?=
 =?us-ascii?q?wWBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEbIhwDAQIvKyMIGYMCAYJ0AxG6b?=
 =?us-ascii?q?oF5M4EBgykBPwJDUNlLgWgBCxQBgTiFQogkXRgBhH0nG4FJRIEVgTuCL4EFg?=
 =?us-ascii?q?VwBAYEnEYZuBIMugVSNFwKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAh8QBhYhCxsYDUgRLDcVGQQ+bgeUFIIocgGBDQEqAYEgZA8Zkz8ykgSBN?=
 =?us-ascii?q?Z9chCuMJJU6GjOFW6UXC5h9jgqGVY8sUIRqgWg8gUcLBzMaCBsVgyIJShkPj?=
 =?us-ascii?q?isOC4NggX+DZch3JjICCQMvAQEHAgcOAwuBaJAAASeBVgEB?=
IronPort-Data: A9a23:jlhND6lJHm8zEv39ja6Buz/o5gzUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXjiGafiOamfxL4wiOd+w9hwE7MTVmNNiTwZor3wyRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbciwMhZL2ZIy
 dZGN2EtSDyY1vOXwr3uH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCzaIGEKoDTG625mG7bt
 n6b8HvkHC1ZOYKe0jaY/EC2uujQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:PjgL6qhS26VXjT+maih5h1Uw2nBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:wUrwMG7VAt45S2KJddssznQuNO4LdXvh5inPcm+eJX04WZyXRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AcY+m+A/NPeiEKZvpi+e2Nz+Qf4R4//mhF10TrdY?=
 =?us-ascii?q?L5cifOTF+CS2hiyviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60398416"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:38 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 0C18918000B73
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:38 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id AB7C6CC12A8; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 2/5] python3-twisted: Fix CVE-2026-115877
Date: Mon, 23 Nov 2026 22:00:32 -0800
Message-Id: <20261124060035.1651451-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124060035.1651451-1-yurade@cisco.com>
References: <20261124060035.1651451-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132922
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [5],
using the commit shown in [1], [2] and [3].

[1] https://github.com/twisted/twisted/commit/1616f702d36eda8990a5a5b22ad70fab140a7eb1
[2] https://github.com/twisted/twisted/commit/022b6f7feb5980166c71f54e2c0d8f4f21ff6e1a
[3] https://github.com/twisted/twisted/commit/9b826a307b1f5d16df84bce2bdb2a3c70dabf06c
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-115877
[5] https://github.com/twisted/twisted/pull/12755
[6] https://github.com/twisted/twisted/security/advisories/GHSA-q7qq-6mhp-9rc4

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-twisted/CVE-2026-115877_p1.patch  | 71 +++++++++++++++++
 .../python3-twisted/CVE-2026-115877_p2.patch  | 30 +++++++
 .../python3-twisted/CVE-2026-115877_p3.patch  | 78 +++++++++++++++++++
 .../python/python3-twisted_25.5.0.bb          |  3 +
 4 files changed, 182 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p3.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p1.patch
new file mode 100644
index 0000000000..3f824788b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p1.patch
@@ -0,0 +1,71 @@
+From 1616f702d36eda8990a5a5b22ad70fab140a7eb1 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Fri, 31 Jul 2026 14:04:59 +0200
+Subject: [PATCH] Reject a bare CR or LF in an HTTP header value (#12754)
+
+CVE: CVE-2026-115877
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/1616f702d36eda8990a5a5b22ad70fab140a7eb1]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/web/http.py                    |  4 +++-
+ src/twisted/web/newsfragments/12754.bugfix |  1 +
+ src/twisted/web/test/test_http.py          | 22 ++++++++++++++++++++++
+ 3 files changed, 26 insertions(+), 1 deletion(-)
+ create mode 100644 src/twisted/web/newsfragments/12754.bugfix
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index c2894fbd2..2ac611105 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2509,7 +2509,9 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+             return False
+ 
+         data = data.strip(b" \t")
+-        if b"\x00" in data:
++        # Reject NUL, CR, and LF in a header value (RFC 9110 section 5.5); a
++        # bare CR or LF would let a lenient proxy smuggle a following header.
++        if b"\x00" in data or b"\r" in data or b"\n" in data:
+             self._respondToBadRequestAndDisconnect()
+             return False
+ 
+diff --git a/src/twisted/web/newsfragments/12754.bugfix b/src/twisted/web/newsfragments/12754.bugfix
+new file mode 100644
+index 000000000..9d42c4682
+--- /dev/null
++++ b/src/twisted/web/newsfragments/12754.bugfix
+@@ -0,0 +1 @@
++twisted.web.http.HTTPChannel.headerReceived now rejects a header value that contains a bare carriage return or line feed, closing a request-smuggling gap where such a value could hide a following header from the parser (RFC 9110 section 5.5).
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 3b4460c12..1c4bd8a21 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -2209,6 +2209,28 @@ class ParsingTests(unittest.TestCase):
+                 [b"GET / HTTP/1.1", b"Host: foo.example", header, b"", b""]
+             )
+ 
++    def test_invalidHeaderValueCRLF(self):
++        """
++        A header value containing a bare CR or LF is rejected with a 400, as
++        required by RFC 9110 section 5.5; accepting it would let a following
++        header be hidden from the parser and enable request smuggling. The bytes
++        are fed directly because L{runRequest} normalises a bare LF to CRLF.
++        """
++        for value in [
++            b"a\nContent-Length: 5",  # bare LF hiding a header
++            b"a\rContent-Length: 5",  # bare CR hiding a header
++            b"a\nb",  # bare LF
++            b"a\rb",  # bare CR
++        ]:
++            channel = http.HTTPChannel()
++            transport = StringTransport()
++            channel.makeConnection(transport)
++            channel.dataReceived(
++                b"GET / HTTP/1.1\r\nHost: foo.example\r\nx-foo: " + value + b"\r\n\r\n"
++            )
++            self.assertTrue(transport.disconnecting)
++            self.assertEqual(transport.value(), b"HTTP/1.1 400 Bad Request\r\n\r\n")
++
+     def test_headerLimitPerRequest(self):
+         """
+         C{HTTPChannel} enforces the limit of C{HTTPChannel.maxHeaders} per
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p2.patch
new file mode 100644
index 0000000000..9929fd9c5c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p2.patch
@@ -0,0 +1,30 @@
+From 022b6f7feb5980166c71f54e2c0d8f4f21ff6e1a Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Fri, 31 Jul 2026 14:30:02 +0200
+Subject: [PATCH] web: check a header value for NUL CR and LF in one pass
+
+CVE: CVE-2026-115877
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/022b6f7feb5980166c71f54e2c0d8f4f21ff6e1a]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/web/http.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index 2ac611105..b6ee3e5a5 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2509,9 +2509,9 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+             return False
+ 
+         data = data.strip(b" \t")
+-        # Reject NUL, CR, and LF in a header value (RFC 9110 section 5.5); a
+-        # bare CR or LF would let a lenient proxy smuggle a following header.
+-        if b"\x00" in data or b"\r" in data or b"\n" in data:
++        # A header value must not contain NUL, CR, or LF (RFC 9110 section 5.5).
++        # A bare CR or LF here would let a lenient proxy smuggle a header.
++        if len(data.translate(None, b"\x00\r\n")) != len(data):
+             self._respondToBadRequestAndDisconnect()
+             return False
+ 
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p3.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p3.patch
new file mode 100644
index 0000000000..10508544d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115877_p3.patch
@@ -0,0 +1,78 @@
+From 9b826a307b1f5d16df84bce2bdb2a3c70dabf06c Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Sat, 1 Aug 2026 07:41:38 +0200
+Subject: [PATCH] web: address review, fold header control-char tests into one
+
+CVE: CVE-2026-115877
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/9b826a307b1f5d16df84bce2bdb2a3c70dabf06c]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/web/http.py           |  1 -
+ src/twisted/web/test/test_http.py | 36 +++++++++++--------------------
+ 2 files changed, 13 insertions(+), 24 deletions(-)
+
+diff --git a/src/twisted/web/http.py b/src/twisted/web/http.py
+index b6ee3e5a5..32c164fcc 100644
+--- a/src/twisted/web/http.py
++++ b/src/twisted/web/http.py
+@@ -2510,7 +2510,6 @@ class HTTPChannel(basic.LineReceiver, policies.TimeoutMixin):
+ 
+         data = data.strip(b" \t")
+         # A header value must not contain NUL, CR, or LF (RFC 9110 section 5.5).
+-        # A bare CR or LF here would let a lenient proxy smuggle a header.
+         if len(data.translate(None, b"\x00\r\n")) != len(data):
+             self._respondToBadRequestAndDisconnect()
+             return False
+diff --git a/src/twisted/web/test/test_http.py b/src/twisted/web/test/test_http.py
+index 1c4bd8a21..fd362fd41 100644
+--- a/src/twisted/web/test/test_http.py
++++ b/src/twisted/web/test/test_http.py
+@@ -2194,34 +2194,24 @@ class ParsingTests(unittest.TestCase):
+                 [b"GET / HTTP/1.1", b"Host: foo.example", header, b"", b""]
+             )
+ 
+-    def test_invalidHeaderValueNUL(self):
++    def test_invalidHeaderValueControlChars(self) -> None:
+         """
+-        A request with a header value that contains a NUL byte
+-        is rejected with a 400 status code.
+-        """
+-        for header in [
+-            b"x-foo: \x00",  # NUL byte
+-            b"x-foo: a\x00",  # trailing NUL
+-            b"x-foo: \x00baz",  # leading NUL
+-            b"x-foo:  \x00\x00\x00x0\0 ",  # lots of NULs
+-        ]:
+-            self.assertRequestRejected(
+-                [b"GET / HTTP/1.1", b"Host: foo.example", header, b"", b""]
+-            )
+-
+-    def test_invalidHeaderValueCRLF(self):
+-        """
+-        A header value containing a bare CR or LF is rejected with a 400, as
+-        required by RFC 9110 section 5.5; accepting it would let a following
+-        header be hidden from the parser and enable request smuggling. The bytes
+-        are fed directly because L{runRequest} normalises a bare LF to CRLF.
++        A header value containing NUL, CR, or LF is rejected with a 400 (RFC
++        9110 section 5.5). A bare CR or LF would additionally let a following
++        header be hidden from the parser, enabling request smuggling.
+         """
+         for value in [
+-            b"a\nContent-Length: 5",  # bare LF hiding a header
+-            b"a\rContent-Length: 5",  # bare CR hiding a header
+-            b"a\nb",  # bare LF
++            b"\x00",  # NUL
++            b"a\x00",  # trailing NUL
++            b"\x00baz",  # leading NUL
+             b"a\rb",  # bare CR
++            b"a\rContent-Length: 5",  # bare CR hiding a header
+         ]:
++            self.assertRequestRejected(
++                [b"GET / HTTP/1.1", b"Host: foo.example", b"x-foo: " + value, b"", b""]
++            )
++        # runRequest normalises a bare LF to CRLF, so feed those bytes directly.
++        for value in [b"a\nb", b"a\nContent-Length: 5"]:
+             channel = http.HTTPChannel()
+             transport = StringTransport()
+             channel.makeConnection(transport)
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 978627077f..78e74fa491 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -17,6 +17,9 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
            file://CVE-2026-83813_p3.patch \
            file://CVE-2026-83813_p4.patch \
            file://CVE-2026-83813-regression.patch \
+           file://CVE-2026-115877_p1.patch \
+           file://CVE-2026-115877_p2.patch \
+           file://CVE-2026-115877_p3.patch \
            "
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
-- 
2.53.0

