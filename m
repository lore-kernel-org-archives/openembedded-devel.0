Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id E8E0E74CF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:27 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id 30-v6so3576453pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PxkM9Gp3MFurXKZXKwQIANt9r0la4zMFlFYER4WkoSA=;
	b=ZfKujld5lEGaGMxorI01Is+DscoNgw1Pzcu94X5MVNGMYeC24pIYpzFLUCQyoMo6uP
	UazZ0Zw7xGWfihTl3EfBTQVByHc55H3oEiSTRAu+t2oxNuh5Bs8YBcihv7vLPN8mxW/i
	S0R8d2LRSxNWVm4sT6vthAJ4xfAtNmBfWfxpD5URHC/TEr295izD6LmGgFkvv9yfF0gK
	scad6HN/mwCgu2ho3Ed3G4BCmsIWeYslq+juCJkDDwkTVgjk6XBj9o5mPpC3UXEZVv1U
	RrYBlkWlhSl/ABYrt5ipcIxARrXwQRVbVd0XEuPRjq+cJtsRzi3qqzzUlZAqXaqW3nUY
	sYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PxkM9Gp3MFurXKZXKwQIANt9r0la4zMFlFYER4WkoSA=;
	b=uhrZA4kwv1nqroVJJ6m7vund5ARCZ+2D9zjHgKK145c0qNpxHK+PAtkCFXhmmqdYwE
	651hRBCBc+6lGg5Y3NQ5xHDGE7vU24WKUnV+9i4fF1WY0NKNfDoVDTjgDTCxUL5DPVyr
	a/0UwjKYE1tF116y3KrcvLOtPg/JYFq52gnsFkjxQSt+o3zjxbFU2ql9mCyd5bnifJhk
	NdY/n/qhO2pQ7bvT0djeBm5qdWd4OaPUgCBebSb2+KrGohNMAS9KziuK32m+qAW0FqER
	G7uXauEJ7AG4HAaCy2yEE6M4/hxdM2Q7ebwoyuNfSChK2Yk4gyXclMfUJlKxYCe2viRQ
	9LVg==
X-Gm-Message-State: ALKqPwfmSLOmHngATtbvf0k4axMJwMquZC7FbyfR+34yWIZSW5MxQ+zg
	ysqDxBiLaQWDCRj++V3ezPeKpg==
X-Google-Smtp-Source: AB8JxZokrQAoasVCpCJAYrn/9cgLAJ4CVvEj/cGTGMLa3IG0D+Hg40nzzXLuw6wD835L5NIDtfdIIw==
X-Received: by 2002:a17:902:b94a:: with SMTP id
	h10-v6mr7569788pls.321.1526607089060; 
	Thu, 17 May 2018 18:31:29 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:46 -0700
Message-Id: <1526607046-8081-17-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 17/17] poco: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:29 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.8.0.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb b/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
index 160b4d3..b4a0eb1 100644
--- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
@@ -8,10 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre zlib"
 
-inherit cmake ptest
-
-BBCLASSEXTEND = "native"
-
 SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
@@ -20,6 +16,8 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
+inherit cmake ptest
+
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
                   -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
@@ -104,3 +102,5 @@ do_install_ptest () {
        find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
        echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
 }
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


