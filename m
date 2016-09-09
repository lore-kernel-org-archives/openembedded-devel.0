Return-Path: <net147@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 046AF6FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 06:11:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so3515779pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 23:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DkGrRawkIb/Hhcqyu7tWNitlkf3usRjvoBhjR/wgsOQ=;
	b=khu/ZVsvQHzv55Fdge/uJVeAs8iqZaCARd0urEm7fsoh+dU4pntczceEffgOhQvhm7
	McDdlo71btSWTzNvgD1/CMOl77Ev0Hd8Y2MkT4aHEJ3G21WckRV4S2wTyHde0Qsdas3r
	crDGd9+MlTCpAh6PIjZ63BbPt7J7pyGSxuzuhss4GKquiA/alUUPUL6L2GLW1nmmA9st
	pu5QcziA/OxuOYuvJZ2/0YsAeXmjJP14G+xub56oxqARbm+RDNDz5Mi/AabdhPWnTfde
	hduev0VZbDOc8e2vYKpRr5fjRXuHgBGgsw+hFUVMkZKgl1QxlFGjW1b+JoIB6wN4IgTD
	NU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DkGrRawkIb/Hhcqyu7tWNitlkf3usRjvoBhjR/wgsOQ=;
	b=kCd5UFesarP4aGthHYMVM5Bwb0H7WbHAxVJYrmb7aUm1Bz/EzIjNgIAM6O3UxQ3uKc
	FoJDFq36PKF4kA0cfg//mZ9UvtDOx+k6uQxBkmjTiZzPfr1vgsQ69lxLoBXv58TCQqgz
	Fy7VZCyFrB86vZip08SpMAM0jX6rHXfkcyqmQHEyrpcNY+SKRIYMwB4fhWfmNtmsxJg2
	rfAa6lEk68ZF8BMQ/c2acba9dE2oKbKWg3FMoZhkLgY02yJAPx3RL/W7XetA5sbkECiB
	LFAPvTNBhalXLn1okViiSCC18p7K1scbM4T+LfAqSgW8TdoTa5lTQc/LJyP2AzsxfVEj
	Fo8g==
X-Gm-Message-State: AE9vXwPR/ADP6G4BH0EvvtKu4a2StcvzWFQfgEoPnUnnNc+J/m/ISmgpZbKEHeAb/BQAbQ==
X-Received: by 10.98.141.219 with SMTP id p88mr3399861pfk.153.1473401501323;
	Thu, 08 Sep 2016 23:11:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id x9sm2035565pfd.70.2016.09.08.23.11.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 23:11:40 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 16:11:19 +1000
Message-Id: <20160909061119.3402-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][PATCH] qtbase: avoid qmake errors due to missing oe-device-extra.pri
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
X-List-Received-Date: Fri, 09 Sep 2016 06:11:42 -0000

An empty oe-extra-extra.pri file is created if it does not exist to
suppress qmake errors.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ee41db5..eda57ac 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -208,6 +208,9 @@ do_configure() {
 }
 
 do_install_append() {
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
+    touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
+
     install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
 
     # Remove example.pro file as it is useless
-- 
2.9.3


