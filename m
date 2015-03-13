Return-Path: <erik.boto@pelagicore.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC726013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:30:22 +0000 (UTC)
Received: by wghl2 with SMTP id l2so21344226wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 00:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=BVfdrhysYFi/YVRm22Mf8gMw6VtyBx4HX4AIow9Sfdw=;
	b=Ij1OJsEYb2rj8BrEnDS9U3PaWzOzNZo4Z7J7jhhwCvhZjVcbbVs6a+O5GZXHLxBHKt
	atnCaSaynR1XR3h3/yLiEj5YVLmTXnovMq/95u7DxypG+48FVjnd8kFiY6jKO/e8dRnQ
	+STFHQUZrougQ0ETm+7guFqcajtfAPH3SxvpSzZvpUrYGz2KMN00UjliRLR/6bLzmTM2
	S8DCoARPWmssDLcIxqH/bFmgfKVQoKQaU9wlXEsxNjprqg4hYFtYl/sV/hoNxEVeWv2q
	uBYaiyx0h646xFLCDF3JEXeBJ1cCzTKLqFF55e34GJGm3PP2GnEhNLeRw9jHzRXqUcBa
	v7dw==
X-Gm-Message-State: ALoCoQncttOjpteAjlrC9eYz2RY5gJGFgCvOu3mtVgMtVE/kxWmrjeInmByOiyN6k79K8y2a2k3T
X-Received: by 10.180.75.108 with SMTP id b12mr92877226wiw.44.1426231823828;
	Fri, 13 Mar 2015 00:30:23 -0700 (PDT)
Received: from erik-debian.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id fm10sm1598297wib.7.2015.03.13.00.30.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 00:30:22 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 08:29:51 +0100
Message-Id: <1426231791-25435-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-qt5][daisy][PATCH] qt5-git.inc: Move to code.qt.io
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
X-List-Received-Date: Fri, 13 Mar 2015 07:30:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Gitorious switch of git:// protocol and will close down in a while, so
move over to code.qt.io.

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 recipes-qt/qt5/qt5-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index fa0c06e..2281b75 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?= "stable"
 
 # each module needs to define valid SRCREV
 SRC_URI += " \
-    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 S = "${WORKDIR}/git"
-- 
2.1.4


