Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACFEEE0ADF
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3904.1770467011554942336
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMU5sISt;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-480706554beso16529015e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467010; x=1771071810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS9xGR4aiwQewFrc87Lpgvirej9JtQlNL+1yJ+2y7E0=;
        b=KMU5sIStDQ5Jz+AWf+b0ZPDMabkgpmA0Sb76sZ8Ygl6xD+ugfKNDZjHSWAq94Xwx24
         iL7ewUmciKeP198jxqSc7ccdP9eKuTC7v0yvWPrDhlJxuNEwiHEWJt2FIE3uMykx4F0i
         7F37PuV1CzT3X33Xp834FhPEZPP/h8d0Vq804IdvEyNcdCNSsKKFBUyVs1YcnMlZJJt2
         kJraAXwN/tTtlTnDm16K+pAyrQvNU6fIN3cu3i4ugccQiwW1vm9yGjqYWofBdIq4qxD7
         dz8tnevexw39SoI5OIp6a/zsCkENnxARQf1v2bpVs3EB/8B+C7/TeTXbbRMA+WeFBoSk
         oPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467010; x=1771071810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cS9xGR4aiwQewFrc87Lpgvirej9JtQlNL+1yJ+2y7E0=;
        b=wNJbABa+H5B52aQ4JQp9Eyu0s9yGOuZhqf/OED1ouquBEV4+jQlKDL6l6z/pJrTYgk
         v8gO1OXulcHapd+u3iSfE4FIDZhn7fD3u1/2A78s7Na7fbsqjvEzO2+BpLhmke5I2im2
         G5/hfAiwp4aRQ7na1praOVJ+gF4mRp506TdUsRuKMfNDUH7Kf4Qn0DEHjATXcBzO6lhn
         5dVDt4l1pF0TnGh1ZHrf51v3sywPFYfr+aA8nWExHmd1sNF2n3AmKhehRBxFq1uiwlG0
         GqXGhiF4IETig1mWfU4ghvTRrhLVKVO4sKTEyTXCXdsR6icjgV2fR0Kjg+76Xx0n5mtJ
         8Xtg==
X-Gm-Message-State: AOJu0YzBBtz1H02+Ao4rpMS1KpAoyqvzPzLK0lc+xE0QBCESzQrtFCzK
	uLNl1lFvgnRORhw8kIH5L/3lKed2KD2dmBS8VtwRnKaH1vjXB0wa1QH0jVW2Hw==
X-Gm-Gg: AZuq6aJhG14RvULvafsnY63k+zbb+cVD0JTGGStzaWAI8lKq140BkBfE7jNFKZxK802
	kdD8XMMN6hMxDAAwu6zk+YdPaABsjXeYH9HDwSG4uHVWmj6u+BZJ28GML7ykwj5AbVfCYEFlTEA
	tumRLycsUwGgSPzm2Sjw1/XdCjKrc22a/nmQnBDWcjSCeDi47It3/Gx8Kgy/HcJCGNdtIxctBGe
	+UzXBxbjgtMwz5Q3VSxsYq8voPu2NlPYbpP3fquoEUAb6bqE3mgJVWs8XDbk0OxnKlGWP76cDU6
	Kp35/8LRg4PEWvS4VVBkNgAspARYorHhuRvWElMCFu09cjy2uXmSEPG7AzyfEtxCdPXqvlXYZTp
	kOH+o2cz1i2ozlEQ3OKZbAKD/Q2/mTB8mVeF/5OO+B3hFndGyN+18MkGH0N9Fjm8rRht5FGvhI/
	CbbLzIvY4BUU29haMk4sE=
X-Received: by 2002:a05:600c:c16a:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-483202160a2mr89119445e9.17.1770467009870;
        Sat, 07 Feb 2026 04:23:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 03/12] gnuchess: upgrade 6.2.9 -> 6.2.11
Date: Sat,  7 Feb 2026 13:23:18 +0100
Message-ID: <20260207122327.664604-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124259

Drop patch that was incorporated in this release.
Also, switch to GNU ftp servers to fetch the source from.

Changes:
6.2.11: No changes.
6.2.10:
- Tempo bonus added in the evaluation function.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ve-register-storage-class-classifier.patch | 149 ------------------
 .../{gnuchess_6.2.9.bb => gnuchess_6.2.11.bb} |   7 +-
 2 files changed, 2 insertions(+), 154 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
 rename meta-gnome/recipes-gnome/gnome-chess/{gnuchess_6.2.9.bb => gnuchess_6.2.11.bb} (55%)

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
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.11.bb
similarity index 55%
rename from meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.11.bb
index 78606b8a2a..a1b899653b 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.11.bb
@@ -4,11 +4,8 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz \
-           file://0001-Remove-register-storage-class-classifier.patch"
-SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
-
-S = "${WORKDIR}/chess-${PV}"
+SRC_URI = "${GNU_MIRROR}/chess/${BP}.tar.gz"
+SRC_URI[sha256sum] = "d81140eea5c69d14b0cfb63816d4b4c9e18fba51f5267de5b1539f468939e9bd"
 
 inherit autotools gettext
 

