Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc73-0006VU-Tk
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:38 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=RtpSv2QMORZUvgUtlz2KVKVVAqwpHznBhZ9Au27dDqE=;
	b=JyN029kNMrz6/mXegtne/SZ55BrkDWXgc9dhLI1L2YQpcQ0CGld758TS4HpdyZiKM9
	m7skSO5bIozz0cBex3/mFM6hi+AQRilaJIhCOWGMjgKk3WnTrsMP+6/3fNET9VwwzdD1
	AiLvOJ99d/161oXNb6K/6nsZM0M1b2NC1uY3Q753wBGk+Qb3XIRoiu+dcRloFk6aLnjG
	1O7w9XNi6b+j20KRZ6qo5h0nrugMKnw6AuvP/kuNWdPW2okYounNOyzg6PveSGzB3u5b
	CljsDp1t2qsGqJ9xm9kgZFsqZU+PjIGeKoT3zdAp8PY6dKNL7aO+IS4OzCnGfyCtvJY7
	o+KA==
Received: by 10.14.45.80 with SMTP id o56mr77195eeb.165.1342170805991;
	Fri, 13 Jul 2012 02:13:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t3sm23151013eeb.15.2012.07.13.02.13.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:07 +0200
Message-Id: <1342170730-14982-21-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm5bjx8AnyPUvyhwP6yX6lSZIz/VzSCLVXn9VKyFsW7ytOrfI0ZdgFpgOZfMIr65AsOSIPp
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 21/24] python-docutils: update to 0.9.1
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
X-List-Received-Date: Fri, 13 Jul 2012 09:27:18 -0000

This fixes the 'no module named Roman' errors. License checksum changed due to date changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-devtools/python/python-docutils_0.5.bb |   20 --------------------
 .../python/python-docutils_0.9.1.bb                |   18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-docutils_0.5.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
deleted file mode 100644
index adecd8f..0000000
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Text processing system"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
-PR = "r1"
-
-DEPENDS = "python"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "dd72dac92fc8e3eb0f48c3effeef80f6"
-SRC_URI[sha256sum] = "747cf984edfca0575addbb42453274a1bdd98ec7780bd37a883dc8b2a66a610e"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils
-
-NATIVE_INSTALL_WORKS = "1"
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb b/meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb
new file mode 100644
index 0000000..44d08d3
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Text processing system"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=21eae6cbbd42b24a4243269f39e5d592"
+
+DEPENDS = "python"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
+SRC_URI[md5sum] = "b0d5cd5298fedf9c62f5fd364a274d56"
+SRC_URI[sha256sum] = "e89f187dbbc6674f839239c89fec44af9f18809b66a8a55a41b57b9ee2356994"
+
+S = "${WORKDIR}/docutils-${PV}"
+
+inherit distutils
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.10



