Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7981D6BE31
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2013 13:59:50 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id n12so2861510wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2013 06:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dYAsmFJgz7j91AGWz9Yzt9LsButlVKiWWT7v7A9qunU=;
	b=TqJZZD/4+ElIQtcrGcPFNUWQUUPP24zn119kUoEysdLqnpRtCzKSMcdSlzaqS/TvnY
	2OB9uKs333zpJKEbkzOWiuLxXyCSgdajEPF23gbMse1Vwp8RXexuhTPQs0KI4kRICXCt
	R8IKYhvoHHLQQIkiehNWP+PwBEwmXFiCPkIhvJsaTBK6TVFwiNGwKfnKeA5qEhQTjtxs
	0lsPEZu0r3472yCgL7jyBB99CInr3DNzBlyxx22YsxvTThZtNle7vUxmAXpB6sdX7R2m
	5Mgqk3ILtNM1U5ccf7Nqg11FZB3FONt7uYkZCIPmtf8Lc6/O3FmGgXtLqn7+bNijQ0gw
	4lHQ==
X-Gm-Message-State: ALoCoQnjRqzyga6xR5ES0eNH/np8cA/+B4vn0QMGLme7cpI0uNaudL2UCRCdDfwqQbVeO/PUTcdb
X-Received: by 10.180.89.147 with SMTP id bo19mr8710767wib.3.1378735191624;
	Mon, 09 Sep 2013 06:59:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d11sm17938102wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 06:59:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2013 14:59:44 +0100
Message-Id: <1378735184-16032-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] numlockx: remove spurious imake dependency
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
X-List-Received-Date: Mon, 09 Sep 2013 13:59:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index daa2c52..22dfbe4 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://home.kde.org/~seli/numlockx/"
 SECTION = "x11/apps"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dcb1cc75e21540a4a66b54e38d95b047"
-DEPENDS = "imake-native virtual/libx11 libxtst"
+DEPENDS = "virtual/libx11 libxtst"
 
 SRC_URI = "http://home.kde.org/~seli/numlockx/numlockx-${PV}.tar.gz"
 
-- 
1.7.10.4


