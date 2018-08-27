Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA5F78EFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:48:07 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id m4-v6so7238924pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oM/mR5hpCZototr5VurTXV3HAaiaEIqkmHk3kSVrW2k=;
	b=Gv9/2kA6+ykGuoUoG1Xg6UHbByGk9/2KEexSxqlMdANZfNHqQ6zDaSA4+OxcNNJVQ1
	GPXaJOTAi2/wAkFwuXLTQmWHHaDlhcghofu7CzsZ8ux9QC0Lr65U08R3CiaujO3USzjA
	1aZdD8i20U+ZpzN9B7iyreuMbGXZIDBJTJtoicy4baMEx8Z5vYYyjRKRgPMOcqkIyQ9I
	n+hZ/IbrCWhs7Jm5IEbY0/2qNnEilnFhKvvs/3QnMwYx/evdxKGdciXpjY3vsmz+1SuV
	D+YHH7YZozJmK03LJUgtRzjGm7iIem09mF2av/toCIA3jLfpki2XrgsBqtdVjJVqGG/W
	v2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oM/mR5hpCZototr5VurTXV3HAaiaEIqkmHk3kSVrW2k=;
	b=M+vYMWxF7Re/6wYXyTrEMZ50kaVu4yr8Wd8orH3otzDFGqFjtlajSE/GHoeIb8JoXv
	zgODsyFnkPBi4Lp3XwYMn8w23htThhVfZF2AT2EKEOzjA+025pOGPi3bOH+xHV6GbM7N
	h/ZcwhHn5MwqqrIy+flonzEiN7dl01XqiGTvAEGoCoe9r5Ce9Ac0et4zJoAN3Ij8HjEX
	O712MZ/XFyYjvbkAMtqXC3Fkn62XqTrNuqN9iuFTU+/zWVJbLuHArtsHnX+Jn13mw7Kk
	Ak4FfD+zIVi/G2XRpghLLFx6+MTg8POewOJV/3U6cizB7EbcrxjhCbKMP7pPk3Xbdera
	BgGQ==
X-Gm-Message-State: APzg51BdWWHhoE94bMgoUfzouxpzfExo6vhzczHRoZF8A0FU+TgYGru0
	djwjsaG+GOmRGdTb9zMpS5GUuyeR
X-Google-Smtp-Source: ANB0VdZhOafqBjtJGOeP7AEm9MmZ9+1oFXSac9ROpHDCfa6aJZRbMVwjb6C3gPFKrkNrA5n0cvO7iw==
X-Received: by 2002:a62:c082:: with SMTP id
	g2-v6mr15346684pfk.72.1535392088631; 
	Mon, 27 Aug 2018 10:48:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	u43-v6sm24454446pgn.81.2018.08.27.10.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 10:48:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 10:47:55 -0700
Message-Id: <20180827174757.7027-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827174757.7027-1-raj.khem@gmail.com>
References: <20180827174757.7027-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH V2 3/5] gedit: Add dep on python-six-native
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
X-List-Received-Date: Mon, 27 Aug 2018 17:48:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors e.g.
recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/common.py", line 31, in <module>
    import six
ImportError: No module named 'six'
make[3]: *** [install-data-local] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
v2: Depend on python3 since thats what is needed

 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index ba425ad6b9..ea6439d91a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,11 +3,13 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native gnome-common-native libice"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ \
+           gtksourceview2 iso-codes intltool-native gnome-common-native \
+           libice python3-six-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit distro_features_check gnome gettext pythonnative
+inherit distro_features_check gnome gettext python3native
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.18.0


