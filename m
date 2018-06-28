Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD6C71A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:41:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c8-v6so4706527qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 06:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JPqntzUDAgfJXYfksoybFy2VXvPcBXL9Rq/cMEEVtJI=;
	b=hOj8gBYHbkLEXj0FJgAzekRer/m7iJ0ULK2jKCkmVP75afkG0HxmARmgL30sOucFW4
	qSxMGTFE8BTFd/NTqr56RUrAlOegGQqkaRGgFUCpvD3v5YbxY7gvLLAycDLSQLoWbVPL
	40d4Gs8Mgk5lEIm6Ci8JP/lQu5ZWR2sf90FQP18pVCgJp1p6qexFpZwjKmuyVyMRgaA3
	mBcwmkdBlfYPiW8hBBWe6udmyCk1KYuH+D+4UKxwi+ce2hnahyT14NGGEL/vu+U5TT7B
	nshkRWs3oDBdfKle/FRtbHaYSTLt1iDa9DO2ar7HJhWY5zMgLi3P98Y6Gn5PLoS5Zthk
	2B2g==
X-Gm-Message-State: APt69E33jiQ4WQWgUPtK6IK7MdEEJzEQh2kR3XAtWOUMi3D7RRYpviJ7
	pmz0MdZkBumvhyefqEpsORZaOMEt
X-Google-Smtp-Source: AAOMgpeM2JZGdIZuq4xym4ukmz5u8z4QPxtdZg2k2eHzvLAWvxl894bhblu+bIBiPC1BbcExAcwMrw==
X-Received: by 2002:a0c:b665:: with SMTP id
	q37-v6mr9303483qvf.43.1530193281229; 
	Thu, 28 Jun 2018 06:41:21 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	i22-v6sm6066852qtc.8.2018.06.28.06.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 06:41:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2018 09:41:14 -0400
Message-Id: <1530193274-16477-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.23
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
X-List-Received-Date: Thu, 28 Jun 2018 13:41:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.22.bb => python-urllib3_1.23.bb}         | 0
 .../python/{python3-urllib3_1.22.bb => python3-urllib3_1.23.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.22.bb => python-urllib3_1.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.22.bb => python3-urllib3_1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index cf79926..288ed8b 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "0da7bed3fe94bf7dc59ae37885cc72f7"
-SRC_URI[sha256sum] = "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
+SRC_URI[md5sum] = "1ad43e4b5ab7a0794c89dc057e1d7179"
+SRC_URI[sha256sum] = "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.22.bb b/meta-python/recipes-devtools/python/python-urllib3_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.22.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.22.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
-- 
2.7.4


