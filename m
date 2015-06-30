Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AF3427320D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 01:45:32 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so126251844pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8tQFY4tuO7jGwA4rfj2H1Jdy8A1AqOOsQQVGX8f5kLc=;
	b=phjlHw+2Yd4Ab666qpc+wJ8mmBq4a91i50XwNkHZhDHJyj4t4rC1d/ZXvWvbIk4hNx
	3P0xw9xS432zIpVLbZkuvMEbQiIQxYh909/lgTJ2juMwDUTREAN8EOuCXhfKipghjEuD
	ebMsN2YtPLkSD138ijPlBm0YlmZXuH3sjjWSm2Ve7KJyDvT7g33O36Vb7HoD8Dis9SnC
	L0qUvjs/zDqC76cTmoJfq972ZP7v0tLx7KIAbuqewz7Jal92LXECFQz5WDMQPz36sd41
	X9tM8IMAUhvncopMuqIJDcx57PsZcBo0pC1X1jaTao5RUU5zw/BoHl0jeSEvsvw7RB9+
	tajA==
X-Received: by 10.68.135.233 with SMTP id pv9mr38517418pbb.115.1435628733838; 
	Mon, 29 Jun 2015 18:45:33 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id o7sm43621617pdi.16.2015.06.29.18.45.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jun 2015 18:45:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jun 2015 18:45:27 -0700
Message-Id: <1435628727-3417-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][fido][PATCH] qtwebkit: remove false dependency on leveldb
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
X-List-Received-Date: Tue, 30 Jun 2015 01:45:33 -0000

The qtwebkit configure test never succeeds in finding system leveldb
(ie qtwebkit internal copy of leveldb is always used) so leveldb is a
false dependency.

This change allows qtwebkit to be built in a disto which enables
security_flags.inc (it's otherwise blocked since the leveldb recipe
fails to build when security_flags.inc is used).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 77568af..759a81d 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee \
 "
 
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
 
 # qemuarm build fails with:
 # | {standard input}: Assembler messages:
-- 
1.9.1


