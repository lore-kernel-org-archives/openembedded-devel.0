Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTk-0005OT-3d
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:54 +0100
Received: (qmail 26451 invoked by uid 813007); 4 Mar 2009 15:53:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:39 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPY-0001Cz-2v; Wed, 04 Mar 2009 16:53:32 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:24 +0100
Message-Id: <1236182004-4523-10-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 09/70] rpm: Add missing patches (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:17 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5154 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/extcond.patch   |   78 ++++++++++++++++++++++++++++++++++++
 packages/rpm/files/missingok.patch |   44 ++++++++++++++++++++
 2 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 packages/rpm/files/extcond.patch
 create mode 100644 packages/rpm/files/missingok.patch

diff --git a/packages/rpm/files/extcond.patch b/packages/rpm/files/extcond.patch
new file mode 100644
index 0000000..6963b86
--- /dev/null
+++ b/packages/rpm/files/extcond.patch
@@ -0,0 +1,78 @@
+This patch supports an extension in the condition evaluation.
+If the condition is a format and returns an nonempty string, it is
+assumed to be true.
+This mechanism is used by the weakdeps patch to filter the
+"RPMSENSE_STRONG" flag.
+
+--- ./rpmdb/header.c.orig	2005-06-06 23:33:54.000000000 +0000
++++ ./rpmdb/header.c	2006-03-17 18:08:02.000000000 +0000
+@@ -2980,8 +2980,12 @@ static int parseExpression(headerSprintf
+ 
+     *endPtr = chptr;
+ 
++    token->u.cond.tag.type = NULL;
++    token->u.cond.tag.format = "";
+     token->type = PTOK_COND;
+ 
++    if ((token->u.cond.tag.type = strchr(str, ':')) != 0)
++	*token->u.cond.tag.type++ = 0;
+     (void) findTag(hsa, token, str);
+ 
+     return 0;
+@@ -3239,6 +3243,7 @@ static char * singleSprintf(headerSprint
+     int_32 type;
+     int_32 count;
+     sprintfToken spft;
++    sprintfTag stag;
+     int condNumFormats;
+     size_t need;
+ 
+@@ -3270,6 +3275,18 @@ static char * singleSprintf(headerSprint
+ 	if (token->u.cond.tag.ext || headerIsEntry(hsa->h, token->u.cond.tag.tag)) {
+ 	    spft = token->u.cond.ifFormat;
+ 	    condNumFormats = token->u.cond.numIfTokens;
++	    if (token->u.cond.tag.fmt) {
++		/* check if format creates output */
++		size_t vallen = hsa->vallen;
++		formatValue(hsa, &token->u.cond.tag, element);
++		if (hsa->vallen == vallen) {
++		    spft = token->u.cond.elseFormat;
++		    condNumFormats = token->u.cond.numElseTokens;
++		} else {
++		    hsa->vallen = vallen;
++		    hsa->val[hsa->vallen] = 0;
++		}
++	    }
+ 	} else {
+ 	    spft = token->u.cond.elseFormat;
+ 	    condNumFormats = token->u.cond.numElseTokens;
+@@ -3291,19 +3308,22 @@ static char * singleSprintf(headerSprint
+ 	spft = token->u.array.format;
+ 	for (i = 0; i < token->u.array.numTokens; i++, spft++)
+ 	{
+-	    if (spft->type != PTOK_TAG ||
+-		spft->u.tag.arrayCount ||
+-		spft->u.tag.justOne) continue;
++	    if (spft->type != PTOK_TAG && spft->type != PTOK_COND)
++		continue;
++
++	    stag = (spft->type == PTOK_COND ? &spft->u.cond.tag : &spft->u.tag);
++	    if (stag->arrayCount || stag->justOne)
++		continue;
+ 
+-	    if (spft->u.tag.ext) {
++	    if (stag->ext) {
+ /*@-boundswrite@*/
+-		if (getExtension(hsa, spft->u.tag.ext, &type, NULL, &count, 
+-				 hsa->ec + spft->u.tag.extNum))
++		if (getExtension(hsa, stag->ext, &type, NULL, &count, 
++				 hsa->ec + stag->extNum))
+ 		     continue;
+ /*@=boundswrite@*/
+ 	    } else {
+ /*@-boundswrite@*/
+-		if (!headerGetEntry(hsa->h, spft->u.tag.tag, &type, NULL, &count))
++		if (!headerGetEntry(hsa->h, stag->tag, &type, NULL, &count))
+ 		    continue;
+ /*@=boundswrite@*/
+ 	    } 
diff --git a/packages/rpm/files/missingok.patch b/packages/rpm/files/missingok.patch
new file mode 100644
index 0000000..b008c9a
--- /dev/null
+++ b/packages/rpm/files/missingok.patch
@@ -0,0 +1,44 @@
+Obey MISSINGOK flag for dependencies. Backport from rpm-4.4.7.
+
+Index: lib/depends.c
+===================================================================
+--- lib/depends.c.orig	2008-04-01 08:28:22.000000000 +0100
++++ lib/depends.c	2008-09-04 14:09:58.000000000 +0100
+@@ -593,8 +593,13 @@
+ /*@=boundsread@*/
+ 
+ unsatisfied:
+-    rc = 1;	/* dependency is unsatisfied */
+-    rpmdsNotify(dep, NULL, rc);
++    if (rpmdsFlags(dep) & RPMSENSE_MISSINGOK) {
++	rc = 0; /* dependency is unsatisfied, but just a hint. */
++	rpmdsNotify(dep, _("(hint skipped)"), rc);
++    } else {
++	rc = 1;	/* dependency is unsatisfied */
++	rpmdsNotify(dep, NULL, rc);
++    }
+ 
+ exit:
+     /*
+@@ -963,6 +968,8 @@
+ 	return "Requires(postun):";
+     if (f & RPMSENSE_SCRIPT_VERIFY)
+ 	return "Requires(verify):";
++    if (f & RPMSENSE_MISSINGOK)
++	return "Requires(hint):";
+     if (f & RPMSENSE_FIND_REQUIRES)
+ 	return "Requires(auto):";
+     return "Requires:";
+Index: lib/rpmlib.h
+===================================================================
+--- lib/rpmlib.h.orig	2008-09-03 22:22:43.000000000 +0100
++++ lib/rpmlib.h	2008-09-04 15:17:17.000000000 +0100
+@@ -562,6 +562,8 @@
+     RPMSENSE_SCRIPT_POSTUN | \
+     RPMSENSE_SCRIPT_VERIFY | \
+     RPMSENSE_FIND_REQUIRES | \
++    RPMSENSE_MISSINGOK | \
++    RPMSENSE_STRONG | \
+     RPMSENSE_SCRIPT_PREP | \
+     RPMSENSE_SCRIPT_BUILD | \
+     RPMSENSE_SCRIPT_INSTALL | \
-- 
1.6.1.3





