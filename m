Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O41iY-0001cs-HQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 02:53:35 +0200
Received: by qyk33 with SMTP id 33so536863qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 17:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=c0TD++yhIUXaQwWDGAL8DVqFq/cpqw5HcL37AZxS0n4=;
	b=hSrVvaJm3xUdJwIW7e0gSk3YHJU93NAWEZpIhHMBn/HFib8R/lsnwGQ0ZPpwNjayx6
	x5T8c3AWs1j3tiGWL5CwquK1TYWZgTiF8lCrjPbTgG5hPiuvgCKSnrz+XS1wSpqAt2Sc
	XH4Tyw0/CNoA6P8I/tjINw6P3aTwS8OEgregk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=bEA6FxY2syzx8QtiSHiaZdcuc06bFAItvlRmEKaT9OnQVTK8vVYw/azFzhZW2OiDxs
	iS7yTKa4SJ/VLIAcPNOT2wpvnTgUsibLEJH6MwHStE6InmP39yst/4HXkSFp/gWnwM2q
	4c8GArGzQDbFW1XsWcn5r6VIRHRqxjkGjAyt4=
Received: by 10.229.186.211 with SMTP id ct19mr420763qcb.16.1271724600678;
	Mon, 19 Apr 2010 17:50:00 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id y41sm3655857qce.23.2010.04.19.17.49.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Apr 2010 17:50:00 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 17:49:50 -0700
Message-Id: <1271724591-29429-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] base.bbclass: add <dir>/lib for each dir in BBPATH to the python search path
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
X-List-Received-Date: Tue, 20 Apr 2010 00:53:35 -0000

From: Chris Larson <chris_larson@mentor.com>

Also makes the os, time, and bb package availability explicit.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/base.bbclass |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index d3bfa76..a738cec 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -9,6 +9,29 @@ inherit utils
 inherit utility-tasks
 inherit metadata_scm
 
+python sys_path_eh () {
+    if isinstance(e, bb.event.ConfigParsed):
+        import sys
+        import os
+        import time
+
+        bbpath = e.data.getVar("BBPATH", True).split(":")
+        sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
+
+        def inject(name, value):
+            """Make a python object accessible from everywhere for the metadata"""
+            if hasattr(bb.utils, "_context"):
+                bb.utils._context[name] = value
+            else:
+                __builtins__[name] = value
+
+        inject("bb", bb)
+        inject("sys", sys)
+        inject("time", time)
+}
+
+addhandler sys_path_eh
+
 die() {
 	oefatal "$*"
 }
-- 
1.6.3.3



