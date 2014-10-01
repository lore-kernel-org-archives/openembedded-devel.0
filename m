Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0F47172D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:32 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so440164wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=di53uHzeu6mvpqDC8Z84oolCCIIyfxOVmwpKURl0a6Y=;
	b=CojbqUNtaQu4+lrEpL6YCWo7Nuqv9FY5jNAsfgeTVtvpdT8jfR9giITEdrac8QCbyj
	pO1CbdI1qgN2TV/F3Avn5lXzakCy/du55MrOH13qMn36WwwmgIlh+joJqgCW0AV/l/Y5
	lB/IuNQ6hzqKUW6vUzyZGczxo5RZcq7P6YDh6aDo2dmi4QzQ0vwTR6duaBvFpLcqAJAA
	tJBZbj5srGqVemdQty0yNypqs85DowB+t2piGugJJpH4n2WdWLihOT2uI2rCpZjtwINU
	jCgM/5U/3YDFo7Jy9rxImIE2lLpdL0XxKXtX3Q138jQlfm+WzELnS0K/BDJSuyxp9Hmo
	m2NQ==
X-Received: by 10.180.206.230 with SMTP id lr6mr12276632wic.82.1412151573566; 
	Wed, 01 Oct 2014 01:19:33 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:10 +0200
Message-Id: <1412151555-19865-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 10/15] xfce4-taskmanager: update to 1.0.1
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb       | 10 ++++++++++
 .../xfce4-taskmanager/xfce4-taskmanager_git.bb         | 18 ------------------
 2 files changed, 10 insertions(+), 18 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
new file mode 100644
index 0000000..e597108
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Easy to use task manager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-app
+
+DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
+
+SRC_URI[md5sum] = "b8a707b25e32c1a296eb50d609aa49b8"
+SRC_URI[sha256sum] = "f5aa2796dd9971f8ae400238bfcdd9fa1322dba1466d1e6fd5bf8ee7e88bee86"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
deleted file mode 100644
index 289cf55..0000000
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Easy to use task manager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-git xfce-app
-
-DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
-
-SRC_URI = " \
-    git://git.xfce.org/apps/xfce4-taskmanager;protocol=git \
-    file://0001-do-not-build-documantation-Makefile-has-no-install-t.patch \
-"
-
-SRCREV = "e5d958738b6d2828a4c8353df67d3c1656c46af5"
-S = "${WORKDIR}/git"
-PV = "1.0.0+git${SRCPV}"
-
-EXTRA_OECONF += "--enable-maintainer-mode"
-- 
1.8.3.1


