Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4086FA66
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:25 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7943587wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qm3iZ/oqTC6bzE5e3SL3YjjRhpfk47bbqaOCM91lElY=;
	b=IxlZizPqQ6pMq6MasxiapXEjKBAIijQu4Qp6OC0Qgdj5AuGVmKlb7oZnlWB51hreFd
	b7RY7H5dKSZLa5VdCB83t0DQg+dpVTWLcO1yu8r3qHivQw9XxoXAsqIp2xkKqSpYWDvJ
	2CQY26ZIbV5vQ0rlGifOgzpsNKVaspYsZu8qUCNPQkF6eNTbSCs1jAIfdC66TEm5VMF0
	kn8GXS8dFEvhdVul7w/XcXjScHVIkkf5NIx7rdGXrCt7kOdujLDTrckOwKJFAvnvx6sM
	nRyRHCNRt3VmGYEGQ4yksaSeGcoYmw1q4/34EBmaoXdv4HIstlFRlqIr0RqgLtv2Y9hu
	DZtA==
X-Received: by 10.194.175.70 with SMTP id by6mr24188451wjc.3.1396372526521;
	Tue, 01 Apr 2014 10:15:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm41879967eev.5.2014.04.01.10.15.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:46 +0200
Message-Id: <1396372434-10710-38-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 38/46] libgnomecanvas: add intltool dependency
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 4a210a4..f0f0c1f 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -5,7 +5,10 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome
 
-DEPENDS = "gtk+ libglade libart-lgpl xineramaproto"
+# intltool to provide IT_PROG_INTLTOOL 
+# configure: line 12654: syntax error near unexpected token `0.35.0'
+# configure: line 12654: `IT_PROG_INTLTOOL(0.35.0)'
+DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool"
 
 SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
 SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
-- 
1.9.1


