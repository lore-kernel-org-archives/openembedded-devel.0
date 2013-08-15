Return-Path: <marek.belisko@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4A16AE7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 19:18:41 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so564970ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mmOQXvw3mcie168TfTS6Se3sO0nGmvPpkGVj8ZoZI3U=;
	b=CiGyUHA5/ugsMn49yd1ufYOuT1B1ESO/8Eey/9vZP3AFmwyyazNx3oi6ZoHJCB3BlH
	C50OLYCBkdkTSw3t0WV3bk0lruNGDO5Az82+UfWE3PFcsi3VSj2rKe73PBUwn1bxumsa
	qRBNLWmIyqWRMRWHepybf4yKQUhUzLxMZ6jNbO7x5cJ6891+8VfUm2AJViN6ZwKMWSKJ
	N7fSdWPQ18138YuF8Vo07tgzqJor8Aum2UlQ1GQNnWDbC0OH08hZcyywEb0nA/8SlGoK
	jTH0adGsMiK+ARpXNYEoCje5Q4KrZPAav5vO4h682A87ANX0jSrYg+/jaqfSHYu4Ahnr
	oZLg==
X-Received: by 10.15.108.72 with SMTP id cc48mr4771519eeb.69.1376594321808;
	Thu, 15 Aug 2013 12:18:41 -0700 (PDT)
Received: from nb.lan (ip-85.162.253.42.o2inet.sk. [85.162.253.42])
	by mx.google.com with ESMTPSA id f49sm931917eec.7.2013.08.15.12.18.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 12:18:40 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 21:18:36 +0200
Message-Id: <1376594316-9677-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-qt5][dylan][PATCH] Fix download url for qt5-5.0.2.
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
X-List-Received-Date: Thu, 15 Aug 2013 19:18:43 -0000

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 recipes-qt/qt5/qt5-5.0.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
index 0bf1404..c04b3a2 100644
--- a/recipes-qt/qt5/qt5-5.0.2.inc
+++ b/recipes-qt/qt5/qt5-5.0.2.inc
@@ -7,7 +7,7 @@ QT_VERSION ?= "${PV}"
 QT_VERSION_DIR ?= "${QT_VERSION}"
 
 SRC_URI += " \
-    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
+    http://download.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
 "
 
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
-- 
1.8.1.2


