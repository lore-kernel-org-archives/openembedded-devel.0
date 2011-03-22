Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q29vs-0008Cl-8h
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 23:20:08 +0100
Received: by bwz10 with SMTP id 10so6082826bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=mUvkCbQw6ThLk9rrx+oQlJyHkwb/QyeS9SCBj7r6aSQ=;
	b=QqDBe4OAm07Hc2uVsmK7Alf00aVCjSA2Sg5stviCZqEPvqCFvtVoikToBEo2/Eg2Fu
	ydHCo1KAsjWS8v08+UAnJQ4tyrwqHZ3InnVFZu3WdkfESDhYbODaElPUgEz+rav+RECI
	poQiSOYMlxzmoxbI0vx/Fr3E/NM7LWZkvtLvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LbJuMC+hw3cEOujWk9QgWmyZdIgOxKrLfRrPGroqkL9fP6x/xqjnGqDyVQzP+vcbGC
	IndkJ5U2v5UnDD8jZrJEz5rcdMHF+VNw8X197cfbhG8rytU/Li4YSu5kZGNZz3gykw7N
	hJjHRck9htxOFUHOmSoIDKeuAGEx3R55fs/+k=
Received: by 10.204.19.20 with SMTP id y20mr124945bka.170.1300832270603;
	Tue, 22 Mar 2011 15:17:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm5483377bkx.19.2011.03.22.15.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 15:17:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 23:17:41 +0100
Message-Id: <1300832261-14946-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <20110322173359.GB10685@rhein.zuhause.netz>
References: <20110322173359.GB10685@rhein.zuhause.netz>
Subject: [PATCH] evas, pango, llvm-native: drop empty PACKAGES_DYNAMIC_virtclass-native as it's in native.bbclass now
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
X-List-Received-Date: Tue, 22 Mar 2011 22:20:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/efl1/evas.inc        |    1 -
 recipes/llvm/llvm-native.inc |    2 --
 recipes/pango/pango.inc      |    1 -
 3 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
index bcb1984..0310667 100644
--- a/recipes/efl1/evas.inc
+++ b/recipes/efl1/evas.inc
@@ -28,7 +28,6 @@ do_install_append() {
 FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/"
 
-PACKAGES_DYNAMIC_virtclass-native = ""
 PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-*"
 
 RRECOMMENDS_${PN} = " \
diff --git a/recipes/llvm/llvm-native.inc b/recipes/llvm/llvm-native.inc
index b3cb7a6..216b03d 100644
--- a/recipes/llvm/llvm-native.inc
+++ b/recipes/llvm/llvm-native.inc
@@ -19,8 +19,6 @@ EXTRA_OECMAKE = "\
 
 PACKAGES = ""
 
-PACKAGES_DYNAMIC = ""
-
 do_stage() {
   cd ${OECMAKE_BUILDPATH}
 
diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
index c54fbad..2e0f199 100644
--- a/recipes/pango/pango.inc
+++ b/recipes/pango/pango.inc
@@ -14,7 +14,6 @@ DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 BBCLASSEXTEND = "native"
 
 PACKAGES_DYNAMIC = "pango-module-*"
-PACKAGES_DYNAMIC_virtclass-native = ""
 
 RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
 RRECOMMENDS_${PN}_virtclass-native = ""
-- 
1.7.4.1



