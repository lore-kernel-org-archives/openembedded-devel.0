Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA4578821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:36:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id k15so3853795pgr.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=chx8AtQPaMVoA+HUjiqEaPN8s8ebM20qEI4jCdd1KRU=;
	b=DGmg/wlee38UyzCRE9j/VQ7CEDK5h0hhPupDaSCzXQE8YlZGEaV2GIO2GFaLFvqIzG
	2jdDsqz6wlPqXuWp69C0wpVjpJ5Msanwuu48w+TCVLhZqZCtzBU7iHX8kLCCXFN9tLQ3
	w93Lg4MYLcGZljMaH4EBP1gM0Ue+Jz4EUKUXRHzFomccSC65yvM8p2AmKklp5WgDlPOY
	fnUikaB6lH2wBOrt/ut36ezdZ8aDVUvkbapXeeYewno8kO+FCDPEmTJFmc33Qhjs2TCT
	XxWd/m3jgpxogJv6jRLqITcBYccSmeiCEhbhPI5Vzxr3Taex3AP/mmFU/z31o7L2zDeb
	2Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=chx8AtQPaMVoA+HUjiqEaPN8s8ebM20qEI4jCdd1KRU=;
	b=YcW41JHwsPynZK4n3ZRhWsvqCbFD0XA3mNRqN/+Q4bchD5IlBamb1wOqAPaH0kn7Ll
	hld+plHl4IO5RlXsD7rni/OVKXHx8puICXiQlyMH5CfzNSAmBvYaJIeMyx2mLCxRF16F
	o+m3Vj9M5cLKpJQgHS4orNh5zYlK4tSlBeWl1nzXuFoxeM6m0ZUqtV26Rzur0GYSGFoN
	BEO8k9XfKh++gjSbksQDvdRIVs+Sigv+jdTZbRXV98RFlh+wy//PpmTrg8DAJ+xpKX+W
	iSqw/6+d8b/OEOnFCayRCxjAsDC5Cl6Y2BVHinfeV+R52jojUceo62SuO6ny1mTmjJb+
	g7Qw==
X-Gm-Message-State: AKGB3mJyRYjBqzrYbUSKIoDANKXPLpDDM7+00rfcpe4EC4GOItReQffY
	L1UpO3P9unZq5Ut1YSvXgf6URQ==
X-Google-Smtp-Source: ACJfBoulXHRMbvXaPJTbBqz6MgMokJwh13GKBvVxn21bExuUt6yJMWY4g7uaAqkpLLQGWu3fh/JeDA==
X-Received: by 10.159.196.135 with SMTP id c7mr2547021plo.197.1513273010009;
	Thu, 14 Dec 2017 09:36:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id l14sm7437748pgn.9.2017.12.14.09.36.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 09:36:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 09:36:33 -0800
Message-Id: <20171214173633.16405-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214173633.16405-1-raj.khem@gmail.com>
References: <20171214173633.16405-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 5/5] libgnomeui: Fix build with newer glib-2.0
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
X-List-Received-Date: Thu, 14 Dec 2017 17:36:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgnome/libgnomeui/05_fix_invalid_utf8.patch   | 21 +++++++++++++++++++++
 .../recipes-gnome/libgnome/libgnomeui_2.24.5.bb     |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch b/meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
new file mode 100644
index 000000000..bb09b4795
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
@@ -0,0 +1,21 @@
+Description: Fix FTBFS with glib 2.54
+ glib-mkenums now expects input files to be UTF-8,
+ fix the encoding of libgnomeui/gnome-scores.h
+Author: Adrian Bunk <bunk@debian.org>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libgnomeui-2.24.5/libgnomeui/gnome-scores.h
+===================================================================
+--- libgnomeui-2.24.5.orig/libgnomeui/gnome-scores.h
++++ libgnomeui-2.24.5/libgnomeui/gnome-scores.h
+@@ -27,7 +27,7 @@
+  * "High Scores" Widget 
+  *
+  * AUTHOR: 
+- * Horacio J. Peña <horape@compendium.com.ar>
++ * Horacio J. PeÃ±a <horape@compendium.com.ar>
+  *
+  * This is free software (under the terms of the GNU LGPL)
+  *
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index 45219d4d7..b78ffc505 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0001-suppress-string-format-literal-warning-to-fix-build-.patch \
     file://gnome-stock-pixbufs.h \
     file://no-pixbuf-csource.patch \
+    file://05_fix_invalid_utf8.patch \
 "
 SRC_URI[archive.md5sum] = "d4bb506b1916015323928faab5aa708b"
 SRC_URI[archive.sha256sum] = "ae352f2495889e65524c979932c909f4629a58e64290fb0c95333373225d3c0f"
-- 
2.15.1


