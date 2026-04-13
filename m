Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89261F34C59
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:23:51 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.273805.1776090227853274792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=zUQZoxjl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d67a483d3eso472949785a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1776090227; x=1776695027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqF6MC7zK/VSIyVgqsJax7/NLK41Rvtw1LkoQA1ZV9s=;
        b=zUQZoxjlY2QttDmxAM8YT5x0+OdzhU4+NiiEBhJA5ZBrBO3qqJpWVweWhur25dBKZk
         WT5DkJxU7RBwd9TkWy2rU3K88TO9Hz988RdHJQXlyvPrJc0A/US3/HN3M2JhOed9NiUD
         feXjfCcF30VDWJfkdN3rUMERT607oWk7mK4EKkyzdz34pCnRDSVzCwqltg/1cWx/rRU7
         KGl+ne9Ep7f70bIbN/SbHm1WfmAKPfcv+see7g4XHnJVg2dmxGn8H7fOtThUQwS0zBqn
         UjECOiATUTb8YlRhbyCM2eFKGB6KWzQB+Z1m3QxkyGLxccR1Lh8hp2t41UCHFpSVSYIX
         jiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090227; x=1776695027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqF6MC7zK/VSIyVgqsJax7/NLK41Rvtw1LkoQA1ZV9s=;
        b=DpPXhtp6cfaENIhSsXZxVFLv63b7Cye6kR6FjjvQFEgYtOtH9aj6gXsNSHTPQ7Stjq
         eVQVeQcWZk4477ARaeLGJE2Q2Zoz/i1M3ulLkvhRH/WOjNqQikRHoFOiHC1+EwjSXIyV
         xNvj6H/dl9WrMYqarmyACvfo7xIjzTgtXqiJExTw1cZNj5NR2dHPnBCAVH47OPBIsJVO
         dageBuTcaaXeApIOj+0O/83j+uTLrBCh6TG+Wl5UyHUoKEKCPx3Zp1VeXzMiVwXsRZIL
         2Ku5gIm7gdRLMg1Lk4IdeVU0Vn2rAAxpR3vouF3v1vSEIF/V6G1TA5e4P4n6L6nwYhBv
         UqLw==
X-Gm-Message-State: AOJu0Yxq9LqbwtF9U0I6yVGUbLr7KWkJ4Np8dH/Zi1BTWV5TSf4L3tUZ
	2WUXlCbsELDLBRxnlOAtCgYjpCNdptfJnGc41xS9d0Et76zN6NCm80zyeuovs8OfFb0Dx5PPh3Q
	cYvQ=
X-Gm-Gg: AeBDieslED7oTcPwtgCOJTgFcIAE0SNYekLxpsKhtD4Yw4Bq/r4lQvUF3GDPADMRu5q
	rbjxkZaxfFtJ1Z+IForOCf5ffTZOdtbYo5sVkKNQUVOtpGzI8JGqkhmV0YvrkidUpHUWvjr/2fP
	OHDae7kJnUyzKD2I4xSbc5q2Qom5bZ6Gw4tYQOln5lsnkT1Ecm+uK6McMjJu45rbISf/dU1POXq
	sviI4nU3mer6UABCiGwzJorrZ1YFdpfaIBpaPxEm2KPjxlcC00IlVeDi4O+7Jrs4IxF5ROpY3l5
	JmF+nQwDB1p9cqjNVnvbwzbvCBmE+GhJ+BshtM1kPnELFiEGCT/Bek7Sd2d/buTeEUDOYTwjWuw
	2RhThhzhXqUiFEp1HMaj4YZZOTC/lq1A+YByyuLiFlIq6wqStU8Y+2XXBYtaGnEcmFVF0mNeMc0
	avXnQoI4sxH7oC
X-Received: by 2002:a05:620a:7089:b0:8cd:8635:c063 with SMTP id af79cd13be357-8ddcfca6c9cmr1976253985a.50.1776090226318;
        Mon, 13 Apr 2026 07:23:46 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6de73sm855580085a.26.2026.04.13.07.23.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:23:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-cbor2: Fix CVE-2025-68131 CVE patch error
Date: Mon, 13 Apr 2026 10:23:41 -0400
Message-Id: <20260413142341.1946410-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 14:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126277

The patch for CVE-2025-68131 does not actually match https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0
Specifically, the indenting in decode_from_bytes

This is causing an error in trusted-firmware-m of
| Traceback (most recent call last):
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/git/tfm/bl2/ext/mcuboot/scripts/wrapper/wrapper.py", line 21, in <module>
|     import imgtool.main
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/git/mcuboot/scripts/imgtool/main.py", line 25, in <module>
|     from imgtool import image, imgtool_version
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/git/mcuboot/scripts/imgtool/image.py", line 24, in <module>
|     from .boot_record import create_sw_component_data
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/git/mcuboot/scripts/imgtool/boot_record.py", line 21, in <module>
|     from cbor2 import dumps
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cbor2/__init__.py", line 1, in <module>
|     from .decoder import load, loads, CBORDecoder  # noqa
|   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cbor2/decoder.py", line 215
|     with BytesIO(buf) as fp:
|     ^
| IndentationError: expected an indented block after 'with' statement on line 214

Indenting to match the original patch fixes this.

