Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rng-0007au-2H
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:33 +0200
Received: by mail-gx0-f175.google.com with SMTP id 22so1148347gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:56 -0700 (PDT)
Received: by 10.100.8.8 with SMTP id 8mr2683192anh.252.1287793015650;
	Fri, 22 Oct 2010 17:16:55 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:55 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:56 -0200
Message-Id: <4cc22977.0311650a.0c4d.ffffaf6b@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 16/17] Disabling docs in ethumb's recipe and adding libexif in DEPENDS
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:34 -0000

From: Fabiano Fidencio <fidencio@profusion.mobi>

---
 recipes/efl1/ethumb_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/efl1/ethumb_svn.bb b/recipes/efl1/ethumb_svn.bb
index 7f826cf..f958bd4 100644
--- a/recipes/efl1/ethumb_svn.bb
+++ b/recipes/efl1/ethumb_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "EFL based thumbnail generation library"
 LICENSE = "LGPL"
-DEPENDS = "eet-native evas ecore edje eet edbus emotion epdf"
+DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
@@ -9,6 +9,7 @@ inherit efl
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
   --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+  --disable-docs \
 "
 
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=ethumb;proto=http"
-- 
1.7.3.1



