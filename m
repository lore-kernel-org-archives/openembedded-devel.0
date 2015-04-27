Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D973C73D9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:45:15 +0000 (UTC)
Received: by wgen6 with SMTP id n6so125845799wge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UAkbfkC76XhoUYtg1cNbK/RrmwtnfAccHnHwLTJvCqM=;
	b=ATeoBoeNSJxJjyDXELI7zTZR2bWNUMQGxuHLiqqjkR1Je4ygugMjB55BKqqRQTy/Os
	19w43t7h9hQH/kiPkaB6Ua5jEeitT3e5WKLaPamXEBentm9XlttHiNqLfc613dZip5C4
	UqaNkfZY9aE5Fazsi0fA/h83Z1UEbJC4m/m9zWC4LLJ8duiHThZTJtjWVp8/WjIT8MA8
	Rj7cE6ZDbqfi06464bafV+ReYWQfsAzuAntHz0ZTII8xuoENnAGB6xpJiJMxSEtZ+dli
	3E/nu5MSbxSz5qK/gwojuFHn/Ne5BlJWbcCyjAPJeZSq6y/tfVojkF6JEXmOraNIDk0y
	nJoQ==
X-Received: by 10.194.7.97 with SMTP id i1mr25592464wja.107.1430160316416;
	Mon, 27 Apr 2015 11:45:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id u6sm30558164wjy.13.2015.04.27.11.45.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:45:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:46:08 +0200
Message-Id: <1430160369-3099-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][dizzy][PATCH 3/4] gsoap-native: add missing dependency on flex-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:45:18 -0000

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


