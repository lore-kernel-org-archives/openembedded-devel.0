Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 530FB7FC14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:47 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id c13so4790867pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fjP2Dwg2+rbDMgD2e6n/M6afHQI68v/jFSNHQnKhGHQ=;
	b=g8sm1azE0N7JNbonpqlQU2e+gUZEM8xvvrZLZsk18CT/CAT8wlpCGekV0uVEZGmfL3
	xEBr55PruIJSBF/vRPQ4qFouYVa0ieN6vIPKLIyGNnd9mGvg1vZ7bWqci+kBQg5PO1TA
	67Y/aQODlMPW/bIcjC1C4AYfTiUXq88l0ywGTqv2XOn+vwvKmffYMpmg2YlAauRyyBWv
	9NPuMfAnfk1Qc7SuHu2M6eOoeB0aYbzG6krKYT2y3FCnLR/iJiIslsraQ6ZW4OE6vMxO
	Wo35RY9zrp+3E04R2LJCFK1TGkJivwDmmjjBDAdXJ9S8K6CLciajjHDGYBPDnCysHmB8
	gnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fjP2Dwg2+rbDMgD2e6n/M6afHQI68v/jFSNHQnKhGHQ=;
	b=T4eaQHjNxrlQRxPVf5x1fSFgdL/BN9HG36N2GWeWdQNIKlWVI4TDTba6scTcP8UJzk
	5HxBv1gUT2nPXkjfR4FqQg32Zatd2SjHfG/3y2KqeCRnj6v/8U/DTN5xso2AcRLKIrYj
	5V65tD4r0CYCx9zC9kFd50xOeX2FULKakMDXevKeKgKQOnoGjioyOsmsMR0IAASgA07H
	M5//Dxu9raPweSs3P+3+7Bq6HLCPdl0l2AGgWT2k6yxeh9GLAL99oCE2+MHLYT4Ibouj
	gDRVSlidRyuj12315SbDZeP58mfffVTJL9AdBKDHVrRJp3NFNgh4MveHG8PzNqEsoWF3
	tL7A==
X-Gm-Message-State: APjAAAUByXDd6HkdElNeYA6fz+rhsH6oFUOM+iF1LVKYU140JnNzSm//
	cCQtrUKKkqJ0adv22ntm1I1sl7+4Gg4=
X-Google-Smtp-Source: APXvYqxJVO5r6r4PrAmmSVpmWyDKIp+OCkayOd9PGQJSKnTYUdXZnHj+/Gu8p4/n9kEy94uZjFkaXg==
X-Received: by 2002:a17:90a:e389:: with SMTP id
	b9mr19034758pjz.7.1576886808048; 
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:15 -0800
Message-Id: <20191221000635.1573390-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/23] cli11: Fix multilib build
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11_1.8.0.bb  |  1 +
 ...stallDirs-instead-of-hard-coded-path.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch

diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
index 404545d5e7..dd129cbec9 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
@@ -8,6 +8,7 @@ PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
             file://0001-Add-CLANG_TIDY-check.patch \
+            file://0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch b/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
new file mode 100644
index 0000000000..4541cd929d
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
@@ -0,0 +1,39 @@
+From 8c51221f748bca1483fe1141e584867d2ff34a07 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 16:26:39 -0800
+Subject: [PATCH] Use GNUInstallDirs instead of hard-coded path
+
+Upstream-Status: Submitted [https://github.com/CLIUtils/CLI11/pull/373]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7073a0b..5236fd2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -120,17 +120,18 @@ endif()
+ configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/CLI11ConfigVersion.cmake.in"
+   "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake" @ONLY)
+ 
++include(GNUInstallDirs)
+ # These installs only make sense for a local project
+ if(CUR_PROJ)
+     # Make version available in the install
+     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake"
+-            DESTINATION lib/cmake/CLI11)
++            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
+ 
+     # Install the export target as a file
+     install(EXPORT CLI11Targets
+             FILE CLI11Config.cmake
+             NAMESPACE CLI11::
+-            DESTINATION lib/cmake/CLI11)
++            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
+ 
+     # Use find_package on the installed package
+     export(TARGETS CLI11
+-- 
+2.24.1
+
-- 
2.24.1


