Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA78DC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 16:54:36 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.1923.1686070471121521705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 09:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I7Oub+O2;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba81f71dfefso7248380276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686070470; x=1688662470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHHUul1f6pBGZjUDvPr6WMYefVtM92QtOSsAkqHNN0c=;
        b=I7Oub+O2I7ql40Zw740ea7s5eZD3ao6yvfT5C7G+XZtt1XLnVjzlU0vXzryK1AAIsJ
         xjNdVSw/65TiKL/as2aUJ8DwM8sFvh4g373eyZ9vc00HMN8nX8YjfM6sco415WZbkZLi
         b5aKn47sHcjwpiZBAPHSaA2AkFF+qKNlNaVKtiPZ4jihSLowMYoCbERNLxPLGBpjS6rr
         Ef5nyOJsqS6BBL/CuaaHJcqi5pqWffgyDRui0X9ljQR/Hotj3JH7ElWhFicCB8xTT8f2
         k8X+cvPYYI+8KGKE0pWq/xeVuc3dGWtbZAhpJIAN9WTLWBcza5dtttyaMpc41kcPYgah
         MzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686070470; x=1688662470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHHUul1f6pBGZjUDvPr6WMYefVtM92QtOSsAkqHNN0c=;
        b=UFZaWSkpBW/XmqZDlic8efkGTE8/T4JQUU5kovwoDtfkA4LdXc+ghth+6VFw0ZBG0N
         ae6hyABbW4tjrmFzjw0yZ7RsdTxGiRCKuWA+MquHg//SFBGKJYhz59nGto31tekmK5k9
         PJjzWh4l/Sw/diuiXojNfg9Z/oYVrgHIwcXp9TwSyOIx2nZhImeRgYKpBry/fdrC5lFH
         79hOhsKGXxvrWJq8ctqq2Kn0/h0agvgQQujk0B5BX1cyEdjN09REor9odAvEamq0W6gO
         VxvbZAhb7XC9Xs3h7tBiP3te5SU0E8MdytFy+YBqNUGkC9X1ucKEqxQbkClsaoqOYn46
         8EOQ==
X-Gm-Message-State: AC+VfDx8SzctLtK1MpdZg699CqoaU8lbHt5++m1oF169PNBf/P6I4VCA
	V5kEgGbo5kmuWm0GqZyZzrcrQALdpxo=
X-Google-Smtp-Source: ACHHUZ5R+9S4WYTiDyv1cSeeb9R9e8++Hboj48zF5cuRDf4IWoeAE2RFBGsScyaf/X2KBIJauWMtNA==
X-Received: by 2002:a81:a201:0:b0:566:584e:5ce with SMTP id w1-20020a81a201000000b00566584e05cemr3532040ywg.34.1686070469554;
        Tue, 06 Jun 2023 09:54:29 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:c463:b29:d008:874c])
        by smtp.gmail.com with ESMTPSA id x62-20020a814a41000000b0054f80928ea4sm4127946ywa.140.2023.06.06.09.54.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 09:54:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wireshark: Update to a supported version 4.0.x
Date: Tue,  6 Jun 2023 12:54:28 -0400
Message-Id: <20230606165428.3108834-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 16:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103151

Drop CVE patch as its included.
Drop 0003-bison-Remove-line-directives.patch as file is not longer there.
refactor 0001-wireshark-src-improve-reproducibility.patch
LIC_FILES_CHKSUM changed do to re-structuring.
Remove TMPDIR found in some files.
Remove c-ares PACKAGECONFIG as its a required pkg

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-a-try_run-test-when-cross-compiling.patch |  66 ++++++++
 ...ireshark-src-improve-reproducibility.patch |  26 +---
 .../0003-bison-Remove-line-directives.patch   |  59 -------
 .../wireshark/files/CVE-2022-3190.patch       | 145 ------------------
 ...wireshark_3.4.12.bb => wireshark_4.0.6.bb} |  37 +++--
 5 files changed, 94 insertions(+), 239 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.12.bb => wireshark_4.0.6.bb} (67%)