Also, because this version of cbor2 is older, it doesn't include commit
53e21063ed1d72ac8f911044dd598a7f9ef72406, which adds 'Any' to encode.py
Because that is  missing, we see the following error:
 |   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cbor2/__init__.py", line 2, in <module>
 |     from .encoder import dump, dumps, CBOREncoder, shareable_encoder  # noqa
 |   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cbor2/encoder.py", line 68, in <module>
 |     class CBOREncoder:
 |   File "/builder/meta-arm/build/tmp/work/corstone1000_fvp-poky-linux-musl/trusted-firmware-m/1.5.0+gitAUTOINC+f8c7e5361b-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cbor2/encoder.py", line 266, in CBOREncoder
 |     def _encode_value(self, obj: Any) -> None:

To get around this issue, remove the "Any" from the encoder.py.  The
logic behind this (instead of importing typing) is that this is the only
instance, and since this is not something that will be updated
frequently with patches from upstream.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../python/python3-cbor2/CVE-2025-68131.patch | 43 ++++++++++++-------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
index 4c5310edfaba..8556c5bdbca3 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
@@ -21,18 +21,18 @@ CVE: CVE-2025-68131
 Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0]
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
 ---
- cbor2/decoder.py      | 26 ++++++++++++++--
- cbor2/encoder.py      | 42 +++++++++++++++++++++-----
+ cbor2/decoder.py      | 38 +++++++++++++++++++-----
+ cbor2/encoder.py      | 43 ++++++++++++++++++++++-----
  source/decoder.c      | 28 +++++++++++++++++-
  source/decoder.h      |  1 +
  source/encoder.c      | 23 +++++++++++++--
  source/encoder.h      |  1 +
  tests/test_decoder.py | 62 ++++++++++++++++++++++++++++++++++++++
  tests/test_encoder.py | 69 +++++++++++++++++++++++++++++++++++++++++++
- 8 files changed, 239 insertions(+), 13 deletions(-)
+ 8 files changed, 246 insertions(+), 19 deletions(-)
 
 diff --git a/cbor2/decoder.py b/cbor2/decoder.py
-index be7198b..f2d818c 100644
+index be7198b..6cdd752 100644
 --- a/cbor2/decoder.py
 +++ b/cbor2/decoder.py
 @@ -2,6 +2,7 @@ import re
@@ -94,16 +94,28 @@ index be7198b..f2d818c 100644
  
      def decode_from_bytes(self, buf):
          """
-@@ -190,6 +211,7 @@ class CBORDecoder:
+@@ -190,12 +211,13 @@ class CBORDecoder:
          object needs to be decoded separately from the rest but while still
          taking advantage of the shared value registry.
          """
+-        with BytesIO(buf) as fp:
+-            old_fp = self.fp
+-            self.fp = fp
+-            retval = self._decode()
+-            self.fp = old_fp
+-            return retval
 +        with self._decoding_context():
-         with BytesIO(buf) as fp:
-             old_fp = self.fp
-             self.fp = fp
++            with BytesIO(buf) as fp:
++                old_fp = self.fp
++                self.fp = fp
++                retval = self._decode()
++                self.fp = old_fp
++                return retval
+ 
+     def _decode_length(self, subtype, allow_indefinite=False):
+         if subtype < 24:
 diff --git a/cbor2/encoder.py b/cbor2/encoder.py
-index 42526c0..0a5722d 100644
+index 42526c0..fc22458 100644
 --- a/cbor2/encoder.py
 +++ b/cbor2/encoder.py
 @@ -109,7 +109,7 @@ class CBOREncoder:
@@ -147,13 +159,14 @@ index 42526c0..0a5722d 100644
      def encode(self, obj):
          """
          Encode the given object using CBOR.
-@@ -243,6 +261,14 @@ class CBOREncoder:
+@@ -243,6 +261,15 @@ class CBOREncoder:
          :param obj:
              the object to encode
          """
 +        with self._encoding_context():
 +            self._encode_value(obj)
-+    def _encode_value(self, obj: Any) -> None:
++
++    def _encode_value(self, obj) -> None:
 +        """
 +        Internal fast path for encoding - used by built-in encoders.
 +        External code should use encode() instead, which properly manages
@@ -162,7 +175,7 @@ index 42526c0..0a5722d 100644
          obj_type = obj.__class__
          encoder = (
              self._encoders.get(obj_type) or
-@@ -390,14 +416,14 @@ class CBOREncoder:
+@@ -390,14 +417,14 @@ class CBOREncoder:
      def encode_array(self, value):
          self.encode_length(4, len(value))
          for item in value:
@@ -180,7 +193,7 @@ index 42526c0..0a5722d 100644
  
      def encode_sortable_key(self, value):
          """
-@@ -422,10 +448,10 @@ class CBOREncoder:
+@@ -422,10 +449,10 @@ class CBOREncoder:
                  # String referencing requires that the order encoded is
                  # the same as the order emitted so string references are
                  # generated after an order is determined
@@ -193,7 +206,7 @@ index 42526c0..0a5722d 100644
  
      def encode_semantic(self, value):
          # Nested string reference domains are distinct
-@@ -436,7 +462,7 @@ class CBOREncoder:
+@@ -436,7 +463,7 @@ class CBOREncoder:
              self._string_references = {}
  
          self.encode_length(6, value.tag)
@@ -202,7 +215,7 @@ index 42526c0..0a5722d 100644
  
          self.string_referencing = old_string_referencing
          self._string_references = old_string_references
-@@ -489,7 +515,7 @@ class CBOREncoder:
+@@ -489,7 +516,7 @@ class CBOREncoder:
      def encode_stringref(self, value):
          # Semantic tag 25
          if not self._stringref(value):
-- 
2.39.5


