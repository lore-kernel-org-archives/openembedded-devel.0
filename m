Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA16CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 18:48:04 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.30115.1755197273982460627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 11:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ugkjluu4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250814184748d62cf98e1a1379e6d0-o2f8jv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250814184748d62cf98e1a1379e6d0
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 20:47:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jjR0FIBP1gUBevcysBP2O7iZm9sJeoaEwZZ6jgdGAw8=;
 b=Ugkjluu4kvlJS3RbpJttGfT3/1bAwUQhBdkY3L3NWX3dNFd5mIfgGYKbKsifi8Alc0Mr8T
 ILgtB6v/fCTzUFuCBy/UrR/S/yisaB3djQcpa86YnHLjvrobkHp8Yk156FuepRv8ayWTSqOk
 fTyJQ2WIhBqzZAXPenGe8yYC5V/KpBtLXM4DaK/b4PE5qcUgtxY9Xiow8/E+0ZmzUAEShQux
 xuGjmv0Cogi4RETtIygzfm+nZT0QEQLAjPpRt1JJXsd90I7v1YlmMxnJZV6cA+T4IfsCQA+E
 cK/u8W6bbXOfxpljcmmAltj0+CqJ4H/frA74xM/FkeUdub6jnJvtY/Cw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][kirkstone][PATCH] python3-protobuf: patch CVE-2025-4565
Date: Thu, 14 Aug 2025 20:47:01 +0200
Message-Id: <20250814184701.1854245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 18:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118944

From: Peter Marko <peter.marko@siemens.com>

This CVE fix was added to protobuf recipe but since it's patching python
code, it should have been submitted to python3-protobuf.
Take the patch from protobuf recipe and adapt to python3-protobuf.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-protobuf/CVE-2025-4565.patch      | 377 ++++++++++++++++++
 .../python/python3-protobuf_3.20.3.bb         |   2 +
 2 files changed, 379 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2025-4565.patch

