Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1MsX22-0005Le-9N for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 09:21:57 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 5B53021378;
	Tue, 29 Sep 2009 10:18:27 +0300 (EEST)
Received: from localhost.localdomain (petri.int.inoi.fi [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id 3C71421201;
	Tue, 29 Sep 2009 10:18:27 +0300 (EEST)
From: Petri Lehtinen <petri.lehtinen+openembedded-devel@inoi.fi>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 10:21:13 +0300
Message-Id: <1254208873-16548-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.4.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 194.100.97.46
X-SA-Exim-Mail-From: petri.lehtinen+openembedded-devel@inoi.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] python-django: Update to work with Python 2.6
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
X-List-Received-Date: Tue, 29 Sep 2009 07:21:57 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>


Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
---
 recipes/python/python-django_1.0.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-django_1.0.2.bb b/recipes/python/python-django_1.0.2.bb
index 0c572ee..572e190 100644
--- a/recipes/python/python-django_1.0.2.bb
+++ b/recipes/python/python-django_1.0.2.bb
@@ -16,11 +16,12 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} --prefix=${prefix}"
 
 RDEPENDS_${PN} = "\
   python-email \
+  python-html \
   python-netserver \
   python-pickle \
   python-pprint \
   python-shell \
-  python-sqlite \
+  python-sqlite3 \
   python-textutils \
   python-threading \
   python-unixadmin \
-- 
1.6.4.4



