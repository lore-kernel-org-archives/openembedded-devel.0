Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA6B97846C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:25:06 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 31so17076018qtz.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OYJ6oeU1CBLGN6FD/0si8LCGCcXch4jriTInIttH0EA=;
	b=hpPWUEeLzfxk0oToZYgzeX69/8RTVxOvl7fkYZ9HLESUmvMxgwySqvKHcDOfHSPqFy
	n1hLJKsmGb7Iq0xk2lvAAUIuI9VTEAVhxVhvnUEPj/OX9AJyCW2xfS7dryOBtwzRHQzq
	2HRl8uJRNNzaX8gdQwyzArZdCuAQERezHndrJMqYDa2XV46zo4VgBjB9e7jBPq9aQIf8
	5RTffoCqkqq1nxSvz288/YmZsfTB9nTxGChwQJnm0KPjP0uKB+DngwlXCKqQOedq9nZp
	ppbeUpWjw6nnLbF/2UrDxWOvWnL7wTAdFBLByvOYWx3ude7cd4oYOm8mXd6vjF9Icmd2
	sRZQ==
X-Gm-Message-State: AJaThX7KvvH3oKcWPtGqI5iEDtmctK5kKJXmIbdbBabsnT3gJTxPBf3H
	dVevoQ4/qDXi+IJIcuzkDTNlHSGu
X-Google-Smtp-Source: AGs4zMaOkwBTla5bv7tqYyX/YdFV2GG7GqAilZoBbYelW7djHecH/COzGyK40o0ibafg0adyW1WBMA==
X-Received: by 10.237.38.36 with SMTP id z33mr10589288qtc.258.1510507507681;
	Sun, 12 Nov 2017 09:25:07 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z15sm9509225qti.47.2017.11.12.09.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:25:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:25:01 -0500
Message-Id: <1510507501-6649-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: update to version 2017.3
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
X-List-Received-Date: Sun, 12 Nov 2017 17:25:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc                   | 4 ++--
 .../python/{python-pytz_2017.2.bb => python-pytz_2017.3.bb}           | 0
 .../python/{python3-pytz_2017.2.bb => python3-pytz_2017.3.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2017.2.bb => python-pytz_2017.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2017.2.bb => python3-pytz_2017.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 1c6564b..026489a 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=39ea92752a35cf67d8a885d8e3af3c69"
 inherit pypi
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[md5sum] = "f89bde8a811c8a1a5bac17eaaa94383c"
-SRC_URI[sha256sum] = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"
+SRC_URI[md5sum] = "7006b56c0d68a162d9fe57d4249c3171"
+SRC_URI[sha256sum] = "fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2017.2.bb b/meta-python/recipes-devtools/python/python-pytz_2017.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2017.2.bb
rename to meta-python/recipes-devtools/python/python-pytz_2017.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2017.2.bb b/meta-python/recipes-devtools/python/python3-pytz_2017.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2017.2.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2017.3.bb
-- 
2.7.4


