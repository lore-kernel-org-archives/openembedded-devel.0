Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E20FC004D4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.2061.1674324090384446993
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZcBfQc+Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c6so7987718pls.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOOOFIhoZzE0fXDVQCOKHF19mKSTZO60b3TrK95oqXs=;
        b=ZcBfQc+Z5QEtyoRGcUTV5hrCqxXpLuQpYHI9WGWNbHBGyAM6tccNUHxcK2cMnJNVl1
         g/7gkP0M0e9fwmz29byp6ctHrkcXIvb0Kse15J4hQ0IS1xPSaodxRiUsEsxzFAnXW9Sm
         teomftf0WPqRhFgl3MYyOmnCzFaHxmloder5Ivk3ZLn9i2d4BZ0GupY2oeS5j1DnrAFW
         eDxKyfce8LJJT9JVFWdc1VCUTnHsuE20IhkOZbhh4y0KNAs9ZaCmZlRMyWvBAGmChWgc
         M1i9g3Nml8mqxazBlyoYOefRCsvKy/VxEArUI6t8gR47lZQ+pa1JkhlBLKGunup57wAF
         9HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOOOFIhoZzE0fXDVQCOKHF19mKSTZO60b3TrK95oqXs=;
        b=YoYISGW7Uqb1gpEtghhuQtkmhnJDPe2Kc1hWFA6ZRvX7yONuMbjZFnE1hUJRpeuugJ
         eTMuX4VkeBL0XoE1Ogo+xbFN/YDlHsp9zk5xuwqq9h55FV4jiA7ldJ17gUtMfpxDkjIp
         zrpio7Edu1jaWbj6yxQzyUaKbThmFm+oUuM79RaLr43bslLzywZtueasdbM3PjWgNK3M
         pGWDeSWxgB1+6oeyFws9hJzCPDsm+5FmA0mSK5+Yz6itrTzJMoF9zTCrs4km7O5XQCXY
         /vAjxT67Z4HxzmW9KkAgX2jyy+gDpRA3WNIXmI1J8Mq7959Qog3hlSutdUps2ElLeaiu
         /uSw==
X-Gm-Message-State: AFqh2kqQ8Qv/KjiDx0YEpxX+MJaGBuO8Xp7VEvD1DCzQNKX1Kdvy/GAT
	zYslQDuDISk67YP+O0vh+1QaOcIZsQZekg==
X-Google-Smtp-Source: AMrXdXtxz7wL37y+A8M6m1z9c2kVsbFZYvjf3NhV2ctnmRCtsV5xZ0x9jBtBIlAk88p167yRWLjQyg==
X-Received: by 2002:a17:90a:aa8a:b0:227:ca8:4ec8 with SMTP id l10-20020a17090aaa8a00b002270ca84ec8mr21001557pjq.17.1674324089593;
        Sat, 21 Jan 2023 10:01:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 07/30] gnuchess: Fix build with c++17
Date: Sat, 21 Jan 2023 10:00:58 -0800
Message-Id: <20230121180121.1229895-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100673

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve-register-storage-class-classifier.patch | 149 ++++++++++++++++++
 .../gnome-chess/gnuchess_6.2.9.bb             |   3 +-
 2 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch b/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
