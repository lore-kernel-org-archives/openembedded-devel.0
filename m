Received: from mail2.picochip.com ([82.111.145.34] helo=thurne.picochip.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jamie.iles@picochip.com>) id 1O9z9h-0003UM-SP
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 13:22:14 +0200
Received: from localhost.localdomain (jamiei.ovpn.rb.picochip.com
	[172.17.21.82]) (authenticated bits=0)
	by thurne.picochip.com (8.13.8/8.13.8) with ESMTP id o46BIMwm028007;
	Thu, 6 May 2010 12:18:24 +0100
From: Jamie Iles <jamie.iles@picochip.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 May 2010 12:20:04 +0100
Message-Id: <1273144804-17115-1-git-send-email-jamie.iles@picochip.com>
X-Mailer: git-send-email 1.6.5.4
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-3.0 (thurne.picochip.com [172.17.0.105]);
	Thu, 06 May 2010 12:18:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.95.3 at thurne.picochip.com
X-Virus-Status: Clean
X-SA-Exim-Connect-IP: 82.111.145.34
X-SA-Exim-Mail-From: jamie.iles@picochip.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jamie Iles <jamie.iles@picochip.com>
Subject: [PATCH] opkg: use https for svn fetching
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
X-List-Received-Date: Thu, 06 May 2010 11:22:14 -0000

Behind some proxies the requests get mangled and the checkout fails.
Using https allows checkout to work for all users.

Signed-off-by: Jamie Iles <jamie.iles@picochip.com>
---
 recipes/opkg/opkg.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 7865f1a..dc3f562 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -9,7 +9,7 @@ INC_PR = "r21"
 
 FILESPATHPKG =. "opkg:"
 
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=https \
 	file://opkg_unarchive.patch;patch=1;maxrev=201 \
 	file://opkg-intercept-cleanup.patch;patch=1;maxrev=241 \
 "
-- 
1.6.5.4



