Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5866FADD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:29 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t61so6700800wes.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PmSQFKpI9jKGTO/D/8qh07lwUiV2xhNm1Tk9+t53YdE=;
	b=M8ucysUN+MqEvV8jnO7Pzil7wmmd+SD62TOvhZmuG8R+94S7bYP7qVP2MeYfADqE8G
	hHE6Z4Lh8U8yVFLbPh/NY0e60+wjMMgfIVIXVLTX4crIVUfVxnLWlkSqqUQIM4Z8X4KJ
	btBVKX+7PjhJK/JWDxhZqmzH/gltMX4XmwZd2294NGo7hRAL8goOUH9I8WkfMBl5z19X
	jkk/4OiPiONi8UP482mDKxHLwWGhTBvbHk0yttoPNpebSCxEYb3dziBGhydvCXqhFHUS
	62MfRXdPcg8xsYF3kvDLsJXtOYsKm6lOUC9VsWARjzdBmqWzyjDlJCpCdXx8P8EKvOxZ
	1Azg==
X-Received: by 10.194.240.226 with SMTP id wd2mr4669794wjc.95.1396372530549;
	Tue, 01 Apr 2014 10:15:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm41864211eef.20.2014.04.01.10.15.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:48 +0200
Message-Id: <1396372434-10710-40-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 40/46] lzip: remove infodir
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:32 -0000

* doesn't use autotools.bbclass which removes infodir automatically
* fixes QA warning:
  lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a particular package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lzip/lzip_1.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.14.bb b/meta-oe/recipes-support/lzip/lzip_1.14.bb
index 8b4a3fb..3d8c090 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.14.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.14.bb
@@ -35,6 +35,10 @@ do_configure () {
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
+    # Info dir listing isn't interesting at this point so remove it if it exists.
+    if [ -e "${D}${infodir}/dir" ]; then
+        rm -f ${D}${infodir}/dir
+    fi
 }
 
 BBCLASSEXTEND += "native nativesdk"
-- 
1.9.1


