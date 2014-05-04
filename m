Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDBC65CD5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 19:02:02 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so3867293lbd.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eY8r6CkJLMP3ujCoJjdCukC7TkVY/V6G2hl7FrkTKSk=;
	b=Tgvh1t8bP88tJk8Cw1g+DtXQZJmgV3QYU/U3jCfHALL4+9myRPkxyElGYW7WVDmXAp
	zv44pnii9yr0ZHoCZqjLzNQCsB+7yVx33J1xs8uVppzm+P7usgYIH1ixdV51M8L2Rkxm
	/t6xXltfXXsTP/Hb8dFbi4evTlQrJwGcAOqhH88IhgfeybgOtle4tnAGTPipdoCQkjBn
	j5FVhbB1TU+MgC94JgofOs/UKFw5j6smci/Sum0OVKF9ESaB1mXm+U8xuNM0Rw6Ok4b5
	knOLlc66ic4RoJZ/i/glliPNmd+Tyk+dv77lxGtp/+XceVeYtzzKineipnLGt9Bl2x0e
	os3Q==
X-Received: by 10.112.171.67 with SMTP id as3mr22473591lbc.10.1399230122857;
	Sun, 04 May 2014 12:02:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q2sm5882627laj.9.2014.05.04.12.02.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 12:02:02 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 21:02:14 +0200
Message-Id: <1399230136-12456-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/4] e.bbclass: Fix do_configure_append for B!=S
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
X-List-Received-Date: Sun, 04 May 2014 19:02:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index 4bcc2bc..4ee80bf 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -8,7 +8,7 @@ do_prepsources () {
 addtask prepsources after do_patch before do_configure
 
 do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
 }
 
 export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
-- 
1.9.1


