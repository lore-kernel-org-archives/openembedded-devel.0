Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyJzF-0000a3-Eo
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 11:52:33 +0200
Received: by bkcik5 with SMTP id ik5so825193bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FhNVpaETzqTum4Fb85rd4joG8FX1npVr3p+BSbBu4PU=;
	b=vQa0XTh8zurNQdEiRbqdy2Xvz01h+sthqsOumnq4lj2rmR6iZsyz4LmscWcJ4Mf57d
	hi25TNdOYTq/oY0GRSOC9W1QWv00Dh+zB+hxozlKxnnBLJkgpMwo+MpF/TWSgjMhMUbc
	Hoe9v9zAA4LasPkXfpj9sNu+2rQsQ4octstkSbfwt0xET+Gm2LNoTh0pwgjCeo9zmwC0
	YNEviWne0srvCZ0w1e2nwP/HoB+LCh4JJY0x44eqRZLaLjWDojo+PKe0WBoYFRX/7RM4
	4rGAKmKBDbGI14aKCNldJbrM7FoPOMa3jJ6EDSUhnRgQJt+i0ZZ+BSnPwzbsaoah9vFo
	4oDg==
Received: by 10.205.134.139 with SMTP id ic11mr3940273bkc.40.1344246049011;
	Mon, 06 Aug 2012 02:40:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t23sm7051563bks.4.2012.08.06.02.40.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 02:40:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 11:40:42 +0200
Message-Id: <1344246042-26714-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Cc: , Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH] chromium-20: add unistd.patch which was used in 19*
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
X-List-Received-Date: Mon, 06 Aug 2012 09:52:33 -0000

* it fails to build later, but this is needed for sure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_20.0.1086.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-browser/chromium/chromium_20.0.1086.0.bb
index 527f317..50fad5c 100644
--- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
+++ b/recipes-browser/chromium/chromium_20.0.1086.0.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0750f191c9bbf46869b70508e7eb455b"
 DEPENDS = "xextproto cairo nss gtk+-native zlib-native libav libxi libgnome-keyring libxss cups"
 
 SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
-	file://include.gypi \
+        file://include.gypi \
+        file://unistd.patch \
 "
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-- 
1.7.8.6



