Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2576978699
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 19:51:38 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d26so16500354qtk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 11:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m1J1/cROPr753dXurzpJPigz/VJb0UHz4kFOk9yUxuU=;
	b=i5st+kjwICkBgotO3dmO1BnJGhayr8dQAG1aGyqzza9gzAP5pCFlB8Q2DTzXTIrmXP
	kkyuTvQBwSvIo36M0alqoOipN9RHwGR0raNhnpZzGrwuWybdhArtL/+U6YJHHJAXgrM2
	BRmyhGdlocVFnJUUST6E/4QmAuNz7Of15gehJ6/rxCnQyjBW472vXAJM9CSHzXdDZkos
	EVNOCwru/EGTqjE2AH6IAjL3Crvg/6GI6xxHQznWeYdSFL0MfCW+hYg3l01mA9Cb8bB+
	zAT6kD1D/DaVgvyFYL4xyCkUu7DyMAs+tzP11sLElAd3GgBnVX/15SJYdNLgTJ013BWe
	y1RQ==
X-Gm-Message-State: APf1xPCTCldUKGl6jYLdAFfY8POvYAUuUwnFc76TGMg/r0Jy4RMDkONb
	2bAkpqPY2cXuR4qQyn4FmLWtFpYn
X-Google-Smtp-Source: AG47ELuiy22w1TePs4wBHRVDdByBcPkwt2+aPoeI814Z/K4YNqgSXyW/ll/U7izrjhNtv/TVOn7Gww==
X-Received: by 10.200.11.131 with SMTP id h3mr2295962qti.194.1519588299798;
	Sun, 25 Feb 2018 11:51:39 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q10sm4688614qtk.25.2018.02.25.11.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 11:51:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 14:51:32 -0500
Message-Id: <1519588292-9909-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.87.1
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
X-List-Received-Date: Sun, 25 Feb 2018 19:51:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.87.bb => python-pymisp_2.4.87.1.bb}     | 0
 .../python/{python3-pymisp_2.4.87.bb => python3-pymisp_2.4.87.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.87.bb => python-pymisp_2.4.87.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.87.bb => python3-pymisp_2.4.87.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 8fcb6f3..9bbcd89 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "1cb54be2bdd39225428fc4789c5a7a77"
-SRC_URI[sha256sum] = "e9d7a00e6f0ad7caa2823ae18e15770cde747a5322aa47d7744858f109af14d3"
+SRC_URI[md5sum] = "5003442bffbb15c227decbe2a1fd2d66"
+SRC_URI[sha256sum] = "44af4fa5ba092a9bee413cedf4bf9453827fd2185b6a609a5388af8b72b6abd6"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.87.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.87.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.87.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.87.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.87.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.87.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.87.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.87.1.bb
-- 
2.7.4


