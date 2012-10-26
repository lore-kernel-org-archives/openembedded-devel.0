Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TRsPb-0001U5-N7
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 00:29:55 +0200
Received: by mail-ea0-f175.google.com with SMTP id c1so1014798eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uhp+vJ5hI89ZsAjhc1TM3exsgX5vtPY2Qc7Hdtw5cZk=;
	b=DCo4r/qC/AYC5359L+Vl2dTIfi3SCR8g2kLeHhd8qLfODcJvF6+8izhCSUNNmzBWzD
	LTYdcrphZg1ic1tm+XG/PR4oThIJ51pSfMQ1YRXMpx+GByCtzoOOKIb0b2k6t7ys+ta0
	DtCY3kVS+urOaZGeLZO2SloWCkzMn/OQyMQYGRn/rqqkOnsmtL9iaBXJELMAJqK+uNO/
	5yTm1DqYNzkMhXA9dZawuMdtMJesRi2ajv97c7QwMw27b6JAnReJJ+K1JAPdd7XeebW8
	AWUhQceLMCbbI+iAsfaJJAcmYSrJC6klPsxA9bq/Eq0OpnuPRxVDiD11mztw4MugpWaR
	wCog==
Received: by 10.14.215.69 with SMTP id d45mr36496827eep.16.1351289785239;
	Fri, 26 Oct 2012 15:16:25 -0700 (PDT)
Received: from mizar.localdomain
	(host191-189-dynamic.60-82-r.retail.telecomitalia.it.
	[82.60.189.191])
	by mx.google.com with ESMTPS id s1sm5357456eem.9.2012.10.26.15.16.23
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 15:16:24 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Oct 2012 00:16:13 +0200
Message-Id: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] udev_164: update .bbappend to 182 as in oe-core
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
X-List-Received-Date: Fri, 26 Oct 2012 22:29:55 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-core/udev/udev_164.bbappend |    9 ---------
 recipes-core/udev/udev_182.bbappend |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-core/udev/udev_164.bbappend
 create mode 100644 recipes-core/udev/udev_182.bbappend

diff --git a/recipes-core/udev/udev_164.bbappend b/recipes-core/udev/udev_164.bbappend
deleted file mode 100644
index 4d263b0..0000000
--- a/recipes-core/udev/udev_164.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
-do_configure_append () {
-        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
-}
diff --git a/recipes-core/udev/udev_182.bbappend b/recipes-core/udev/udev_182.bbappend
new file mode 100644
index 0000000..4d263b0
--- /dev/null
+++ b/recipes-core/udev/udev_182.bbappend
@@ -0,0 +1,9 @@
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 2}"
+
+# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
+do_configure_append () {
+        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
+}
-- 
1.7.8.6



