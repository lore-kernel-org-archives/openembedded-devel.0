Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0B01C6D06A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:13 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so2498572eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pHb49JKjB2hXdN47VeKKJ+mS7AifIK+ZDzICjrXUNOY=;
	b=V3AMlnCKvaxO0BCxz78byvOlls5/bTR+Iq+AFFq5oTKhkyDP4yaqM+Tku64N2fYt8G
	tSRy/sJwBmkhaO87UqeBUWWygeyCWE8pUglNA87j2o7sOLLYRsb18MIWDoqUxk0MHQ9k
	V/6FU5/rnoXkSGzYA3pHPrKjBUT6XNn8pCFYP13MJM/Wx7N+DdSJdjUH3iwUjcmoht91
	XrSdytDzbGa1JwlK7SaEKfubGEUZ1//wprL1p7sZdmJwzcOrbrVjT5eJycCKLFjtECWP
	1HkF90Qowz+6Ag2g92X/C6oqkrFz7IDKxfijz0Jgm3e4hyO2Wi4oD/ihKPFSj+i+0nYz
	niNw==
X-Received: by 10.14.1.130 with SMTP id 2mr24598724eed.24.1384813275632;
	Mon, 18 Nov 2013 14:21:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x4sm42101907eef.1.2013.11.18.14.21.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:10 +0100
Message-Id: <1384813274-7231-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] libdvdread: Use _remove operator to drop silent rules
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
X-List-Received-Date: Mon, 18 Nov 2013 22:21:14 -0000

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


