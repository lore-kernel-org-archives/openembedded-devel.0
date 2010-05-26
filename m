Received: from ey-out-1920.google.com ([74.125.78.144])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1OHA0Q-0006xx-65
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:22:19 +0200
Received: by ey-out-1920.google.com with SMTP id 26so197024eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UAZ8cr5ia5aic1z4eLFTykgC7Qhm63Y7NpTsNNgkN6g=;
	b=Q1z6KUV/J/oImfSUcY6V8WJWuGMo3HftYB/PPlGYyNoXwl2aBgQp0V6guQvNSej83p
	vYgArIwHjhCjNTxAxpxHPKziig5Sdb/bddrE5yNg6UmTZi2W36aJJPOtrdaGY/zW2DD7
	EGpcOkc3keT9CBIAtbUj9xMy9NEh/8KmjF+2Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AhMV+Je1WjX3soEWEOBGmYtVz2AnXaInRT5j6QYkxNJSqw50YD2WqHfN0HTShDCmwq
	IaLZt91FGSllmSkUcvxhbcw91S+uEq3/n1tFZvCaICmAvyu8wACAN2zQCdh8RO8G1Hh9
	1p/+KfD0TCTgQdkbPRCzGk9hXJz0/otwx9iao=
Received: by 10.213.3.4 with SMTP id 4mr1016219ebl.24.1274854692519;
	Tue, 25 May 2010 23:18:12 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 14sm2857006ewy.14.2010.05.25.23.18.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 23:18:12 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:17:51 +0200
Message-Id: <1274854676-5931-2-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 74.125.78.144
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>, Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 2/7] Usermanual/comparing: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 06:22:19 -0000

From: Chase Maupin <chase.maupin@ti.com>

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Koen Kooi <k-kooi@ti.com>
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
1.7.0



