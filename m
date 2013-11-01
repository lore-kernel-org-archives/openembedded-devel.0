Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id D1FB36CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 17:48:10 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t61so4220471wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 10:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=velIoU7N4DtmOrzLm8J0W8QWDdZhXhQOWxxopKAFzsU=;
	b=mdY/k8eW/qgb3xtqcEE/K9A6TVP1a8PFFvY/vlxAlr465LJ97XSbOpwvlWMRk1vvOE
	pgt32XMVmXIUVGxjz5qm/lwyrC74f4PDBqsWRxxx/kBWzsZb3XecUfE7e8+lrJWIoQlg
	/iNTJZu4hTUVHmX5Zsd8VKg8pICVkX//9KtPDulaSd2QByosuEqjDfvwIJ2ngOQ24p9E
	R7YjI/LjB+kVGDvdMqVciZMSxRrg+y+MCEkxJpEeI7Ln92J5mzA94iIi1hRI2vg7HGlr
	CkUhjx4Jq1DFRmbT0wlKjZbKUqMW5RrMhLJjRbgebb7ulmjZsvULNT9hY1fOmXQI9yq4
	Xpbw==
X-Gm-Message-State: ALoCoQnKM8rCCh1FKlulkFyZl1cykIrmfx7qAPaVzHT/POlXKU2oLs19tJGX0STkIN/OSrCvLaQq
X-Received: by 10.180.78.165 with SMTP id c5mr3337579wix.3.1383328092250;
	Fri, 01 Nov 2013 10:48:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id td6sm9582230wic.10.2013.11.01.10.48.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 10:48:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2013 17:48:07 +0000
Message-Id: <1383328087-1610-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] mesa-glut: add Mesa's OpenGL Utility Toolkit implementation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2013 17:48:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/licenses/Kilgard                         |    5 +++++
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb |   14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/licenses/Kilgard
 create mode 100644 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb

diff --git a/meta-oe/licenses/Kilgard b/meta-oe/licenses/Kilgard
new file mode 100644
index 0000000..8836db1
--- /dev/null
+++ b/meta-oe/licenses/Kilgard
@@ -0,0 +1,5 @@
+Copyright (c) Mark J. Kilgard, 1994, 1995, 1996, 1998.
+
+This program is freely distributable without licensing fees  and is
+provided without guarantee or warrantee expressed or  implied. This
+program is -not- in the public domain.
diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
new file mode 100644
index 0000000..7006b41
--- /dev/null
+++ b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "OpenGL Utility Toolkit"
+LICENSE = "Kilgard"
+LIC_FILES_CHKSUM = "file://include/GL/glut.h;md5=4aab626c830aed79d7b2e5a76dfa2dd6;startline=4;endline=8"
+
+SRC_URI = "git://anongit.freedesktop.org/mesa/glut"
+
+SRCREV = "ee89e9aeb49604b036e06f1df6478d32006b30cd"
+PV = "8.0.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
-- 
1.7.10.4


