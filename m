Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1Mgmbd-0006sq-Db
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 23:34:05 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id A565B1B815; Thu, 27 Aug 2009 14:15:26 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2009 14:12:57 -0700
Message-Id: <1251407577-2052-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.1.rc3.354.g332d31
Subject: [PATCH] insane.bbclass: only abort on the gettext check if it's the po makefile getting hte messages, for now.
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
X-List-Received-Date: Thu, 27 Aug 2009 21:34:05 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index b811ad0..c431b46 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -548,7 +548,7 @@ python do_qa_configure() {
     for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
         logfile = os.path.join(root, "config.log")
         crosscheck = "grep 'CROSS COMPILE Badness:' %s > /dev/null" % logfile
-        gettextcheck = "grep -E 'WARNING:  (po|intl)/Makefile.*\.in seems to ignore the .*dir setting$' %s > /dev/null" % logfile
+        gettextcheck = "grep -E 'WARNING:  po/Makefile.*.in seems to ignore the .*dir setting$' %s > /dev/null" % logfile
         if "config.log" in files:
             if os.system(crosscheck) == 0:
                 bb.fatal("""This autoconf log indicates errors, it looked at host includes.
-- 
1.6.0



