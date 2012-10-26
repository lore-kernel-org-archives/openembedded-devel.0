Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TRsof-0001rv-H3
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 00:55:49 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1274913eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ddgkUwZjWQ6uqXbwrdFFYRA8v1gj/JAQsEbOOQ8PK8k=;
	b=UXxRiKZOhdfZGcyywm0/IrXSoBS0NnF8tXR6Fas+6GQUSmCZsNXM1/x8KcADUAHjr3
	tEQELw2mPsLmEkMqO/RLNglF5FPDt5VCdI+XiiGEr5uW7/Cn8XNmYgHo+Q9LJOIvQYlZ
	uCH4qlbIqUXJotUzQ8oJIcAPOALOBMrJWJEl7BAyyMgoBWrkPj/dqkTEzIQd45n95kh9
	+nBKlljsFA/LuSj41v01Q1EEwPZ7XvRa75paaFhw2m6oCplWwoH/fyEXu3ss9Mvp6QtV
	cic6zvH4ihxi11EIdCF2ybDYGhFtNsRtnW08LkeOoDccOMqHbcKWlRCCmw24HmroGDjM
	DTKQ==
Received: by 10.14.221.194 with SMTP id r42mr36909561eep.25.1351291339216;
	Fri, 26 Oct 2012 15:42:19 -0700 (PDT)
Received: from mizar.localdomain
	(host191-189-dynamic.60-82-r.retail.telecomitalia.it.
	[82.60.189.191])
	by mx.google.com with ESMTPS id e1sm5474037eem.3.2012.10.26.15.42.17
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 15:42:18 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Oct 2012 00:41:40 +0200
Message-Id: <1351291300-4591-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
References: <1351289773-25205-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH v2] udev_164: update .bbappend to 182 as in oe-core
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
X-List-Received-Date: Fri, 26 Oct 2012 22:55:49 -0000

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
+PRINC := "${@int(PRINC) + 1}"
+
+# check only for ABS_X (0x00) and ABS_Y (0x01), ignore ABS_PRESSURE (0x18)
+do_configure_append () {
+        sed -i -e 's/"input:*-e0*,3,*a0,1,*18,*"/"input:*-e0*,3,*a0,1,*"/' ${WORKDIR}/local.rules
+}
-- 
1.7.8.6



