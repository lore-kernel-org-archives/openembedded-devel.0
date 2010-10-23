Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rqx-0003KA-KD
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:20:56 +0200
Received: by gwaa11 with SMTP id a11so1561501gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:20:14 -0700 (PDT)
Received: by 10.150.219.7 with SMTP id r7mr6835159ybg.192.1287793213975;
	Fri, 22 Oct 2010 17:20:13 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id j64sm2898590yha.24.2010.10.22.17.20.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:20:13 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:19:50 -0200
Message-Id: <4cc22a3d.641eec0a.286f.ffffa40c@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Eve: Update recipe
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
X-List-Received-Date: Sat, 23 Oct 2010 00:20:56 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Requires webkit-efl and is valid for EFL_SRCREV >= 51060

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/e17/eve_svn.bb |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/recipes/e17/eve_svn.bb b/recipes/e17/eve_svn.bb
index 223a90b..6157f92 100644
--- a/recipes/e17/eve_svn.bb
+++ b/recipes/e17/eve_svn.bb
@@ -1,19 +1,20 @@
-DESCRIPTION = " Enlightenment webbrowser"
+DESCRIPTION = " Enlightenment Web Browser"
 LICENSE = "GPL"
-DEPENDS = "webkit-efl evas ecore edje"
+DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.2.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
 
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=eve;proto=http \
-           file://default.theme.remove.min.size.patch \
+SRC_URI = " \
+           svn://svn.enlightenment.org/svn/e/trunk;module=eve;proto=http    \
+           file://default.theme.remove.min.size.patch   \
 "
 
-EXTRA_OECONF = "\
-  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+EXTRA_OECONF = "    \
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc   \
 "
 
-S = "${WORKDIR}/eve"
-
-FILES_${PN} += "${datadir}/icons/eve.png"
+FILES_${PN} += "    \
+        ${datadir}  \
+"
-- 
1.7.3.1



