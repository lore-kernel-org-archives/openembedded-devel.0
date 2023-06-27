Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579BCEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 12:23:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.11834.1687868623187579349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 05:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=BZ7ra0VW;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55ae51a45deso1087488a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687868622; x=1690460622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gt7o0fIM5AHeE8rQe6jVqCLl5wSIt7iqFdf6gG6dfrw=;
        b=BZ7ra0VWH6f0FOB87boVjTKdSfXar/sW1qQL93BYXOpKXI/4qe4LBctm7LXnjoLPgb
         OclztTfOU8XIq/7jJb7bo1nCYKalCjSoR/it8r4UvG6KRDy5Tsl0oTgwP0VmURj+M//s
         WMYVZXXQ5ZTF2ecNylhj3RePPOrlhDKV2KP1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687868622; x=1690460622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gt7o0fIM5AHeE8rQe6jVqCLl5wSIt7iqFdf6gG6dfrw=;
        b=dbNT/V0O6BAQzvr3GRtkABYR+G0GNMTOKbYzOuKF4pgiZkerPWq0Pa6KQwo8Kn8aLo
         ZjVLxoJwDzDqvSXl1tq2zxB8HfBKMfpbqwnILI46dwvtPBloQnmEf2NOTFj8k8UKV67q
         T7WijA6NG4gnE1tzGzI7KMv3i+ygpfG0yNonw1narM/d0/WaBqj7LSa3JKY+jBJZDzCL
         nlFrG3wvR7bScfKUdel4Kkoc4YK77n4D/t6DUGVZSWm96fuis0rTmk+KuhE4/loNjOZl
         e/LYuorZatjmgXtN39TOBRCMS55/f+jjIFjIqvxD1By6GaqXAmcUi5VZU5mqD+0LWK7m
         bX1Q==
X-Gm-Message-State: AC+VfDziY6/5KuRdMV0l3PcIKHhmyJqBD2x3Z/BAN++BlWXT1ukYbOOR
	HeP7ocmi3EmotoTMpfHYIte2n45rQkjkDUWNJl8=
X-Google-Smtp-Source: ACHHUZ67080Sy/84MJTTUXZ705ZRqQUP+weCo8qDT8088A6/8g3SRq8Pl3XZ8uXi50ktFk9+Jw+xvQ==
X-Received: by 2002:a17:903:22c6:b0:1b8:2537:5428 with SMTP id y6-20020a17090322c600b001b825375428mr767126plg.50.1687868622112;
        Tue, 27 Jun 2023 05:23:42 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902dac500b001b04b1fae4dsm1131850plx.35.2023.06.27.05.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 05:23:41 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 27 Jun 2023 17:53:35 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Fix CVE-2023-0667 & CVE-2023-0668
Date: Tue, 27 Jun 2023 17:53:33 +0530
Message-Id: <20230627122333.233056-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 12:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103618

Backport fixes for:
* CVE-2023-0667 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/35418a73f7c9cefebe392b1ea0f012fccaf89801 && https://gitlab.com/wireshark/wireshark/-/commit/85fbca8adb09ea8e1af635db3d92727fbfa1e28a
* CVE-2023-0668 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/c4f37d77b29ec6a9754795d0efb6f68d633728d9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-0667-pre1.patch  | 153 ++++++++++++++++++
 .../wireshark/files/CVE-2023-0667.patch       |  66 ++++++++
 .../wireshark/files/CVE-2023-0668.patch       |  33 ++++
 .../wireshark/wireshark_3.2.18.bb             |   3 +
 4 files changed, 255 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch
