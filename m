Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.14430.1613866589339462343
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 16:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RKqxLvPy;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id lu16so22930353ejb.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 16:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PSeFgB7s2dAhSHl4q5GR5JLzpTZXOLj5zp1mEQA73PE=;
        b=RKqxLvPy9I7fVdGXAAykYk1alMOsbJOLGIruYpb1uhIKd0v971ayKP+eIJ2hnP5pZU
         mqyKByKAS/GsqQTJcBYqZo44qmsHbM1LHSaZGZP3epkvN9rIFwmLH+iUCpTEr2MrUmmo
         VHLPleOWyahPa6hw/FDoapemIqzGRh9a8XmXbsUUXHjqe5kcPsk0lrK4dI/y9tMd/ZhC
         4KU6y8LKb8OIUhr4B7vr6klxmFtXsDqBz0ioqAC5y24/BWWfdDPvdDHeYnw2+uCIgjpn
         3b48HTeNXMb2uJLTJfSsvakcdXObH1vlDGyiN5Nq1NoTeF7quJLiO4FSqyvlDTeNqYcV
         gqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PSeFgB7s2dAhSHl4q5GR5JLzpTZXOLj5zp1mEQA73PE=;
        b=Rk1Yc7zjrVx14exSPI4fwDx1Umr2gpMENcwuxizvapjv21rJ8w8Aen7V7rGG0Lha3G
         RKKX8gHuKhsLLaZbQGsaPDMMQXozyC5OI6PfRmCjIV48htKeXeYK8Yg6B1Ia1sZOhj8c
         qc+ZXiFhXlUga/i5iM6uTa4CZ9cq5Y/o40tPniKc0ny02I8ivG/A8dKdFraCfzdXe8ck
         iQhlFPgRUEuLy6kqMbYtitqbWtKsCa9oj46R/7QDCcTCZIJ2Oa+CXjXCCD6s/ZpRfDzo
         bCgq3nugODjZuAqLvX27q9vrIok6yxyAILZ4ZOneNRbrZ3TnXzuIQT4H3xZOWZyduOue
         ImYg==
X-Gm-Message-State: AOAM533cIrBvnQwrnQ1nZr9ChkoMWb++8bVKwYKyITYJ25Bk5y/8izvK
	NYwDWNwmfodDBHXq+wt+zlokrf+klfgqmg==
X-Google-Smtp-Source: ABdhPJwkgIY5MgnOkcYW+GfWv4fG4Hq64yZx2BFrnuI++tXVZbgW3l46XTv4ANYI2aLXVdNV8BV6xg==
X-Received: by 2002:a17:906:7f84:: with SMTP id f4mr15126439ejr.60.1613866587764;
        Sat, 20 Feb 2021 16:16:27 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cb14sm1125324ejb.82.2021.02.20.16.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 16:16:27 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][meta-oe][PATCH] nghttp2: Fix CVE-2020-11080.patch to apply
Date: Sun, 21 Feb 2021 01:16:23 +0100
Message-Id: <20210221001623.46241-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixes:

Applying patch CVE-2020-11080.patch
patching file doc/CMakeLists.txt
patching file doc/Makefile.am
Hunk #1 FAILED at 69.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
patching file lib/includes/nghttp2/nghttp2.h
patching file lib/nghttp2_helper.c
patching file lib/nghttp2_option.c
patching file lib/nghttp2_option.h
patching file lib/nghttp2_session.c
Hunk #3 succeeded at 5694 (offset 31 lines).
Hunk #4 succeeded at 7470 (offset 29 lines).
patching file lib/nghttp2_session.h
patching file tests/main.c
Hunk #1 succeeded at 315 (offset -2 lines).
patching file tests/nghttp2_session_test.c
Hunk #1 succeeded at 10558 (offset -56 lines).
patching file tests/nghttp2_session_test.h
Patch CVE-2020-11080.patch does not apply (enforce with -f)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nghttp2/nghttp2/CVE-2020-11080.patch      | 66 +++++++++----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
index 5cf2e872f4..83a1074191 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
+++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
@@ -1,11 +1,11 @@
-From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
+From 0e3ddf72a648c5909eef3486432f70ba15089f13 Mon Sep 17 00:00:00 2001
 From: James M Snell <jasnell@gmail.com>
 Date: Fri, 17 Apr 2020 16:53:51 -0700
 Subject: [PATCH] Implement max settings option
 
 CVE: CVE-2020-11080
 Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c27f75090]
