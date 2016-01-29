Return-Path: <simon.aittamaa@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 55FCE771E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 08:24:11 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 17so42372662lfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 00:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YSDA+mMakrUK5Td1DDa/kNFqQhq/w9xYMOvU7/tQ9tE=;
	b=kqgZvxjf+BrTMkyPoXlhaYIuWIEIu9/t9Le70vnGdcRt5CaeQMZ5obdZiZgksURyQ5
	gB2rSEBICuiFRhTB0ATyo5vj3n6gEW4uYj4RLZFmZOT2nbLKeKgWd7oBD+vEmieG8UPt
	jrzWR6eF/TU8ajy5M9nVYUSZFSZpHN/uWaKDnT+YLGgPX1fuDLaAwaKyRJ4SLvh+Oskc
	bybQg+LiJ3k3JQnSo/mOfVMXNWrLT9WARYMwBC22aMH7DMnd51zeSxYIlmkN5R4f/Ep9
	2DvBYjQUgGhqEql5i1hC/ol/B06a/cRnKIeLmGrtAPJJxlz5RjynsyQZncHOPZb1Qzue
	rcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YSDA+mMakrUK5Td1DDa/kNFqQhq/w9xYMOvU7/tQ9tE=;
	b=eZGrGPzXgh+nhdYpM2VDedtn8B2Eer/LEfYD6l1KQpz3RgehoBGQTE3eNdkAA4JVqL
	tKhiKvigX7QDiqa6wtbxX2qQ9085xaLHjrPoV49n6BzIIN2C48xEJWrVDg4oktbUc+nF
	AgRCHjZiMAobmzKShTeiOnfyNWYFew1oayDQ/BDBFxM9eutGa/1/Jb8tFfCDRZUNN+e6
	PBzmZxTnh0LfEK3Zqf0bpkyGvxAfyijpocbxYoJOtthipnT2w3lZH87u1v15tENsULVk
	2Qv93NLBPz99ZYEKHB50AOZ8EVuW7T5VFDU3EivepUaILA0gwNwGZeFZ6RXkdlxidovE
	DJIg==
X-Gm-Message-State: AG10YOSzGpAx5VrUJDIdf8nNzTx7zo7szs4TS18+V3TuMNs29VSO4UMJk9vzYhwHl5GhIw==
X-Received: by 10.25.206.137 with SMTP id e131mr2819866lfg.67.1454055851443;
	Fri, 29 Jan 2016 00:24:11 -0800 (PST)
Received: from saa.indexbraille.lan ([88.129.244.25])
	by smtp.gmail.com with ESMTPSA id
	h187sm1959531lfg.18.2016.01.29.00.24.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 00:24:10 -0800 (PST)
From: Simon Aittamaa <simon.aittamaa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 09:23:30 +0100
Message-Id: <1454055810-25770-1-git-send-email-simon.aittamaa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [meta-qt5][PATCH] Fixed installation of qtbase-files.
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
X-List-Received-Date: Fri, 29 Jan 2016 08:24:13 -0000

This patch fixes three problems
    1) Running on a case-sensitive system would result in an error
       due to invalid casing of pattern to install.
    2) Using install on symlinks would cause multiple copies of the
       same file to be installed on the target-system, since install
       doesn't preserve symlinks. This wastes a lot of space and it
       causes ldconfig to complain about non-symlinked files.
    3) Leakage of user-ids, i.e. cp -a would preserve the uid/gid of
       whoever built the files, which is usually not what you want.

Signed-off-by: Simon Aittamaa <simon.aittamaa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 3ef5923..62c0ab5 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -229,10 +229,10 @@ do_install_append() {
     # install fonts manually if they are missing
     if [ ! -d ${D}/${OE_QMAKE_PATH_QT_FONTS} ]; then
         mkdir -p ${D}/${OE_QMAKE_PATH_QT_FONTS}
-        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
+        cp -d ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
-    install -m 0644 ${B}/lib/libqt* ${D}${libdir}
+    cp -d ${B}/lib/libQt* ${D}${libdir}
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
2.7.0