new file mode 100644
index 0000000000..e6fc158c3a
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch
@@ -0,0 +1,153 @@
+From 35418a73f7c9cefebe392b1ea0f012fccaf89801 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Wed, 19 Aug 2020 23:58:20 -0700
+Subject: [PATCH] Add format_text_string(), which gets the length with
+ strlen().
+
+format_text(alloc, string, strlen(string)) is a common idiom; provide
+format_text_string(), which does the strlen(string) for you.  (Any
+string used in a %s to set the text of a protocol tree item, if it was
+directly extracted from the packet, should be run through a format_text
+routine, to ensure that it's valid UTF-8 and that control characters are
+handled correctly.)
+
+Update comments while we're at it.
+
+Change-Id: Ia8549efa1c96510ffce97178ed4ff7be4b02eb6e
+Reviewed-on: https://code.wireshark.org/review/38202
+Petri-Dish: Guy Harris <gharris@sonic.net>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Guy Harris <gharris@sonic.net>
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/35418a73f7c9cefebe392b1ea0f012fccaf89801]
+Comment: to backport fix for CVE-2023-0667, add function format_text_string().
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/strutil.c | 33 ++++++++++++++++++++++++++++----
+ epan/strutil.h | 51 ++++++++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 76 insertions(+), 8 deletions(-)
+
+diff --git a/epan/strutil.c b/epan/strutil.c
+index 347a173..bc3b19e 100644
+--- a/epan/strutil.c
++++ b/epan/strutil.c
+@@ -193,10 +193,11 @@ get_token_len(const guchar *linep, const guchar *lineend,
+ #define UNPOOP 0x1F4A9
+ 
+ /*
+- * Given a string, expected to be in UTF-8 but possibly containing
+- * invalid sequences (as it may have come from packet data), generate
+- * a valid UTF-8 string from it, allocated with the specified wmem
+- * allocator, that:
++ * Given a wmem scope, a not-necessarily-null-terminated string,
++ * expected to be in UTF-8 but possibly containing invalid sequences
++ * (as it may have come from packet data), and the length of the string,
++ * generate a valid UTF-8 string from it, allocated in the specified
++ * wmem scope, that:
+  *
+  *   shows printable Unicode characters as themselves;
+  *
+@@ -493,6 +494,30 @@ format_text(wmem_allocator_t* allocator, const guchar *string, size_t len)
+     return fmtbuf;
+ }
+ 
++/** Given a wmem scope and a null-terminated string, expected to be in
++ *  UTF-8 but possibly containing invalid sequences (as it may have come
++ *  from packet data), and the length of the string, generate a valid
++ *  UTF-8 string from it, allocated in the specified wmem scope, that:
++ *
++ *   shows printable Unicode characters as themselves;
++ *
++ *   shows non-printable ASCII characters as C-style escapes (octal
++ *   if not one of the standard ones such as LF -> '\n');
++ *
++ *   shows non-printable Unicode-but-not-ASCII characters as
++ *   their universal character names;
++ *
++ *   shows illegal UTF-8 sequences as a sequence of bytes represented
++ *   as C-style hex escapes;
++ *
++ *  and return a pointer to it.
++ */
++gchar *
++format_text_string(wmem_allocator_t* allocator, const guchar *string)
++{
++	return format_text(allocator, string, strlen(string));
++}
++
+ /*
+  * Given a string, generate a string from it that shows non-printable
+  * characters as C-style escapes except a whitespace character
+diff --git a/epan/strutil.h b/epan/strutil.h
+index 2046cb0..705beb5 100644
+--- a/epan/strutil.h
++++ b/epan/strutil.h
+@@ -46,18 +46,61 @@ WS_DLL_PUBLIC
+ int        get_token_len(const guchar *linep, const guchar *lineend,
+     const guchar **next_token);
+ 
+-/** Given a string, generate a string from it that shows non-printable
+- *  characters as C-style escapes, and return a pointer to it.
++/** Given a wmem scope, a not-necessarily-null-terminated string,
++ *  expected to be in UTF-8 but possibly containing invalid sequences
++ *  (as it may have come from packet data), and the length of the string,
++ *  generate a valid UTF-8 string from it, allocated in the specified
++ *  wmem scope, that:
++ *
++ *   shows printable Unicode characters as themselves;
++ *
++ *   shows non-printable ASCII characters as C-style escapes (octal
++ *   if not one of the standard ones such as LF -> '\n');
++ *
++ *   shows non-printable Unicode-but-not-ASCII characters as
++ *   their universal character names;
++ *
++ *   shows illegal UTF-8 sequences as a sequence of bytes represented
++ *   as C-style hex escapes;
++ *
++ *  and return a pointer to it.
+  *
+  * @param allocator The wmem scope
+- * @param line A pointer to the input string
++ * @param string A pointer to the input string
+  * @param len The length of the input string
+  * @return A pointer to the formatted string
+  *
+  * @see tvb_format_text()
+  */
+ WS_DLL_PUBLIC
+-gchar*     format_text(wmem_allocator_t* allocator, const guchar *line, size_t len);
++gchar*     format_text(wmem_allocator_t* allocator, const guchar *string, size_t len);
++
++/** Given a wmem scope and a null-terminated string, expected to be in
++ *  UTF-8 but possibly containing invalid sequences (as it may have come
++ *  from packet data), and the length of the string, generate a valid
++ *  UTF-8 string from it, allocated in the specified wmem scope, that:
++ *
++ *   shows printable Unicode characters as themselves;
++ *
++ *   shows non-printable ASCII characters as C-style escapes (octal
++ *   if not one of the standard ones such as LF -> '\n');
++ *
++ *   shows non-printable Unicode-but-not-ASCII characters as
++ *   their universal character names;
++ *
++ *   shows illegal UTF-8 sequences as a sequence of bytes represented
++ *   as C-style hex escapes;
++ *
++ *  and return a pointer to it.
++ *
++ * @param allocator The wmem scope
++ * @param string A pointer to the input string
++ * @return A pointer to the formatted string
++ *
++ * @see tvb_format_text()
++ */
++WS_DLL_PUBLIC
++gchar*     format_text_string(wmem_allocator_t* allocator, const guchar *string);
+ 
+ /**
+  * Given a string, generate a string from it that shows non-printable
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
new file mode 100644
index 0000000000..3fc5296073
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
@@ -0,0 +1,66 @@
+From 85fbca8adb09ea8e1af635db3d92727fbfa1e28a Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Thu, 18 May 2023 18:06:36 -0400
+Subject: [PATCH] MS-MMS: Use format_text_string()
+
+The length of a string transcoded from UTF-16 to UTF-8 can be
+shorter (or longer) than the original length in bytes in the packet.
+Use the new string length, not the original length.
+
+Use format_text_string, which is a convenience function that
+calls strlen.
+
+Fix #19086
+
+(cherry picked from commit 1c45a899f83fa88e60ab69936bea3c4754e7808b)
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/85fbca8adb09ea8e1af635db3d92727fbfa1e28a]
+CVE: CVE-2023-0667
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-ms-mms.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/epan/dissectors/packet-ms-mms.c b/epan/dissectors/packet-ms-mms.c
+index db1d2cc..3d5c7ee 100644
+--- a/epan/dissectors/packet-ms-mms.c
++++ b/epan/dissectors/packet-ms-mms.c
+@@ -739,7 +739,7 @@ static void dissect_client_transport_info(tvbuff_t *tvb, packet_info *pinfo, pro
+                                  transport_info, "Transport: (%s)", transport_info);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (guchar*)transport_info, length_remaining - 20));
++                    format_text_string(pinfo->pool, (const guchar*)transport_info));
+ 
+ 
+     /* Try to extract details from this string */
+@@ -836,7 +836,7 @@ static void dissect_server_info(tvbuff_t *tvb, packet_info *pinfo, proto_tree *t
+                             ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &server_version);
+ 
+         col_append_fstr(pinfo->cinfo, COL_INFO, " (version='%s')",
+-                    format_text(wmem_packet_scope(), (const guchar*)server_version, strlen(server_version)));
++                    format_text_string(pinfo->pool, (const guchar*)server_version));
+     }
+     offset += (server_version_length*2);
+ 
+@@ -890,7 +890,7 @@ static void dissect_client_player_info(tvbuff_t *tvb, packet_info *pinfo, proto_
+                         ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &player_info);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (const guchar*)player_info, strlen(player_info)));
++                    format_text_string(pinfo->pool, (const guchar*)player_info));
+ }
+ 
+ /* Dissect info about where client wants to start playing from */
+@@ -965,7 +965,7 @@ static void dissect_request_server_file(tvbuff_t *tvb, packet_info *pinfo, proto
+                         ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &server_file);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (const guchar*)server_file, strlen(server_file)));
++                    format_text_string(pinfo->pool, (const guchar*)server_file));
+ }
+ 
+ /* Dissect media details from server */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
new file mode 100644
index 0000000000..42f8108301
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
@@ -0,0 +1,33 @@
+From c4f37d77b29ec6a9754795d0efb6f68d633728d9 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 20 May 2023 23:08:08 -0400
+Subject: [PATCH] synphasor: Use val_to_str_const
+
+Don't use a value from packet data to directly index a value_string,
+particularly when the value string doesn't cover all possible values.
+
+Fix #19087
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/c4f37d77b29ec6a9754795d0efb6f68d633728d9]
+CVE: CVE-2023-0668
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-synphasor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-synphasor.c b/epan/dissectors/packet-synphasor.c
+index 2d2f4ad..47120f5 100644
+--- a/epan/dissectors/packet-synphasor.c
++++ b/epan/dissectors/packet-synphasor.c
+@@ -1130,7 +1130,7 @@ static gint dissect_PHSCALE(tvbuff_t *tvb, proto_tree *tree, gint offset, gint c
+ 
+ 		data_flag_tree = proto_tree_add_subtree_format(single_phasor_scaling_and_flags_tree, tvb, offset, 4,
+ 							       ett_conf_phflags, NULL, "Phasor Data flags: %s",
+-							       conf_phasor_type[tvb_get_guint8(tvb, offset + 2)].strptr);
++							       val_to_str_const(tvb_get_guint8(tvb, offset + 2), conf_phasor_type, "Unknown"));
+ 
+ 		/* first and second bytes - phasor modification flags*/
+ 		phasor_flag1_tree = proto_tree_add_subtree_format(data_flag_tree, tvb, offset, 2, ett_conf_phmod_flags,
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index f80f287ab4..361123d1c5 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -14,6 +14,9 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-2856.patch \
            file://CVE-2023-2858.patch \
            file://CVE-2023-2952.patch \
+           file://CVE-2023-0667-pre1.patch \
+           file://CVE-2023-0667.patch \
+           file://CVE-2023-0668.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


