Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8F51B60272
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:32 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b9so13437562pgf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=w10cxoA9apieu4fl0ftv/Bea6Dm9uj5kTazVACjsLQk=;
	b=HT8vfNXoUgggVtnprmvFUitxszz3/p07Fvx4ABz+r5AvJ+N66X/F8Y5u/KU0D5bSvV
	O9SOcyxqXqjn282dSbtjEJvDaKAUMtGDApVpyVYxnOQR7rp2oK2RKI+ia4MUjx8WKcCL
	xTb/Pk6C1udSCX/CYokxg7xC8ey0drqMme/dNbTcsKO4ohm64IvF8TXg6IJ9/72cRZ5a
	TUgWHoEFe3gBRBNCsEyCQpm8ds85j3XAVZJiTEmWWLTRaGng0LtkB3Ko23fXBwtuhLST
	LBntd9BRClujiOVhQ4xc0Lz+hZe0TSce1dNf8D0Z1mqnVrCMW4JKEGCuFGtazCpj8iCG
	5kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=w10cxoA9apieu4fl0ftv/Bea6Dm9uj5kTazVACjsLQk=;
	b=PmGo67lXS9vwsYMbrJbF14jmOO9pMts5+yojKkAlV5ONveB8QDyYLlnH4SW1c2e+4f
	7HMquTY2RiR0CpMyDXc0ItR/Wi3uAA5mRIwBFNqkAsNvQaJ3Oe/WSgluCZo6DsJTp4zd
	4F516po47LECybYUybwV2qzkDXSwLmxBX0pbgjAqO+HikVtRZUjTPA43AzdiIxqlBoGJ
	h8e3AXu4RtAMcrT28FyWKrmChJN0B94DGQNM6n2ftWI2ciiv1py4pwsUrg35n4CNZ5vH
	rWpI3zIeomdwIzE+3vqDxZyzwGPDVkNjOAFkca9vfOLydi48qKFZF0iLfpjOWhEkarJe
	MgUg==
X-Gm-Message-State: ALQs6tBqA6CL33NQvpACf1hlGoDQTHSE5qFKZjYpmb59dtAvoQ8ZRxfm
	scDraNKPEdXJ1LH/sh2QmBljWQ==
X-Google-Smtp-Source: AIpwx4+j6eHjs1+1+ZdVg3cc98lefYQ+JjJ+oz+oaRMqDYmisnYUKzU9Od2WFK+s5ToZ12uW92+ggg==
X-Received: by 10.98.233.11 with SMTP id j11mr28112832pfh.205.1524665613506;
	Wed, 25 Apr 2018 07:13:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:25 -0700
Message-Id: <1524665609-7709-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/6] libmusicbrainz: refresh patches
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:32 -0000

used quilt.

Details:
Applying patch allow-libdir-override.patch
patching file CMakeLists.txt
Hunk #1 succeeded at 36 with fuzz 1 (offset 10 lines).

Now at patch allow-libdir-override.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../musicbrainz/files/allow-libdir-override.patch              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
index d59d12e..db4d6e8 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
@@ -6,11 +6,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 
-Index: libmusicbrainz-3.0.3/CMakeLists.txt
+Index: git/CMakeLists.txt
 ===================================================================
---- libmusicbrainz-3.0.3.orig/CMakeLists.txt
-+++ libmusicbrainz-3.0.3/CMakeLists.txt
-@@ -26,7 +26,7 @@ FIND_PACKAGE(DiscId)
+--- git.orig/CMakeLists.txt
++++ git/CMakeLists.txt
+@@ -36,7 +36,7 @@ FIND_PACKAGE(LibXml2 REQUIRED)
  SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
  SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installation prefix for executables and object code libraries" FORCE)
  SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation prefix for user executables" FORCE)
@@ -18,4 +18,4 @@ Index: libmusicbrainz-3.0.3/CMakeLists.txt
 +SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries")
  SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Installation prefix for C header files" FORCE)
  
- CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz3.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz3.pc)
+ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz5.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz5.pc)
-- 
2.7.4


