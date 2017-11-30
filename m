Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF9E7850A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:10 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bd8so3617881plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BBehXKTBH+bHr5iheBJlytZ/jiAkKgW4kG3SUQRmBVQ=;
	b=ShYdLBo9W8j9C9C72zw3/ZPwphKv5aYHuLPwpDP7xtciVOsfHQCrtQNrrQHew4v/3K
	ONlhsnDTNscNNP1dqtnBOw6BNivFGPUM905rhFErosH1aTFscEdsn4FjZuV7dJP8lYMF
	OqPVupVLCYxxmGg3oOlMuP8Sq0jeI92Kqa85hHAqhcZuYvvCGVaGt5S3UaNuKJA1ueXI
	GJhocPHEhDZQVkBcr33LTV91w1roQNxAHpWvG2UsXQS/iV6AxvbyDcWiCCQRSleexTu1
	LQdUSQx/cAzNe9aYnPzcQTCprGdVISm1LBjs8tYOrupwAP/gZzNV2GSuK9gmpgwlVfqI
	ejqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BBehXKTBH+bHr5iheBJlytZ/jiAkKgW4kG3SUQRmBVQ=;
	b=TUjbWdBcNh3G8QqSfi3TFLAExFVFlC2k1sMI6V4++xHcH7IF+M143qJ0Xfbt8S37tY
	2hcDv9wq0xn9qpxvBpnzXtksbDbvT89ni5u00aPiePHm3I3z7AmotilUFTgHO+cIkfkY
	E9mFCHO3j6D3V0IbJVhPVRUMcrmJuuqJM2I1Mh6mrydKFJ9v3ymKBuWjmk0HGlgOwSVl
	YZ7YndOgmot/xuMRZ8kox0ZPp6V9Az29oxQAeYiN6GiSaarCiHdHU91K/Px9KYF8eOT6
	Ma3GTRoHIN4akioe+46U1LN2l2urU3LWVYpqgy5X83slJd/Ss0w4MjvHwzVFcCYVV51F
	uKmQ==
X-Gm-Message-State: AJaThX5fJQQiw/k5i7jmIwXJLHN8jO1YJQJQkCURRnhauoXyeJN9eZlu
	v/2OPBc2HXc4PL2Zx6nnEhUMOg==
X-Google-Smtp-Source: AGs4zMYGiKfMQZWDjOBLlDxlbgIEI3AbXeDsXJ+ti/HCfWl0dPgx+nBtR1ti+7hnYrj5p9aVBD4DuQ==
X-Received: by 10.84.128.226 with SMTP id a89mr1445211pla.150.1512020891818;
	Wed, 29 Nov 2017 21:48:11 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:11 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:04 -0800
Message-Id: <1512020828-4040-6-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 05/12] python-flask-sqlalchemy: move core of recipe to a .inc file
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:10 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-sqlalchemy.inc      | 10 ++++++++++
 .../recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb | 12 +-----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
new file mode 100644
index 0000000..e0efbc6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
+
+SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
+SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
+
+PYPI_PACKAGE = "Flask-SQLAlchemy"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
index 7650917..3dc355c 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.2.bb
@@ -1,12 +1,2 @@
-DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
-
-SRC_URI[md5sum] = "373ce61dfd03b593ad2eaba68c9fee35"
-SRC_URI[sha256sum] = "5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53"
-
-PYPI_PACKAGE = "Flask-SQLAlchemy"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
+require python-flask-sqlalchemy.inc
-- 
2.7.4


