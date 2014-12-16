Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 715357259B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:05:45 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so11511065wiw.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 01:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fNIJq3IZK9cP6TNS1u3ZvyfHuJjrp8jcrqL60W0ak4Q=;
	b=sMD5s/FJk3Q8YQZU9jq3yFOXLyo0x+CVO1Lqe1dhZYGc+qdPrqlTDP3x668kgYZIgc
	CJ29KLKu6PkEe+BOUSQoYxQvP20QlKW67ybtvyrmJNr7hZp/YjMgVbIXJfXnyv1mxbr1
	cn13Jbmg6ZMRAVuXnICOQK/vCZ5Xc2sZHqAl1xIOyBakqBRTW6vqJhaB+UL/v/0taCz3
	BmHxsgh/LAoEJvjeJR5nnBI4XIiBQtMXYldyoe58SduO5L1y/M1v/O2L4ARsZO+Trwks
	XkuWsp/gGW4uqNog95XWEltiYJpZgfmsGfuV182sbMnAX1wtkQVdo9HtGC/u8aR9SdPH
	0ADA==
X-Received: by 10.180.107.136 with SMTP id hc8mr2947429wib.32.1418720745892;
	Tue, 16 Dec 2014 01:05:45 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id gl10sm295635wjd.26.2014.12.16.01.05.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 01:05:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 10:05:36 +0100
Message-Id: <1418720736-20426-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1418720736-20426-1-git-send-email-schnitzeltony@googlemail.com>
References: <1418720736-20426-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/1] qtwayland: re-enable cmake files they don't break build anymore
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
X-List-Received-Date: Tue, 16 Dec 2014 09:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index 2f1cf2d..baadcf5 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -7,8 +7,6 @@ require qt5.inc
 XKB_DEPENDS = "libxkbcommon xproto"
 DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS}"
 
-EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
-
 QT_WAYLAND_CONFIG ?= "wayland-compositor"
 QT_WAYLAND_DEFINES ?= ""
 QT_WAYLAND_BUILD_PARTS ?= "examples"
-- 
1.8.3.1


