Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id DBCAB65F14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 11:08:22 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so4030914wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=phM9/zJA/OCLcGgiRtFedrNP93wf/f2tcYm3imtHejg=;
	b=myzfb1VeFy1jVjuaBkep1oEUmmmKENJb/XKSVbiu/FQyzWlGD7Fi6YUDqcAOlI4MZp
	JzvK1bv95kGdoQDGUSneIl8tRZEyVXTWm+ntp8EP3mCaAsH+FaIdku0E+1aE/I3FsPVi
	1tzo8PO98jaroS8eo1xohTSnM25KmT6sux9+oL1owK12hFFGtQNHdZobi0+Y8aFSwjDl
	lT+1qxCuVp17tQ9OM0S1fWWFCF4a/jncife+FgZE4AioedLr+QHtLiOlLiYO5CINgt0d
	VYQIOzbrl4aNtocg/L8NbOBvbwLprHs4f56ydzpCmgeqKhDCe8nH1ks4Z/0EPGfgOvhI
	bypw==
X-Received: by 10.180.99.99 with SMTP id ep3mr25287531wib.42.1403521702050;
	Mon, 23 Jun 2014 04:08:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wv8sm19864373wjb.1.2014.06.23.04.08.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 04:08:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jun 2014 13:08:21 +0200
Message-Id: <1403521701-19861-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-efl][PATCH] layer.conf: Exclude some theme dependencies from siggen
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jun 2014 11:08:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/layer.conf | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index 5ed7bd6..53f4ff4 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -11,3 +11,15 @@ BBFILE_PRIORITY_efl-layer = "7"
 E_MIRROR = "http://download.enlightenment.org/releases"
 E_RELEASES = "http://download.enlightenment.org/rel"
 E_SVN = "svn://svn.enlightenment.org/svn/e"
+
+# RDEPENDS on update-alternatives provider opkg-utils
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
+  exquisite-theme-illume->opkg-utils \
+"
+
+# RDEPENDS on e-wm
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
+  e-wm-theme-illume-efenniht->e-wm \
+  e-wm-theme-illume-neo->e-wm \
+  e-wm-theme-b-and-w->e-wm \
+"
-- 
2.0.0


