Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013C1CCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:31:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6611.1762612304302508099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0JtnHSR;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477549b3082so15081565e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762612303; x=1763217103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4r6NRdoSskTfF6t9wd+gKk3NWE6EAJhNswJY8Oc7c+4=;
        b=P0JtnHSRN2K+1Z3zaXkCZmytdn4de6XZP5khZkJ6S0xhwdQNFwgNnfNkZq69eJq+cA
         jjWlxYQi5Q3gNiNlZQgvfXovSBRucal52HKzP9cT7dKLJQy/HnJ7hF8HzyYuoEIAczxM
         cPz/lq6eGE9EbeOKk93lBPK+O9j7t2eWrFaFV+5lB6KjwmoetI6zA0uKlOnU7Ug+j7L4
         u02v+R8EqPI88J8jfkGJW2mbL7oPXzPmD5kpBT44QH69SQAusjAjuIh7weD6oP4N6DA3
         SDVPs4CmzkR7K8QSCU904U21YWa9qXIZEizELr8WBCvIxvHA7J/q6/vHNxGqdVdmCctt
         5mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612303; x=1763217103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r6NRdoSskTfF6t9wd+gKk3NWE6EAJhNswJY8Oc7c+4=;
        b=PJ8+pvs8Me1h5AIT/aXKyTvVdclIJP6T7Z8YS0B4ZZ8IZ+ccPvvrVHjr20rF64N5FW
         DRIwv7iIsBBLI5Wz35mg6y3Q17es9fr84FjXQHSlaImo16PyaIqTKt5XqDndtPt3ID68
         ds6jiDVhFuSSq4v8jTENLSjylBLLrsoKHAQXWKp6NVoQ9xQBamXNjQd6nP526N2ECOHE
         xCI8AjycsM88Lx5AGA7L7Y79mLRjo4wFNi9FbOcNYDk32EnkCoIsa/FYHzdfvAwAP8Fq
         s5BU277r8wdZ/PtWYDpc48KB31nRrcJTpfQE8k0doLscQ7+942JGHhnU9thbOoeqlpvY
         Ftxw==
X-Gm-Message-State: AOJu0Yy4AONUl7/Hfpj7odjzn4l9A3Zt3PNK/vQrB/RlSh4ERLMAjNBI
	BRRG4GOhL5oS6fxpnrwTqJytXlVgJmirZm4oBJ7ebUbJiJB9ZPbpBCWEnhixqxsW
X-Gm-Gg: ASbGncsT8NQtf8yj59LJDHAaIuLAW18gPPuSLbCNP9tMNU5g1/fJe3yP2vanlIwmfKX
	zcPBK4UrwoeWDKf1sbLs7L2FACfvoZisjY6/Z1gg62eBJRTlr5+kOtgiXtyfO+j/gSgzEx0O+qf
	TZ5AJFXL0d1P+riW5zxZZXtt3iecRxEdeEzXOcJbOgmM8DfR574KTfKvV23ss53FVVbNMUS/xJ/
	J1agnrqHgBXNd/t1PdrjBu01g/Dv42JrBX/LdTm07ah+MSW29sJ+xMLzBI25KxM0MRSWKZDyfnm
	KL50VXKAB6HjR/3GE/DkgI/TuNd7dyePZiK0Me92OA8t3/NwDqL5LTU4fGiYpBYOmdFKVOGy9vt
	zEOuAUlSO29XiKCzpX3MP5+dx9lHvmZXIfmQK5P0P6TOA/pRPtJQDqAaGDODsfxi3FwwvtexCS2
	KEhUkTjPEo
X-Google-Smtp-Source: AGHT+IEvvRIKPx4nJJTQmHVG99A3p73xGCGcxAGiaZMn+NkdKQol4WT23lkmI/caysHD6KBwpX90lA==
X-Received: by 2002:a05:6000:430e:b0:429:89c2:d933 with SMTP id ffacd0b85a97d-42b2dc82635mr2473196f8f.36.1762612302424;
        Sat, 08 Nov 2025 06:31:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm1012211f8f.0.2025.11.08.06.31.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:31:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] gnuchess: upgrade 6.2.9 -> 6.3.0
Date: Sat,  8 Nov 2025 15:31:37 +0100
Message-ID: <20251108143141.3117797-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121389

Drop patch 0001-Remove-register-storage-class-classifier.patch,
because it is included in this release.

Changelog:

Version 6.3.0 (August 2025)

 - Look for gnuchess.ini in XDG_CONFIG_HOME or ~/.config/.
 - Dynamically configure gnuchess.ini from gnuchess.ini.in.
 - Disable engine book on 'book off'.
 - Improve style of some help messages.
 - More graceful program termination if book does not exist.
 - Bug fix in (epd)load command.
 - Fix potential buffer overflows in the pipes read/write.

Version 6.2.10 (April 2025)

