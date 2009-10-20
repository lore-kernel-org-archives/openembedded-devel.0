Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1N0Lln-00078d-UB
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 22:57:30 +0200
Received: by fxm22 with SMTP id 22so6504544fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=O+GqWviRKt2zdXHhPtm8FhFqqZVd/+w+D0I3G1RkVnc=;
	b=VIBMRom+a+tgKfiatxQPOgyc/5k//MelaTCaMdGiaf2Lb/KvKkmsmECcwhUkgDj86Y
	X8ZTjXwcsL8SMtcHE6wjtyReJLD6gwDjl3QExHZGiL9/zD8lTxZoi4at/TPi4keKrFEH
	m3wiFvJ6dcuor4+4rRM8E0woKFHMZP6xBiLJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kY9ozPfxPXz7Y1pYt9yUGakmUi7xQyv96G1swbEMnfdyBHzOEcQHJ0jMbFdCdD+vEO
	gqJkuQV0290j1csP+ULdwC4bMBlzgK2w5ZdVNuu/EM1KakUsMOgiBiA2pK9ESNIunwOc
	pxx6jQYENV2SthRHGQ3ZrvgFfbZPB4LwXweok=
Received: by 10.204.152.151 with SMTP id g23mr6963134bkw.148.1256072187375;
	Tue, 20 Oct 2009 13:56:27 -0700 (PDT)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 21sm435456fks.9.2009.10.20.13.56.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 20 Oct 2009 13:56:26 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1N0Ll6-0001BX-Hd; Tue, 20 Oct 2009 22:56:44 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Oct 2009 22:56:38 +0200
Message-Id: <1256072198-4449-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] improve printing dependent tasks
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
X-List-Received-Date: Tue, 20 Oct 2009 20:57:31 -0000

Print names instead of Task-IDs (and not mentioning they're task ids).

Previously we printed e.g.:
Dependency loop #1 found:
  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (depends: Set([88, 282, 92, 87]))

Now we say
Dependency loop #1 found:
  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (dependent Task-IDs ['busybox-native, do_patch', 'update-rc.d, do_populate_staging', 'busybox-native, do_populate_staging', 'shasum-native.bb, do_populate_staging', 'busybox-native, do_unpack'])

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 lib/bb/runqueue.py |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 8b6e12d..df6e673 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -174,9 +174,17 @@ class RunQueue:
         self.runq_task = []
         self.runq_depends = []
         self.runq_revdeps = []
-
         self.state = runQueuePrepare
 
+    def runq_depends_names(self, ids):
+        import re
+        ret = []
+        for id in self.runq_depends[ids]:
+            nam = os.path.basename(self.get_user_idstring(id))
+            nam = re.sub("_[^,]*,", ",", nam)
+            ret.extend([nam])
+        return ret
+
     def get_user_idstring(self, task):
         fn = self.taskData.fn_index[self.runq_fnid[task]]
         taskname = self.runq_task[task]
@@ -247,7 +255,7 @@ class RunQueue:
                         valid_chains.append(new_chain)
                         msgs.append("Dependency loop #%d found:\n" % len(valid_chains))
                         for dep in new_chain:
-                            msgs.append("  Task %s (%s) (depends: %s)\n" % (dep, self.get_user_idstring(dep), self.runq_depends[dep]))
+                            msgs.append("  Task %s (%s) (dependent Tasks %s)\n" % (dep, self.get_user_idstring(dep), self.runq_depends_names(dep)))
                         msgs.append("\n")
                     if len(valid_chains) > 10:
                         msgs.append("Aborted dependency loops search after 10 matches.\n")
-- 
1.6.5



