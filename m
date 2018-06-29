Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id B71BF751FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:46:00 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id b66-v6so5683143qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2w5scW9lzTgYhTbM+mc75JSedxYoX92J5Tbxa9rEgoM=;
	b=L2ZeHn8OKclqKD4J+Uli5786KYJi+YqAauv484C1vZzvu9oEYqRnSrNo/m2zuR7JOF
	bDBHO3cfPYI0H6k3Xx81wvRDkRjfd0rXytPaA5Hi04eSCuqImt2I9z8gPav0Ivf11Kob
	K94Zsiq+pIoU/NZ54fmecArpEYOqaGQpJwO6fHvuJxAW3ju/7ZC4Ubl+8rEnVUv5DTpT
	kwiJTsgj5yMOG5XD2iROR7OQxPqEAovfL3OAlV56SEUINlZDbQC04ipTh6edfVcJZ+9O
	T+Ypc8Du9brEPV7kGwbmNzY06YGdLvDDLm8yibnl5F41v2FKWiNLtvsGUig4RJ6MXjkD
	Wztg==
X-Gm-Message-State: APt69E24kUelUCjYqo7e7h3BTVoCNDgWTVv22ONy0oWk+rpa+GmF2exz
	P013Sfbh9IH9e0nvuM3tYu9XvLVJ
X-Google-Smtp-Source: AAOMgpcLxKTYoTRv1Gtd/MFJlYYH+gGrR++HXy32i0r8DtVPoiUIw4bbtyIIBgjC5/nieZLyRlf3+g==
X-Received: by 2002:ae9:e009:: with SMTP id
	m9-v6mr13229405qkk.320.1530305161265; 
	Fri, 29 Jun 2018 13:46:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	13-v6sm1632876qtn.75.2018.06.29.13.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:46:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:45:44 -0400
Message-Id: <1530305144-2721-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530305144-2721-1-git-send-email-derek@asterius.io>
References: <1530305144-2721-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 2.2.2
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
X-List-Received-Date: Fri, 29 Jun 2018 20:46:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_2.2.bb => python-cryptography_2.2.2.bb}      | 0
 .../{python3-cryptography_2.2.bb => python3-cryptography_2.2.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.2.bb => python-cryptography_2.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.2.bb => python3-cryptography_2.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index cdc8185..64192f8 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "c49c1ee145a900313a216fa2c788208c"
-SRC_URI[sha256sum] = "f5a0279e362c37e2150a32fe35ec20226e9237b6c9927fce8d53ef8e49e64f48"
+SRC_URI[md5sum] = "17c4ed4b4d0f25adbc576d89071dc92e"
+SRC_URI[sha256sum] = "9fc295bf69130a342e7a19a39d7bbeb15c0bcaabc7382ec33ef3b2b7d18d2f63"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.2.bb b/meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.2.2.bb
-- 
2.7.4


