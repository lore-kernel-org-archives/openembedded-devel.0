Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE356E667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:28:34 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x7so40843214qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zdxp2eJM1kU8eEq2d7njLVMRAdtzLUHpvsACjeKf5yM=;
	b=jYb0wGou6ihDSP/OdDX5T4aR1I3SxbsjPTDjD0wOlsHScPC2FYsk9z+t1Uy1oy/Nj9
	/vDnElecVlPBwUcQv6VYgux2BnagcDiT6e+WpYAT0Uk3NSuCanro1HTs1/FhtjIsYyGb
	C3A5gi9hyVuSAs+UHccens+uRsWIKVsdGPXSjWn5ViN65P2OVI7p8Ep+uuw+4nQ/ThIO
	Oq4dE60SPYh3qfTbzsrGZNHGwTJcFZcMmNObh+qXscOeCsrY7/cDbvST6FV+DL7z8Zda
	IOqmynzaGOOCxSEt0gHSGYcO8mMdfm32CXavkJKuMbzOV5Ht7mHg/q2os3qW1KH0tyE3
	9rwA==
X-Gm-Message-State: AOPr4FUfmFRV0ZBufRnKhU6pMZlH9yWzom23ajbBx7pECZJ5uAYKc5aSMqA1bl0eFXX8BQ==
X-Received: by 10.55.117.12 with SMTP id q12mr5854246qkc.192.1461346115397;
	Fri, 22 Apr 2016 10:28:35 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	200sm2607756qhw.18.2016.04.22.10.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 10:28:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 13:28:12 -0400
Message-Id: <1461346092-22694-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libxml++: update to the latest stable version (2.38.1)
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
X-List-Received-Date: Fri, 22 Apr 2016 17:28:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libxml/{libxml++-2.37.1 => libxml++}/libxml++_ptest.patch         | 0
 meta-oe/recipes-core/libxml/{libxml++-2.37.1 => libxml++}/run-ptest   | 0
 .../recipes-core/libxml/{libxml++_2.37.1.bb => libxml++_2.38.1.bb}    | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libxml/{libxml++-2.37.1 => libxml++}/libxml++_ptest.patch (100%)
 rename meta-oe/recipes-core/libxml/{libxml++-2.37.1 => libxml++}/run-ptest (100%)
 rename meta-oe/recipes-core/libxml/{libxml++_2.37.1.bb => libxml++_2.38.1.bb} (84%)

diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
similarity index 100%
rename from meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
rename to meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest b/meta-oe/recipes-core/libxml/libxml++/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
rename to meta-oe/recipes-core/libxml/libxml++/run-ptest
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
similarity index 84%
rename from meta-oe/recipes-core/libxml/libxml++_2.37.1.bb
rename to meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
index 0ed8ee3..20313fe 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
     file://libxml++_ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "2f9372a6eba6e40206c11f558a8fbc32"
-SRC_URI[sha256sum] = "f3b183600532a92af355719210223f858857092b8b1531c7907155c59a6db39f"
+SRC_URI[md5sum] = "6b16aac575725a9bc0e9d96489e9251f"
+SRC_URI[sha256sum] = "882529189b03db6c69925b3f579ab1941feb4f02b5fe2612504ee7e498a4a05f"
 
 DEPENDS = "libxml2 glibmm"
 
-- 
1.9.1


