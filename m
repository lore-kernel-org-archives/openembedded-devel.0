Received: from gateway-2929.mvista.com ([206.112.117.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1NXKQU-0004Lt-P4
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 21:11:52 +0100
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id CC0C21DBCA; Tue, 19 Jan 2010 12:09:25 -0800 (PST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 13:01:07 -0700
Message-Id: <1263931267-18470-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 206.112.117.47
X-SA-Exim-Mail-From: clarson@mvista.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] base.bbclass: add 'any' and 'all' functions.
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
X-List-Received-Date: Tue, 19 Jan 2010 20:11:53 -0000

Python 2.5+ has these functions built-in, but we don't yet require 2.5+.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 4d25258..dc56282 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1,5 +1,20 @@
 BB_DEFAULT_TASK ?= "build"
 
+# Useful Python 2.5+ built-in functions
+def any(iterable):
+    """ Return True if any element of the iterable is true.  If the iterable is empty, return False. """
+    for element in iterable:
+        if element:
+            return True
+    return False
+
+def all(iterable):
+    """ Return True if all elements of the iterable are true (or if the iterable is empty). """
+    for element in iterable:
+        if not element:
+            return False
+    return True
+
 python () {
     env = {}
     for v in d.keys():
-- 
1.6.6



