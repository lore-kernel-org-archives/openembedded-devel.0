Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (unknown [209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 201E56B89F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 14:47:08 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 131so6156918ykp.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=aWD35Dx0DT/URjjocTPvVOzD6USnLEyvdKaz9FDDN1o=;
	b=VGEbYewYBolrxH1+4MpG18POH9DtB2qcYSoDWOgFbDhUul0oaXfEKUxVVRwFcQ8GCC
	xhzBGeV+BZupa1Ylzt7P+oKMJu1zvKcZmunk+pgP/GJ6vHN2CykzyBqd8OLzSdlOlwPp
	xiklp1FaRD2jbpl9c9wj3+VZaho3GhLg1sTacBwUs+pfiUiZOWlY/81PfwRv+NseAfLU
	h7d3f/1yVoJkHMjNJcwp/4ip6OIitIqG3gdUL2wOGqsa3YL2AWkNK61shmSN/rqP2SVE
	C0u8/PGWSQbUhp84zfWa4uqipRjyNg/bfoXEyvGnzx/7HsklIT9eWVENUlvB5JZ77OqJ
	p62w==
X-Received: by 10.236.161.10 with SMTP id v10mr36610664yhk.27.1401115629226;
	Mon, 26 May 2014 07:47:09 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id m50sm18233184yha.8.2014.05.26.07.47.07
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 07:47:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:46:47 -0300
Message-Id: <1401115609-12644-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/3] packagegroup-qt5-toolchain-target: Don't require qtquickcontrols-qmlplugins
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
X-List-Received-Date: Mon, 26 May 2014 14:47:12 -0000

The qtquickcontrols-qmlplugins requirement has been move to a runtime
recommendation so we don't fail in case it is not available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 3fcc38f..b2c5474 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -67,7 +67,6 @@ RDEPENDS_${PN} += " \
     qtmultimedia-mkspecs \
     qtmultimedia-plugins \
     qtmultimedia-qmlplugins \
-    qtquickcontrols-qmlplugins \
     qtscript-dev \
     qtscript-mkspecs \
     qtsensors-dev \
@@ -88,3 +87,7 @@ RDEPENDS_${PN} += " \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
 "
+
+RRECOMMENDS_${PN} += " \
+    qtquickcontrols-qmlplugins \
+"
-- 
1.7.10.4


