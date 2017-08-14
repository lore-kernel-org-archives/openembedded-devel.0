Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B16660670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:08:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15so9668580qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+OcHo1KnUCScu7/yT2DXk3vTYC8rJZB+hd7yv6hOano=;
	b=KwsV9uabXWX1TNajurUw+pkg+6R2jReO0teAD/CGXSRGk5Afca90ljdBNNoRRnVupX
	Ren5HNbvHUH9uKfoAv9DRyRqFS/jEJdejRZ6QUcLMWS55OEJtH3yk9sR0DPKH/cKfB9H
	3hE7QnmXehmpFC5DeyN0W0kLUoiayAjk228EM/aYQd/UKCdkN4NX7Qiz6/r9JxVK9Lf4
	CCqTYvjD6+7ySUlQ0fsVddFhtOw3CHvcae/t4krZPcME4tfWRml+03mCWzVxZ7M2QDsG
	SCogDakjE4RvXnVJmn3NNTJVlQILqh01zFTF4N7OpiJN2lalqJWse2/dHoZtDYm7jEIE
	TVQQ==
X-Gm-Message-State: AHYfb5i6YfRP1o5RDTQGsqCZDIjjA+eTblMkV/nxBfgI/SXftESbuny6
	tf1GMdhfRnSLNbg+bYA=
X-Received: by 10.237.56.38 with SMTP id j35mr34495602qte.30.1502719741046;
	Mon, 14 Aug 2017 07:09:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id c5sm5310910qtk.4.2017.08.14.07.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 07:09:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:08:53 -0400
Message-Id: <1502719733-16930-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.13
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
X-List-Received-Date: Mon, 14 Aug 2017 14:09:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../{python-sqlalchemy_1.1.11.bb => python-sqlalchemy_1.1.13.bb}      | 0
 .../{python3-sqlalchemy_1.1.11.bb => python3-sqlalchemy_1.1.13.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.11.bb => python-sqlalchemy_1.1.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.11.bb => python3-sqlalchemy_1.1.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 0a93dc4..12f16c3 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "3de387eddb4012083a4562928c511e43"
-SRC_URI[sha256sum] = "76f76965e9a968ba3aecd2a8bc0d991cea04fd9a182e6c95c81f1551487b0211"
+SRC_URI[md5sum] = "6353eb8223b8476bb0399c28adff5850"
+SRC_URI[sha256sum] = "2a98ac87b30eaa2bee1f1044848b9590e476e7f93d033c6542e60b993a5cf898"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.11.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.11.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.11.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.11.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.13.bb
-- 
2.7.4


