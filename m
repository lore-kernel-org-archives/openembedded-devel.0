Return-Path: <martin.jansa@gmail.com>
X-Greylist: delayed 353 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 May 2014 14:48:44 UTC
Received: from mail-vc0-f177.google.com (unknown [209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C353A6059B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 14:48:44 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id if17so3057347vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kjtvtDMBnnlIjwN/lfmxICbAQWCME5u4zgSlNsJPyto=;
	b=dOlKRd/ewAAh3g8owBasdDizbqIyx9KO27pdTlX6a3wO5ePSDQijoHy2NiqLQtXIdu
	06P3YjG3VrP4d30h1oLPbSalQBZbnWgBL4w17F7SasaJZtbfUNbJ96UufYguH6xyHsks
	KBJAbsE7wImgJgOXJ/3ziZBZbHqDU3s52f3ZXqPUyimN7Xuyx+wrdODHbbd9iSpIEMKi
	ztmUoC6vSIVcz0bsXMSh2/EY5ENoKQJDR9VPZydhfcbFT8WMfIhkpfWjYiuW/MMKnRQI
	AqgP4rM3JD6DVxS7AfSh+FCNwKUNMFL4E6qU2sglP7TEEuca0GOY1Hd/DQZqqfNClr9Q
	Joqg==
X-Received: by 10.52.182.227 with SMTP id eh3mr207351vdc.40.1399819379878;
	Sun, 11 May 2014 07:42:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d8sm11069975vek.11.2014.05.11.07.42.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 07:42:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 16:43:15 +0200
Message-Id: <1399819395-2128-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399819395-2128-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399819395-2128-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/3] python-efl: add dependency on python-dbus and lua5.1 to always build edje and elementary bindings
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
X-List-Received-Date: Sun, 11 May 2014 14:48:52 -0000

* fixes following issue in test-dependencies report:
  python-efl/python-edje/latest lost dependency on  edje eglibc eina libpython2
  python-efl/python-elementary/latest lost dependency on  eglibc eina elementary evas libpython2
* this is example where dependencies of dependencies isn't included
  because lua5.1 is dependency of efl recipe with lua-old PACKAGECONFIG
  which is enabled by default, but lua5.1 isn't staged when building
  just python-efl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 1ced0c3..75e664e 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -8,7 +8,7 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 # NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
 # we need to build pyrex otherwise cython doesn't get called to build
 # the extension modules.
-DEPENDS = "python-cython-native python-pyrex-native python-numeric efl elementary"
+DEPENDS = "python-cython-native python-pyrex-native python-numeric python-dbus lua5.1 efl elementary"
 RDEPENDS_${PN} += "python-lang"
 
 PROVIDES = "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
-- 
1.9.2


