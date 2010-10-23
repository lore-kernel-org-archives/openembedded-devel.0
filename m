Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnZ-0007ps-Qp
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:27 +0200
Received: by gwaa11 with SMTP id a11so1560580gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:46 -0700 (PDT)
Received: by 10.100.42.1 with SMTP id p1mr2721487anp.79.1287793006115;
	Fri, 22 Oct 2010 17:16:46 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:45 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:51 -0200
Message-Id: <4cc2296d.0311650a.0c4d.ffffaf65@mx.google.com>
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
Subject: [PATCH 11/17] Eeze: New recipe
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:28 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Part of the EFL, eeze is a library to simplify the use of devices. It is now
a dependency for E17.

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/eeze_svn.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/efl1/eeze_svn.bb

diff --git a/recipes/efl1/eeze_svn.bb b/recipes/efl1/eeze_svn.bb
new file mode 100644
index 0000000..5388ec1
--- /dev/null
+++ b/recipes/efl1/eeze_svn.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Eeze is a library to simplify the use of devices"
+LICENSE = "MIT BSD"
+DEPENDS = "ecore udev"
+PV = "0.2.0.+svnr${SRCPV}"
+PR = "r0"
+SRCREV = "${EFL_SRCREV}"
+
+inherit efl
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
-- 
1.7.3.1



