Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fU2-0004M7-HE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:58:42 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3210360fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G7+qLXJKNQ57lKlimt7dU9qEDR8tr5217Cq1Jz19fz4=;
	b=ib9OIYLia/R56/WEdLMBOBe/DAAzLUFd/ZuK11NjimPMpOPdOVoPmFX3+EyV9od8tT
	Yc7eudN2XUzSTk1XCgqRJSoxn4DyZjnVY6ZzfG3oza9s1Vegpcf6dV0S3BYzTtIsWJw1
	PHHh9MHv7TAUweu1141wZ7e6m4jE8vMxtY3zs=
Received: by 10.223.17.215 with SMTP id t23mr1595632faa.11.1317397950469;
	Fri, 30 Sep 2011 08:52:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm7217073fan.9.2011.09.30.08.52.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:52:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:52:02 +0200
Message-Id: <739e5d4f2d083e9f1f93aeeed99a79018d08ae61.1317397769.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
References: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397769.git.Martin.Jansa@gmail.com>
References: <cover.1317397769.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] poppler-data: upgrade from 0.4.0 to 0.4.5
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
X-List-Received-Date: Fri, 30 Sep 2011 15:58:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} (77%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
similarity index 77%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
index c59cc73..cbb02b4 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
-PR = "r2"
-
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
 
 do_compile() {
@@ -19,5 +17,5 @@ do_install() {
 FILES_${PN} += "${datadir}"
 inherit allarch
 
-SRC_URI[md5sum] = "6975bf8e9ea2cfb42b9ecdbcc257cf57"
-SRC_URI[sha256sum] = "5caf7e10b7b0c6a4e1e753af09be52224e88bb8fbcb47794ad72b99b9e24b109"
+SRC_URI[md5sum] = "448dd7c5077570e340340706cef931aa"
+SRC_URI[sha256sum] = "3190bc457bafe4b158f79a08e8a3f1824031ec12acefc359e68e0f04da0f70fd"
-- 
1.7.6.1