new file mode 100644
index 0000000000..69237fd57a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
@@ -0,0 +1,149 @@
+From 321eb9b1ca1b230063259dc43be8a2ab2f3bfee9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Jan 2023 22:16:36 -0800
+Subject: [PATCH] Remove 'register' storage class classifier
+
+This is gone with c++17
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/frontend/atak.cc   |  4 ++--
+ src/frontend/lexpgn.cc | 34 +++++++++++++++++-----------------
+ src/frontend/util.cc   |  2 +-
+ 3 files changed, 20 insertions(+), 20 deletions(-)
+
+diff --git a/src/frontend/atak.cc b/src/frontend/atak.cc
+index ef19d87..640e150 100644
+--- a/src/frontend/atak.cc
++++ b/src/frontend/atak.cc
+@@ -37,7 +37,7 @@ short SqAtakd (short sq, short side)
+  *
+  **************************************************************************/
+ {
+-   register BitBoard *a, b, *c, d, blocker;
++   BitBoard *a, b, *c, d, blocker;
+    int t;
+ 
+    a = board.b[side];
+@@ -89,7 +89,7 @@ BitBoard AttackTo (int sq, int side)
+  *
+  ***************************************************************************/
+ {
+-   register BitBoard *a, b, *c, e, blocker;
++   BitBoard *a, b, *c, e, blocker;
+    int t;
+ 
+    a = board.b[side];
+diff --git a/src/frontend/lexpgn.cc b/src/frontend/lexpgn.cc
+index 475899d..971aa13 100644
+--- a/src/frontend/lexpgn.cc
++++ b/src/frontend/lexpgn.cc
+@@ -2431,9 +2431,9 @@ extern int yylex (void);
+  */
+ YY_DECL
+ {
+-	register yy_state_type yy_current_state;
+-	register char *yy_cp, *yy_bp;
+-	register int yy_act;
++	yy_state_type yy_current_state;
++	char *yy_cp, *yy_bp;
++	int yy_act;
+     
+ #line 153 "lexpgn.ll"
+ 
+@@ -3118,9 +3118,9 @@ case YY_STATE_EOF(RAV):
+  */
+ static int yy_get_next_buffer (void)
+ {
+-    	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
+-	register char *source = (yytext_ptr);
+-	register int number_to_move, i;
++    	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
++	char *source = (yytext_ptr);
++	int number_to_move, i;
+ 	int ret_val;
+ 
+ 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] )
+@@ -3252,8 +3252,8 @@ static int yy_get_next_buffer (void)
+ 
+     static yy_state_type yy_get_previous_state (void)
+ {
+-	register yy_state_type yy_current_state;
+-	register char *yy_cp;
++	yy_state_type yy_current_state;
++	char *yy_cp;
+     
+ 	yy_current_state = (yy_start);
+ 	yy_current_state += YY_AT_BOL();
+@@ -3278,8 +3278,8 @@ static int yy_get_next_buffer (void)
+  */
+     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
+ {
+-	register int yy_is_jam;
+-    	register char *yy_cp = (yy_c_buf_p);
++	int yy_is_jam;
++    	char *yy_cp = (yy_c_buf_p);
+ 
+ 	yy_current_state = yy_nxt[yy_current_state][1];
+ 	yy_is_jam = (yy_current_state <= 0);
+@@ -3296,9 +3296,9 @@ static int yy_get_next_buffer (void)
+ 	return yy_is_jam ? 0 : yy_current_state;
+ }
+ 
+-    static void yyunput (int c, register char * yy_bp )
++    static void yyunput (int c, char * yy_bp )
+ {
+-	register char *yy_cp;
++	char *yy_cp;
+     
+     yy_cp = (yy_c_buf_p);
+ 
+@@ -3308,10 +3308,10 @@ static int yy_get_next_buffer (void)
+ 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
+ 		{ /* need to shift things up to make room */
+ 		/* +2 for EOB chars. */
+-		register yy_size_t number_to_move = (yy_n_chars) + 2;
+-		register char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
++		yy_size_t number_to_move = (yy_n_chars) + 2;
++		char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
+ 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
+-		register char *source =
++		char *source =
+ 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
+ 
+ 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
+@@ -3925,7 +3925,7 @@ int yylex_destroy  (void)
+ #ifndef yytext_ptr
+ static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
+ {
+-	register int i;
++	int i;
+ 	for ( i = 0; i < n; ++i )
+ 		s1[i] = s2[i];
+ }
+@@ -3934,7 +3934,7 @@ static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
+ #ifdef YY_NEED_STRLEN
+ static int yy_flex_strlen (yyconst char * s )
+ {
+-	register int n;
++	int n;
+ 	for ( n = 0; s[n]; ++n )
+ 		;
+ 
+diff --git a/src/frontend/util.cc b/src/frontend/util.cc
+index 5d3efe2..f7f7f1d 100644
+--- a/src/frontend/util.cc
++++ b/src/frontend/util.cc
+@@ -75,7 +75,7 @@ void UpdateFriends (void)
+  *
+  ***************************************************************************/
+ {
+-   register BitBoard *w, *b;
++   BitBoard *w, *b;
+ 
+    w = board.b[white];
+    b = board.b[black];
+-- 
+2.39.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
index 8ca40229ee..78606b8a2a 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
@@ -4,7 +4,8 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz"
+SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz \
+           file://0001-Remove-register-storage-class-classifier.patch"
 SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
 
 S = "${WORKDIR}/chess-${PV}"
-- 
2.39.1


