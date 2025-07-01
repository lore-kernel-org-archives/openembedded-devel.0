Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A9C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 09:16:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6142.1751361401529389362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 02:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9277f8c7bb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615kmD5006939
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Jul 2025 02:16:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm2h2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 02:16:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 02:16:39 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 1 Jul 2025 02:16:38 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: Use qq format when time_t is 64bit on 32bit system
Date: Tue, 1 Jul 2025 17:16:38 +0800
Message-ID: <20250701091638.3259918-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6863a778 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=bwGbKnmsAAAA:8 a=t7CeM3EgAAAA:8 a=Vlq3iF5mmyObjZHUMIUA:9 a=nuVVIWbBudwLbAahYuja:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6gIpeOtJKJwFuwJx-8yOkYvDWBbVuS8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1NCBTYWx0ZWRfX2qFSFRZ2G27z gZ/MMELvhJ1vpvNmSyiLt2yfFoildV2ypy4wthU04Q7nCF/+XqqgBx3uObdR0kBUStlzrSnaHXq xQ9VgeFPLpzmrcnFDnj3Zsiourv58PNwdplvKj5iO9nDaYK4NH0xKm/tYKjqxsnvFtNq1daJ/q+
 VWvuiqZ3sOeBC4jnbIsr9ocFbBMtkesFInks/cEtfbvrJxQaLNLnBSZbanZx9QeAoQBF/RXsM06 JbBiyuKRUTutW1lbxx+z9VlHKoYpJveH+VBbEQgKcTxeBy+jWkfZg7sYaAs7W0YcGYomtwcYXst m/JBF2uiD4foUOXsgVEZRw7moLafrhnNMNTQOiDZxQA8JpBHF9DJHn1904HATXWl+l5tY1mkRfG
 9DqJPvDtOiwOnPHgDlpstorGA0tsENLiV6LWE7rlVmtivgqVjNB+wIMOMqSewkZaY2LsnjrP
X-Proofpoint-ORIG-GUID: 6gIpeOtJKJwFuwJx-8yOkYvDWBbVuS8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 09:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118192

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   # python3 -munittest -v test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts
test_server_simple_timeouts (test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts) ... ERROR

======================================================================
ERROR: test_server_simple_timeouts (test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/opt/python3-m2crypto/tests/test_ssl.py", line 474, in test_server_simple_timeouts
    s.set_socket_read_timeout(SSL.timeout())
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/site-packages/M2Crypto/SSL/Connection.py", line 680, in set_socket_read_timeout
    self.socket.setsockopt(
    ~~~~~~~~~~~~~~~~~~~~~~^
        socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeo.pack()
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
OSError: [Errno 22] Invalid argument

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...q-format-when-time_t-is-64bit-on-32b.patch | 80 +++++++++++++++++++
 .../python/python3-m2crypto_0.45.1.bb         |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
new file mode 100644
index 0000000000..120a67b6a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch
@@ -0,0 +1,80 @@
+From 7fa4f17cc183e04b10684b28219cf15780910206 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 30 Jun 2025 16:11:16 +0800
+Subject: [PATCH] timeout.py: use qq format when time_t is 64bit on 32bit
+ platform
+
+Fixes:
+   # python3
+  Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
+  Type "help", "copyright", "credits" or "license" for more information.
+  >>> import socket
+  >>> import struct
+  >>> s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+  >>> seconds = 5
+  >>> microseconds = 0
+  >>> timeval_packed = struct.pack('ll', seconds, microseconds)
+  >>> s.setsockopt(socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeval_packed)
+Traceback (most recent call last):
+  File "<python-input-6>", line 1, in <module>
+    s.setsockopt(socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeval_packed)
+    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+OSError: [Errno 22] Invalid argument
+
+Upstream-Status: Submitted [https://lists.sr.ht/~mcepl/m2crypto/patches/60463]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/M2Crypto/SSL/timeout.py | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py
+index 298a9ca..0b38329 100644
+--- a/src/M2Crypto/SSL/timeout.py
++++ b/src/M2Crypto/SSL/timeout.py
+@@ -15,7 +15,7 @@ __all__ = [
+ import sys
+ import struct
+ 
+-from M2Crypto import m2
++from M2Crypto import m2, util
+ 
+ DEFAULT_TIMEOUT: int = 600
+ 
+@@ -40,7 +40,10 @@ class timeout(object):
+             if m2.time_t_bits() == 32:
+                 binstr = struct.pack('ii', self.sec, self.microsec)
+             else:
+-                binstr = struct.pack('ll', self.sec, self.microsec)
++                if util.is_32bit():
++                    binstr = struct.pack('qq', self.sec, self.microsec)
++                else:
++                    binstr = struct.pack('ll', self.sec, self.microsec)
+         return binstr
+ 
+ 
+@@ -52,7 +55,10 @@ def struct_to_timeout(binstr: bytes) -> timeout:
+         sec = int(millisec / 1000)
+         microsec = (millisec % 1000) * 1000
+     else:
+-        (sec, microsec) = struct.unpack('ll', binstr)
++        if sys.platform == 'linux' and util.is_32bit() and m2.time_t_bits() == 64:
++             (sec, microsec) = struct.unpack('qq', binstr)
++        else:
++            (sec, microsec) = struct.unpack('ll', binstr)
+     return timeout(sec, microsec)
+ 
+ 
+@@ -60,4 +66,8 @@ def struct_size() -> int:
+     if sys.platform == 'win32':
+         return struct.calcsize('l')
+     else:
+-        return struct.calcsize('ll')
++        if sys.platform == 'linux' and util.is_32bit() and m2.time_t_bits() == 64:
++            return struct.calcsize('qq')
++        else:
++            return struct.calcsize('ll')
++
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
index b029b2978c..e0e9fdb2bb 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "d0fc81a8828edbf4308432b3040bf06bb26bad95abb9e7d4690b611855
 
 SRC_URI += " \
            file://0001-setup.py-Make-the-cmd-available.patch \
+           file://0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch \
 "
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.34.1


