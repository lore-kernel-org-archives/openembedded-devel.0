Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1TLW78-0002DT-7S
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:28:34 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so3007323wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ThdoQLwgyM24qMJ3se8ioOHluexKOkdgMYBA9TVJxBU=;
	b=uiJf+0HY+yOC3A0aIWsLKzw07UMJ9Vkk7Gfjx63bf5aM3CTLg/NBuKUmZ5Mq98iZiZ
	JPcfXkpQAK5cjI42kWg/ixtg9Hfsd8VpfHXBuzIqPSiR/8BS/X0fKKHwoALP/8mGDO39
	5CxoPs/2aI0cX/ikxPNAJhtI6tf9MiHD7ROU6lnzUFiP7xCsey/N/cxxPHMsotZU6KFd
	WyyTObJiUUBBaAZGd6Jje+XEzcgWr6r9KYd+9FRlDpBVFxTq0u5oVKRdevsIXRauHQAx
	+W07HN/axC04Z9Bovi8pWFjucGYhJvLHsJnRNjqvj93NurRoxN9J9I+srxEUu651J3hK
	c4gA==
Received: by 10.180.79.100 with SMTP id i4mr3078751wix.12.1349774127009;
	Tue, 09 Oct 2012 02:15:27 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id bn7sm27114770wib.8.2012.10.09.02.15.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 02:15:26 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 11:13:29 +0200
Message-Id: <1349774009-4537-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libconfig: port from classic and update
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
X-List-Received-Date: Tue, 09 Oct 2012 09:28:34 -0000

* based on recipe from oe-classic
* update to currently available upstream version 1.4.9

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libconfig/libconfig_1.4.9.bb  |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
new file mode 100644
index 0000000..c7d3cf7
--- /dev/null
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
@@ -0,0 +1,14 @@
+SUMMARY = "C/C++ Configuration File Library"
+DESCRIPTION = "Library for manipulating structured configuration files"
+HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
+
+SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
+SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
-- 
1.7.9.5



