Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAFF7321C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 18:39:33 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x67so3699759qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 11:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=byVlxZqK3f5K4yPag33LbgcTaJTNZujmPh4bT9uY1+0=;
	b=VihI2jeVscSfpH9hfc59l0VgTD0Z503QZu0gjhFB2fJu9W6FnhdRRDRdxZnRso/0L3
	i0NLeU3qB/GtkHIAeGLFcl96Cla0QRxGZX21bJvvsNPSi98tHpvieD+qGkjYE91h7oqI
	L3c2zzucIHJ3DwRHX04j8fwW2VkjquIiCSX1N5sBmbRCZB3ftMS6ZgWLEMg8jzk5j25O
	PsryS9On6lknQNklIsIGM01BBt/L2q0qf93uzWv3Y9NQHsqbgaLN7O1g4BJVdSF4iwqZ
	K92fCXUTRl981AEDj7lC/bJuWmc8NeyZeF29YQEUV20YwlgDp6EnRBJpSMu7Gs17KYtl
	uKlg==
X-Gm-Message-State: AEkoous81Xax6Q74zGWHcAQQSm3nHFKJBVZQqE1V5qHuJVKygZ9Qu0ZLY+YxhxX+qLwVjw==
X-Received: by 10.55.53.6 with SMTP id c6mr7882905qka.141.1470335974459;
	Thu, 04 Aug 2016 11:39:34 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	x42sm7582266qtc.29.2016.08.04.11.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Aug 2016 11:39:33 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2016 14:39:23 -0400
Message-Id: <1470335963-10625-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCHv2] libgit2: add a recipe for libgit2 version 0.24.1
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
X-List-Received-Date: Thu, 04 Aug 2016 18:39:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
new file mode 100644
index 0000000..dbcbb7a
--- /dev/null
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "the Git linkable library"
+HOMEPAGE = "http://libgit2.github.com/"
+LICENSE = "GPL-2.0-with-GCC-exception"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48bc2"
+
+DEPENDS = "curl openssl zlib"
+
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
+SRCREV = "211e117a0590583a720c53172406f34186c543bd"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "\
+        -DTHREADSAFE=ON \
+        -DBUILD_CLAR=OFF \
+        -DSHA1_TYPE="builtin" \
+        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+        -DBUILD_EXAMPLES=OFF \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


