Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhz-000711-LW
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522521eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=24QwJixT60j99tUGiw5LUvKBVSV2cTBALM8XJgaKaR0=;
	b=r7gq/YF/W/57mIUFUZwN4+yCWppAIZhxc1aOBC3a3V73mGnNf4z5yiYgr0rgAjtbiZ
	Bh1WM884vyCLArfrQvNtmItwNIL0f+wQ51Ldnk+O3eSVEqWqcAgM/+ViMhamKGdIXE3z
	GOwhgIduHOGP7Z9oWolk4CcbX+LQCh1NawivnKxW6QWy+WY4iS3XJM1RFT60IRxlzW1I
	s4vubHHiILoTzQAye8B87pTLpQnTUIRwpErvSa9YsRywNoANuFmBbdIRmmHEY8w9gBL+
	TnsvflboXqDIeWSVUa78A0boUUN1TBAqgS74hYEyspp0G75Vdh+FAHyMw0SGR4nBda3l
	SX2Q==
Received: by 10.14.223.200 with SMTP id v48mr9231614eep.24.1355438536518;
	Thu, 13 Dec 2012 14:42:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm5678489eep.9.2012.12.13.14.42.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:50 +0100
Message-Id: <f52405e70b3fb592693d39bc416051de9180c3b3.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/11] iotop: don't fail when site.py* does not exist
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:51 -0000

* also remove usr/share/share removal, it's taken care of in distutils.bbclass now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
index 8be41af..3b8150b 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
  a table of current I/O usage by processes on the system."
 HOMEPAGE = "http://guichaz.free.fr/iotop/"
 
+PR = "r1"
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
@@ -14,9 +16,8 @@ SRC_URI[sha256sum] = "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d68648
 inherit distutils
 
 do_install_append() {
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py
-	[ -d ${D}${datadir}/share ] && rmdir ${D}${datadir}/share
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo || true
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
 RDEPENDS_${PN} = "python-distutils python-curses python-textutils \
-- 
1.8.0.2



