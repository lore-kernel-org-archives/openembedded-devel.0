Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 84BA265C9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 15:05:10 +0000 (UTC)
Received: by widdi4 with SMTP id di4so21119578wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5zAmzVBfSPJ6QgYjm/RE2+lxhhpjOtae7pME1qJZtKU=;
	b=Q2A1InTB47deqgEzFSXUFbq3rYK9i493lOWVGZVsrneiF392WMgB+PcH6s+Keo9FLI
	HQVqQcWz/l8VEWtMiMdUYJEC7jr20TA3DL5lMtJa2f/bLsEW25IICbbtOCCgZfH9ynO9
	qHIl418c3aiPLXM/xtZgaiS7c07bMNDdQh+CtUi42wBJlppQOa4BcZQj5trrt24UTkgd
	/hZpZ0Wtnc9o1Ir17L/JQsqF9iWUUAGP3E7zkMApu0NTeHv3q0AawuPFkp2jc7J0nWZ4
	wgK/AbfXtp/fMQyAaqe0vz2IA52O6lM8TyEYi+VURIhNgiwQ1tVGgcZvUUlmc1G8LWm5
	8n2g==
X-Received: by 10.180.105.136 with SMTP id gm8mr5559801wib.13.1428419112143;
	Tue, 07 Apr 2015 08:05:12 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B505.dip0.t-ipconnect.de.
	[217.249.181.5]) by mx.google.com with ESMTPSA id
	dr7sm11370730wib.22.2015.04.07.08.05.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Apr 2015 08:05:11 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Apr 2015 17:04:37 +0200
Message-Id: <1428419079-30420-6-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428419079-30420-5-git-send-email-sven.ebenfeld@gmail.com>
References: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-5-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH 5/7] openjdk-7: use icedtea7-native as dependency instead of icedtea6
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
X-List-Received-Date: Tue, 07 Apr 2015 15:05:11 -0000

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
1.8.1.rc3


