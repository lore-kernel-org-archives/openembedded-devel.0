Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF0160024
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 May 2015 16:56:54 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so122531841pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 May 2015 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6NyAkZrGGkVit91WGlSsmGkOMW20ef8JrreYPsrPDfw=;
	b=s2E7PVnxKR2Otjgxlwu/h1VoY+RXyrfAic7szsgVy5Z+Xc8zxkEGAwhLVosu/zeE3t
	W6yYrcEednVtSIzsJYB16JKYuv56cXHxTnt/KfVr20RkmD6wyu6Cp2tkk3oTR1c5fbUS
	tko1ZX3e1B1eOlqW4lXaZTNxfJi5UZEyzoSGD6SKjBPe9jDGDPOYRH0tEtc0RWJ5HTFf
	fAQq1/kPuUuOBm/6CZrUtlDLZq0h4EezID6GCruOvqRV717ZoZPBbauJnRw4+uDqVYmo
	3CZSrNHC+XRXT0Vd2DzI2o+dghUGgr0Yiduww4qvJZPsYaLqd2welDxiF1S1dkaRV+7q
	JQ7A==
X-Received: by 10.66.230.130 with SMTP id sy2mr12741618pac.157.1430585815761; 
	Sat, 02 May 2015 09:56:55 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id k8sm8063032pbq.51.2015.05.02.09.56.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 May 2015 09:56:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Sat,  2 May 2015 09:56:50 -0700
Message-Id: <1430585810-19488-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-xfce][PATCH] meta-xfce: add layer depends
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
X-List-Received-Date: Sat, 02 May 2015 16:56:57 -0000

depends on gnome if an image includes packagegroup-xfce-base.
depends on meta-networking if an image includes packagegroup-xfce-base-extended.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/conf/layer.conf | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index d669e4e..55bcef6 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -7,3 +7,13 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "xfce-layer"
 BBFILE_PATTERN_xfce-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_xfce-layer = "7"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_xfce-layer = "1"
+
+LAYERDEPENDS_xfce-layer = "core"
+LAYERDEPENDS_xfce-layer += "openembedded-layer"
+LAYERDEPENDS_xfce-layer += "gnome-layer"
+LAYERDEPENDS_xfce-layer += "openembedded-layer"
+LAYERDEPENDS_xfce-layer += "meta-python"
-- 
2.3.5


