Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 933396B961
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:07 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so7001633eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=r2tONMSdcK8n0NW3NlPHt6wvEXEX+ag9Prj6OAck4/Q=;
	b=LnuuGa85KLHtG4jYnCucSC/ErXVdLdIYwH/76LMyejHTn0/Mp71noIk5YgJmHnqL19
	yOxJeLCyKHIe3oE0/cbWfktadZxQOMVacQTkBFiNa/RjmNHo9HujdXOHpDLNnUIvyTRL
	vbKfXA10pdmFEifShZ8WdOCIfBetDf3yoKPLi8Bx0Ch7O4B3Nclusq5SOYJJU8Mn2KDe
	3dayRTwieH6SEXhXieDLZsGc5aGP5xmUt2MM9joRdZ84hr57hVbWLjhM1MgiyXl82i39
	wax0mVbZtRz8XlDfwcBj9nnj/sOKi4erILYlTlLpkR/jDMjJ8E2qr8J06F/ojZ2WPHCM
	mWPw==
X-Received: by 10.15.110.8 with SMTP id cg8mr25830517eeb.42.1388834048299;
	Sat, 04 Jan 2014 03:14:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm152645027eed.14.2014.01.04.03.14.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:13:59 +0100
Message-Id: <80e8c34db0c96ba2fe7c1838312df99001ff6602.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 3/9] cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:07 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* make files in bindir/sbindir a bit more deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 3d15ff3..0d0f5c6 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -13,6 +13,10 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+# when enabled, it creates ${bindir}/cifscreds and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
+# when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 talloc keyutils"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.3


