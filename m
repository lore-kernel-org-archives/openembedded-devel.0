Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1RGGu0-000526-BS
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:08:49 +0200
Received: by wyg19 with SMTP id 19so1105384wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=k20GshcG5BQRM4H37tbSq1Voq7Wseqwp7QOJ7JpoSrk=;
	b=UeHsV9QRfi8epkYS2L/QlNvT7jhFsm9AhylYbwByYLnASNEFBzIIiV+lhHzq8V82zo
	Wc9IU87dfM2+JnACinNSdlF9aAZpZPnBePo4CWeA3Y+UlIjMv+J17shc6onm7GTTc3Gp
	TTdtW1x29H68lUha5mdwdjzcrDh8A93xpNXwo=
Received: by 10.227.13.66 with SMTP id b2mr481717wba.44.1318971775184;
	Tue, 18 Oct 2011 14:02:55 -0700 (PDT)
Received: from localhost.localdomain ([90.163.60.41])
	by mx.google.com with ESMTPS id i29sm5767885wbp.22.2011.10.18.14.02.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:02:54 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 23:00:33 +0200
Message-Id: <1318971633-1534-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH][meta-efl]] dummy patch to try if patchwork bug is fixed
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
X-List-Received-Date: Tue, 18 Oct 2011 21:08:49 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/efm-path_svn.bb |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb

diff --git a/meta-efl/recipes-efl/e17/efm-path_svn.bb b/meta-efl/recipes-efl/e17/efm-path_svn.bb
deleted file mode 100644
index 685513f..0000000
--- a/meta-efl/recipes-efl/e17/efm-path_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "MIT"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRCNAME = "E-MODULES-EXTRA/efm_path"
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
-FILES_${PN} += "${libdir}/enlightenment/modules/"
-- 
1.7.7