- Tempo bonus added in the evaluation function.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ve-register-storage-class-classifier.patch | 149 ------------------
 .../{gnuchess_6.2.9.bb => gnuchess_6.3.0.bb}  |   7 +-
 2 files changed, 2 insertions(+), 154 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
 rename meta-gnome/recipes-gnome/gnome-chess/{gnuchess_6.2.9.bb => gnuchess_6.3.0.bb} (54%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch b/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
deleted file mode 100644
index 69237fd57a..0000000000
--- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 321eb9b1ca1b230063259dc43be8a2ab2f3bfee9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Jan 2023 22:16:36 -0800
-Subject: [PATCH] Remove 'register' storage class classifier
-
-This is gone with c++17
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/frontend/atak.cc   |  4 ++--
- src/frontend/lexpgn.cc | 34 +++++++++++++++++-----------------
- src/frontend/util.cc   |  2 +-
- 3 files changed, 20 insertions(+), 20 deletions(-)
-
-diff --git a/src/frontend/atak.cc b/src/frontend/atak.cc
-index ef19d87..640e150 100644
---- a/src/frontend/atak.cc
-+++ b/src/frontend/atak.cc
-@@ -37,7 +37,7 @@ short SqAtakd (short sq, short side)
-  *
-  **************************************************************************/
- {
--   register BitBoard *a, b, *c, d, blocker;
-+   BitBoard *a, b, *c, d, blocker;
-    int t;
- 
-    a = board.b[side];
-@@ -89,7 +89,7 @@ BitBoard AttackTo (int sq, int side)
-  *
-  ***************************************************************************/
- {
--   register BitBoard *a, b, *c, e, blocker;
-+   BitBoard *a, b, *c, e, blocker;
-    int t;
- 
-    a = board.b[side];
-diff --git a/src/frontend/lexpgn.cc b/src/frontend/lexpgn.cc
-index 475899d..971aa13 100644
---- a/src/frontend/lexpgn.cc
-+++ b/src/frontend/lexpgn.cc
-@@ -2431,9 +2431,9 @@ extern int yylex (void);
-  */
- YY_DECL
- {
--	register yy_state_type yy_current_state;
--	register char *yy_cp, *yy_bp;
--	register int yy_act;
-+	yy_state_type yy_current_state;
-+	char *yy_cp, *yy_bp;
-+	int yy_act;
-     
- #line 153 "lexpgn.ll"
- 
-@@ -3118,9 +3118,9 @@ case YY_STATE_EOF(RAV):
-  */
- static int yy_get_next_buffer (void)
- {
--    	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
--	register char *source = (yytext_ptr);
--	register int number_to_move, i;
-+    	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
-+	char *source = (yytext_ptr);
-+	int number_to_move, i;
- 	int ret_val;
- 
- 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] )
-@@ -3252,8 +3252,8 @@ static int yy_get_next_buffer (void)
- 
-     static yy_state_type yy_get_previous_state (void)
- {
--	register yy_state_type yy_current_state;
--	register char *yy_cp;
-+	yy_state_type yy_current_state;
-+	char *yy_cp;
-     
- 	yy_current_state = (yy_start);
- 	yy_current_state += YY_AT_BOL();
-@@ -3278,8 +3278,8 @@ static int yy_get_next_buffer (void)
-  */
-     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
- {
--	register int yy_is_jam;
--    	register char *yy_cp = (yy_c_buf_p);
-+	int yy_is_jam;
-+    	char *yy_cp = (yy_c_buf_p);
- 
- 	yy_current_state = yy_nxt[yy_current_state][1];
- 	yy_is_jam = (yy_current_state <= 0);
-@@ -3296,9 +3296,9 @@ static int yy_get_next_buffer (void)
- 	return yy_is_jam ? 0 : yy_current_state;
- }
- 
--    static void yyunput (int c, register char * yy_bp )
-+    static void yyunput (int c, char * yy_bp )
- {
--	register char *yy_cp;
-+	char *yy_cp;
-     
-     yy_cp = (yy_c_buf_p);
- 
-@@ -3308,10 +3308,10 @@ static int yy_get_next_buffer (void)
- 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
- 		{ /* need to shift things up to make room */
- 		/* +2 for EOB chars. */
--		register yy_size_t number_to_move = (yy_n_chars) + 2;
--		register char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
-+		yy_size_t number_to_move = (yy_n_chars) + 2;
-+		char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
- 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
--		register char *source =
-+		char *source =
- 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
- 
- 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
-@@ -3925,7 +3925,7 @@ int yylex_destroy  (void)
- #ifndef yytext_ptr
- static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
- {
--	register int i;
-+	int i;
- 	for ( i = 0; i < n; ++i )
- 		s1[i] = s2[i];
- }
-@@ -3934,7 +3934,7 @@ static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
- #ifdef YY_NEED_STRLEN
- static int yy_flex_strlen (yyconst char * s )
- {
--	register int n;
-+	int n;
- 	for ( n = 0; s[n]; ++n )
- 		;
- 
-diff --git a/src/frontend/util.cc b/src/frontend/util.cc
-index 5d3efe2..f7f7f1d 100644
---- a/src/frontend/util.cc
-+++ b/src/frontend/util.cc
-@@ -75,7 +75,7 @@ void UpdateFriends (void)
-  *
-  ***************************************************************************/
- {
--   register BitBoard *w, *b;
-+   BitBoard *w, *b;
- 
-    w = board.b[white];
-    b = board.b[black];
--- 
-2.39.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.3.0.bb
similarity index 54%
rename from meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.3.0.bb
index 9e2a21d4cc..c91ae23a30 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.3.0.bb
@@ -4,11 +4,8 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz \
-           file://0001-Remove-register-storage-class-classifier.patch"
-SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
-
-S = "${UNPACKDIR}/chess-${PV}"
+SRC_URI = "${GNU_MIRROR}/chess/${BP}.tar.gz"
+SRC_URI[sha256sum] = "0b37bec2098c2ad695b7443e5d7944dc6dc8284f8d01fcc30bdb94dd033ca23a"
 
 inherit autotools gettext
 