-Comment: No hunks refreshed
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  doc/CMakeLists.txt             |  1 +
  doc/Makefile.am                |  1 +
@@ -21,7 +21,7 @@ Comment: No hunks refreshed
  11 files changed, 124 insertions(+)
 
 diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index 34c027929..f3aec84da 100644
+index 34c02792..f3aec84d 100644
 --- a/doc/CMakeLists.txt
 +++ b/doc/CMakeLists.txt
 @@ -42,6 +42,7 @@ set(APIDOCS
@@ -33,25 +33,25 @@ index 34c027929..f3aec84da 100644
    nghttp2_priority_spec_check_default.rst
    nghttp2_priority_spec_default_init.rst
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 4d73cef50..f073bfa4c 100644
+index 4d73cef5..f073bfa4 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
 @@ -69,6 +69,7 @@ APIDOCS= \
-       nghttp2_option_set_peer_max_concurrent_streams.rst \
-       nghttp2_option_set_user_recv_extension_type.rst \
-       nghttp2_option_set_max_outbound_ack.rst \
-+      nghttp2_option_set_max_settings.rst \
-       nghttp2_pack_settings_payload.rst \
-       nghttp2_priority_spec_check_default.rst \
-       nghttp2_priority_spec_default_init.rst \
+ 	nghttp2_option_set_peer_max_concurrent_streams.rst \
+ 	nghttp2_option_set_user_recv_extension_type.rst \
+ 	nghttp2_option_set_max_outbound_ack.rst \
++	nghttp2_option_set_max_settings.rst \
+ 	nghttp2_pack_settings_payload.rst \
+ 	nghttp2_priority_spec_check_default.rst \
+ 	nghttp2_priority_spec_default_init.rst \
 diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2.h
-index e3aeb9fed..9be6eea5c 100644
+index e3aeb9fe..9be6eea5 100644
 --- a/lib/includes/nghttp2/nghttp2.h
 +++ b/lib/includes/nghttp2/nghttp2.h
 @@ -228,6 +228,13 @@ typedef struct {
   */
  #define NGHTTP2_CLIENT_MAGIC_LEN 24
-
+ 
 +/**
 + * @macro
 + *
@@ -77,7 +77,7 @@ index e3aeb9fed..9be6eea5c 100644
 @@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_closed_streams(nghttp2_option *option,
  NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
                                                          size_t val);
-
+ 
 +/**
 + * @function
 + *
@@ -93,7 +93,7 @@ index e3aeb9fed..9be6eea5c 100644
   * @function
   *
 diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
-index 91136a619..0bd541472 100644
+index 91136a61..0bd54147 100644
 --- a/lib/nghttp2_helper.c
 +++ b/lib/nghttp2_helper.c
 @@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
@@ -106,7 +106,7 @@ index 91136a619..0bd541472 100644
      return "Unknown error code";
    }
 diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
-index e53f22d36..34348e660 100644
+index e53f22d3..34348e66 100644
 --- a/lib/nghttp2_option.c
 +++ b/lib/nghttp2_option.c
 @@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2_option *option, size_t val) {
@@ -119,7 +119,7 @@ index e53f22d36..34348e660 100644
 +  option->max_settings = val;
 +}
 diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
-index 1f740aaa6..939729fdc 100644
+index 1f740aaa..939729fd 100644
 --- a/lib/nghttp2_option.h
 +++ b/lib/nghttp2_option.h
 @@ -67,6 +67,7 @@ typedef enum {
@@ -128,7 +128,7 @@ index 1f740aaa6..939729fdc 100644
    NGHTTP2_OPT_MAX_OUTBOUND_ACK = 1 << 11,
 +  NGHTTP2_OPT_MAX_SETTINGS = 1 << 12,
  } nghttp2_option_flag;
-
+ 
  /**
 @@ -85,6 +86,10 @@ struct nghttp2_option {
     * NGHTTP2_OPT_MAX_OUTBOUND_ACK
@@ -142,15 +142,15 @@ index 1f740aaa6..939729fdc 100644
     * Bitwise OR of nghttp2_option_flag to determine that which fields
     * are specified.
 diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
-index 563ccd7de..415e34776 100644
+index 9df3d6f3..470576da 100644
 --- a/lib/nghttp2_session.c
 +++ b/lib/nghttp2_session.c
 @@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session_ptr,
-
+ 
    (*session_ptr)->max_send_header_block_length = NGHTTP2_MAX_HEADERSLEN;
    (*session_ptr)->max_outbound_ack = NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
 +  (*session_ptr)->max_settings = NGHTTP2_DEFAULT_MAX_SETTINGS;
-
+ 
    if (option) {
      if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
 @@ -521,6 +522,11 @@ static int session_new(nghttp2_session **session_ptr,
@@ -163,12 +163,12 @@ index 563ccd7de..415e34776 100644
 +      (*session_ptr)->max_settings = option->max_settings;
 +    }
    }
-
+ 
    rv = nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
-@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
+@@ -5688,6 +5694,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
            iframe->max_niv =
                iframe->frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;
-
+ 
 +          if (iframe->max_niv - 1 > session->max_settings) {
 +            rv = nghttp2_session_terminate_session_with_reason(
 +                session, NGHTTP2_ENHANCE_YOUR_CALM,
@@ -181,8 +181,8 @@ index 563ccd7de..415e34776 100644
 +
            iframe->iv = nghttp2_mem_malloc(mem, sizeof(nghttp2_settings_entry) *
                                                     iframe->max_niv);
-
-@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(nghttp2_session *session,
+ 
+@@ -7454,6 +7470,11 @@ static int nghttp2_session_upgrade_internal(nghttp2_session *session,
    if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
      return NGHTTP2_ERR_INVALID_ARGUMENT;
    }
@@ -195,7 +195,7 @@ index 563ccd7de..415e34776 100644
                                                settings_payloadlen, mem);
    if (rv != 0) {
 diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
-index d20827315..07bfbb6c9 100644
+index 90ead9c0..0cd51815 100644
 --- a/lib/nghttp2_session.h
 +++ b/lib/nghttp2_session.h
 @@ -267,6 +267,8 @@ struct nghttp2_session {
@@ -208,10 +208,10 @@ index d20827315..07bfbb6c9 100644
    uint32_t next_stream_id;
    /* The last stream ID this session initiated.  For client session,
 diff --git a/tests/main.c b/tests/main.c
-index 41e0b03eb..67eb4a1c2 100644
+index 46e9b1cb..e1e75689 100644
 --- a/tests/main.c
 +++ b/tests/main.c
-@@ -317,6 +317,8 @@ int main() {
+@@ -315,6 +315,8 @@ int main() {
                     test_nghttp2_session_set_local_window_size) ||
        !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
                     test_nghttp2_session_cancel_from_before_frame_send) ||
@@ -221,13 +221,13 @@ index 41e0b03eb..67eb4a1c2 100644
                     test_nghttp2_session_removed_closed_stream) ||
        !CU_add_test(pSuite, "session_pause_data",
 diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
-index 6eb8e244d..33ee3ad84 100644
+index b366a6aa..cefe27a6 100644
 --- a/tests/nghttp2_session_test.c
 +++ b/tests/nghttp2_session_test.c
-@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_before_frame_send(void) {
+@@ -10558,6 +10558,67 @@ void test_nghttp2_session_cancel_from_before_frame_send(void) {
    nghttp2_session_del(session);
  }
-
+ 
 +void test_nghttp2_session_too_many_settings(void) {
 +  nghttp2_session *session;
 +  nghttp2_option *option;
@@ -293,7 +293,7 @@ index 6eb8e244d..33ee3ad84 100644
  prepare_session_removed_closed_stream(nghttp2_session *session,
                                        nghttp2_hd_deflater *deflater) {
 diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_test.h
-index e872c5d0b..818c808d0 100644
+index e872c5d0..818c808d 100644
 --- a/tests/nghttp2_session_test.h
 +++ b/tests/nghttp2_session_test.h
 @@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_change(void);
-- 
2.27.0

