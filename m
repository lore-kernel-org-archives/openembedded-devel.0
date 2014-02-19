Return-Path: <net147@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3DC6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 01:59:26 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id um1so17431002pbc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vmAADeMd1YQK2JcrOyIZqXN2xJ6FkGmNoY3c0RsbTS8=;
	b=DZ5grHvcNNDylU44OAYp+SJi3xkjQ2QcBMJnNTcHLnH8uRvJzb87s6FarZz4g6pnZa
	616xKL681GOB2QTn8OXRefN7uDoaF3v2a2IR1D5G26Ra1OfQLN8I03T6igZMMcWsGTEr
	qaDuy03BD97qU2wTLDzmIMnMj/NhH48aQ3uBcKIjNYmCsbJliz4a3tMerHbFzygT41P5
	RcU7CqPnRL0pOh5aGvgCXSMd3W39jHLeD9hbt357+DUpyFgxFOeekvNjh91JsY3PVjYY
	ci5kBkxk9f/ipOZfEygfNca2swfYXZ6xUrplUdEJLzWNL9ENkC+IfG3oPKcQJg2OnS4d
	zp5w==
X-Received: by 10.68.134.130 with SMTP id pk2mr7230849pbb.167.1392775167727;
	Tue, 18 Feb 2014 17:59:27 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id n6sm60493726pbj.22.2014.02.18.17.59.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 17:59:27 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 13:03:11 +1100
Message-Id: <1392775391-1469-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [meta-qt5][jansa/qt5-5.2.1][PATCH] qtbase: add mtdev packageconfig
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
X-List-Received-Date: Wed, 19 Feb 2014 01:59:26 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index f056393..3468211 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -74,6 +74,7 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 # gl or gles2 is needed in order to build qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
 PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
+PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb,-no-xcb,xcb-util-wm xcb-util-image xcb-util-keysyms"
-- 
1.8.5.4


