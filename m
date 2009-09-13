Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MmxpN-0005f2-9f
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 00:45:52 +0200
Received: by fxm22 with SMTP id 22so1787753fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2009 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=pjoG7xT2/d/nW8rHf3wYNW51HRStDiSP+Hsh4qcL33k=;
	b=l6dnROfDRUE5qoqOYr1CYSV9JSoJQ6T/PvOYgOgH9JXDPQsYEFkqw3HFc3ymZY+37B
	vyj2AY+285JseeXiR3f04b48uL3hPUSxTIsV7oITLGDkBH3oq8GpFTSN7jLxCHBXNsaw
	XZ6e2cmjTzl/hclD2Inhv3VRPODeS/bBFG1Ys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MxsFUoQO7CrpA4HumJlG/wpbA8t1vsAtP1/SeWy7a0KHQgn8wKvDq4lRcM4FIqnUIQ
	3tf77reVQu9Yy/a4hYEycPtSY0sYPB2McxQF3blqeF7jH2VoU8SiAjceI0JVu10o3kLP
	2xDgFbdoJIsYqfH9M9ycIzYUvJ248mUvkyfrs=
Received: by 10.204.154.213 with SMTP id p21mr4497397bkw.163.1252881918770;
	Sun, 13 Sep 2009 15:45:18 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 35sm7982407fkt.46.2009.09.13.15.45.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 13 Sep 2009 15:45:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: bitbake-dev@lists.berlios.de,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2009 00:43:58 +0200
Message-Id: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Sun, 13 Sep 2009 22:45:52 -0000

---
 lib/bb/providers.py |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/lib/bb/providers.py b/lib/bb/providers.py
index 8970fb3..feaee52 100644
--- a/lib/bb/providers.py
+++ b/lib/bb/providers.py
@@ -63,7 +63,18 @@ def sortPriorities(pn, dataCache, pkg_pn = None):
 
     return tmp_pn
 
+def isPreferredVersion(pe, pv, pr, preferred_e, preferred_v, preferred_r):
+    """
+    Check if the version pe,pv,pr is the preferred one.
+    If there is preferred version defined and ends with '%', then pv has to start with that version after removing the '%' in the end,
+    """
 
+    if (pv == preferred_v or (preferred_v != None and preferred_v.endswith('%') and pv.startswith(preferred_v[:len(preferred_v)-1]))):
+        if (pr == preferred_r or preferred_r == None):
+            if (pe == preferred_e or preferred_e == None):
+                return true
+    return false
+    
 def findPreferredProvider(pn, cfgData, dataCache, pkg_pn = None, item = None):
     """
     Find the first provider in pkg_pn with a PREFERRED_VERSION set.
@@ -96,7 +107,7 @@ def findPreferredProvider(pn, cfgData, dataCache, pkg_pn = None, item = None):
         for file_set in pkg_pn:
             for f in file_set:
                 pe,pv,pr = dataCache.pkg_pepvpr[f]
-                if preferred_v == pv and (preferred_r == pr or preferred_r == None) and (preferred_e == pe or preferred_e == None):
+                if isPreferredVersion(pe,pv,pr,preferred_e,preferred_v,preferred_r):
                     preferred_file = f
                     preferred_ver = (pe, pv, pr)
                     break
-- 
1.6.4.2



