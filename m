Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 58AE560685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:45 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id p10so3317975pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IE2AMrgVmcW8FDJ3YOhwEA7rrxfCKo0VDMfJ0kKXPAc=;
	b=nwmaZCmLQFjtmnKXVq42hikOwjhrbvoJeA/NF5QV+IpZZJJBXuPAMdE1rcvZCeZRD2
	d041D9uY7J+nRosVxNVAVxjwX0aK7vWf+ia9yVHJjaMmCCp+Lb19H7QX2JJOhJOak1jp
	z86KifoE5z17ZlMy3LqTF/XbvlZdfjxuxDSlqlGfTp+gf3sHrB25zvrYx79kDPAncxka
	Xj7iWXazrU4dBrIcAT5YYXksrNOUfBGO42eb2KbQbnqq9GF6jvJmDTo96zKe+ubE3XuT
	WrXHieiCJTSo8yHVngq+WgoxGXOUlk0p+iSM7ROgQFpCwyZKki3Reu5NW4FOICeeQiVD
	xeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IE2AMrgVmcW8FDJ3YOhwEA7rrxfCKo0VDMfJ0kKXPAc=;
	b=hZJXFBYV7lSIrwYmhetCXz5YrKfCWIZtGTK7c9XrQH8Caiq5dxOhBRluOpXxHVqYED
	fLyHtXbn27EmZWxpW3n+1p35cDB2/v2jcw8C+ghK+raM94PcwvxtsaxjtP4rJVSlJMFJ
	JKyDJOBKRnSAroPcugwCN+RzSwsjpjI+aVhd48W3MA6h5lBB7jzKjoAxhxpPZ2yy3ABo
	rtOYyJjSsph5CjFYGl3XlzrXMe3yiDkJzI+Q1aZKy9K6zkiEblQRsRB+Ajay47GiWeF8
	aAEjjiwhksiD1DzQ24eCiEwf6fVjlPgaeVjcDhAK8GWo7gSec85EXRycyUOI2pP6ZP3g
	v9Fg==
X-Gm-Message-State: ALQs6tC6Cq8bKZDHfNkBkh1QrwYW/MY/ehJUZpeTrFVmc3v9/PesLTNa
	fMTrgcTVwRts64FZqIC8HECR5Q==
X-Google-Smtp-Source: AIpwx4/sLDdxBAYQLAX1yAGpUNcT0I8QhHcg0XgD1tseU1FpJvkScVVGXUtL5VZa5u0OzwvD3Kb8lA==
X-Received: by 10.98.7.152 with SMTP id 24mr20333558pfh.94.1523858506552;
	Sun, 15 Apr 2018 23:01:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:33 -0700
Message-Id: <20180416060134.26291-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416060134.26291-1-raj.khem@gmail.com>
References: <20180416060134.26291-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] libyui: Fix build with gcc8
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libyui/0001-Fix-GCC-8-warning.patch       | 48 +++++++++++++++++++
 meta-oe/recipes-graphics/libyui/libyui_git.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch
new file mode 100644
index 000000000..c1ba42eee
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-GCC-8-warning.patch
@@ -0,0 +1,48 @@
+From 1e6d40fec16a94d1a4bd40634405267200b7e969 Mon Sep 17 00:00:00 2001
+From: marxin <mliska@suse.cz>
+Date: Tue, 10 Apr 2018 15:21:40 +0200
+Subject: [PATCH] Fix GCC 8 warning:
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+/home/marxin/Programming/libyui/src/YDialog.cc: In static member function ‘static void YDialog::showText(const string&, bool)’:
+/home/marxin/Programming/libyui/src/YDialog.cc:690:26: error: catching polymorphic type ‘class YUIException’ by value [-Werror=catch-value=]
+     catch ( YUIException exception )
+                          ^~~~~~~~~
+/home/marxin/Programming/libyui/src/YDialog.cc: In static member function ‘static bool YDialog::showRelNotesText()’:
+/home/marxin/Programming/libyui/src/YDialog.cc:814:26: error: catching polymorphic type ‘class YUIException’ by value [-Werror=catch-value=]
+     catch ( YUIException exception )
+                          ^~~~~~~~~
+---
+Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/122]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ src/YDialog.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/YDialog.cc b/src/YDialog.cc
+index 92e5031..8ecff90 100644
+--- a/src/YDialog.cc
++++ b/src/YDialog.cc
+@@ -687,7 +687,7 @@ YDialog::showText( const std::string & text, bool useRichText )
+ 	dialog->waitForEvent();
+ 	dialog->destroy();
+     }
+-    catch ( YUIException exception )
++    catch ( YUIException &exception )
+     {
+ 	// Don't let the application die just because help couldn't be displayed.
+ 
+@@ -811,7 +811,7 @@ YDialog::showRelNotesText()
+ 	}
+         dialog->destroy();
+     }
+-    catch ( YUIException exception )
++    catch ( YUIException &exception )
+     {
+         // Don't let the application die just because RN couldn't be displayed.
+ 
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_git.bb
index 92d96044e..e46e365b2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
                    "
 
 SRC_URI = "git://github.com/libyui/libyui.git \
+           file://0001-Fix-GCC-8-warning.patch \
            "
 
 PV = "3.3.3+git"
-- 
2.17.0


