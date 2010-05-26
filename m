Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1OHA0U-0006yM-J7
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:22:23 +0200
Received: by ewy21 with SMTP id 21so599647ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MNNOisj87kh9kfdNuOQXn+RWc2n9qXWKDyHNUqX3l08=;
	b=JkEwgxrcY4x7646+QrnxiYhtHnKQgLGeryo4OOZJRE0SYDPRGQUEc1S8sK1yFgTOII
	WZuN7ce95hSwQaWI9S/PePXH7hekycwd/6opowYo0EC4lUFpTYgOw/GiqsqpMr6hnhOX
	VBgzX3JxqrYAPIqc0I3/sf0afk5WJu7tWMsuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WtrcrcTuLcnE2eglZddQq7Z+OLDD8zANwCHLlM6Y6cwhQ09uUhfGOxoN/bsnqa/p5h
	tkC/MrLxqhnylXzpMdp2mRCh6qideuqnWlTNxs+dBzFlrLitBFW7cJNhA+Bm/VVJwHV8
	z/YB5T5/XB5YqvpmunQlvGQfW3H+6vcUCBmT4=
Received: by 10.213.31.203 with SMTP id z11mr1048556ebc.88.1274854694770;
	Tue, 25 May 2010 23:18:14 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 14sm2872738ewy.2.2010.05.25.23.18.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 23:18:14 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:17:52 +0200
Message-Id: <1274854676-5931-3-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.221
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>, Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 3/7] Usermanual/features: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 06:22:23 -0000

From: Chase Maupin <chase.maupin@ti.com>

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Koen Kooi <k-kooi@ti.com>
---
 docs/usermanual/chapters/features.xml |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
index 3cbf1d8..0b82378 100644
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
+    search for packages that installs these libraries. These packages are
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
1.7.0



