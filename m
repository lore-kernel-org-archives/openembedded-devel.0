Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFDF77B99
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:32 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 83so11768847pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vv0oPkWF4LHnb/JiPXd9PnbcyQDCgY5ohE+h0m+A4zM=;
	b=WauiUpIuA6DQzXOCrOeEVtoXc0tZmpDelA8wpaKBB+Hki5aeE4OmkEdukrP+RTzXip
	AOG0cQwEEekjl5i1JJRTJOX2cf+sCC/9OE/r9HR6CIu2G307xPbTxCayhAC7du/5yy9c
	pKQvNFx7b2FKmlcNZF9oyQtzROEWZpCA3NWBqu4+n5IFEB16n5cXlaS7UJVr0GJDiToa
	UHEPvcz7FhCK/yloyZl0xW4aWbqlPLIudr1mVprdBrvVJvQxNAoWQHcJHzGAtJG3ic0+
	APFERk74ELbGtuE4fuLRd1IAsigJKuT2osntp19iWTEJcAXXgGjTWPuvIOep324nrw2u
	fIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vv0oPkWF4LHnb/JiPXd9PnbcyQDCgY5ohE+h0m+A4zM=;
	b=EYgQZfmAOelktvEqwcOzGAjDgzXsBqk/HqORx0QfdUjXEzSvCaswCLVPrUh4X6HuVx
	fCr0lP3Q7FsKPxpx09SmK/TIti4i1bICtAM4iXMnDQt74tUe0okrLGTvrmsXjiaUApMj
	e9Nvke0EhW+VuwSRfLe12uviRNAMq1CF9So9JOaSYM+IcdkHWnDp1fpWm5DXHJbC8ikf
	E6zqdYsu1Po4FwrqlIXMIi4mIoDLKXoqeTTfPlZQcEKMIsDzMyGICPrL3wPurMl8p16o
	xtnpjUG2vrzDRaI3PW2oimwxuV8D4Enno/t/ui3b2KjEtR+8BdDWIVQ0Yiujd2zA+8RX
	+J2w==
X-Gm-Message-State: AHYfb5jcprTGAEkjPVSjupaGaaqf6hi8gWGiSS4I856MlYliFvXAtXGi
	LLMXj0WYd5+kUB5e
X-Received: by 10.98.12.205 with SMTP id 74mr1698912pfm.52.1503772534312;
	Sat, 26 Aug 2017 11:35:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:19 -0700
Message-Id: <20170826183521.34294-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/7] gedit: Fix with with hardening flags and clang
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-qualify-handle_builder_error-with-format.patch | 31 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch

diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch b/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
new file mode 100644
index 000000000..4885c4511
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
@@ -0,0 +1,31 @@
+From 623ffac1f6e7725041b386e0f2933fe36809b5a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 09:04:30 -0700
+Subject: [PATCH] gedit-utils: qualify handle_builder_error() with format
+ string parameters
+
+gedit-utils.c:1063:32: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+        msg_plain = g_strdup_vprintf (message, args);
+                                      ^~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gedit/gedit-utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gedit/gedit-utils.c b/gedit/gedit-utils.c
+index 41a5afd..c800828 100644
+--- a/gedit/gedit-utils.c
++++ b/gedit/gedit-utils.c
+@@ -1051,7 +1051,7 @@ gedit_utils_is_valid_uri (const gchar *uri)
+ 	return TRUE;
+ }
+ 
+-static GtkWidget *
++static G_GNUC_PRINTF(1, 2) GtkWidget *
+ handle_builder_error (const gchar *message, ...)
+ {
+ 	GtkWidget *label;
+-- 
+2.14.1
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 4352b5e11..5d244de64 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0001-Remove-help-directory-from-build.patch \
            file://0002-suppress-string-format-literal-warning-to-fix-build-.patch \
            file://0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch \
+           file://0001-gedit-utils-qualify-handle_builder_error-with-format.patch \
            "
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
-- 
2.14.1


