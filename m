Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36256.1795584234448348191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XZvI+VYG;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12252; q=dns/txt;
  s=iport01; t=1795584234; x=1796793834;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w36+hakRM+BNthM81BlhDffhwyov3xmFOnhMdS5Xsm8=;
  b=XZvI+VYGzUPmve+b7ar2XXIbDi9dScVXie9Q1VJZujRVayrpyFf5K0V6
   V6AHA7br4ihrfL+ZeJCLvUAKjZXt+qhisCipOL7H6fYUxrWrDzyLFpjKN
   vVofit9lh0iJqaoWbtL5l82Smmu+OIKrf7AKoxVq/XGAsLlN82YKT7dix
   Pr908YdfSvhQ1oOs4ZLgSVyCmCWYkdpg+uvH4MLzDkD7T7ap1GK3Vhopd
   MwEOrB+PoyYrSNF0ZiLax8xaW1wFVWWNLt3+HKMnRwNLWFE1KtqhEVJcs
   R88nYSTvYmETebGTNtPVqmTAsYeQToSgZBnh5GDTjiP645Nz2yg5mOnn0
   g==;
X-CSE-ConnectionGUID: ayoVHgLbRdyTA6Gg2tWr2Q==
X-CSE-MsgGUID: Zx24FwxvQAWo1Q0fvPbGsA==
X-IPAS-Result: =?us-ascii?q?A0BFAgCQbgZr/8pK/pBaglmCV3VhQkkDlCeBNWyeLIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAS0LARgBWQMBAlojIYMCAYJ0AgERugWBeTOBAYMpAd0HAQsUA?=
 =?us-ascii?q?YE4hUKIJV0YAUSEOicbG4FygRWDaoEFgVwCgTiGbgSCDRWBDIFUHjEzgiCJc?=
 =?us-ascii?q?QKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESg?=
 =?us-ascii?q?QNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5QTgxs9UQErBHsGG4EMDw+TIZI2oREKKIN5jCSVOhozhVulFwuYf?=
 =?us-ascii?q?Ys3glOWUYRqgWg8gVlwFTuCZwlKGQ+OKwQKCxyDRIVkyHcjNQIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokAGBfQEB?=
IronPort-Data: A9a23:yrtHMaN4jJpNkiDvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUoi1mRSz
 2AZDzjQO/mOZmf0f4pxboTlp0MO68XQx9BlHHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/x/C38WMqkSwOpmPUgQ2
 vNCNA8XNCnW0opawJrjIgVtrs0uNozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I1BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FIpi+O8aYqKEjCMbfdFxBq2u
 XLYxk3GBUgjbNKB8TCq6Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:vbpMPqhv6aR02pJf0uT8hXIMNnBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AjR+DAmhBRodhdvcuEb1rEtazMjJue2za8lffB0W?=
 =?us-ascii?q?CBXdVYeO6RgWMx7k+qp87?=
X-Talos-MUID: 9a23:JxUGewZPqMHW/+BThS+22B99JNlRypupUXlVn4s+seafHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60339187"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:23:50 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 3F454794E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:50 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id E624ACC1634; Tue, 24 Nov 2026 21:23:48 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH 1/2] python3-scapy: fix CVE-2026-128237 and CVE-2026-128238
Date: Tue, 24 Nov 2026 21:23:44 -0800
Message-Id: <20261125052345.3120371-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132987
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch backports the shared upstream BER fix to the current version
of Scapy. The fix bounds numeric decoding and recursive ASN.1/BER
decoding. Both CVEs are addressed by the same upstream commit,
referenced in [1]. Their public advisories are referenced in [2] and
[3].

The CBOR files do not exist in the current version and are omitted.
Applicable ASN.1/BER source and regression test changes are retained
together.

