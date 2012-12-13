Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhV-0006uy-84
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:21 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522359eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3H1MSk7XGGNmuDATFmXA35EgK/0FrEUcQXwiXSa2l5U=;
	b=nl4QtjOmtVvz/Ln3+YukyG4auMJ7nb0pJ6hWAtkoOY3Wno6JbWkPUY0CYpd+uEWXWl
	tRna3imtLoqN6nsbmDRigPZ84ee1GSjKv95UKKu+wUDJ54dnlqlEDAF2XNZRd4OXJ8mI
	svu68L6eScU8kEcmFqs9xD5m8KQK7cv36IAl+4fEAbz0g9vnsyqZXuppjtmEAbmWE6LB
	RHcBMtxJganw/DGuVSQKgT2KNQhGI4dEhD3DqeHpMBoRJL/Y+CE5HWb6Mv+0xb/ZEJVK
	041CmFdWGkc/dnicRdVdl5ENZcZ3wIWCr+lyjuejXFlKp9pVtk8zc6yfuVFWBqrUuEk/
	+1cQ==
Received: by 10.14.0.71 with SMTP id 47mr9176189eea.19.1355438506013;
	Thu, 13 Dec 2012 14:41:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm5678232eel.17.2012.12.13.14.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:42 +0100
Message-Id: <dbd823cfbfc9f332aa40c4a55affba71807fcb41.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/11] qconnman-e: fix unpackaged files QA warning
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:21 -0000

* fixes:
qconnman-e-0.0+gitr1+f976b18c7c5584627224784801803e9fd3ebe0ff: qconnman-e: Files/directories were installed but not shipped
  /usr/share
  /usr/share/qconnman
  /usr/share/qconnman/i18n
  /usr/share/qconnman/i18n/pt_BR.qm

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb | 2 ++
 meta-oe/recipes-qt/qconnman/qconnman.inc      | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
index 87a3610..2fcd3da 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
@@ -6,3 +6,5 @@ inherit qt4e
 
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
+
+FILES_${PN} += "${datadir}/qconnman/"
diff --git a/meta-oe/recipes-qt/qconnman/qconnman.inc b/meta-oe/recipes-qt/qconnman/qconnman.inc
index f26274b..44ad9a1 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman.inc
+++ b/meta-oe/recipes-qt/qconnman/qconnman.inc
@@ -4,7 +4,7 @@ DEPENDS = "connman"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
-- 
1.8.0.2



