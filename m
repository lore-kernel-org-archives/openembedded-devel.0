Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCF3676061
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 14:47:10 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l10-v6so18530635qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FlrF2h300fYNR/YkdT/S6QUC96O08GO312cqIO2R248=;
	b=lwgc7qC1aocExIm2X1DRza++8j2gAlxnb5O0xd2EYQQPgN0Y2nivOnQSeWZPpke/x0
	aYE0eSgkT7YeHjU3F2GUU7yrczGk12tibjzMFaOMR62RH82cCV9vjwbHGVvElJBd6ghV
	PF7/fWZ6sRlnz60uC4vW7pc7nlk5tGENgtAUNu7uqXsWDX3ZiuMoQVu3P8im5FWXTK5r
	5JBsnvt+ud5ouDuj61st5JnFJm3OIePreagYcYS+CQ0GKXEDAWYtmJP3bFefpGf2bgbT
	ln7gh+JVXJePM0VxQCL2j96B6zNwsI/uWjpOpKJObup5/IkV6RrYziD/kivmaFbdy+aa
	CSvg==
X-Gm-Message-State: AOUpUlGQc7Tua29fb+xle63IN9LHolI/nLB9iDtigkouSXzCTQdHOvU/
	2tuIJRgNUdNoNqg/syE3hpwt6fVr
X-Google-Smtp-Source: AAOMgpdsIZSTK1vCbbVsQE1HdNKmmZzMeAkU2wOSdRTOjzjo5q/rxlPuy+vQfAeBsCpoBzaLkqrJEA==
X-Received: by 2002:a0c:d788:: with SMTP id
	z8-v6mr15039187qvi.71.1531234031166; 
	Tue, 10 Jul 2018 07:47:11 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	u27-v6sm13698026qkl.66.2018.07.10.07.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 07:47:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 10:47:02 -0400
Message-Id: <1531234022-19666-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-scapy: update to version 0.25
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
X-List-Received-Date: Tue, 10 Jul 2018 14:47:10 -0000

License-Update: Update PKG-INFO checksum and verify GPLv2 remains

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-scapy_0.23.bb => python3-scapy_0.25.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scapy_0.23.bb => python3-scapy_0.25.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.23.bb b/meta-python/recipes-devtools/python/python3-scapy_0.25.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-scapy_0.23.bb
rename to meta-python/recipes-devtools/python/python3-scapy_0.25.bb
index 3e7baf4..f785a2f 100644
--- a/meta-python/recipes-devtools/python/python3-scapy_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-scapy_0.25.bb
@@ -3,11 +3,11 @@ based on scapy with python3 compatibility"
 SECTION = "devel/python"
 HOMEPAGE = "https://github.com/phaethon/scapy"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95ea6ecfc360eb47fe6f470ad736d7cd"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a4282d4d80227fa599a99e77fdd95e71"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "scapy-python3"
 
-SRC_URI[md5sum] = "8642d09ca727e7e2b455223ae94059b7"
-SRC_URI[sha256sum] = "8760991a67162f43af4d9e64828bcefc100ba88859b75177ae9f7ace56e58186"
+SRC_URI[md5sum] = "c9003d39def73c028cb8c71bcbb42629"
+SRC_URI[sha256sum] = "2ae1b3bd9759844e830a6cc3ba11c3f25b08433a8ee3e7eddc08224905e5ef2b"
-- 
2.7.4


