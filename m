Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 215B071C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:43:33 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d136so10704057qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NULYizbnfsHuOkSNDk57cLIAztqR1W/e0RKKU5+7UG4=;
	b=pAEW+I0ZiSFxbrvvilD5K885Iq2VELVXaipw1rS3vf5ik828+s5334ynfY7SqZadRI
	Mzye4JzsIsy7ZVqaME/tzsTOqvFjRYcBuL1I47YF65jX+iuCqbvhLDLHbA1hYXM6JWCx
	LOIOoW6Pn8mDmk27b2IvpIve0M+G3uKlBttWPwgEVKcWbOU9Pp/vDXvWxZIxWslcLmFb
	RPkcAQx07uzSfBGAUAeeNpSwkzgRUC7m5T2fo8NJC1mPn/MXqILRCjQUf5dQZr5tScH4
	HZYjz17aMjfr1t7IFBG5AOPFYne8zYTIU3YNBXHWFK1/zzrhDyer5riy5Joz5sJflXNc
	R+7A==
X-Gm-Message-State: AIVw110dIcM14zMSFqXgJXntun/vL7xS9xfY4mvVaWIfxEq0Dzk+QAJV
	SxNP/KSs7txZ8wpBnhA=
X-Received: by 10.55.42.216 with SMTP id q85mr20080113qkq.202.1500921815107;
	Mon, 24 Jul 2017 11:43:35 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	n14sm8866406qtn.73.2017.07.24.11.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:43:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:43:29 -0400
Message-Id: <1500921809-15823-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-urllib3: update to version 1.22
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
X-List-Received-Date: Mon, 24 Jul 2017 18:43:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.21.1.bb => python-urllib3_1.22.bb}       | 0
 .../python/{python3-urllib3_1.21.1.bb => python3-urllib3_1.22.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.21.1.bb => python-urllib3_1.22.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.21.1.bb => python3-urllib3_1.22.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 8f31c27..cf79926 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "ef6c72c79b9c6bcd68c204f9b92abc86"
-SRC_URI[sha256sum] = "b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5"
+SRC_URI[md5sum] = "0da7bed3fe94bf7dc59ae37885cc72f7"
+SRC_URI[sha256sum] = "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.22.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
-- 
2.7.4


