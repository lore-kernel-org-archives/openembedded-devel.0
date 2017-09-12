Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 18E95784D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:33:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p17so8737609wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5yLvWBKvlPFwG6wYfN1cl54yxQxdifFMZhSKIA2X7XM=;
	b=eaGiWWMmkw8V1uImTQEclWAqP9Lmhzk8OXFwn4gpcTwU4VR+avVwCMn2w6VjuHEDh4
	FP9fhBzUZwrWugUFs9wiGOHcIvUeIsTOWSVVWzdmY6JDOldZPTEVffrG/Zj4mfDVKkvo
	g+3o5AdMlCBSFzt3eSVUM9drP3RLyxAK+aWpQcQ7wSwqjdjDbfvQv0tIgw53y7PX8v2z
	Vi1bPnVsKFu7714l34WOYf1Pt8Nx7jGjR7yShf5QEbUm7obRSMvu3EYajVUE+YlSz12R
	ZHDHp97S1v+ZvNSnNIzlq2GwzYsbFswf+RMYJOpKO5gJ8Y+q7qqEEi58VemIat1074v6
	57cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5yLvWBKvlPFwG6wYfN1cl54yxQxdifFMZhSKIA2X7XM=;
	b=Mln/ucx4fJCYZc+S347b0aYYcnDgrKANJfACn/VHMaNWceZP6g6aQylOZNNCEzO2fl
	l9ykT6x7QlMDKfAL0YK6NkG07ot538pbqJHaL4/S7uw6pHQOXkdt4mjQybRSOuA+0H4D
	VOoRJBw+/5L+CtRoR1c0fIWgL5pAGFQ6RpbXgxOaoeY8GAupmzvhz0Kz9wiyBCtkE8XR
	RHeTvc8oy/zLZACO2pwl1lwyQg+VrWNvt7j+93axOSYlryBulCnCWk3+BddcawYSb2u5
	VvkzZzJaBYcQ4XHj3DBdFmeCBgXhmfSnKkL//xjRsS9xUWKdsAdouv3NKSKX4assTJK/
	U1Aw==
X-Gm-Message-State: AHPjjUggJco2nymqh/78JrTEMhIJ1iX0JKNkBWRVrdFQ9PwNiY2tybsB
	GShsjFqb0jOLozjWpB4tqMntmA==
X-Google-Smtp-Source: AOwi7QDACpuA8TCLdOfVeoj6Hz9YiPfoKId3W5fEgum8ni3CApA45Iaxzvh9JQOQkYgr4ITJm1+9qQ==
X-Received: by 10.28.109.77 with SMTP id i74mr11052974wmc.67.1505205240353;
	Tue, 12 Sep 2017 01:34:00 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t15sm895651wrb.41.2017.09.12.01.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 01:33:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 10:36:13 +0200
Message-Id: <20170912083614.5300-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912083614.5300-1-Martin.Jansa@gmail.com>
References: <20170912083614.5300-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] system-setup-keyboard: delete blacklisted
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
X-List-Received-Date: Tue, 12 Sep 2017 08:34:00 -0000

* there was some work on it recently, but still contains QA issues and no
  reply in 2 weeks:
  http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114478.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../system-setup-keyboard_0.8.8.bb                 | 33 ----------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb

diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
deleted file mode 100644
index 0bd7af734..000000000
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "xorg.conf keyboard layout callout"
-DESCRIPTION = "system-setup-keyboard is a daemon to monitor the keyboard layout configured in \
-/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d snippet."
-
-HOMEPAGE = "https://git.fedorahosted.org/git/system-setup-keyboard.git"
-SECTION = "Applications/System"
-
-SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz"
-SRC_URI[md5sum] = "399003968ccc739cddd9cc370af377a0"
-SRC_URI[sha256sum] = "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2d6fc1b645abcb860"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bf57969a59612c5aca007b340c49d3a2"
-
-inherit pythonnative
-
-DEPENDS = "glib-2.0 system-config-keyboard-native"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-do_compile_prepend() {
-    ${PYTHON} -v get_layouts.py > keyboards.h
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-    install -d ${D}/etc/X11/xorg.conf.d
-    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
-}
-
-FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
-
-PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted system-config-keyboard-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


