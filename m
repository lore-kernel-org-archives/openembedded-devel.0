Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 510056028A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 21:50:11 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id e16so1388645lan.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dHvZFqjwWhefFF8yVv8CNHP3IXfaZO/wBJQjBkNqjYw=;
	b=mV0yAYGUs8nBDYvEjycRK3PbTpyFYNuZqrs0cqEqdol/Kpd0+qr43OwcB+qffsFdWB
	WzOfzlOIZViTPmtz0qGeLzMpaGinlo6mDsy8PjiAEftJArkIQkRDYZMGYokwjznCRXIS
	y995PEKNlVmy9cCcTHAJcYZDbJ7LOTfgr6gCVFmf/16brBqqEvlsVgAOkeqTRcZnk3Xt
	MPcLjv+dPsVoSVhhoTaBnfkCIq3BNhkOkLq/P3Gou8WE41R8k0hE65+rzCr0Sqozjg4W
	3gMqQNaJUW62iAxziE4OeBrvhj0otnUrZWc5AbH+/Yote8/XR+PqczopygNuj50Lp+kt
	XVAw==
X-Received: by 10.152.205.106 with SMTP id lf10mr9273371lac.21.1399240212559; 
	Sun, 04 May 2014 14:50:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q2sm6245409laj.9.2014.05.04.14.50.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 14:50:11 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 23:50:29 +0200
Message-Id: <1399240229-6377-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][WIP][PATCH] efl: fix pkg-config files when B!=S
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
X-List-Received-Date: Sun, 04 May 2014 21:50:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index bdb5834..d8cdd11 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -14,7 +14,7 @@ do_configure_prepend() {
 }
 
 do_install_prepend () {
-    for i in `find ${S}/ -name "*.pc" -type f` ; do \
+    for i in `find ${B}/ -name "*.pc" -type f` ; do \
         sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
     done
 }
-- 
1.9.1


