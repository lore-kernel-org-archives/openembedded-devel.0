Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1NWd2w-00008B-Jj
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:52:37 +0100
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 0A636D48047
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 22:50:20 +0100 (CET)
Received: from localhost.localdomain (tal33-2-82-228-175-43.fbx.proxad.net
	[82.228.175.43])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 11309D48085
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 22:50:17 +0100 (CET)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 22:50:17 +0100
Message-Id: <1263765017-12302-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] usermanual : update note about PR
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
X-List-Received-Date: Sun, 17 Jan 2010 21:52:38 -0000

quoting Koen Kooi : Please don't set variables to the current default
value, but leave them out. We had tons of problems with vars getting
copy/paste where the default changed and we had to manually fix those
(e.g. efl.bbclass still pokes needlessly at PACKAGES).

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 docs/usermanual/chapters/recipes.xml |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index cad1d80..30364c0 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -323,9 +323,9 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     then the default value of "r0" is used.</para>
 
     <para><note>
-        <para>It is good practice to always define PR in your recipes, even
-        for the <emphasis>"r0"</emphasis> release, so that when editing the
-        recipe it is clear that the PR number needs to be updated.</para>
+        <para>As PR is set to "r0" as a default, it must not be defined at the
+        creation of the recipe. When editing the recipe for the first time, the
+        PR variable must be defined to "r1".</para>
 
         <para>You should always increment PR when modifying a recipe.
         Sometimes this can be avoided if the change will have no effect on the
-- 
1.6.3.3



