Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id E48F86007A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:46 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id b129-v6so9797643pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dHQWh/BiJQaHl7zrJF1uPs1MKRH3v+F0o9cO+gbMvww=;
	b=n8quAECaQdZ/v10jBnhSl05MGjz8x73cMT57+ZL//1o2a7Q8s5OWNd8d43TFJnK8Sg
	ZI3OlyPijXiplPSGn1zJ1Q/89zNFueoZWf9R7sS1o6HAKZNDys1YfUxJO5k+hOyntAPj
	h/N0CPxjvacJU6KRispSX4NUim8NHQpgEIjJRYsFCDmRlkezKb7X7dJSO/P+NXAcxxTD
	84MWgpp5ikoQus5kPpL33Eyg98MB2xaBo4bQiTxxDMqVoM2jo3urxXCk5j+1vIS7G2KL
	gSjBK8FRjvGMjR5B6eAlcuwR6e/7rFJOm+gJdSkNHQP47f1H14t9iv7Ij4dexBWfsJIB
	97Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dHQWh/BiJQaHl7zrJF1uPs1MKRH3v+F0o9cO+gbMvww=;
	b=V8zsovLtNOFkPRA6ZpLxCW9Iz2JHO+Odfu4QgLYLThE/TdXUmXmtQtlbjiSimzDn9o
	Y8K2MWEq3d4rtgJyit9eyYCUIDBZPhoNQJ0iyFv9i4DosHxLrSCbJkmn+tKKanXSDXpa
	F+qvVtD2kf/dNN1GD5qM6y9ecybHWu7LYo+iVBAYNA3GbBeQUW9xqZpAfy1ejBgYkguT
	y8+6VmGdhNLObB+fkSbs84PKOVa/7miBOv2pD5DIfm+GpWNHqcLSKQmhqJnuKQn80q+v
	L+3X0dZEyiwtlsDZfYyCdTZmses3xw7dQ2RHPuJheBkb4pvQS6FymVNvG2L91f9Z1aEE
	w11g==
X-Gm-Message-State: APzg51CQG35y1MxMd/EOElmK4rbaMeCWYA3CwtiqygUAUtmDbDxcRY0t
	+qRKl3ZUiLRthVnSzCC+ZDF+poqk
X-Google-Smtp-Source: ANB0VdY8sxlqZDJ4KViDQpmGbXcV99n/OxrpTrICQ9dHeDsh2CZlDv9DDdiOTwmVtTKsiac1p1k9Pg==
X-Received: by 2002:a63:e116:: with SMTP id
	z22-v6mr20342443pgh.89.1536556007596; 
	Sun, 09 Sep 2018 22:06:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:29 -0700
Message-Id: <20180910050629.16170-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH 10/10] evince: Fix build with clang
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The added patch aids clang to avoid format warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...001-add-a-formatting-attribute-check.patch | 34 +++++++++++++++++++
 .../recipes-gnome/evince/evince_3.28.2.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch
new file mode 100644
index 0000000000..e87da90bce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch
@@ -0,0 +1,34 @@
+From ef170dda7fbab53682c9bc287dec93fa86130bc9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Sep 2018 21:49:59 -0700
+Subject: [PATCH] add a formatting attribute check
+
+Tell Clang that parameter is a printf style format using the
+attribute flag
+
+This helps in avoiding below warnings seen with clang
+
+unarr.c:106:22: error: format string is not a string literal
+[-Werror,-Wformat-nonliteral]
+|     vfprintf(stderr, msg, args);
+|                      ^~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cut-n-paste/unarr/common/unarr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cut-n-paste/unarr/common/unarr.c b/cut-n-paste/unarr/common/unarr.c
+index 97ec92a..9e6e3ad 100644
+--- a/cut-n-paste/unarr/common/unarr.c
++++ b/cut-n-paste/unarr/common/unarr.c
+@@ -92,7 +92,7 @@ size_t ar_get_global_comment(ar_archive *ar, void *buffer, size_t count)
+     return ar->get_comment(ar, buffer, count);
+ }
+ 
+-void ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
++void __attribute__((__format__ (__printf__, 4, 0))) ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
+ {
+     va_list args;
+     va_start(args, msg);
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
index c5b5484324..8bf8a04e2a 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
@@ -11,6 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
+           file://0001-add-a-formatting-attribute-check.patch \
            "
 SRC_URI[archive.md5sum] = "66aa1766eaaa37536e48def11a0e67a3"
 SRC_URI[archive.sha256sum] = "0955d22d85c9f6d322b6cbb464f1cc4c352db619017ec95dad4cc5c3440f73e1"
-- 
2.18.0


