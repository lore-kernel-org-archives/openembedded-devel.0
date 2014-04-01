Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id DB2C86F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:17 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so5184792wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z2brFFwmGQNtP3zikFcAGl4YXAl7UjsQClD5N3ia9a4=;
	b=iicoav+LI3DhHQ5ND6ZBEa7oO+sPXVKjetz2Ku+FEHCKKqufPRDMA8L00L0BzqroS0
	pGq2No7C66Ua9YdyxrB+MVMSn1NyDAUGUW/ZPDUcyDcQ8pLeeVjRrNxMUIqNcQHPmmj7
	2vFnqiJqIrZJKRH5qsqWQMqvfO+A/EBiqgIvJQzs5NrfUq7XGPUuKxf/p4+FR/ffn2t6
	NxTelQhoB18qqleOor2oNT7wThTP6qUY9l3fHrV9lmUgl6SQznNWXHIcAJh+c6kG1LLx
	gyjFTmMZRLj0KtVtQNcN9xx4KGOzKcmFwkItitBlpwHBzF4SbtMuh7H2kljNwPONpYY3
	ZxQg==
X-Received: by 10.194.2.145 with SMTP id 17mr15690410wju.60.1396372458328;
	Tue, 01 Apr 2014 10:14:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm41872309eeg.4.2014.04.01.10.14.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:18 +0200
Message-Id: <1396372434-10710-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/46] libdc1394: add libsdl dependency
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 330f78f..7c6d2ab 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
-DEPENDS += "libusb1 libraw1394"
+
+# libsdl to provide sdl.m4 with AM_PATH_SDL
+DEPENDS += "libusb1 libraw1394 libsdl"
 
 PV = "2.2.1+gitr${SRCPV}"
 
-- 
1.9.1


