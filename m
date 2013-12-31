Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 60A4D6B648
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:33 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so5448562eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JXjH5UOS400CIqeNPMvhxUvL7vVAgeAlHa4CIgvgbr4=;
	b=njEBL8a4fWuRIlAHc5Cv6aWdDxaZrqaSa+6lV36iTSv/u3ad3uR8Dpw0CJcOi34DFw
	h0+5xLjGZdF0xGNrX3j/PYvuzWyS4zbPiC17/p+D4EKci8kICUJ4bLsfDyEdO7C+O7yn
	MNx2FaWCS3ewE5paW/V6z9podQrzOqVYRKpymHTNM7Y/9eO8UGgT6+GvR8ap6a6vT7He
	hrndelN6g9ubjcRnsuT1n5dfc82NjVafYINcvbl20VrB5E9tZkY3/yAi2qeDyuEOEG+S
	l7qNVwVSKhW652gouicpbHld8Oy5SGTsoe4MQgRT9skfuMaIxkGIN7aEe0/70IlK9iQ0
	H5FA==
X-Received: by 10.14.0.201 with SMTP id 49mr5842092eeb.38.1388483373869;
	Tue, 31 Dec 2013 01:49:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	n1sm116589846eep.20.2013.12.31.01.49.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:18 +0100
Message-Id: <1388483363-28575-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 06/11] gateone: Drop allarch
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:34 -0000

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 85c32cc..ac5aa5b 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch python-dir systemd update-rc.d
+inherit distutils python-dir systemd update-rc.d
 
 export prefix = "${localstatedir}/lib"
 
-- 
1.8.4.3


