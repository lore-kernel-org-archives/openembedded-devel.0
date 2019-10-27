Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E2C997FA96
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:12 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id w9so7259401wmm.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Bf2UcVp+Vzq3Lj2vqyity/aQD/UW4z0/FM/LeFcFkbQ=;
	b=f7teb9qmoTzODwGGZZb+NwYTbJ15QbYCedYp3AduNf0B7WaG2kz14rwoeq1p/hM/O3
	tj0/GCmqODujypIAPv+Jo4fOmGWi3XukS4WwKAmBhoyXIPWJdtktF4k5vnoqVUIs3BI0
	XlTBEf09HxujyeSj9m32FkPqcww7euDSBnJCfkJH64I7G0l+wVzXNmvYH+C9FM+sAi6c
	6kacEuEs3BsNN2nub/br3TXxZomktKSMHPUuSEQPVnm7k7Bp1Um0U3qHB0iwG0q1LQpb
	URVk9AXfB2Aw4XT2BDD5+Zy/Rw1o0+YmDSOVnk6KpLmFehwrg1vDY6072r1bDkiy47Ke
	+Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Bf2UcVp+Vzq3Lj2vqyity/aQD/UW4z0/FM/LeFcFkbQ=;
	b=NjvS0kzevO3YCCnoPuchTkvgQkJp4R/lSIktSL8/cipCsm2c85GeHO0V4lR3NkbgZ0
	HFUkdyjyGJ0wBNqOzE5n7Pw9lyotPN+wnB9bDkz8m6+HOeUxqVMQIe0qmUBdOfwChG4+
	6PcBv6pN5QO4K36X4FiggyHNZlDgCq/UTYFNJT+pBbcqj8KJExuN9e2n6oGecO3A8XyE
	qnATuF7LO3BRrOUNg3J38Zhl9QU2LLh9Z4k2TOIquo3WCMwtam+owP8N9i9igRoJp7jB
	utO0k/he2vVQ3pq5MI2CFmDvGb4AYyJ8CoxFMf8D30Pv3MJ6dJ6o+qRaccRJf2KXQkP/
	NyhQ==
X-Gm-Message-State: APjAAAXzPPzbipftm8lgExeWMQmn6buWo7LQML1gxjchlifCI2ZLdGxO
	hD1oOr/yd4m3YofdQUMit79rFq8F
X-Google-Smtp-Source: APXvYqxTJr8FvLMRlSuK0EGDrSOb1Sl0eSJ1cb9k+4YsEXuTNfBfGv3tx1JtYZqFcDrLLdRnBU4uYA==
X-Received: by 2002:a1c:8189:: with SMTP id
	c131mr13087598wmd.151.1572219373435; 
	Sun, 27 Oct 2019 16:36:13 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:41 +0100
Message-Id: <20191027233545.4146-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/19] glade3: upgrade 3.8.5 -> 3.8.6
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* online help support was added - ship it optionally
* prettify recipe a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-devtools/glade/glade3_3.8.5.bb    | 23 -------------------
 .../recipes-devtools/glade/glade3_3.8.6.bb    | 18 +++++++++++++++
 2 files changed, 18 insertions(+), 23 deletions(-)
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
 create mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb

diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
deleted file mode 100644
index c3da3e9b9..000000000
--- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Glade - A User Interface Designer"
-HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
-                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
-                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
-
-inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-cache
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
-           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
-           file://0002-fix-gcc-6-build.patch \
-           file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
-           "
-SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
-SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-FILES_${PN} += "${datadir}/icons"
diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
new file mode 100644
index 000000000..8ed30944b
--- /dev/null
+++ b/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Glade - A User Interface Designer"
+HOMEPAGE = "http://www.gnu.org/software/gnash"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
+                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
+                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
+DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native yelp-tools-native"
+
+inherit gnomebase gnome-help distro_features_check pythonnative gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI += " \
+    file://0002-fix-gcc-6-build.patch \
+    file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
+"
+SRC_URI[archive.md5sum] = "c16756952967f7316d64593124761027"
+SRC_URI[archive.sha256sum] = "aaeeebffaeb3068fb23757a2eede46adeb4c7cecc740feed7654e065491f5449"
-- 
2.21.0


