Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyNgF-0007Po-8c
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 15:49:11 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2377815wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GsIQEQwzc7nPt49RXcVQXCdxEDeuaJfbH3FNvoCqOpg=;
	b=MX0KwBQ/dOSuqaHZgq1Syc7420SkpLeoDyyTwUT83jbFrpvojiVxawdi9TVHb77EQl
	oP2QVUqQXP4NTIZj+5R7yhUUsl9zT/f+Oz4+Da9D8R9ZtzGT+JkbVEpHsYNmhSX2QiaM
	Qr6ptNuVRbl4EFxZYxIf564OhXi3UjjlPLN/OQCb1ciUBuYvlzAF9NjF+AtAujQTv2jU
	9Q6o1eeSP5SoDRof2GWS2IfodPhVzn5/y7b0WWgdixzOJ8vyMPUnsF1N77EaYMaIGaRQ
	GAVYJtq1LL6dlrI+vyILNvrkTpK1ZcFx9ZR2XicOgkG2hAvo4YAyHdF8S8TfVZ+vgQKh
	yJZw==
Received: by 10.180.74.33 with SMTP id q1mr18610676wiv.4.1344260248964;
	Mon, 06 Aug 2012 06:37:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm23028785wid.7.2012.08.06.06.37.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:37:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 15:37:06 +0200
Message-Id: <430f5aa8559a421553f412e1392ad929751c7665.1344259248.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1344259248.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/12] php: inherit pythonnative
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 13:49:11 -0000

* fixes:
| AUTOV is 1.12
| Traceback (most recent call last):
|   File "/OE/shr-core/openembedded-core/scripts/cp-noerror", line 8, in <module>
|     import shutil
|   File "/usr/lib/python2.7/shutil.py", line 12, in <module>
|     import collections
|   File "/usr/lib/python2.7/collections.py", line 9, in <module>
|     from operator import itemgetter as _itemgetter
| ImportError: /usr/lib/python2.7/lib-dynload/operator.so: undefined symbol: _PyUnicodeUCS4_AsDefaultEncodedString
| ERROR: Function failed: do_configure (see /OE/shr-core/tmp-eglibc/work/x86_64-linux/php-native-5.3.6-r1.0/temp/log.do_configure.14841 for further information)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 7f2dc45..7c03798 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -13,7 +13,7 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
 S = "${WORKDIR}/php-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig pythonnative
 
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
-- 
1.7.8.6



