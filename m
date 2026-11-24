Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12459.1795500042234081347
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZpSY9xq0;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9636; q=dns/txt;
  s=iport01; t=1795500042; x=1796709642;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=w6/hhazQT4QMvJwcFtEJPFLCd1DZCQFSNIhEwGVYLW8=;
  b=ZpSY9xq0aqTxeH+QOLh3ca4/x7kWteAr4zlI3s5cp04HNg8CLBSry7us
   NLJrDQ0saRnH8GwTkARIH2eb7yKP6rItkO7Fx2xLoC0t57fBIo4g0J4Tr
   bpqGVuXz0cZ1PEJBNjRcdK8KTce/J3PnHeBGSk1PQjvEGFJKVX2RQmeG2
   5lXmcTJZ+rBGnRDkhi0qZC+FbiIMRYuF+AiM+QBo2s0qiQ2S40jFVevUu
   KNKA/1xeIFsgl5Dnq9/glLFHT75Z/e9YB1pEWC+YIkenILHOPtplhc2Gv
   z09YIZliS1yTB3bkkODyjDy6lFsz+gIQdJNd/jaeqDZGObaYMKkx90o93
   Q==;
X-CSE-ConnectionGUID: g8D8Ym7ETc2fDQma8ywy7w==
X-CSE-MsgGUID: ESn0HmZ8QtODBtRw1ZAlJQ==
X-IPAS-Result: =?us-ascii?q?A0ASBABBJgVr/9FK/pBaglmCV3VgQ0mUKoIhA4pMk12Bf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDHQoLARgBPRwDAQIvKyMIGYMCAYJ0AxG6boF5M?=
 =?us-ascii?q?4EBgykBPwJDUNlLgWgBCxQBgTiFQogkXRgBRIQ5JxuBSUSCUIIvgQWBXAEBg?=
 =?us-ascii?q?S0LEIZeBIINgSGBVI0XAoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eG?=
 =?us-ascii?q?w4CHxAGFiELGxgNSBEsNxUZBD5uB5QUgxoOH2EBKxR9gSIbpVOhEYQrjCSVO?=
 =?us-ascii?q?hozqnILmH2OCoZVj3yEaoFoPIFHCwczGggbFYMiCUoZD445g2uBf4NlyHcmM?=
 =?us-ascii?q?gIJMgEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:OYC5DavT0jkneceZkwtLE6ZatufnVANfMUV32f8akzHdYApBsoF/q
 tZmKW2AOa6KYTD9fdByb4nlphsP7JTRz9ZqQVQ5+ytgFiJBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9bZbUVBLq
 tEkI2oDQimGjrKn36PkVbw57igjBJGD0II3s3x6iDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgZ/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGISNI4HVG5kL9qqej
 k/9+TzZByNKDcC45RCZyG31tMbLvxquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:TW675K7XrUaW70xrTgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AJwAZlWmy8g+xo4NsAf62ZmIwbLvXOXKN4CfhJhC?=
 =?us-ascii?q?VNW0zRpGsTFbA6bx1zNU7zg=3D=3D?=
X-Talos-MUID: 9a23:KUozxwSwavWNkw8MRXTBvzc6FMJas52yL2wnja8Z4vutMQ5JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60157646"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:00:38 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 11DB418000279
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:38 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id B87C5CC124A; Mon, 23 Nov 2026 22:00:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][wrynose][PATCH 4/5] python3-twisted: Fix CVE-2026-115776
Date: Mon, 23 Nov 2026 22:00:34 -0800
Message-Id: <20261124060035.1651451-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124060035.1651451-1-yurade@cisco.com>
References: <20261124060035.1651451-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132924
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1].

[1] https://github.com/twisted/twisted/commit/ac90fb7b0ab73688a581fcd9a7c0577ec8ca3059
[2] https://github.com/twisted/twisted/commit/01f8cff7753c1edac132380b2ea939fa6bdbab30
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-115776

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-twisted/CVE-2026-115776_p1.patch  | 111 ++++++++++++++++++
 .../python3-twisted/CVE-2026-115776_p2.patch  |  79 +++++++++++++
 .../python/python3-twisted_25.5.0.bb          |   2 +
 3 files changed, 192 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p1.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p1.patch
