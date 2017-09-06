Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 248D477BBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 03:21:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m1so2513042pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Sep 2017 20:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yRGjXpfkfBAUYFahI25jzEhSHIzBtaOZs3fQvVzKm7U=;
	b=Lh3ejnWFJkzqamf2fEJOFHNb4Czhwx2ubVQNdRkMrTGMlp/Sz+miY1TVZKWnTZ0gBv
	B3u9JeKIYJkMHUXWlqFgIIG/ZTg9gwB/dg6q+3WyHopKCTcaCqmceGT50Ul64/ssxC0x
	GejnLY5mF6wYtX4yQ21mGmPRB5DTxuYrWMQcgr69xTQMK6xYT35R03fkGyVGjzvIMGLP
	wghPJYYSu+Ic/WeVfqcnOp14hfs6NdnUPf9Rrr9mqhXNsdSjq+FOVjzBVeH/YoAG6R+S
	bmLO4Fyu1AfFsfGa7/gv7hoLk5Xa7/qSdIahuX1Tw9Mg/CVGoM3jjYenEXwl6VNuKvoh
	afDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yRGjXpfkfBAUYFahI25jzEhSHIzBtaOZs3fQvVzKm7U=;
	b=ndq5sHe52Ts0wCHKnR9MWfHE7qXnzjiXj6Kj2ZHBieXrzvi2mANHU7uF7GDtfM7Yi1
	MOfc5DrLciVmTiAPQ6XlMtP8sU17JzzTL0ljbwrGXknH+X1M+pACDP6LFK/Rr/P9N0sW
	DqX94DGqQ6FrckusqQSkAtqFArnN2MCYpNFzeZlwaz7r2ShZ9dSmCqtezTAQK1REv7Q8
	hvCdzq3EvQzXSqPap5P6FGLuLzSWcCC8b0/OClB0EDpooPwPwbeUzKydjSbiOFoxyZa5
	+N9dHtOBqWoluJTZ9nsjw1BPQeo8yANu6AS7T6wjg8p3GtI9sDFg1ysVLErAI+0MlrBw
	2TNQ==
X-Gm-Message-State: AHPjjUjLxsQWmfPkCmJ+gQMiEYd2Gp5DSvlBS7/Ud4CURIltY/0POlFW
	GBpPXVRqP/KJrA9bf4Y=
X-Google-Smtp-Source: ADKCNb7yh2DTH+NGhQVpSNoOtIeWpmMULlv2Dl8fayNVBf4AqYORRdij1T73nA0nIAJYRH7ubsfqBA==
X-Received: by 10.98.131.193 with SMTP id h184mr5903307pfe.307.1504668103980; 
	Tue, 05 Sep 2017 20:21:43 -0700 (PDT)
Received: from ankit.iind.intel.com (fmdmzpr01-ext.fm.intel.com.
	[192.55.54.36]) by smtp.gmail.com with ESMTPSA id
	e27sm509146pfk.130.2017.09.05.20.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Sep 2017 20:21:43 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 08:55:47 +0530
Message-Id: <1504668347-20700-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Wed, 06 Sep 2017 03:21:43 -0000

 7b7c15c build: Include check for xxd binary when in maintainer-mode

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-connectivity/ell/ell_git.bb | 17 -----------------
 meta-oe/recipes-core/ell/ell.inc            | 13 +++++++++++++
 meta-oe/recipes-core/ell/ell_git.bb         |  5 +++++
 3 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/ell/ell_git.bb
 create mode 100644 meta-oe/recipes-core/ell/ell.inc
 create mode 100644 meta-oe/recipes-core/ell/ell_git.bb

diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb b/meta-oe/recipes-connectivity/ell/ell_git.bb
deleted file mode 100644
index d259f52..0000000
--- a/meta-oe/recipes-connectivity/ell/ell_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-
-do_configure_prepend () {
-    mkdir ${S}/build-aux
-}
-
-DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell.inc b/meta-oe/recipes-core/ell/ell.inc
new file mode 100644
index 0000000..7bed240
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell.inc
@@ -0,0 +1,13 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_git.bb
new file mode 100644
index 0000000..0589809
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell_git.bb
@@ -0,0 +1,5 @@
+require ell.inc
+
+S = "${WORKDIR}/git"
+SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-- 
1.9.1