[1] https://github.com/secdev/scapy/commit/36239645cf0b9408eb0821d9ed94f02e7b3c6dc6
[2] https://github.com/secdev/scapy/security/advisories/GHSA-xx44-g48m-mjp6
[3] https://github.com/secdev/scapy/security/advisories/GHSA-456h-w4v7-hvpr

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../CVE-2026-128237_CVE-2026-128238.patch     | 269 ++++++++++++++++++
 .../python/python3-scapy_2.6.1.bb             |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/CVE-2026-128237_CVE-2026-128238.patch

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/CVE-2026-128237_CVE-2026-128238.patch b/meta-networking/recipes-devtools/python/python3-scapy/CVE-2026-128237_CVE-2026-128238.patch
new file mode 100644
index 0000000..a8c0821
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/CVE-2026-128237_CVE-2026-128238.patch
@@ -0,0 +1,269 @@
+From 46557d0e8fa42e93b82c09c78134ceb03ff52d9f Mon Sep 17 00:00:00 2001
+From: Gabriel <10530980+gpotter2@users.noreply.github.com>
+Date: Fri, 31 Jul 2026 18:24:22 +0200
+Subject: [PATCH] Improve BER handling of integer boundaries (#5063)
+
+CVE: CVE-2026-128237 CVE-2026-128238
+Upstream-Status: Backport [https://github.com/secdev/scapy/commit/36239645cf0b9408eb0821d9ed94f02e7b3c6dc6]
+
+Backport Changes:
+- Omit scapy/cbor/cbor.py and scapy/cbor/cborcodec.py because these
+  files do not exist in the current version.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ scapy/asn1/asn1.py  | 12 +++++-----
+ scapy/asn1/ber.py   | 57 ++++++++++++++++++++++++++++++++++-----------
+ test/regression.uts | 28 +++++++++++++++++-----
+ 3 files changed, 71 insertions(+), 26 deletions(-)
+
+diff --git a/scapy/asn1/asn1.py b/scapy/asn1/asn1.py
+index 0783a3b3..44588b6f 100644
+--- a/scapy/asn1/asn1.py
++++ b/scapy/asn1/asn1.py
+@@ -126,13 +126,13 @@ class ASN1Codec(EnumElement):
+         # type: (Type[BERcodec_Object[Any]]) -> None
+         cls._stem = stem
+ 
+-    def dec(cls, s, context=None):
+-        # type: (bytes, Optional[Type[ASN1_Class]]) -> ASN1_Object[Any]
+-        return cls._stem.dec(s, context=context)  # type: ignore
++    def dec(cls, s, context=None, _depth=0):
++        # type: (bytes, Optional[Type[ASN1_Class]], int) -> ASN1_Object[Any]
++        return cls._stem.dec(s, context=context, _depth=_depth)  # type: ignore
+ 
+-    def safedec(cls, s, context=None):
+-        # type: (bytes, Optional[Type[ASN1_Class]]) -> ASN1_Object[Any]
+-        return cls._stem.safedec(s, context=context)  # type: ignore
++    def safedec(cls, s, context=None, _depth=0):
++        # type: (bytes, Optional[Type[ASN1_Class]], int) -> ASN1_Object[Any]
++        return cls._stem.safedec(s, context=context, _depth=_depth)  # type: ignore
+ 
+     def get_stem(cls):
+         # type: () -> type
+diff --git a/scapy/asn1/ber.py b/scapy/asn1/ber.py
+index 23899274..b5ffc425 100644
+--- a/scapy/asn1/ber.py
++++ b/scapy/asn1/ber.py
+@@ -50,6 +50,8 @@ from typing import (
+ 
+ #    [ BER tools ]    #
+ 
++MAX_BER_DEPTH = 32
++
+ 
+ class BER_Exception(Exception):
+     pass
+@@ -155,8 +157,8 @@ def BER_num_enc(ll, size=1):
+     return b"".join(chb(k) for k in x)
+ 
+ 
+-def BER_num_dec(s, cls_id=0):
+-    # type: (bytes, int) -> Tuple[int, bytes]
++def BER_num_dec(s, cls_id=0, max_pow=32):
++    # type: (bytes, int, int) -> Tuple[int, bytes]
+     if len(s) == 0:
+         raise BER_Decoding_Error("BER_num_dec: got empty string", remaining=s)
+     x = cls_id
+@@ -166,6 +168,9 @@ def BER_num_dec(s, cls_id=0):
+         x |= c & 0x7f
+         if not c & 0x80:
+             break
++        if i > max_pow:
++            raise BER_Decoding_Error("BER_num_dec: maximum value reached (2^32-1)",
++                                     remaining=s)
+     if c & 0x80:
+         raise BER_Decoding_Error("BER_num_dec: unfinished number description",
+                                  remaining=s)
+@@ -338,7 +343,8 @@ class BERcodec_Object(Generic[_K], metaclass=BERcodec_metaclass):
+     def do_dec(cls,
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+-               safe=False  # type: bool
++               safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[Any], bytes]
+         if context is not None:
+@@ -360,22 +366,28 @@ class BERcodec_Object(Generic[_K], metaclass=BERcodec_metaclass):
+             # Value type defined as Unknown
+             l, s = BER_num_dec(remainder)
+             return ASN1_BADTAG(s[:l]), s[l:]
+-        return codec.dec(s, _context, safe)
++        return codec.dec(s, _context, safe, _depth=_depth)
+ 
+     @classmethod
+     def dec(cls,
+             s,  # type: bytes
+             context=None,  # type: Optional[Type[ASN1_Class]]
+             safe=False,  # type: bool
++            _depth=0,  # type: int
+             ):
+         # type: (...) -> Tuple[Union[_ASN1_ERROR, ASN1_Object[_K]], bytes]
++        if _depth > MAX_BER_DEPTH:
++            raise BER_Exception("Reached maximum BER recursion limit")
+         if not safe:
+-            return cls.do_dec(s, context, safe)
++            return cls.do_dec(s, context, safe, _depth=_depth)
+         try:
+-            return cls.do_dec(s, context, safe)
++            return cls.do_dec(s, context, safe, _depth=_depth)
+         except BER_BadTag_Decoding_Error as e:
+             o, remain = BERcodec_Object.dec(
+-                e.remaining, context, safe
++                e.remaining,
++                context=context,
++                safe=safe,
++                _depth=_depth + 1,
+             )  # type: Tuple[ASN1_Object[Any], bytes]
+             return ASN1_BADTAG(o), remain
+         except BER_Decoding_Error as e:
+@@ -387,9 +399,10 @@ class BERcodec_Object(Generic[_K], metaclass=BERcodec_metaclass):
+     def safedec(cls,
+                 s,  # type: bytes
+                 context=None,  # type: Optional[Type[ASN1_Class]]
++                _depth=0,  # type: int
+                 ):
+         # type: (...) -> Tuple[Union[_ASN1_ERROR, ASN1_Object[_K]], bytes]
+-        return cls.dec(s, context, safe=True)
++        return cls.dec(s, context, safe=True, _depth=_depth)
+ 
+     @classmethod
+     def enc(cls, s, size_len=0):
+@@ -437,6 +450,7 @@ class BERcodec_INTEGER(BERcodec_Object[int]):
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+                safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[int], bytes]
+         l, s, t = cls.check_type_check_len(s)
+@@ -461,7 +475,8 @@ class BERcodec_BIT_STRING(BERcodec_Object[str]):
+     def do_dec(cls,
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+-               safe=False  # type: bool
++               safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[str], bytes]
+         # /!\ the unused_bits information is lost after this decoding
+@@ -515,6 +530,7 @@ class BERcodec_STRING(BERcodec_Object[str]):
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+                safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[Any], bytes]
+         l, s, t = cls.check_type_check_len(s)
+@@ -555,6 +571,7 @@ class BERcodec_OID(BERcodec_Object[bytes]):
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+                safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[bytes], bytes]
+         l, s, t = cls.check_type_check_len(s)
+@@ -562,7 +579,8 @@ class BERcodec_OID(BERcodec_Object[bytes]):
+         while s:
+             l, s = BER_num_dec(s)
+             lst.append(l)
+-        if (len(lst) > 0):
++        if lst:
++            # X.690 sect 8.19.4
+             lst.insert(0, lst[0] // 40)
+             lst[1] %= 40
+         return (
+@@ -639,18 +657,24 @@ class BERcodec_SEQUENCE(BERcodec_Object[Union[bytes, List[BERcodec_Object[Any]]]
+     def do_dec(cls,
+                s,  # type: bytes
+                context=None,  # type: Optional[Type[ASN1_Class]]
+-               safe=False  # type: bool
++               safe=False,  # type: bool
++               _depth=0,  # type: int
+                ):
+         # type: (...) -> Tuple[ASN1_Object[Union[bytes, List[Any]]], bytes]
+         if context is None:
+             context = cls.tag.context
++        if _depth > MAX_BER_DEPTH:
++            raise BER_Exception("Reached maximum BER recursion limit")
+         ll, st = cls.check_type_get_len(s)  # we may have len(s) < ll
+         s, t = st[:ll], st[ll:]
+         obj = []
+         while s:
+             try:
+                 o, remain = BERcodec_Object.dec(
+-                    s, context, safe
++                    s,
++                    context=context,
++                    safe=safe,
++                    _depth=_depth + 1,
+                 )  # type: Tuple[ASN1_Object[Any], bytes]
+                 s = remain
+             except BER_Decoding_Error as err:
+@@ -683,8 +707,13 @@ class BERcodec_IPADDRESS(BERcodec_STRING):
+         return chb(int(cls.tag)) + BER_len_enc(len(s), size=size_len) + s
+ 
+     @classmethod
+-    def do_dec(cls, s, context=None, safe=False):
+-        # type: (bytes, Optional[Any], bool) -> Tuple[ASN1_Object[str], bytes]
++    def do_dec(cls,
++               s,  # type: bytes
++               context=None,  # type: Optional[Any]
++               safe=False,  # type: bool
++               _depth=0,  # type: int
++               ):
++        # type: (...) -> Tuple[ASN1_Object[str], bytes]
+         l, s, t = cls.check_type_check_len(s)
+         try:
+             ipaddr_ascii = inet_ntoa(s)
+diff --git a/test/regression.uts b/test/regression.uts
+index 9b53fa36..67cd2870 100644
+--- a/test/regression.uts
++++ b/test/regression.uts
+@@ -4150,16 +4150,21 @@ r1 == b'@\x04\x08\x08\x08\x08'
+ r2 = b.dec(r1)[0]
+ r2.val == '8.8.8.8'
+ 
+-a = b'\x1f\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\x01\x01\x00C\x02\x01U0\x0f0\r\x06\x08+\x06\x01\x02\x01\x02\x01\x00\x02\x01!'
+-ret = False
++a = b'\x1f\xfe\xfe\xfe\xfe\xfe\x01\x01\x00C\x02\x01U0\x0f0\r\x06\x08+\x06\x01\x02\x01\x02\x01\x00\x02\x01!'
+ try:
+     BERcodec_Object.check_type(a)
+-except BER_BadTag_Decoding_Error:
+-    ret = True
++except BER_BadTag_Decoding_Error as ex:
++    assert "Got tag" in str(ex)
+ else:
+-    ret = False
++    assert False
+ 
+-assert ret
++a = b'\x1f\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\x01\x01\x00C\x02\x01U0\x0f0\r\x06\x08+\x06\x01\x02\x01\x02\x01\x00\x02\x01!'
++try:
++    BERcodec_Object.check_type(a)
++except BER_Decoding_Error as ex:
++    assert "maximum value" in str(ex)
++else:
++    assert False
+ 
+ = BER trigger failures
+ 
+@@ -4170,6 +4175,17 @@ except BER_Decoding_Error:
+     pass
+ 
+ 
++= BER tests - 2
++
++a = b'0c\x02\x01\x01\x04\x06public\xa2V\x02\x01\x01\x02\x01\x00\x02\x01\x000K0I\x06\x03+\x06\x010B0@0>0<0:08060402000.0,0*0(0&0$0"0 0\x1e0\x1c0\x1a0\x180\x160\x140\x120\x100\x0e0\x0c0\n0\x080\x060\x040\x020\x00'
++try:
++    SNMP(a)
++except BER_Exception as ex:
++    assert "recursion limit" in str(ex)
++else:
++    assert False
++
++
+ ############
+ ############
+ + Fields
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index 678aec0..8dcca1f 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "8e08cbf759de6709a5b4af6bea3655d293129bb4"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch \
+           file://CVE-2026-128237_CVE-2026-128238.patch \
            file://run-ptest"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.35.6

