Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AEF2378821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:36:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id l24so4104866pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bj6Dkkq95zRkijGipXSJgV3OQuk+kHxC4aODmC0ZE/I=;
	b=pArkF8WI39UOo2MDlmZngcHgjuiFOnH479UZXprPoT8T4bfB/5WJXayNKhQhpuDkd2
	puDYi7A4GHm+y7QSMVhj070ydvT78VQtFDSID39ammnas/0F68ib+vN4GNDANtb2VrJl
	AptlR/uxFux/v5gOaMjryjq0MBG185Ah2rnJzdPA+8WFh+0AukMBvP61Yw8QfiHcZzug
	t0WSF35oR/FxyyGTWnGNTGmyiZ+JmfwGV8X36ZJoi7/pDA2/56HgcNHS6GpGhU04+l0q
	86JLNM8fRsftMbw/fDyeJpIKALrUVq6vEE18Q3xpU9J9GU0Mm9zj9n2B9Ap2cHB3s1ra
	M4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bj6Dkkq95zRkijGipXSJgV3OQuk+kHxC4aODmC0ZE/I=;
	b=A5UFV9HxCett2F0FchAlZg9gWnjizkYHfo2UNhdIT6LpnrCMys9iixEcNO1p3tR2Pk
	3OLLebE7cfWlAJsQWitubpwfwX3w7LnVypwmS2BouSQ3he6keXCy7PQPKwqNkdR/Vyzp
	XWFaX0Wr8lJGIkyUPWeZIGCS5PVI1QkRL+Lpo6puAEIdL3mTxMJBfLQ6b1rrgQOK2OLj
	3eWf/HUcgVi3nPAZkzPo5lG7sEUP4Cl9Lodve4bPD9c+PuEX0HQDPThreZ+VlTZZ25EX
	d6fsQfFj5vxwZyCrmYlG81kHE07QHYn//4r7v8cCUTcQzut1v5mcc40oPLw1zZukkJnU
	FuCA==
X-Gm-Message-State: AKGB3mIeMgJOzzREVEBeUEkwggbWAhlwywCOMRfLcpKleeQmhqw+ARQ4
	jV54he5d2OmIyqJXZN5YWCSBcw==
X-Google-Smtp-Source: ACJfBosRmSz73g8LOJNncc+iK3GgJWJkzhOnbyT23E8lvE4SMXRDcNXxudI7pwK132KS4p1tjrPB7A==
X-Received: by 10.98.66.196 with SMTP id h65mr10408426pfd.172.1513273008527;
	Thu, 14 Dec 2017 09:36:48 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id l14sm7437748pgn.9.2017.12.14.09.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 09:36:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 09:36:32 -0800
Message-Id: <20171214173633.16405-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214173633.16405-1-raj.khem@gmail.com>
References: <20171214173633.16405-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 4/5] libgnome: Fix invalid UTF-8 in header
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 17:36:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgnome/libgnome/05_fix_invalid_utf8.patch    | 26 ++++++++++++++++++++++
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch b/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
new file mode 100644
index 000000000..cd90b8ed9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
@@ -0,0 +1,26 @@
+From 33313713c4f5c1de500859ff128d6fd7e3af5722 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Mon, 7 Aug 2017 12:57:43 -0400
+Subject: gnome-config.h: Fix invalid UTF-8 in header
+
+This breaks the new Python `glib-mkenums`.
+---
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ libgnome/gnome-config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgnome/gnome-config.h b/libgnome/gnome-config.h
+index 0c3dfe6..b9d659d 100644
+--- a/libgnome/gnome-config.h
++++ b/libgnome/gnome-config.h
+@@ -270,7 +270,7 @@ void gnome_config_clean_key_ (const char *path, gboolean priv);
+ #define gnome_config_private_clean_key(path) \
+ 	(gnome_config_clean_key_((path),TRUE))
+ 
+-/* returns the true filename of the config file */
++/* returns the true filename of the config file */
+ #define gnome_config_get_real_path(path) \
+ 	(g_build_filename (gnome_user_dir_get(),(path),NULL))
+ #define gnome_config_private_get_real_path(path) \
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 0055ba4a3..94fcf2e8c 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -9,7 +9,9 @@ PR = "r2"
 
 SRC_URI[archive.md5sum] = "a4345e6087ae6195d65a4674ffdca559"
 SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4"
-SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch"
+SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch \
+            file://05_fix_invalid_utf8.patch \
+"
 GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound intltool-native gnome-common-native"
-- 
2.15.1


