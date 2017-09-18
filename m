Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0434F6011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:11:07 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t46so1074207qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0hiSsIcWJVGG3kEyLa9/eKKxwWJ1/UY8Un2ZWv+0fkI=;
	b=V3yMd013R9HtFUsQkyyfve0RDdBwEbzGK+Y58JQERanXs/dNO94RL/pjOoziGqsbmq
	EYW88/2qIqqKxJCI5LpJRToAx66cxgqmR0ndw5EgA/4R1iEOfvUz+HqYtLsTyLCuFbfB
	JBJz5H1acLbgJjeoyl1r4mcVoMeqCLtwWzNSD6IrHtfHWYaHwFU4eKZj1uZmYLYfNTps
	DlW+ZRmhnvMbplCQe0ghXI1F98nZn5mY2jIA2kMzoZ+pKt3/xEBKxcDY76WhsN5MT9zW
	0mCrgE8weVU/Lfoj8V4u4doGwbk337pTz8L63cpHW8+EO2sDJOuJYifj5DkkqquR0nph
	MYWQ==
X-Gm-Message-State: AHPjjUje1gX1sSAkIQu1Rb6ZnP8iNWgEWr9kzLu3ppFkfcx+ICfXe9DD
	4V5rLsnacLxs6+2bMns=
X-Google-Smtp-Source: AOwi7QBvREs75TI+CUeOiv0hb1zcsfyN5AiojPVfVVO9y82bDeav8Rp9w99PsxosRpZ78EWvNK88hg==
X-Received: by 10.200.49.202 with SMTP id i10mr43116137qte.63.1505765468779;
	Mon, 18 Sep 2017 13:11:08 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	m93sm2559341qte.96.2017.09.18.13.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:11:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:11:01 -0400
Message-Id: <1505765461-8881-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-six: update to version 1.11.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 20:11:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-six.inc                  | 6 +++---
 .../python/{python-six_1.10.0.bb => python-six_1.11.0.bb}           | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-six_1.10.0.bb => python-six_1.11.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index fe1a409..a5915c1 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "http://pypi.python.org/pypi/six/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35cec5bf04dd0820d0a18533ea7c774a"
 
-SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
-SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
+SRC_URI[md5sum] = "d12789f9baf7e9fb2524c0c64f1773f8"
+SRC_URI[sha256sum] = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
 
 do_compile_append() {
     ${PYTHON} setup.py -q bdist_egg --dist-dir ./
diff --git a/meta-python/recipes-devtools/python/python-six_1.10.0.bb b/meta-python/recipes-devtools/python/python-six_1.11.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-six_1.10.0.bb
rename to meta-python/recipes-devtools/python/python-six_1.11.0.bb
-- 
2.7.4


