Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CF85B6FAD2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:51 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id n12so1642747wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LZ0ehr2cfmtq+Mhp4flUCDpKa6SzWLW/cHimR1NW+kE=;
	b=NoBs2Zip4GFHW2k8xSRYIPUCwXpNcfzL8qD79OB373RQNMD3McB90INjfAwnHt/k+4
	MNDoO/Si5l/t3PDThyn1tGKHHA3nYuNBDNWQxvi2TqAWGznZcuUSw+CADb/V0UkyQF8W
	iOQCGOfUc8zRd3Sf4JOOmKcnvdz/Ar/9xOnD5xWyM3EeJvTpfG6ww6+lKwQ4LbfCTgLC
	N9Nf6kvQIcGdhQVXmctQ5qOANgP0OC0pMWJ9N0IZ8w4Wn3x7+1PBKD6VGgoa3Ui9gR7K
	vPwJbtuzRo0HWdRS+W7HJ+l8E2fn4WEEMoceDQUBSX8NrIKM0JCdV048wc7ZRcwtmNza
	YfSw==
X-Received: by 10.15.56.65 with SMTP id x41mr300243eew.13.1402006132280;
	Thu, 05 Jun 2014 15:08:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm17721833eeu.16.2014.06.05.15.08.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:54 +0200
Message-Id: <1402006139-27614-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 05/10] packagegroup-qt5-toolchain-target: Add qtenginio, qtwebsockets
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:52 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index b2c5474..18ecb4d 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -56,6 +56,9 @@ RDEPENDS_${PN} += " \
     qtdeclarative-plugins \
     qtdeclarative-qmlplugins \
     qtdeclarative-staticdev \
+    qtenginio-dev \
+    qtenginio-mkspecs \
+    qtenginio-qmlplugins \
     qtgraphicaleffects-qmlplugins \
     qtimageformats-dev \
     qtimageformats-plugins \
@@ -84,6 +87,9 @@ RDEPENDS_${PN} += " \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtwebsockets-dev \
+    qtwebsockets-mkspecs \
+    qtwebsockets-qmlplugins \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
 "
-- 
2.0.0


