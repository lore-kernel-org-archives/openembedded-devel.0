Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 826E97259B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 18:16:05 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so8428134qgd.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 10:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4aGQGFwzRZwFXC1/WUuYgR6cU5I8LTMZUCRWBZOsd78=;
	b=x69FdDxUKYy3fixoM/q7W7QxxlGcO1LD/Xz/j/1wTkxzH9BF4wizxKRsNfTM8C7erD
	OOPps043trXh4524VTCRVAVEtBRuHffMjsK93P7Un4hucgOlQH89Sp1ScWWxsIOP85jC
	i7Ft/VNQeVlsYszYfDkmLVHzU+bVb5nYYYGr7SVW+x9afDEjZulflKhb3oGwyzWEeJGu
	cTxncF/+4sAtRGzJhRzLPGxBANZNEcwM+gk+MAjGyZHJe9176jE/kYVMpQuNsuSZ3sgG
	warzF2Ok0GARJlBlgyWNKygVbC7PHCYelhu6WQwqDKoTE5u9sEA5Q6BNasQdVYphssbR
	Rmpw==
X-Received: by 10.229.126.5 with SMTP id a5mr68499065qcs.14.1418753765732;
	Tue, 16 Dec 2014 10:16:05 -0800 (PST)
Received: from localhost.localdomain (host29.reason.com.br. [187.49.239.29])
	by mx.google.com with ESMTPSA id w75sm1500138qgd.14.2014.12.16.10.16.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Dec 2014 10:16:05 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 16:15:58 -0200
Message-Id: <1418753758-2609-1-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [meta-oe][PATCH] zsh: fixing B!=S build issue
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
X-List-Received-Date: Tue, 16 Dec 2014 18:16:05 -0000

Provided correct path for gnu-configize, since It
is beeing executed in ${B} so It is not able to find
configure.ac

Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
index 86a546e..e18c25f 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -8,7 +8,6 @@ SECTION = "base/shell"
 LICENSE = "zsh"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
 
-PNBLACKLIST[zsh] = "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
 
 DEPENDS = "ncurses bison-native"
 
@@ -38,7 +37,7 @@ ALTERNATIVE_PRIORITY = "100"
 export AUTOHEADER = "true"
 
 do_configure () {
-    gnu-configize --force
+    gnu-configize --force ${S}
     oe_runconf
 }
 
-- 
2.2.0


