Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C2A2E6B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:51:25 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so4775441eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2kBbIlZQyhtvZ+Mh5UwOBUdLJZsAHrhMklQ4K98MMtk=;
	b=HgZpu4vIPXwtE7lJAKiQvHj9fx/2shgza2jc0cZHHwYB8lGhqwMuavPPZLfEWu+EHa
	ef43cVk2eJEmP0q85EkBzYtWX/Jjw+X0f4Y1YAYLvLc35+Y8Qe2apzkh1t2BFzJ6ZAis
	n0rH+nApE8Jv1/2cjqAoexugTKUNDPxa2FdmcCUToMI9UgxRrvTLs0+jxolZ0eZkxZYl
	69Jug4M29BFZjUtLS8GIQMmHo2xaR9Hb4MfFi9TRiLzF7gi7Hqsh+50bHxli1UtNFYjn
	td2ntsSGfhtw4zcUvR4p9Th1uAk6cFHqxuD3D7nhlafQmXJ5hb0ttDXMpi4xUKeBMaPf
	lHrQ==
X-Received: by 10.14.225.195 with SMTP id z43mr1057859eep.19.1390391486206;
	Wed, 22 Jan 2014 03:51:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z42sm18449225eel.3.2014.01.22.03.51.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:51:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 12:51:18 +0100
Message-Id: <1390391479-22665-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
References: <1390239757-27055-4-git-send-email-Martin.Jansa@gmail.com>
	<1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCHv2 4/5] elfe: Replace svn with git version
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
X-List-Received-Date: Wed, 22 Jan 2014 11:51:26 -0000

* bump PE to cope with +svn -> +git

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elfe_git.bb | 15 +++++++++++++++
 meta-efl/recipes-efl/e17/elfe_svn.bb | 10 ----------
 2 files changed, 15 insertions(+), 10 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/elfe_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/elfe_svn.bb

diff --git a/meta-efl/recipes-efl/e17/elfe_git.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
new file mode 100644
index 0000000..fcb97a9
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/elfe_git.bb
@@ -0,0 +1,15 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+PV = "0.0.1+gitr${SRCPV}"
+PE = "1"
+
+require e-module.inc
+
+SRC_URI = " \
+    git://git.enlightenment.org/enlightenment/modules/${BPN}.git \
+"
+S = "${WORKDIR}/git"
+
+SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
+
+DEPENDS += "elementary"
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
deleted file mode 100644
index f6d6fdb..0000000
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.1"
-
-require e-module.inc
-
-SRCREV = "${EFL_SRCREV}"
-
-DEPENDS += "elementary"
-- 
1.8.5.3


