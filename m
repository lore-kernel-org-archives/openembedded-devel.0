Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6N-0005cR-FH
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4bJj+jUmxD189ckuPjGYSGiqbNTZuA4GqGsHSsrM0Ks=;
	b=e2QL+mByq84vel6C76A0NSpAtRqCXdXHPOFDx1nEkVnr8U55CoC9/iXDlNRhnFGftz
	oMdChCNDCI3zawunfdzgQSKpio0P5R2gSLpnFx0AHdP3DtoWKEJgGrEWcadsiMqrAraZ
	1wgNsrgWFERjsqDh6vYd7hIG9lr46F9tqjkJXQImIe/ag8gp4Sdh+/vanIYtSBGaVSYu
	WQKeBmSIOz6rREyNNOIp3Ff3UVkg+LGIpfMHMunm0yIYonbIkGrXRknSeG/oZV1eD9ZG
	21QCef0aegPSZzPMhWQHHO6B9q2NGKkfbX6y8SXji7dw9Fp0vABR1W366xpdQh0Dhonj
	emOA==
Received: by 10.14.1.69 with SMTP id 45mr62023143eec.23.1354048544331;
	Tue, 27 Nov 2012 12:35:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm11420442eep.9.2012.11.27.12.35.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:52 +0100
Message-Id: <812dccd218937aae84fce9ecb8f429e8bfb338b9.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 15/21] edje: backport patch to fix e-wm build
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
X-List-Received-Date: Tue, 27 Nov 2012 20:50:25 -0000

* 1.7.2 wont be released before E17 is finished, until then we need to backport
  mandatory patches or use conf/distro/include/efl-from-svn-recipes.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje/r79484.patch | 52 ++++++++++++++++++++++++++++++
 meta-efl/recipes-efl/efl/edje_1.7.1.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-efl/recipes-efl/efl/edje/r79484.patch

diff --git a/meta-efl/recipes-efl/efl/edje/r79484.patch b/meta-efl/recipes-efl/efl/edje/r79484.patch
new file mode 100644
index 0000000..68dc02d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje/r79484.patch
@@ -0,0 +1,52 @@
+Upstream-Status: backport
+
+Index: src/bin/edje_cc_out.c
+===================================================================
+--- a/src/bin/edje_cc_out.c	(revision 79483)
++++ b/src/bin/edje_cc_out.c	(revision 79484)
+@@ -1900,27 +1900,32 @@
+           {
+              for (i = 0 ; i < pc->programs.fnmatch_count ; i++)
+                {
+-                  if (!strcmp(pl->u.ep->name, pc->programs.fnmatch[i]->name))
++                  if (pl->u.ep->name && pc->programs.fnmatch[i]->name &&
++                      !strcmp(pl->u.ep->name, pc->programs.fnmatch[i]->name))
+                     data_queue_anonymous_lookup(pc, pc->programs.fnmatch[i], dest);
+                }
+              for (i = 0 ; i < pc->programs.strcmp_count ; i++)
+                {
+-                  if (!strcmp(pl->u.ep->name, pc->programs.strcmp[i]->name))
++                  if (pl->u.ep->name && pc->programs.strcmp[i]->name &&
++                      !strcmp(pl->u.ep->name, pc->programs.strcmp[i]->name))
+                     data_queue_anonymous_lookup(pc, pc->programs.strcmp[i], dest);
+                }
+              for (i = 0 ; i < pc->programs.strncmp_count ; i++)
+                {
+-                  if (!strcmp(pl->u.ep->name, pc->programs.strncmp[i]->name))
++                  if (pl->u.ep->name && pc->programs.strncmp[i]->name &&
++                      !strcmp(pl->u.ep->name, pc->programs.strncmp[i]->name))
+                     data_queue_anonymous_lookup(pc, pc->programs.strncmp[i], dest);
+                }
+              for (i = 0 ; i < pc->programs.strrncmp_count ; i++)
+                {
+-                  if (!strcmp(pl->u.ep->name, pc->programs.strrncmp[i]->name))
++                  if (pl->u.ep->name && pc->programs.strrncmp[i]->name &&
++                      !strcmp(pl->u.ep->name, pc->programs.strrncmp[i]->name))
+                     data_queue_anonymous_lookup(pc, pc->programs.strrncmp[i], dest);
+                }
+              for (i = 0 ; i < pc->programs.nocmp_count ; i++)
+                {
+-                  if (!strcmp(pl->u.ep->name, pc->programs.nocmp[i]->name))
++                  if (pl->u.ep->name && pc->programs.nocmp[i]->name &&
++                      !strcmp(pl->u.ep->name, pc->programs.nocmp[i]->name))
+                     data_queue_anonymous_lookup(pc, pc->programs.nocmp[i], dest);
+                }
+           }
+@@ -2466,6 +2471,7 @@
+ _data_queue_part_lookup(Edje_Part_Collection *pc, char *name, char *ptr, int len)
+ {
+    Code_Lookup *cl;
++
+    cl = mem_alloc(SZ(Code_Lookup));
+    cl->ptr = ptr;
+    cl->len = len;
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.1.bb b/meta-efl/recipes-efl/efl/edje_1.7.1.bb
index b676c1a..67cf95e 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.1.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+  file://r79484.patch \
 "
 
 SRC_URI[md5sum] = "f0be474e4b4d51704dc64ec27941c2ad"
-- 
1.8.0