new file mode 100644
index 0000000000..ceb5c3139e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p1.patch
@@ -0,0 +1,111 @@
+From ac90fb7b0ab73688a581fcd9a7c0577ec8ca3059 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Wed, 5 Aug 2026 11:14:11 +0200
+Subject: [PATCH] words: bound the IRC server line buffer (Fixes #12770)
+
+CVE: CVE-2026-115776
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/ac90fb7b0ab73688a581fcd9a7c0577ec8ca3059]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/words/newsfragments/12770.bugfix |  1 +
+ src/twisted/words/protocols/irc.py           | 21 ++++++++++++++
+ src/twisted/words/test/test_irc.py           | 29 ++++++++++++++++++++
+ 3 files changed, 51 insertions(+)
+ create mode 100644 src/twisted/words/newsfragments/12770.bugfix
+
+diff --git a/src/twisted/words/newsfragments/12770.bugfix b/src/twisted/words/newsfragments/12770.bugfix
+new file mode 100644
+index 000000000..6bf3a63ee
+--- /dev/null
++++ b/src/twisted/words/newsfragments/12770.bugfix
+@@ -0,0 +1 @@
++twisted.words.protocols.irc.IRC now limits the length of a single line, so a peer can no longer exhaust server memory by sending data without a line delimiter.
+diff --git a/src/twisted/words/protocols/irc.py b/src/twisted/words/protocols/irc.py
+index 2906fa562..1123cdc4a 100644
+--- a/src/twisted/words/protocols/irc.py
++++ b/src/twisted/words/protocols/irc.py
+@@ -255,6 +255,9 @@ class IRC(protocol.Protocol):
+     """
+ 
+     buffer = ""
++    # Longest line accepted, matching twisted.protocols.basic.LineReceiver.
++    # An unterminated line would otherwise grow self.buffer without bound.
++    MAX_LENGTH = 16384
+     hostname = None
+ 
+     encoding: Optional[str] = None
+@@ -415,8 +418,15 @@ class IRC(protocol.Protocol):
+         # Put the (possibly empty) element after the last LF back in the
+         # buffer
+         self.buffer = lines.pop()
++        if len(self.buffer) > self.MAX_LENGTH:
++            # An unterminated line too long to be a valid message.
++            line, self.buffer = self.buffer, ""
++            return self.lineLengthExceeded(line)
+ 
+         for line in lines:
++            if len(line) > self.MAX_LENGTH:
++                self.buffer = ""
++                return self.lineLengthExceeded(line)
+             if len(line) <= 2:
+                 # This is a blank line, at best.
+                 continue
+@@ -429,6 +439,17 @@ class IRC(protocol.Protocol):
+ 
+             self.handleCommand(command, prefix, params)
+ 
++    def lineLengthExceeded(self, line):
++        """
++        Called when a line longer than C{MAX_LENGTH} is received. The default
++        behaviour, matching L{twisted.protocols.basic.LineReceiver}, drops the
++        connection.
++
++        @param line: The line which exceeded the length limit.
++        @type line: L{str}
++        """
++        return self.transport.loseConnection()
++
+     def handleCommand(self, command, prefix, params):
+         """
+         Determine the function to call for the given command and call it with
+diff --git a/src/twisted/words/test/test_irc.py b/src/twisted/words/test/test_irc.py
+index c30cfc522..cd400f9ed 100644
+--- a/src/twisted/words/test/test_irc.py
++++ b/src/twisted/words/test/test_irc.py
+@@ -1522,6 +1522,35 @@ class BasicServerFunctionalityTests(IRCTestCase):
+             bufferValue = bufferValue.decode("utf-8")
+         self.assertEqual(bufferValue, s)
+ 
++    def test_dataReceivedBoundsUnterminatedLine(self) -> None:
++        """
++        A line longer than L{irc.IRC.MAX_LENGTH} that arrives without a
++        delimiter is not buffered without bound. The buffer is cleared and the
++        connection is dropped, matching L{twisted.protocols.basic.LineReceiver}.
++        """
++        self.p.dataReceived(b"A" * (self.p.MAX_LENGTH + 1))
++        self.assertEqual(self.p.buffer, "")
++        self.assertTrue(self.t.closed)
++
++    def test_dataReceivedDropsOverlongTerminatedLine(self) -> None:
++        """
++        A delimited line longer than L{irc.IRC.MAX_LENGTH} is dropped rather
++        than dispatched.
++        """
++        self.p.dataReceived(b"A" * (self.p.MAX_LENGTH + 1) + b"\n")
++        self.assertEqual(self.p.buffer, "")
++        self.assertTrue(self.t.closed)
++
++    def test_dataReceivedAcceptsBoundedInput(self) -> None:
++        """
++        Input under the length limit is buffered normally and the connection is
++        left open.
++        """
++        self.p.dataReceived(b"\r\n")
++        self.p.dataReceived(b"AB")
++        self.assertEqual(self.p.buffer, "AB")
++        self.assertFalse(self.t.closed)
++
+     def test_sendMessage(self):
+         """
+         Passing a command and parameters to L{IRC.sendMessage} results in a
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p2.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p2.patch
new file mode 100644
index 0000000000..55ecb71a66
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2026-115776_p2.patch
@@ -0,0 +1,79 @@
+From 01f8cff7753c1edac132380b2ea939fa6bdbab30 Mon Sep 17 00:00:00 2001
+From: arkmarta <arkadiuszmarta@proton.me>
+Date: Sat, 8 Aug 2026 08:25:06 +0200
+Subject: [PATCH] bound the IRC server line length
+
+CVE: CVE-2026-115776
+Upstream-Status: Backport [https://github.com/twisted/twisted/commit/01f8cff7753c1edac132380b2ea939fa6bdbab30]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/twisted/words/newsfragments/12770.bugfix |  2 +-
+ src/twisted/words/protocols/irc.py           | 19 ++++++++++++-------
+ 2 files changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/src/twisted/words/newsfragments/12770.bugfix b/src/twisted/words/newsfragments/12770.bugfix
+index 6bf3a63ee..2a62e440f 100644
+--- a/src/twisted/words/newsfragments/12770.bugfix
++++ b/src/twisted/words/newsfragments/12770.bugfix
+@@ -1 +1 @@
+-twisted.words.protocols.irc.IRC now limits the length of a single line, so a peer can no longer exhaust server memory by sending data without a line delimiter.
++twisted.words.protocols.irc.IRC.dataReceived now limits the length of a single line, so a peer can no longer exhaust server memory by sending data without a line delimiter.
+diff --git a/src/twisted/words/protocols/irc.py b/src/twisted/words/protocols/irc.py
+index 1123cdc4a..2249edd99 100644
+--- a/src/twisted/words/protocols/irc.py
++++ b/src/twisted/words/protocols/irc.py
+@@ -252,11 +252,14 @@ def parseModes(modes, params, paramModes=("", "")):
+ class IRC(protocol.Protocol):
+     """
+     Internet Relay Chat server protocol.
++
++    @cvar MAX_LENGTH: The maximum length of a line to allow. A received line
++        longer than this drops the connection, matching
++        L{twisted.protocols.basic.LineReceiver}, so an unterminated line cannot
++        grow the buffer without bound. Default is 16384.
+     """
+ 
+     buffer = ""
+-    # Longest line accepted, matching twisted.protocols.basic.LineReceiver.
+-    # An unterminated line would otherwise grow self.buffer without bound.
+     MAX_LENGTH = 16384
+     hostname = None
+ 
+@@ -421,12 +424,14 @@ class IRC(protocol.Protocol):
+         if len(self.buffer) > self.MAX_LENGTH:
+             # An unterminated line too long to be a valid message.
+             line, self.buffer = self.buffer, ""
+-            return self.lineLengthExceeded(line)
++            self.lineLengthExceeded(line)
++            return
+ 
+         for line in lines:
+             if len(line) > self.MAX_LENGTH:
+                 self.buffer = ""
+-                return self.lineLengthExceeded(line)
++                self.lineLengthExceeded(line)
++                return
+             if len(line) <= 2:
+                 # This is a blank line, at best.
+                 continue
+@@ -439,16 +444,16 @@ class IRC(protocol.Protocol):
+ 
+             self.handleCommand(command, prefix, params)
+ 
+-    def lineLengthExceeded(self, line):
++    def lineLengthExceeded(self, line: str) -> None:
+         """
+         Called when a line longer than C{MAX_LENGTH} is received. The default
+         behaviour, matching L{twisted.protocols.basic.LineReceiver}, drops the
+         connection.
+ 
+         @param line: The line which exceeded the length limit.
+-        @type line: L{str}
+         """
+-        return self.transport.loseConnection()
++        assert self.transport is not None
++        self.transport.loseConnection()
+ 
+     def handleCommand(self, command, prefix, params):
+         """
diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
index 7ba179c455..72dc23e3fb 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
@@ -22,6 +22,8 @@ SRC_URI += "file://CVE-2026-42304_p1.patch \
            file://CVE-2026-115877_p3.patch \
            file://CVE-2026-115774_p1.patch \
            file://CVE-2026-115774_p2.patch \
+           file://CVE-2026-115776_p1.patch \
+           file://CVE-2026-115776_p2.patch \
            "
 
 SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
-- 
2.53.0

