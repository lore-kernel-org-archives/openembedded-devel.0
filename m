Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1Qoy7B-0000Zz-26
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 15:37:33 +0200
Received: by yxi19 with SMTP id 19so1076392yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XPyi5TkXyanITQiXQsJDbDuKUhPMNLs6H1sspUtBSdo=;
	b=CEdCjKK41k/f9uk4mGXvzulrLfTVZzbpgws5VBFLtXle/qvQq2hVWEFHB7FELcPqLi
	VLJhXpOJOw59VIY/IkBjMxtzUmNghTjgDJx7aqBV+DnZrsdGZDWimQmZJ/68iRNLss1j
	JyVtTT1/PTe24b6YCuem17S9gItDDjyd29lP8=
Received: by 10.142.215.19 with SMTP id n19mr817675wfg.422.1312464788575;
	Thu, 04 Aug 2011 06:33:08 -0700 (PDT)
Received: from localhost.localdomain ([173.8.168.17])
	by mx.google.com with ESMTPS id g4sm2224465pbj.89.2011.08.04.06.33.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 06:33:07 -0700 (PDT)
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2011 06:32:43 -0700
Message-Id: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] ptpd: added recipe for v1.1.0.
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
X-List-Received-Date: Thu, 04 Aug 2011 13:37:33 -0000

Signed-off-by: Chris Verges <kg4ysn@gmail.com>
---
 meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb

diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
new file mode 100644
index 0000000..87e0a69
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+LICENSE = "BSD"
+SECTION = "network"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz" 
+
+S = "${WORKDIR}/ptpd-${PV}/src"
+
+do_install() {
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 4555 ptpd ${D}${bindir}
+        install -m 644 ptpd.8 ${D}${mandir}/man8
+}
+
+SRC_URI[md5sum] = "faa4823576dd49ccc94b741ff32b03f5"
+SRC_URI[sha256sum] = "a7c6ea83bd53da75ae04a7b7a25fe7c597b4e9ff1f93d46f4502e3fa8a2cb950"
+
-- 
1.7.4.1



