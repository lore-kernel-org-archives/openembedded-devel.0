Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDDE747FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:35:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id c192-v6so10108158qkg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sz+slL/2v2GZjixU0OyDD/MNiShrAHh5WwCNPnwHN7M=;
	b=k7WfBftiKKJtM09gDaJdnb8xvxNIL53XZ3OF962fxNvVU0UZaP/RbJQkQwK3C1wyMB
	2CGtqPTVRB7dejv9kztdyWtNHi1O1WE17WmolSKZF99kL+kzfZm/3OiBASKyt0qgjqvQ
	Vh2iGEsAIFQjPDvjVGtdskCvhM9V+OvDXIQta/F0Dp4ptCscSNEFSQYK2a3isbGDNRfW
	Cgp/aYzAfJg/SHxeVbpCvXT2vCcccTaZLClRBYl8nG2beZkmXhr2zQ3KflZkyUOEnnnP
	6flk4ekakkDfyxfisYY07HaVz8oc5ziwZ6pAVVQ3S/KrAhjiT6onD2tMS/HYZaumQEhF
	VqAg==
X-Gm-Message-State: APt69E0TpiSaxxV7T18h7Bk6p/hdxslDFyYaphm+9G3Yh2A0FsHh0gzA
	w3NUcrKv3whs3mazJ+BqWXF3otJS
X-Google-Smtp-Source: AAOMgpcjcD2xhSm6Yc6l1ExrBPdCY5hFwxL5iBGou2ZmJ4bbOa+kgmJtrpwb0rZjCpU6LlyDXhb5qg==
X-Received: by 2002:a37:bf82:: with SMTP id
	p124-v6mr10262820qkf.46.1531157734687; 
	Mon, 09 Jul 2018 10:35:34 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	k29-v6sm10041793qtk.29.2018.07.09.10.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:35:33 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:35:25 -0400
Message-Id: <1531157725-4129-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-robotframework: update to version 3.0.4
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
X-List-Received-Date: Mon, 09 Jul 2018 17:35:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-robotframework.inc         | 4 ++--
 ...{python-robotframework_3.0.2.bb => python-robotframework_3.0.4.bb} | 0
 ...ython3-robotframework_3.0.2.bb => python3-robotframework_3.0.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-robotframework_3.0.2.bb => python-robotframework_3.0.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.0.2.bb => python3-robotframework_3.0.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc b/meta-python/recipes-devtools/python/python-robotframework.inc
index 78bbbc6..e920c51 100644
--- a/meta-python/recipes-devtools/python/python-robotframework.inc
+++ b/meta-python/recipes-devtools/python/python-robotframework.inc
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi
 
-SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
-SRC_URI[sha256sum] = "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
+SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
+SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
rename to meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
-- 
2.7.4