diff --git a/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch b/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
new file mode 100644
index 0000000000..0d51ce1b8f
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch
@@ -0,0 +1,66 @@
+From b4f29807225cf3744c2f4f971902fbdd7486fc19 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Valverde?= <j@v6e.pt>
+Date: Fri, 26 May 2023 13:29:23 +0100
+Subject: [PATCH] CMake: Fix a try_run() test when cross-compiling
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ ConfigureChecks.cmake | 36 ++++++++++++++++++++----------------
+ 1 file changed, 20 insertions(+), 16 deletions(-)
+
+diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
+index dd8268e077..d8bca54115 100644
+--- a/ConfigureChecks.cmake
++++ b/ConfigureChecks.cmake
+@@ -122,26 +122,30 @@ check_type_size("ssize_t"       SSIZE_T)
+ # Check if the libc vsnprintf() conforms to C99. If this fails we may
+ # need to fall-back on GLib I/O.
+ #
+-check_c_source_runs("
+-	#include <stdio.h>
+-	int main(void)
+-	{
+-		/* Check that snprintf() and vsnprintf() don't return
+-		 * -1 if the buffer is too small. C99 says this value
+-		 * is the length that would be written not including
+-		 * the nul byte. */
+-		char buf[3];
+-		return snprintf(buf, sizeof(buf), \"%s\", \"ABCDEF\") > 0 ? 0 : 1;
+-	}"
+-	HAVE_C99_VSNPRINTF
+-)
+-if (NOT HAVE_C99_VSNPRINTF)
+-	message(FATAL_ERROR
++# If cross-compiling we can't check so just assume this requirement is met.
++#
++if(NOT CMAKE_CROSSCOMPILING)
++	check_c_source_runs("
++		#include <stdio.h>
++		int main(void)
++		{
++			/* Check that snprintf() and vsnprintf() don't return
++			* -1 if the buffer is too small. C99 says this value
++			* is the length that would be written not including
++			* the nul byte. */
++			char buf[3];
++			return snprintf(buf, sizeof(buf), \"%s\", \"ABCDEF\") > 0 ? 0 : 1;
++		}"
++		HAVE_C99_VSNPRINTF
++	)
++	if (NOT HAVE_C99_VSNPRINTF)
++		message(FATAL_ERROR
+ "Building Wireshark requires a C99 compliant vsnprintf() and this \
+ target does not meet that requirement. Compiling for ${CMAKE_SYSTEM} \
+ using ${CMAKE_C_COMPILER_ID}. Please report this issue to the Wireshark \
+ developers at wireshark-dev@wireshark.org."
+-	)
++		)
++	endif()
+ endif()
+ 
+ #
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
index 0b83ca4ae4..6ad8a62c28 100644
--- a/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
+++ b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
@@ -13,24 +13,11 @@ Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
  tools/ncp2222.py         | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/tools/make-plugin-reg.py b/tools/make-plugin-reg.py
-index 66b4656..c52b3fc 100755
---- a/tools/make-plugin-reg.py
-+++ b/tools/make-plugin-reg.py
-@@ -28,7 +28,7 @@ preamble = """\
-  *
-  * Generated automatically from %s.
-  */
--""" % (sys.argv[0])
-+""" % (os.path.basename(sys.argv[0]))
- 
- # Create the proper list of filenames
- filenames = []
-diff --git a/tools/ncp2222.py b/tools/ncp2222.py
-index 1dea4ec..dc376e3 100755
---- a/tools/ncp2222.py
-+++ b/tools/ncp2222.py
-@@ -5858,7 +5858,7 @@ def produce_code():
+Index: wireshark-4.0.6/tools/ncp2222.py
+===================================================================
+--- wireshark-4.0.6.orig/tools/ncp2222.py
++++ wireshark-4.0.6/tools/ncp2222.py
+@@ -5891,7 +5891,7 @@ def produce_code():
  
      print("/*")
      print(" * Do not modify this file. Changes will be overwritten.")
@@ -39,6 +26,3 @@ index 1dea4ec..dc376e3 100755
      print(" */\n")
  
      print("""
--- 
-2.26.2.Cisco
-
diff --git a/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
deleted file mode 100644
index 824761a3dc..0000000000
--- a/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 42abf1d299fed8e00a189f6f9c55fb344e5bb775 Mon Sep 17 00:00:00 2001
-From: Oleksiy Obitotskyy <oobitots@cisco.com>
-Date: Wed, 27 Jan 2021 04:01:34 -0800
-Subject: [PATCH] bison: Remove #line directives
-
-Append --no-lines option to bison to not
-generate #line directives with absolute file path.
-
-Upstream-Status: Pending
-Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
----
- cmake/modules/FindYACC.cmake | 31 ++++++++++++++++++++++---------
- 1 file changed, 22 insertions(+), 9 deletions(-)
-
-diff --git a/cmake/modules/FindYACC.cmake b/cmake/modules/FindYACC.cmake
-index c96f87b..54a73cb 100644
---- a/cmake/modules/FindYACC.cmake
-+++ b/cmake/modules/FindYACC.cmake
-@@ -29,15 +29,28 @@ MACRO(ADD_YACC_FILES _source _generated)
- 
-       SET(_out ${CMAKE_CURRENT_BINARY_DIR}/${_basename}.c)
- 
--      ADD_CUSTOM_COMMAND(
--         OUTPUT ${_out}
--         COMMAND ${YACC_EXECUTABLE}
--           -d
--           -p ${_basename}
--           -o${_out}
--           ${_in}
--         DEPENDS ${_in}
--      )
-+      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
-+         ADD_CUSTOM_COMMAND(
-+            OUTPUT ${_out}
-+            COMMAND ${YACC_EXECUTABLE}
-+              --no-lines
-+              -d
-+              -p ${_basename}
-+              -o${_out}
-+              ${_in}
-+            DEPENDS ${_in}
-+         )
-+      ELSE ()
-+         ADD_CUSTOM_COMMAND(
-+            OUTPUT ${_out}
-+            COMMAND ${YACC_EXECUTABLE}
-+              -d
-+              -p ${_basename}
-+              -o${_out}
-+              ${_in}
-+            DEPENDS ${_in}
-+         )
-+      ENDIF ()
-       LIST(APPEND ${_source} ${_in})
-       LIST(APPEND ${_generated} ${_out})
-    ENDFOREACH (_current_FILE)
--- 
-2.26.2.Cisco
-
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
deleted file mode 100644
index 0b987700f5..0000000000
--- a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 4585d515b962f3b3a5e81caa64e13e8d9ed2e431 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 26 Sep 2022 12:47:00 +0530
-Subject: [PATCH] CVE-2022-3190
-
-Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67]
-CVE : CVE-2022-3190
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- epan/dissectors/packet-f5ethtrailer.c | 108 +++++++++++++-------------
- 1 file changed, 56 insertions(+), 52 deletions(-)
-
-diff --git a/epan/dissectors/packet-f5ethtrailer.c b/epan/dissectors/packet-f5ethtrailer.c
-index ed77dfd..b15b0d4 100644
---- a/epan/dissectors/packet-f5ethtrailer.c
-+++ b/epan/dissectors/packet-f5ethtrailer.c
-@@ -2741,69 +2741,73 @@ dissect_dpt_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *d
- static gint
- dissect_old_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
- {
--    proto_tree *type_tree   = NULL;
--    proto_item *ti          = NULL;
-     guint offset            = 0;
--    guint processed         = 0;
--    f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
--    guint8 type;
--    guint8 len;
--    guint8 ver;
- 
-     /* While we still have data in the trailer.  For old format trailers, this needs
-      * type, length, version (3 bytes) and for new format trailers, the magic header (4 bytes).
-      * All old format trailers are at least 4 bytes long, so just check for length of magic.
-      */
--    while (tvb_reported_length_remaining(tvb, offset)) {
--        type = tvb_get_guint8(tvb, offset);
--        len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
--        ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
--
--        if (len <= tvb_reported_length_remaining(tvb, offset) && type >= F5TYPE_LOW
--            && type <= F5TYPE_HIGH && len >= F5_MIN_SANE && len <= F5_MAX_SANE
--            && ver <= F5TRAILER_VER_MAX) {
--            /* Parse out the specified trailer. */
--            switch (type) {
--            case F5TYPE_LOW:
--                ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
--
--                processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_low = 1;
--                }
--                break;
--            case F5TYPE_MED:
--                ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
--
--                processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_med = 1;
--                }
--                break;
--            case F5TYPE_HIGH:
--                ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
--
--                processed =
--                    dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_high = 1;
--                }
--                break;
-+    while (tvb_reported_length_remaining(tvb, offset) >= F5_MIN_SANE) {
-+        /* length field does not include the type and length bytes.  Add them back in */
-+        guint8 len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
-+        if (len > tvb_reported_length_remaining(tvb, offset)
-+            || len < F5_MIN_SANE || len > F5_MAX_SANE) {
-+            /* Invalid length - either a malformed trailer, corrupt packet, or not f5ethtrailer */
-+            return offset;
-+        }
-+        guint8 type = tvb_get_guint8(tvb, offset);
-+        guint8 ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
-+
-+        /* Parse out the specified trailer. */
-+        proto_tree *type_tree   = NULL;
-+        proto_item *ti          = NULL;
-+        f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
-+        guint processed = 0;
-+
-+        switch (type) {
-+        case F5TYPE_LOW:
-+            ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
-+
-+            processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_low = 1;
-             }
--            if (processed == 0) {
--                proto_item_set_len(ti, 1);
--                return offset;
-+            break;
-+        case F5TYPE_MED:
-+            ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
-+
-+            processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_med = 1;
-+            }
-+            break;
-+        case F5TYPE_HIGH:
-+            ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
-+
-+            processed =
-+                dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_high = 1;
-             }
-+            break;
-+        default:
-+            /* Unknown type - malformed trailer, corrupt packet, or not f5ethtrailer - bali out*/
-+            return offset;
-+        }
-+        if (processed == 0) {
-+            /* couldn't process trailer - bali out */
-+            proto_item_set_len(ti, 1);
-+            return offset;
-         }
-         offset += processed;
-     }
--return offset;
-+    return offset;
- } /* dissect_old_trailer() */
- 
- /*---------------------------------------------------------------------------*/
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb
similarity index 67%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb
index 693a167938..f822dce672 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb
@@ -2,25 +2,22 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares"
+DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares"
 
 DEPENDS:append:class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
