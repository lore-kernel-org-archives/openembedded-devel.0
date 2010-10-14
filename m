Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P6HrN-0003X7-Rx
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:04:19 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A103B275CE2E; Thu, 14 Oct 2010 09:03:49 +0200 (CEST)
Received: from localhost (unknown [89.204.137.8])
	by gravedo.de (Postfix) with ESMTPSA id 73C1A275CDC9;
	Thu, 14 Oct 2010 09:03:39 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 09:03:03 +0200
Message-Id: <1287039784-1667-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287039784-1667-1-git-send-email-morphis@gravedo.de>
References: <1287039784-1667-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libgee: define common INC_PR and use it in all specific version recipes
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
X-List-Received-Date: Thu, 14 Oct 2010 07:04:19 -0000

Until now there is now way to indicate that the libgee.inc common part of libgee has
changed - the PR is only defined in the specific version recipes. This adds the INC_PR var
to to the common libgee.inc and use it in the specific version recipes.
INC_PR is initial set to the highest value of both version 0.5.2 and 0.6.0.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/libgee/libgee.inc      |    1 +
 recipes/libgee/libgee_0.5.2.bb |    2 ++
 recipes/libgee/libgee_0.6.0.bb |    2 +-
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/libgee/libgee.inc b/recipes/libgee/libgee.inc
index 918f45b..5148386 100644
--- a/recipes/libgee/libgee.inc
+++ b/recipes/libgee/libgee.inc
@@ -5,6 +5,7 @@ SECTION = "libs"
 DEPENDS = "glib-2.0 gobject-introspection"
 BBCLASSEXTEND = "native"
 LICENSE = "LGPL"
+INC_PR = "r4"
 PE = "1"
 
 inherit autotools vala
diff --git a/recipes/libgee/libgee_0.5.2.bb b/recipes/libgee/libgee_0.5.2.bb
index 5c94620..223537d 100644
--- a/recipes/libgee/libgee_0.5.2.bb
+++ b/recipes/libgee/libgee_0.5.2.bb
@@ -1,4 +1,6 @@
 require libgee.inc
+
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/0.5/${BPN}-${PV}.tar.bz2"
diff --git a/recipes/libgee/libgee_0.6.0.bb b/recipes/libgee/libgee_0.6.0.bb
index 41bfce1..9460e97 100644
--- a/recipes/libgee/libgee_0.6.0.bb
+++ b/recipes/libgee/libgee_0.6.0.bb
@@ -1,6 +1,6 @@
 require libgee.inc
 PE = "1"
-PR = "r3"
+PR = "${INC_PR}.0"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/0.6/${BPN}-${PV}.tar.bz2"
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.1



