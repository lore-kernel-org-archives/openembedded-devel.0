Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2C17570D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:17:56 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so20937409pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V3XdJHJdoSi6kuzW4zopbMJCuDPBjVDv5wYQLjxZeK0=;
	b=OMLQg7PiaOCjjeyzi4m6Dcpx78F7q4zdwWjhZxj5s0/o6uznSc4j2zl2CZVkU8b1cB
	/3dmHbrgWOpvS2FyRic9b3fDTEOY5IMemtzSfoZswBzgC3gqYcjywaGhr+lr8Lu+fosb
	op9wAqpyLsdzfmn0lN+uI9G6NnoviMjW9ge4nu22if5bklj9j7w1a/3sHBVO1VoEGiqL
	w+JHwLV5RHq0vSoB1s1WrEqyfJLlrUqAl2BkIObA8fu6MMBtXQ+HSFF/Z/7b+oOHy0tS
	ln2gcOJt6zxHueBPznxwZ8PWZOBEn0BrgtNKgj5e9s60ekiMsj0nzLrgqyb9ryU9Kve8
	UE+g==
X-Received: by 10.68.237.105 with SMTP id vb9mr27055135pbc.149.1433387877823; 
	Wed, 03 Jun 2015 20:17:57 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id fo5sm2054831pbb.41.2015.06.03.20.17.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:17:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:17:47 -0700
Message-Id: <1433387867-7893-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtwebengine: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:17:59 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index df82dd8..682e8de 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -16,6 +16,7 @@ DEPENDS += " \
 
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_i686 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
-- 
1.9.1


