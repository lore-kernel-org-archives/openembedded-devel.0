Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 79BF278316
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:17 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id 12so72452927wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1x3l4IbUxGe7DMgJYtWb4iP8IoUAVbgh13VVjY8MhQs=;
	b=KIcjW/W1FQAJm14hV9obNjhX3a1dbByEw9oDXigFOdKU5CSsbNuXor0AZiyeCZIU0s
	Ox9hwknHg77N90GjeOdteAKwu7EyDPnfx4LOFQcKvnSPpo08G1OF1WNFJmS83QiZnlL9
	COTQTh7hYGV7FBCfWx8/zsRASPOn9F8JnyWdo0tBDXRMJXRYKu9TuSmZuXa8eCo1JMyz
	d6Rci5I+Z/YpXxH8VW4N8KVKF5uzj19k/xhDoOg9nDQ2A7cBjKWjkhu2hkdI6E0mxjop
	no+WsJCDZGyTcfpI5AB03moybOYOgaJ/5oMiA0LGIVE6J9znvfokK4H62kPTGHZtNiO7
	+lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1x3l4IbUxGe7DMgJYtWb4iP8IoUAVbgh13VVjY8MhQs=;
	b=gp6CNxDJPc6TH4PhokfhQKXjcpBM6PtigOV96M+PEgvOtF3+ocBvmM6Uack1IXWF8+
	h/sfELhjYkwqijGgzpRiHG1uycZdAZTEqf0VZ4E8W2vJTt2LSXITNpfo+JILbxn/Wcfl
	pl8CNP76ayHgqlrE0CBn3FSJrjhP00ZdIxUa+bVsiNXg3ufdI3TkQAoS9z2a6bpf7uf+
	x9Ytz8IY2HbuO2A8qWKWZvP1NDQipZeUmIU6B8zdjSwFd48b6sjAzsI0HIWb80GN1DNf
	7NEpOOfX17vkAVQSDU89uasT21yrzTXdPT7Ih6Le/EWk1d2KudKEnP5vroEc+6RM2mDv
	RxfA==
X-Gm-Message-State: AIVw111J9BGmdlPm/LiHbXmTVZlyhlrU17FIfxZ7hc0kJP93pzareJZi
	KsbMyVwx3SjkmwqMvGw=
X-Received: by 10.223.161.219 with SMTP id v27mr7006135wrv.135.1500564917862; 
	Thu, 20 Jul 2017 08:35:17 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:02 +0100
Message-Id: <20170720153508.23113-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 3/9] gtk-theme-torturer: remove (previously blacklisted)
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:17 -0000

This recipe is for GTK+ 2 only, doesn't build and has been blacklisted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   | 25 ----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb

diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
deleted file mode 100644
index c419d0f44..000000000
--- a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "GTK+ Theme benchmark program"
-DEPENDS = "gtk+"
-HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
-
-SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
-PV = "0.0.0+git${SRCPV}"
-
-SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
-S = "${WORKDIR}/git/gtk-theme-torturer"
-
-CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 torturer ${D}${bindir}
-}
-
-# http://errors.yoctoproject.org/Errors/Details/35132/
-PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


