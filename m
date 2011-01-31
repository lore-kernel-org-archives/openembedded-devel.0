Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pk22s-00049W-5x
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 23:16:26 +0100
Received: by ywi6 with SMTP id 6so2235901ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=tyW9jg3D54ry8k/wUxL6KX5Uxz0iYMF96mJinU0h8ZE=;
	b=ikkdoEHIT4c3EOZ22GgxZObvmlm8acLzVSJCJw8SP51ZOE3WuhXqk+xGCPlabdZp7L
	SO3Gbf3WxbVF56uuhmbA+xTdhWk4CK9hjE4ikMB713GGlAO24L5jrY+CBoVn+wV9ASof
	dB/e14TrG7cNt9hsk81+p3+XvOP/TTn4IJ6VY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Q/ougJiTCt7MIjn8dWG/v8zOLjTGNK8+ckeA74wvlrrQMWVqZjN2bV7rrF/PUquSzF
	2pKp09MwuFs+UAYF5Mn8IogjZT4lMmznmuPc+7GyjTnubsFwYq1wHd8LozRp20A66ZxP
	3AM20pmtIE63RwdwLVQuHu/oqQGBZ9tn5frhg=
Received: by 10.100.152.8 with SMTP id z8mr4334668and.65.1296512128759;
	Mon, 31 Jan 2011 14:15:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c34sm26399174anc.10.2011.01.31.14.15.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Jan 2011 14:15:27 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 16:15:40 -0600
Message-Id: <1296512140-16744-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] sourceipk: fix race condition with compileconfigs
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
X-List-Received-Date: Mon, 31 Jan 2011 22:16:26 -0000

* This patch adds an empty compileconfigs function to the
  sourceipk class.
* This is required because when making a sourceipk of a
  package using the multi-kernel.inc functionality you will
  have a race condition between the compileconfigs of the
  multi-kernel file building the kernel and sourceipk trying
  to copy and patch the sources.  The resulting conditions
  can then occur:
    - You will package some interim build files, yielding
      a sourceipk that is not consistent between builds
    - You will try to copy interim build files as they are
      being deleted which will result in an error and break
      the build.
* The empty compileconfigs function is overwritten by the
  real compileconfigs function when the multi-kernel.inc file
  is used.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/sourceipk.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 8a92115..1b4a318 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -144,7 +144,18 @@ EXPORT_FUNCTIONS do_create_srcipk
 
 do_create_srcipk[deptask] = "do_patch"
 
-addtask create_srcipk after do_patch before do_configure
+# Add a blank compileconfigs task.  This allows the sourceipk to schedule
+# its copy of the sources for kernels using the multi-kernel functionality
+# before the compileconfigs task.  Failure to do this results in a race
+# condition where in the best case the sources packaged may contain binary
+# builds and in the worst case binary files being cleaned cause an error
+# in the copy command for the sourceipk.
+do_compileconfigs() {
+    :
+}
+addtask compileconfigs after do_patch before do_configure
+
+addtask create_srcipk after do_patch before do_compileconfigs
 
 #Add source packages to list of packages OE knows about
 PACKAGES_DYNAMIC += "${PN}-src"
-- 
1.7.0.4



