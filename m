Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D1F4A6F9F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:24 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7635400wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6R4HGzPworh4yXPknHhoQ/cYvIYTVKbC8Lba6pSF5g0=;
	b=CDbBvQ5uCl82GwD5v/NNpYQcGAiTwsE7SKhafoiUwCLszjxVF4yRa4z6wL0f2UVLN6
	OAaCNxgKZdvBekybvrWceS2P5EsBN/EsaG7DCOl/FswTtP30vkBQC0YsNGfpaa2hh2OZ
	CMtP8gvNd3QNYqmrrWwbauckNpgxZJpnwbhGYYudlN1NYY4vwXUMU+MezaWroPYLg9jK
	7Bt2E7WNqcQDXlRR5ueyhZlq21xQyaTj7cDPtje+pZe1MLyJSYOzT8Gru0MMuvWA9vfy
	fvCDkE4WHJqPqh+GzcrxyJ95UghxNeniS7L0IWCNSyfhLFrAptglpTEQ/5AuBc+FSpj9
	xICg==
X-Received: by 10.194.174.135 with SMTP id bs7mr4713501wjc.94.1396372465053;
	Tue, 01 Apr 2014 10:14:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm41877758eel.1.2014.04.01.10.14.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:21 +0200
Message-Id: <1396372434-10710-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/46] gnome-control-center: include datadir/mime in PN
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:25 -0000

* Fixes this QA warning:
  gnome-control-center-2.32.1: gnome-control-center: Files/directories were installed but not shipped
  /usr/share/mime/globs
  /usr/share/mime/globs2
  /usr/share/mime/magic
  /usr/share/mime/XMLnamespaces
  /usr/share/mime/subclasses
  /usr/share/mime/aliases
  /usr/share/mime/types
  /usr/share/mime/generic-icons
  /usr/share/mime/icons
  /usr/share/mime/treemagic
  /usr/share/mime/mime.cache
  /usr/share/mime/version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index beecfa7..ee25c1e 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -22,6 +22,7 @@ FILES_${PN} += "${datadir}/icon* \
                 ${libdir}/window-manager-settings/*.so \
                 ${datadir}/gnome \
                 ${datadir}/desktop-directories \
+                ${datadir}/mime \
 "
 FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
 FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
-- 
1.9.1


