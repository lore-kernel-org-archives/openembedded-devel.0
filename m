Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD8A73296
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:34:50 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id i50so18162117qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=FpILLn1SGXfZBKPSlexldmANFrsjYd2/o0XZsNsNxEA=;
	b=mPVnCZomSEqSouNzv1CC7ERy3gBpXCpclfpjZPTWyZAw2hTTFl5Z8rf5laaiIXAbZX
	hE0V/Bgy/tqJ/vjYv8mmW0PjNbeYX90bJL9Ptm+ivOB5+/KbMKWbXGiMkmVED579rtLB
	fsvByaFIKAY2E8s3617PVFmaTayVqxmMgul13wfGDz36uBuuKGW4CeqK5O6VgGbjGfoO
	B9/pQXKWiUG5+lsQKUVH5hYUdyTsxw+nv+Wsb1oSrcbGQSOOksEl+ty7+QiDOWKLVo0A
	TPwoVxQV2K3n1fchkPHrl+VJEvOr32+69+1EI3GmgNxSm2Wvsn+ljz1GAyaN6S2ql4YQ
	+T9g==
X-Received: by 10.224.137.197 with SMTP id x5mr34432829qat.57.1423431291464;
	Sun, 08 Feb 2015 13:34:51 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 103sm9794660qgg.11.2015.02.08.13.34.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Feb 2015 13:34:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  8 Feb 2015 19:34:40 -0200
Message-Id: <1423431280-890-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 8/8] qt5.inc: Fix packaging of architecture independent data
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
X-List-Received-Date: Sun, 08 Feb 2015 21:34:50 -0000

The architecture independent data were being added to the '-dev'
package however it shouldn't be. For example the QtWebEngine had the
translation and the resources package were not being installed with
the main package, as it should be.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qt5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index bb0bcdc..af0a906 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -118,7 +118,6 @@ FILES_${PN}-dev += " \
     ${OE_QMAKE_PATH_LIBS}/cmake/* \
     ${OE_QMAKE_PATH_LIBS}/*.prl \
     ${OE_QMAKE_PATH_LIBS}/*.la \
-    ${OE_QMAKE_PATH_DATA}/* \
     ${OE_QMAKE_PATH_HEADERS}/* \
 "
 FILES_${PN}-dbg += " \
@@ -129,6 +128,7 @@ FILES_${PN}-staticdev += " \
     ${OE_QMAKE_PATH_LIBS}/*.a \
 "
 FILES_${PN}-examples = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/README \
     ${OE_QMAKE_PATH_EXAMPLES}/*/* \
 "
 FILES_${PN}-examples-dev = " \
-- 
2.1.4


