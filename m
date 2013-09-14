Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id AD84B6102D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 19:43:48 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so2594253pdi.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 12:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Nl9VqX7VscN+x1G3+pJtwDxOlgyHOhsCio4UxBBKCCc=;
	b=VAodf0qwCa9wNakqxUjeB/K4dPTvERL4C5fLpfjoN/sfwzAeMDuX7TZiMTL4dqpIyx
	d0N8Ov4PiA9glGmldnPF+VMzMxr/tvAALLBLC9z+0UAdhg8vJoMSePf+zKE//4YNeNP1
	Q7a64SNgzbcCPLwUOJJlf64z8w/2H5dYyeT7LzsVqpqZNuDWkf9THso7J8EUHg/2Dp7Q
	arJcAbKxsB1TludSHhYmiCafym1PLbOukp0etGL4132dZlTfbnMSATg0uUEllsMK8s7f
	nqkdNSiFmuvykGVaJ3P2iVyXwsCa42MySs+UjbR05u9Q0aiGc6WomTG7kcE7Xu7gam4Z
	ioUg==
X-Received: by 10.68.247.36 with SMTP id yb4mr20346400pbc.138.1379187830648;
	Sat, 14 Sep 2013 12:43:50 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	yh1sm15470402pbc.21.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 12:43:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Sep 2013 12:42:36 -0700
Message-Id: <1379187756-9984-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] proxy-libintl: Do not act as gettext provider
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
X-List-Received-Date: Sat, 14 Sep 2013 19:43:49 -0000

It only is a replacement for libintl so lets not
go overboard.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 0c652b6..df12299 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -5,9 +5,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
 
 PR = "r1"
-PROVIDES = "virtual/libintl virtual/gettext"
-RPROVIDES_${PN} += "gettext"
-RPROVIDES_${PN}-dev += "gettext-dev"
+PROVIDES = "virtual/libintl"
 
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip \
-- 
1.8.4


