Received: from mail-yx0-f193.google.com ([209.85.213.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OHGVx-0006yZ-6R
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:19:38 +0200
Received: by yxg6 with SMTP id 6so18385yxg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=zqN1JtQmg2Z+T4yKxrkgdMndzKMPHMWUswEooaPTdQA=;
	b=H6rIUanVdo+l7RDbTb5IOhRyfO4qVr8BdzEYXabpSO/sGRe7VaHwGifc2mmWtcoTIC
	s6L/f6EnNDooNHWwKU7PcB4fE7vNSJAw+AnKvSA5l54sPdo6kEUVBtju/x9LFS4NLZV9
	L3NB6IDItp7Hk8nSZwuYsWH7MitiRILCJnDRE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CHlG4w0aoEFz6SwefcEw0l9FrHpQQWmmoQ4SYOvutEt98rSuffhK/K0hX2Y7rKTAQQ
	BeG6tKkhHyJIXLG+5trk3T7SkSC81qwn0pbixzvHb5/eYyFl+2dCzUInZwKM8A3pI15X
	deF9YtZJDQRyinlSryi0l00c2sI3EPMUxN3iY=
Received: by 10.101.135.31 with SMTP id m31mr10301942ann.164.1274879692375;
	Wed, 26 May 2010 06:14:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n18sm433983anl.12.2010.05.26.06.14.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 06:14:51 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:09:31 -0500
Message-Id: <1274879375-19626-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1274879375-19626-2-git-send-email-chase.maupin@ti.com>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.193
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 3/7] features: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 13:20:36 -0000

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/features.xml |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
index 3cbf1d8..880b75c 100644
--- a/docs/usermanual/chapters/features.xml
+++ b/docs/usermanual/chapters/features.xml
@@ -22,9 +22,9 @@
     <para>Run-time Dependencies (<command>RDEPENDS</command>) will be added
     when packaging the software. They should only contain the minimal
     dependencies to run the program. OpenEmbedded will analyze each packaged
-    binary and search for <command>SO_NEEDED</command> libraries. The
-    libraries are absolutely required by the program then OpenEmbedded is
-    searching for packages that installs these libraries. these packages are
+    binary and search for <command>SO_NEEDED</command> libraries. These
+    libraries are absolutely required by the program so OpenEmbedded will
+    search for packages that install these libraries. These packages are
     automatically added to the <command>RDEPENDS</command>. As a packager you
     don't need to worry about shared libraries anymore they will be added
     automatically.</para>
@@ -52,9 +52,9 @@ BBFILE_PRIORITY_local = "10"
     <title>Task-base <anchor id="task-base" /></title>
 
     <para>Task-base is new way of creating basic root filesystems. Instead of
-    having each machine setting a ton of duplicate variables, this allow a
+    having each machine setting a ton of duplicate variables, this allows a
     machine to specify its features and <command>task-base</command> builds it
-    a customised package based on what the machine needs along with what the
+    a customized package based on what the machine needs along with what the
     distro supports.</para>
 
     <para>To illustrate, the distro config file can say: <screen>
-- 
1.6.0.4



