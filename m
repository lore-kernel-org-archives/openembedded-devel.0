Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8070973D41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:44:50 +0000 (UTC)
Received: by wgso17 with SMTP id o17so126187062wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UAkbfkC76XhoUYtg1cNbK/RrmwtnfAccHnHwLTJvCqM=;
	b=l64D5kArqrDrIe20Cm/opL/4Poy+tY4QoMeMjO4vnwEZzQXd6VVRmPpUoui4c3X/4x
	9Qvy00CAnkD3cx17EapUlJytkQ1+Wm6fUuyCIZzqf6q1fpSbUN8xE/O7wErsJkgrQobL
	6mhcoZPBiOlRN7p8IOGQFaOsSxUWjlbhufRONrE21Mo50ysnhfIHYK6/Elo00BC8HPiX
	T2tfjFnPSEL3mUgI8ljRFIXPGfVt/7v+Ed8E/YGrxbf0WIX5hru40X/EdfSBFTFA1MJg
	VK0Rzx4EcU2FSO0xz1u6Sp28LnxpG0/F43aJTqPm/VAgkmjTzTmrYdqNH9tkE3QKBLN8
	iiLA==
X-Received: by 10.180.75.102 with SMTP id b6mr23045119wiw.75.1430160291790;
	Mon, 27 Apr 2015 11:44:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id o5sm12918159wia.0.2015.04.27.11.44.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:44:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:45:42 +0200
Message-Id: <1430160343-2781-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] gsoap-native: add missing dependency on flex-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:44:51 -0000

* otherwise fails with:
| gcc  -DHAVE_CONFIG_H -I. -I/work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/gsoap/src -I../..   -isystem/sysroots/x86_64-linux/usr/include -DWITH_BISON -DWITH_LEX  -DSOAPCPP_IMPORT_PATH="\"/sysroots/x86_64-linux/usr/share/gsoap/import\"" -DLINUX -isystem/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o soapcpp2-soapcpp2_yacc.o `test -f 'soapcpp2_yacc.c' || echo '/work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/gsoap/src/'`soapcpp2_yacc.c
| /bin/bash /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/ylwrap /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/gsoap/src/soapcpp2_lex.l .c soapcpp2_lex.c -- /bin/bash /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/missing flex
| /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/missing: line 81: flex: command not found
| WARNING: 'flex' is missing on your system.
|          You should only need it if you modified a '.l' file.
|          You may want to install the Fast Lexical Analyzer package:
|          <http://flex.sourceforge.net/>
| make[4]: *** [soapcpp2_lex.c] Error 127
| make[4]: Leaving directory `/work/x86_64-linux/gsoap-native/2.8.12-r1/build/gsoap/src'
| make[3]: *** [all-recursive] Error 1
---
 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
index 46fabbb..ac90155 100644
--- a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
@@ -1,6 +1,6 @@
 require gsoap_${PV}.inc
 
-DEPENDS = ""
+DEPENDS = "flex-native"
 EXTRA_OEMAKE = ""
 
 inherit native
-- 
2.3.5


