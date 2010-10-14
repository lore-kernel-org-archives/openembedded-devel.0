Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P6Hrb-0003Z1-MP
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:04:32 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 7BF7C275CE2E; Thu, 14 Oct 2010 09:04:03 +0200 (CEST)
Received: from localhost (unknown [89.204.137.8])
	by gravedo.de (Postfix) with ESMTPSA id A2158275CDC9;
	Thu, 14 Oct 2010 09:03:57 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 09:03:04 +0200
Message-Id: <1287039784-1667-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287039784-1667-1-git-send-email-morphis@gravedo.de>
References: <1287039784-1667-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] libgee: remove unnecessary dependency on gobject-introspection
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
X-List-Received-Date: Thu, 14 Oct 2010 07:04:32 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/libgee/libgee.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libgee/libgee.inc b/recipes/libgee/libgee.inc
index 5148386..ed86554 100644
--- a/recipes/libgee/libgee.inc
+++ b/recipes/libgee/libgee.inc
@@ -2,10 +2,10 @@ DESCRIPTION = "libgee is a collection library providing GObject-based interfaces
 and classes for commonly used data structures."
 HOMEPAGE = "http://live.gnome.org/Libgee"
 SECTION = "libs"
-DEPENDS = "glib-2.0 gobject-introspection"
+DEPENDS = "glib-2.0"
 BBCLASSEXTEND = "native"
 LICENSE = "LGPL"
-INC_PR = "r4"
+INC_PR = "r5"
 PE = "1"
 
 inherit autotools vala
-- 
1.7.1



