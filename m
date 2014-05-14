Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f181.google.com (unknown [209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7E04A60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:25 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id ld13so2005316vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rarxu+5R0ugpgefvPH4PCrdXKSgwQ2RNPydhN1AWVHQ=;
	b=ZoPWRoWegmuaR1coWzqi66TPa6h+vzFwGtE1ysYFDPKGdq2p0XWbeEiCbHQorMKlnd
	RozvdaKuTQK6MsP2Wz7lsLMOVNpSpbvsrYWwzZfSKhSJ2b7XxENGrSFt5QVOw73C1q8n
	raHj9tnRLPYsFHBIViPbdy2wnxqIPaP9CoWUOKvlhnQKtt69tUJTw76sNIhZzGiHQXSu
	jnwWVdJGw0abyCFngdN6H7/bNC2/A+hZah4G22jKZ8BrF75VUhOiscNe+zAQ7jTz56FH
	euRUsjwyQ5iNo1qXAKzLv46g2tVNqykb0OOsL7U5EQW6r/1+ZGw/i9hlfEBDGxpzNH0Z
	PGBw==
X-Received: by 10.58.85.3 with SMTP id d3mr634612vez.34.1400058207007;
	Wed, 14 May 2014 02:03:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tf10sm2248664vdc.0.2014.05.14.02.03.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:44 +0200
Message-Id: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][WIP][PATCH 1/8] azy: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 97c509b..cb180fb 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -22,7 +22,7 @@ do_configure_prepend_class-target() {
 
 do_install_append_class-native() {
     install -d ${D}/${bindir}
-    install -m 0755 ${S}/src/bin/lemon ${D}/${bindir}/azy_lemon
+    install -m 0755 ${B}/src/bin/lemon ${D}/${bindir}/azy_lemon
 }
 
 inherit efl
-- 
1.9.3


