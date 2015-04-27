Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id F1C7C727E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:18 +0000 (UTC)
Received: by wief7 with SMTP id f7so1478697wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N8DoOOOfscdEDAnx9oIvICmRhq2YAosTkJCmcGT6aoE=;
	b=lNBpA68xEcRAMGXLHNyHlnXXJAn4DOkIzBxlUXnJaGyPt+Q/vBiyHyPMIxERYtrQ6p
	CcMJpm14NTKihXjMZEt03Qe/K1nMw0ZT2hGxBFTe0tBgmzTXQFuCDM0BDuL5Qp4oacrY
	cA4+Xm8ndoP7Lt6mjOY6SMzU6kQ304ctJtRLZZBlgBrQ11p3wrwKWWb/F/AFUL7qhReq
	WOPbBX9WSJD5hToSIOUeDzjS2g7oPbGIg6rQxv+bW8yqJNYvCnG/YtMNdv1YPUxY2O4B
	8jl1xCKuIrIapBV8ni9KIniP1ajkM4kpkgwj/Gkhu4ROkRkw4O0chkHPgJypo5zXGQu+
	2AzA==
X-Received: by 10.194.57.11 with SMTP id e11mr24524893wjq.19.1430165599445;
	Mon, 27 Apr 2015 13:13:19 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:18 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:13:00 +0200
Message-Id: <1430165584-5634-6-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 05/10] openjdk-7: use icedtea7-native as dependency instead of icedtea6
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
X-List-Received-Date: Mon, 27 Apr 2015 20:13:19 -0000

Due to problems when using native rmic, I switched to using icedtea7.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index b9ec571..29519fa 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -26,7 +26,7 @@ PN = "${JDKPN}-jre"
 PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
-           icedtea6-native zip-native ant-native \
+           icedtea7-native zip-native ant-native \
            zlib \
 	   jpeg libpng giflib \
            gtk+ glib-2.0 \
@@ -101,7 +101,7 @@ EXTRA_OECONF = " \
 	\
         --enable-zero \
 	\
-	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native \
+	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
 	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
 	\
         --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
-- 
1.9.1


