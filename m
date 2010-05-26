Received: from mail-gy0-f193.google.com ([209.85.160.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OHGVw-0006yU-Qx
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:19:44 +0200
Received: by gyd5 with SMTP id 5so409797gyd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=q8IC7dO5R+M/Ldbrd4Iv9atIOB5j+JYoWq809w/v2m0=;
	b=wBNt41CfGygVQslHrLoQKRUrAh7jWUHrraXg87zqzaZI/17ZLQpTmMbsoaaaXDen/Q
	3dTJsWC1iGMRI+rHo9uEkNKWk1QppEBecyszF1MVQ0LFkMpQWWboWbQjSOIdxGt7JzJ7
	HXQ1AtayQk1HLBItD5vvmnHgOaxSfbU3QlVpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TYsyeEWApA7Pr3RFEeWG4Ira0UbhQgGbWjuS653zzh9p4oRFyYKerBOCz2Fnk0E5Js
	wxiai2jc5iscj6yqhaxKBxC261YT5GIUmDRKwqaLbX9qFSZflE6bXYgTv9MyrSPEn/GW
	wSb0V/2Q5tXGgFk5qwSjdVQsVnkTnTsoy58ys=
Received: by 10.101.11.22 with SMTP id o22mr10576611ani.159.1274879690993;
	Wed, 26 May 2010 06:14:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n18sm433983anl.12.2010.05.26.06.14.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 06:14:50 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:09:30 -0500
Message-Id: <1274879375-19626-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.193
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 2/7] comparing: Fix documentation errors
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
 docs/usermanual/chapters/comparing.xml |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/usermanual/chapters/comparing.xml b/docs/usermanual/chapters/comparing.xml
index 1347010..cfdaa95 100644
--- a/docs/usermanual/chapters/comparing.xml
+++ b/docs/usermanual/chapters/comparing.xml
@@ -5,13 +5,13 @@
   <section id="comparing_buildroot">
     <title>buildroot</title>
 
-    <para>Writing of <application>BitBake</application> recipes is more easy
+    <para>Writing of <application>BitBake</application> recipes is easier
     and more intuitive than writing Makefiles while providing higher
     flexibility. This allows you to tweak specific recipes for your very
-    special needs and to add new recipes very fast. You can build toolchains,
+    special needs and to add new recipes quickly. You can build toolchains,
     Software Distribution Kits (SDKs), complete Distributions or just single
-    packages. The flexibility of OpenEmbedded allows you to reuse the once
-    written recipes for many different purposes. OpenEmbedded provides
+    packages. The flexibility of OpenEmbedded allows you to reuse recipes
+    for many different purposes. OpenEmbedded provides 
     everything buildroot will be able to provide. But in contrast to buildroot
     OpenEmbedded will allow you to achieve what you really want to achieve.
     You can add new package formats, new filesystems, new output formats
@@ -21,11 +21,11 @@
   <section id="comparing_crosstool">
     <title>crosstool</title>
 
-    <para>Crosstool allows to create toolchains for you. It can only create
+    <para>Crosstool allows the creation of toolchains. It can only create
     the initial toolchain for you. It will not compile other needed libraries
-    or applications for you, it will not be able to track dependencies or to
+    or applications for you, it will not be able to track dependencies or
     package them properly. OpenEmbedded supports all configurations crosstool
-    supports. You can start to create toolchains with OpenEmbedded, then as
+    supports. You can start by creating toolchains with OpenEmbedded, then as
     your needs grow create a more complete SDK from already present base
     libraries and applications and if you recognize you need to have packages
     for the target you have them almost built already.</para>
@@ -38,7 +38,7 @@
     cross-compiling is hard itself but many people misuse the buildsystem they
     use to build their software. This will lead to a variety of issues you can
     run into. This can be failing tests on configuration because of executing
-    cross compiled binaries or crashes at run-time due wrong sizes of basic
+    cross compiled binaries or crashes at run-time due to wrong sizes of basic
     types. When utilizing OpenEmbedded you avoid searching for patches at many
     different places and will be able to get things done more quickly.
     <application>OpenEmbedded</application> allows you to choose from a pool
@@ -48,4 +48,4 @@
     output formats and filesystems. This allows you to create complete and
     specialized distributions easily.</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
-- 
1.6.0.4