-
-SRC_URI += " \
-    file://0001-wireshark-src-improve-reproducibility.patch \
-    file://0002-flex-Remove-line-directives.patch \
-    file://0003-bison-Remove-line-directives.patch \
-    file://0004-lemon-Remove-line-directives.patch \
-    file://CVE-2022-3190.patch \
-"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
+           file://0001-CMake-Fix-a-try_run-test-when-cross-compiling.patch \
+           file://0001-wireshark-src-improve-reproducibility.patch \
+           file://0002-flex-Remove-line-directives.patch \
+           file://0004-lemon-Remove-line-directives.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca"
+SRC_URI[sha256sum] = "0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884"
 
 PE = "1"
 
@@ -43,13 +40,12 @@ PACKAGECONFIG[zlib] = "-DENABLE_ZLIB=ON,-DENABLE_ZLIB=OFF, zlib"
 PACKAGECONFIG[geoip] = ",, geoip"
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
-PACKAGECONFIG[libssh] = ",,libssh2"
+PACKAGECONFIG[libssh] = "-DENABLE_LIBSSH=ON,-DENABLE_LIBSSH=OFF, libssh2"
 PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 PACKAGECONFIG[zstd] = "-DENABLE_STTD=ON,-DENABLE_ZSTD=OFF, zstd"
 PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
-PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
@@ -64,6 +60,16 @@ EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                  "
 CFLAGS:append = " -lm"
 
+do_compile:append:class-target() {
+    # Fix TMPDIR, these are in the comments section
+    sed -i -e "s:** source file.*::g"  ${B}/wiretap/ascend_parser.c
+    sed -i -e "s:** source file.*::g"  ${B}/wiretap/candump_parser.c
+    sed -i -e "s:** source file.*::g"  ${B}/wiretap/busmaster_parser.c
+    sed -i -e "s:** source file.*::g"  ${B}/epan/protobuf_lang_parser.c
+    sed -i -e "s:** source file.*::g"  ${B}/epan/dtd_grammar.c
+    sed -i -e "s:** source file.*::g"  ${B}/epan/dfilter/grammar.c
+}
+
 do_install:append:class-native() {
 	install -d ${D}${bindir}
 	for f in lemon
@@ -77,6 +83,9 @@ do_install:append:class-target() {
 	do
 		chrpath --delete $f
 	done
+
+    # We don't need the cmake files installed
+    rm -fr ${D}${usrlib}/${BPN}/cmake
 }
 
 PACKAGE_BEFORE_PN += "tshark"
-- 
2.25.1


