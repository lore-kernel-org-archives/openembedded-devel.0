Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A9F6770C8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:49 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so9765794wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FsRfQgNOvSkLM6zY6SlSCqyPP1xYuYhnaDRt2MdSHu8=;
	b=yi+jUFeJuKAbjMA4FqNePPnMhRF3YfEFA7hHPR93doo9UZH5bIeT4Ei3fefQyNXPe2
	2nI1Hyd3+9wBETX7yrEPk+WNAkQTQ5VGzkWYRsLDfWuvRdcq2xP2MvBqXhqOnvV9HXil
	/1Lxp1RNxNlxhA7QQvgFathxPAd2W2puw9DuS05AHxzMm0QaugPmQCTyZAfvpwQUa/+z
	UPH6aDSdaELwg5HTTV+hKpwml2WAz9IRJXRlLFTjt5lcKr4aikYVDQNUJ5mgQXkqzv0B
	zEE4lWiGzGXeMD8XTVvGesrRECPzzWbU21C9iHidJyiHSP4zaOP8gJC/Vme+T+TIrcZN
	LNlQ==
X-Received: by 10.180.35.134 with SMTP id h6mr32924827wij.0.1407846290298;
	Tue, 12 Aug 2014 05:24:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb12sm8901480wjc.43.2014.08.12.05.24.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:13 +0200
Message-Id: <26202eb74f6ef4227ef90a159f1b68a806187f55.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 3/5] glmark2: Add virtual/libx11 dependency
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
X-List-Received-Date: Tue, 12 Aug 2014 12:24:52 -0000

* without it, do_configure fails:
  | Checking for 'x11'                       : not found
  | The configuration failed
* inherit distro_features_check

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
index 031e3b3..2efe6d6 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
@@ -8,14 +8,17 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12 jpeg"
+DEPENDS = "libpng12 jpeg virtual/libx11"
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "4f306664aa3886fa0cf93853603603f8"
 SRC_URI[sha256sum] = "bea6f9de2cdce376195bd91e4a2fdfdf80bf3e480abff8e05b90a6458c1deb47"
 
-inherit waf pkgconfig
+inherit waf pkgconfig distro_features_check
 
 PACKAGECONFIG ?= "gl gles2"
 
-- 
2.0.4