diff --git a/meta-python/recipes-devtools/python/python3-protobuf/CVE-2025-4565.patch b/meta-python/recipes-devtools/python/python3-protobuf/CVE-2025-4565.patch
new file mode 100644
index 0000000000..1b07505a53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-protobuf/CVE-2025-4565.patch
@@ -0,0 +1,377 @@
+From 0b48d64d7fcfd34514b6fa9b046d40457ed3e4b9 Mon Sep 17 00:00:00 2001
+From: shaod2 <shaod@google.com>
+Date: Wed, 21 May 2025 14:30:53 -0400
+Subject: [PATCH] Manually backport recursion limit enforcement to 25.x
+
+CVE: CVE-2025-4565
+
+Upstream-Status: Backport [d31100c9195819edb0a12f44705dfc2da111ea9b]
+Adjusted for the 3.19.6 version, resolving conflicts and removing
+unused testing codes.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Adapted from protobuf_3.19.6.bb to python3-protobuf_3.20.3.bb
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ google/protobuf/internal/decoder.py           | 110 ++++++++++++++----
+ google/protobuf/internal/python_message.py    |   6 +-
+ google/protobuf/internal/self_recursive.proto |  17 +++
+ 3 files changed, 106 insertions(+), 27 deletions(-)
+ create mode 100644 google/protobuf/internal/self_recursive.proto
+
+diff --git a/google/protobuf/internal/decoder.py b/google/protobuf/internal/decoder.py
+index bc1b7b7..445c1d0 100644
+--- a/google/protobuf/internal/decoder.py
++++ b/google/protobuf/internal/decoder.py
+@@ -195,7 +195,10 @@ def _SimpleDecoder(wire_type, decode_value):
+                       clear_if_default=False):
+     if is_packed:
+       local_DecodeVarint = _DecodeVarint
+-      def DecodePackedField(buffer, pos, end, message, field_dict):
++      def DecodePackedField(
++          buffer, pos, end, message, field_dict, current_depth=0
++      ):
++        del current_depth # unused
+         value = field_dict.get(key)
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+@@ -214,7 +217,10 @@ def _SimpleDecoder(wire_type, decode_value):
+     elif is_repeated:
+       tag_bytes = encoder.TagBytes(field_number, wire_type)
+       tag_len = len(tag_bytes)
+-      def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++      def DecodeRepeatedField(
++          buffer, pos, end, message, field_dict, current_depth=0
++      ):
++        del current_depth # unused
+         value = field_dict.get(key)
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+@@ -231,7 +237,8 @@ def _SimpleDecoder(wire_type, decode_value):
+             return new_pos
+       return DecodeRepeatedField
+     else:
+-      def DecodeField(buffer, pos, end, message, field_dict):
++      def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++        del current_depth # unused
+         (new_value, pos) = decode_value(buffer, pos)
+         if pos > end:
+           raise _DecodeError('Truncated message.')
+@@ -375,7 +382,9 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+   enum_type = key.enum_type
+   if is_packed:
+     local_DecodeVarint = _DecodeVarint
+-    def DecodePackedField(buffer, pos, end, message, field_dict):
++    def DecodePackedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       """Decode serialized packed enum to its value and a new position.
+ 
+       Args:
+@@ -388,6 +397,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -428,7 +438,9 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+   elif is_repeated:
+     tag_bytes = encoder.TagBytes(field_number, wire_format.WIRETYPE_VARINT)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       """Decode serialized repeated enum to its value and a new position.
+ 
+       Args:
+@@ -441,6 +453,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -469,7 +482,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       """Decode serialized repeated enum to its value and a new position.
+ 
+       Args:
+@@ -482,6 +495,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value_start_pos = pos
+       (enum_value, pos) = _DecodeSignedVarint32(buffer, pos)
+       if pos > end:
+@@ -563,7 +577,10 @@ def StringDecoder(field_number, is_repeated, is_packed, key, new_default,
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -580,7 +597,8 @@ def StringDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++      del current_depth # unused
+       (size, pos) = local_DecodeVarint(buffer, pos)
+       new_pos = pos + size
+       if new_pos > end:
+@@ -604,7 +622,10 @@ def BytesDecoder(field_number, is_repeated, is_packed, key, new_default,
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -621,7 +642,8 @@ def BytesDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++      del current_depth # unused
+       (size, pos) = local_DecodeVarint(buffer, pos)
+       new_pos = pos + size
+       if new_pos > end:
+@@ -646,7 +668,9 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_START_GROUP)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -655,7 +679,13 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+         # Read sub-message.
+-        pos = value.add()._InternalParse(buffer, pos, end)
++        current_depth += 1
++        if current_depth > _recursion_limit:
++          raise _DecodeError(
++              'Error parsing message: too many levels of nesting.'
++          )
++        pos = value.add()._InternalParse(buffer, pos, end, current_depth)
++        current_depth -= 1
+         # Read end tag.
+         new_pos = pos+end_tag_len
+         if buffer[pos:new_pos] != end_tag_bytes or new_pos > end:
+@@ -667,12 +697,16 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+       # Read sub-message.
+-      pos = value._InternalParse(buffer, pos, end)
++      current_depth += 1
++      if current_depth > _recursion_limit:
++        raise _DecodeError('Error parsing message: too many levels of nesting.')
++      pos = value._InternalParse(buffer, pos, end, current_depth)
++      current_depth -= 1
+       # Read end tag.
+       new_pos = pos+end_tag_len
+       if buffer[pos:new_pos] != end_tag_bytes or new_pos > end:
+@@ -691,7 +725,9 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -702,18 +738,27 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+         if new_pos > end:
+           raise _DecodeError('Truncated message.')
+         # Read sub-message.
+-        if value.add()._InternalParse(buffer, pos, new_pos) != new_pos:
++        current_depth += 1
++        if current_depth > _recursion_limit:
++          raise _DecodeError(
++              'Error parsing message: too many levels of nesting.'
++          )
++        if (
++            value.add()._InternalParse(buffer, pos, new_pos, current_depth)
++            != new_pos
++        ):
+           # The only reason _InternalParse would return early is if it
+           # encountered an end-group tag.
+           raise _DecodeError('Unexpected end-group tag.')
+         # Predict that the next tag is another copy of the same repeated field.
++        current_depth -= 1
+         pos = new_pos + tag_len
+         if buffer[new_pos:pos] != tag_bytes or new_pos == end:
+           # Prediction failed.  Return.
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -722,11 +767,14 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+       new_pos = pos + size
+       if new_pos > end:
+         raise _DecodeError('Truncated message.')
+-      # Read sub-message.
+-      if value._InternalParse(buffer, pos, new_pos) != new_pos:
++      current_depth += 1
++      if current_depth > _recursion_limit:
++        raise _DecodeError('Error parsing message: too many levels of nesting.')
++      if value._InternalParse(buffer, pos, new_pos, current_depth) != new_pos:
+         # The only reason _InternalParse would return early is if it encountered
+         # an end-group tag.
+         raise _DecodeError('Unexpected end-group tag.')
++      current_depth -= 1
+       return new_pos
+     return DecodeField
+ 
+@@ -844,7 +892,8 @@ def MapDecoder(field_descriptor, new_default, is_message_map):
+   # Can't read _concrete_class yet; might not be initialized.
+   message_type = field_descriptor.message_type
+ 
+-  def DecodeMap(buffer, pos, end, message, field_dict):
++  def DecodeMap(buffer, pos, end, message, field_dict, current_depth=0):
++    del current_depth # unused
+     submsg = message_type._concrete_class()
+     value = field_dict.get(key)
+     if value is None:
+@@ -926,8 +975,16 @@ def _SkipGroup(buffer, pos, end):
+       return pos
+     pos = new_pos
+ 
++DEFAULT_RECURSION_LIMIT = 100
++_recursion_limit = DEFAULT_RECURSION_LIMIT
+ 
+-def _DecodeUnknownFieldSet(buffer, pos, end_pos=None):
++
++def SetRecursionLimit(new_limit):
++  global _recursion_limit
++  _recursion_limit = new_limit
++
++
++def _DecodeUnknownFieldSet(buffer, pos, end_pos=None, current_depth=0):
+   """Decode UnknownFieldSet.  Returns the UnknownFieldSet and new position."""
+ 
+   unknown_field_set = containers.UnknownFieldSet()
+@@ -937,14 +994,14 @@ def _DecodeUnknownFieldSet(buffer, pos, end_pos=None):
+     field_number, wire_type = wire_format.UnpackTag(tag)
+     if wire_type == wire_format.WIRETYPE_END_GROUP:
+       break
+-    (data, pos) = _DecodeUnknownField(buffer, pos, wire_type)
++    (data, pos) = _DecodeUnknownField(buffer, pos, wire_type, current_depth)
+     # pylint: disable=protected-access
+     unknown_field_set._add(field_number, wire_type, data)
+ 
+   return (unknown_field_set, pos)
+ 
+ 
+-def _DecodeUnknownField(buffer, pos, wire_type):
++def _DecodeUnknownField(buffer, pos, wire_type, current_depth=0):
+   """Decode a unknown field.  Returns the UnknownField and new position."""
+ 
+   if wire_type == wire_format.WIRETYPE_VARINT:
+@@ -958,7 +1015,12 @@ def _DecodeUnknownField(buffer, pos, wire_type):
+     data = buffer[pos:pos+size].tobytes()
+     pos += size
+   elif wire_type == wire_format.WIRETYPE_START_GROUP:
+-    (data, pos) = _DecodeUnknownFieldSet(buffer, pos)
++    print("MMP " + str(current_depth))
++    current_depth += 1
++    if current_depth >= _recursion_limit:
++      raise _DecodeError('Error parsing message: too many levels of nesting.')
++    (data, pos) = _DecodeUnknownFieldSet(buffer, pos, None, current_depth)
++    current_depth -= 1
+   elif wire_type == wire_format.WIRETYPE_END_GROUP:
+     return (0, -1)
+   else:
+diff --git a/google/protobuf/internal/python_message.py b/google/protobuf/internal/python_message.py
+index 2921d5c..c7fec8c 100644
+--- a/google/protobuf/internal/python_message.py
++++ b/google/protobuf/internal/python_message.py
+@@ -1141,7 +1141,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+   local_SkipField = decoder.SkipField
+   decoders_by_tag = cls._decoders_by_tag
+ 
+-  def InternalParse(self, buffer, pos, end):
++  def InternalParse(self, buffer, pos, end, current_depth=0):
+     """Create a message from serialized bytes.
+ 
+     Args:
+@@ -1179,7 +1179,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+         # TODO(jieluo): remove old_pos.
+         old_pos = new_pos
+         (data, new_pos) = decoder._DecodeUnknownField(
+-            buffer, new_pos, wire_type)  # pylint: disable=protected-access
++            buffer, new_pos, wire_type, current_depth)  # pylint: disable=protected-access
+         if new_pos == -1:
+           return pos
+         # pylint: disable=protected-access
+@@ -1192,7 +1192,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+             (tag_bytes, buffer[old_pos:new_pos].tobytes()))
+         pos = new_pos
+       else:
+-        pos = field_decoder(buffer, new_pos, end, self, field_dict)
++        pos = field_decoder(buffer, new_pos, end, self, field_dict, current_depth)
+         if field_desc:
+           self._UpdateOneofState(field_desc)
+     return pos
+diff --git a/google/protobuf/internal/self_recursive.proto b/google/protobuf/internal/self_recursive.proto
+new file mode 100644
+index 0000000..2a7aacb
+--- /dev/null
++++ b/google/protobuf/internal/self_recursive.proto
+@@ -0,0 +1,17 @@
++// Protocol Buffers - Google's data interchange format
++// Copyright 2024 Google Inc.  All rights reserved.
++//
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file or at
++// https://developers.google.com/open-source/licenses/bsd
++
++syntax = "proto2";
++
++package google.protobuf.python.internal;
++
++message SelfRecursive {
++  optional group RecursiveGroup = 1 {
++    optional RecursiveGroup sub_group = 2;
++    optional int32 i = 3;
++  };
++}
+\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index a4088a2de2..3c25373796 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
+SRC_URI += "file://CVE-2025-4565.patch"
+
 SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f337105f2"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/

