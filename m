Return-Path: <simon.aittamaa@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 335A973D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 08:34:09 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 78so90555844lfy.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YSDA+mMakrUK5Td1DDa/kNFqQhq/w9xYMOvU7/tQ9tE=;
	b=WkI6+UmRjZkEHJlQPCDat2sGSv7sJ+3phszQ1rZ4PpZrnT9XDz7XU2LHNndFRVuac2
	eA0R9o2sGciNg9zjswDE8bcpdMxQ5Q0ACvrRdmW9oGkx6uxyB0B/ulnxvMIazLP+kkyF
	Dyep2RYcqbl0ZDMoPfn854Tv7MQC0ROroU836jicG3J2UzrhgDNS+innWmiNYuTHkK22
	gYpQ+fRSaKQJkDvy7oJpsDb7kE9+gFSBM/P/tUu3IUkOjqTeM+x7lgFm0/uw9i5JPTpb
	sfOEgf/l2oEoqAr/pSTkarcJ+VvLqRjZfKQS5tJKF8nZe1FVfkxA8AhNRSWU9ZK2zJ/D
	ufLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YSDA+mMakrUK5Td1DDa/kNFqQhq/w9xYMOvU7/tQ9tE=;
	b=YtXGL/5DLYMp3ayuJGnQFTxKbsNn/QsPlCf8g1fN25WLrUaa4rfUiSlPOlILPMCc9L
	mp9uvWT/m+jtLj/WPKQL+N7p+VuXFe/iSGbST0wWr2D2b9TcdDIbC+gQlkuY4Y7hwdru
	8R4yLebIReeFajcfjdCPkoqc56DmynoPTBZYD/QIXmRljzP+1Kq5OxDoLkx6HK2dxHaM
	fSTTsR0NgV4tTYrAZOCUAjFNYc/dqRbPwpBdRD41Eir5Zn5FWh2goV4MJcFH5O1qtHIt
	QprqKw4h+soCgFAp9D5Fdgf4pxLvRTdZDGlnjwOYn4uBtvZpAYiJue8oT19/Fj1suDc1
	0JMw==
X-Gm-Message-State: AG10YOSPxlLRMtM8RtVTtmec8cRE+G7OpxprooVrOdZUXmnGwoYWg1JNAHnzx7QIX7SkyQ==
X-Received: by 10.25.15.23 with SMTP id e23mr10685512lfi.111.1454920449382;
	Mon, 08 Feb 2016 00:34:09 -0800 (PST)
Received: from saa.indexbraille.lan ([88.129.244.25])
	by smtp.gmail.com with ESMTPSA id o9sm3855838lfe.15.2016.02.08.00.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 00:34:08 -0800 (PST)
From: Simon Aittamaa <simon.aittamaa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 09:34:06 +0100
Message-Id: <1454920446-11153-1-git-send-email-simon.aittamaa@gmail.com>
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
X-List-Received-Date: Mon, 08 Feb 2016 08:34:10 -0000

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


