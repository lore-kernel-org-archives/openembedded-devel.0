Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbAL2-0005b5-N7
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:23:04 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6YiLQbmE6bexX4Z6dGpVqiZx0O1yuXoxQCwQmLvg0rE=;
	b=aKKcMLdwD6q5IN+GS2L7JidLY5ab3PCH/CgdFX8HX0fDf+GiPKrCsY5+XQeuoK32sw
	f3yov6mB9fLPWV10GHjzbbicGa/TnEC8J/kCgi799OJgswff0XVH3K1e4KX6RmTpbW5g
	BQw+T1+cm+fi+jKShQJjaqGZVLP1n89y2MNT8=
Received: by 10.213.26.215 with SMTP id f23mr419792ebc.37.1323951369132;
	Thu, 15 Dec 2011 04:16:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm23513566eeh.5.2011.12.15.04.16.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:49 +0100
Message-Id: <9e9f1838d7849b4290f5c295443b68d5eb6e613c.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
References: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 2/6] xf86-input-void: drop archive prefix from checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 12:23:04 -0000

* .inc file from oe-core doesn't have name=archive in SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index a6e49a5..ccd27f1 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -4,5 +4,5 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
-SRC_URI[archive.md5sum] = "3056bc7c57db8c5d56039648c0530c45"
-SRC_URI[archive.sha256sum] = "aba69784ac83f5951af3e164312adb4b8b1c91a8f79ab35dc5165c534e14c674"
+SRC_URI[md5sum] = "3056bc7c57db8c5d56039648c0530c45"
+SRC_URI[sha256sum] = "aba69784ac83f5951af3e164312adb4b8b1c91a8f79ab35dc5165c534e14c674"
-- 
1.7.8



