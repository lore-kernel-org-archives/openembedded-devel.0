Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6AF6AF54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:32 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so5467069ead.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pHb49JKjB2hXdN47VeKKJ+mS7AifIK+ZDzICjrXUNOY=;
	b=mpcNHg41sibYYh04+bvwAux+zNv61aNyDagNc9novO0rKCL8PZpBarSJxIa1PwMpwL
	iH+5vzG57xaDbh+hBiVZm6GnmUHOzPG0Z4HZCBi51TXGYyCPHczBU0p+OIjzNlyTRGDo
	zZaSLCS2iK+6CWDLXhlhTsHhX/PKN64uWqhh5Q7JuN4DtP1BM3nl7gihHoa/O8eKa8EA
	2mN3g29eSzXvJjLfXJswjtqqBL9v9K3yhN4viQlwQGB0k9LIR8EU/AJjEaR0dyRBS3r/
	FSJ7ZCPCMTQ5TAQndTIPnOxfLxDQoIABREGzGlQlPculPoEkllDiuNUZVBt0z/sCzY84
	KwKQ==
X-Received: by 10.14.207.194 with SMTP id n42mr5813179eeo.76.1388483372801;
	Tue, 31 Dec 2013 01:49:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	a51sm116613640eeh.8.2013.12.31.01.49.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:17 +0100
Message-Id: <1388483363-28575-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 05/11] libdvdread: Use _remove operator to drop silent rules
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:33 -0000

* replace causes different signatures for different MACHINES, see
  http://lists.openembedded.org/pipermail/openembedded-core/2013-November/086510.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
index d5695ca..afc8a14 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "0bea15da842a4b04a482b009d72dcc6d9c9524ccc1bf67e5748319ec5a
 
 inherit autotools lib_package binconfig pkgconfig
 
-CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
+CONFIGUREOPTS_remove = "--disable-silent-rules"
 
 do_configure_prepend() {
     # For some weird reason, libdvdread only provides a `configure2' script...
-- 
1.8.4.3


