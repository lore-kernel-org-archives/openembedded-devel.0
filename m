Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6CF608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:06:41 +0000 (UTC)
Received: by pacfa8 with SMTP id fa8so9377512pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kIP0oljrts2hFYLbK52HRz6sklsH9f+2qrQhwZFB6M4=;
	b=ZnMU5vsnxbOQOzjIbxY6e8blh5bctkjQTw4kHeok/GhmNdPy1qo2jLGW5NedZpwwY0
	Dj283gpOBSMBaXfsYHMt2xykSZNQ9UPQ0ta627QaZbmjx9NwEeVgScKcXAwcP3Q0owaD
	DsZZl5JKuTAxh6nmzhcbt2mRryOWHC7xXZ0nXQrOYhb9yeP4jmteVb402tw0kw2hfhAy
	5LjNNkK9pVRX0ezfkTY55vYtJ5ViP8uGrWgFqlJwmwhbtVGsYGiecZdkURLjv7JwkqLn
	Pp3nZViB30PfnxCe/Wqx+keIhCagBxvA7UCidBZ9A1x1pOQ1TwjEB+byrpw/eXSAu0IF
	S9BA==
X-Received: by 10.66.188.49 with SMTP id fx17mr21891424pac.95.1445864802050;
	Mon, 26 Oct 2015 06:06:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	ro3sm33965691pbc.69.2015.10.26.06.06.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 06:06:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2015 00:06:42 +1100
Message-Id: <1445864802-11625-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-qt5][PATCH v2] libconnman-qt5: update HOMEPAGE/SRC_URI
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
X-List-Received-Date: Mon, 26 Oct 2015 13:06:43 -0000

The project has moved from github.com to merproject.org.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 229003d..0fc4bc0 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -1,14 +1,14 @@
 require recipes-qt/qt5/qt5.inc
 
 SUMMARY = "Qt Library for ConnMan"
-HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
+HOMEPAGE = "https://git.merproject.org/mer-core/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
 PV = "1.0.97+git${SRCPV}"
 
 SRCREV = "4cca434935fa4d70d6841a2c20717eecb0beafa8"
-SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
+SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.1


