Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DBA9B75169
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:39:51 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4-v6so16063058qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LEE0GxrJLrvvbHNKX7tkqawqYVJ+eB7yHHgBXOZS3lI=;
	b=D1qOthUz/7tZWtOrvMdlhGSi8mMKs73fEjiGfZ73QE2LT/rQ8ZHEs/bBoRNXzHGQVA
	3X36c5E5IBZ9Fwa1nWHOug9yrh1oHi2Sn/zV1MHkT7NY3d2tYAhS1QcnAi9diUqjGskB
	Zav505ChdO0Crk/3Ex4gEI0xtTnio+r5cuk+PsnyiYW8UYYFYZOs6HOXXCkurJy4AVBm
	7njUG4iScrlyhYKIQvA41Mu+iyQUtzlQhXbyVB10x5eZbasUVCPIcV4RNd4qIzWnKo0o
	E13LqmF91wtFkLASbtjGKICJhWa1H4EiQHY/KTNfdu5Nh0UM5GvYwrS3U55cDndxbZ3S
	+1Gg==
X-Gm-Message-State: APt69E0c+ateWMqyYuJCqpxGFJ6o7bsxc4NzGfft3p/4NxvL0+adBq/7
	j4J9yzEV1wFJW654rKd+kpnVmi7G
X-Google-Smtp-Source: AAOMgpeFghxSLMF3g37ZnJJimr2wcarJeGE2FjDKWRqAWi1cOJJEtsGDJE7bZa0cyfnlhaY9WheNJQ==
X-Received: by 2002:ac8:1642:: with SMTP id
	x2-v6mr20164469qtk.107.1531157992483; 
	Mon, 09 Jul 2018 10:39:52 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	v187-v6sm5509576qka.73.2018.07.09.10.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:39:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:39:46 -0400
Message-Id: <1531157986-6760-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-wtforms: update to version 2.2.1
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
X-List-Received-Date: Mon, 09 Jul 2018 17:39:52 -0000

License-Update: Update the checksum for the latest PKG-INFO release and verify license is still BSD

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-wtforms.inc             | 7 +++----
 .../python/{python-wtforms_2.1.bb => python-wtforms_2.2.1.bb}      | 0
 .../python/{python3-wtforms_2.1.bb => python3-wtforms_2.2.1.bb}    | 0
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wtforms_2.1.bb => python-wtforms_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-wtforms_2.1.bb => python3-wtforms_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-wtforms.inc b/meta-python/recipes-devtools/python/python-wtforms.inc
index 916697f..868686b 100644
--- a/meta-python/recipes-devtools/python/python-wtforms.inc
+++ b/meta-python/recipes-devtools/python/python-wtforms.inc
@@ -2,13 +2,12 @@ DESCRIPTION = "A flexible forms validation and rendering library for python web
 HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c459accc90c6ed6a94878c8fe0535be2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493"
 
-SRC_URI[md5sum] = "6938a541fafd1a1ae2f6b9b88588eef2"
-SRC_URI[sha256sum] = "ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f"
+SRC_URI[md5sum] = "41c0008dbe7bd98892c58f7457a46a4a"
+SRC_URI[sha256sum] = "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61"
 
 PYPI_PACKAGE = "WTForms"
-PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.1.bb b/meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-wtforms_2.1.bb
rename to meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-wtforms_2.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
-- 
2.7.4


