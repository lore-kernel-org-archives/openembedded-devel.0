Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7F06D79715
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id g2-v6so4331772plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z1iyZOE3nTbx2BmPhGcom6wMtLB6quncibAH8XNvzkU=;
	b=HFH8kLSSqHNN+5jBXBsanb0XiRGVt8qj2ozXh+w2kSyWhI4GWH0OWgM6lt/gObwVVF
	pgutT47brZGYDavnpM+8hFiR/B+xF6/+hHcMQRgrfTmPJr9Jklg1JculRDOZUCPn5SgQ
	K7e5RGNYpCWCIvOkXj0MADZEM1WpdSfneFAPEfMmM112pTrdKWl5FVvrlmakUQyRpwJD
	qK5ejk8uUZLBoxgQkoV5978OfxNimtW6N6lkDbPZyGik54IxrYiOWvRscxoM/r82yJkt
	VCfCFJgVQVr7YCfYvhQUi0iLYS2dRzkYh9PYMdRXkmPGSheTsUrq/W7+6+sDgN+HKquu
	Yg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z1iyZOE3nTbx2BmPhGcom6wMtLB6quncibAH8XNvzkU=;
	b=W9ZNumlHJymBT0fig+pVq2v7awH0TjtDspZ+fKC+zGIH0803ETRowKi2dD1dYL9cBp
	tuMqj9kICyJIvjkdWN+njRQ/z1wYyGetEXp41WSwdd7FrDrk4icPIKUdIubfFL5BK50T
	G/hzieQs1outaUqwpYHqgxMJwZ3DveMre8FXJT6TQl4tYGcDrw5e5Tke8uckGG0ahQfX
	v9yGt17xLdLLCHds1Rptj6vmo4joLgP81CXtaAxoKJiGIAhLdDpVTaybjgdyizDtjczY
	EQsNmoR43OLJFqogVPXdQ9627v+xpdcuPnmX3OHwMot+r62PSGeM9QXM4JEtdLHr/Zm7
	L1Hg==
X-Gm-Message-State: APzg51BzLD/AVYfxtTenAoeQwO3/kX6HWmGVZGg3iRGB3JJ8/540MPl6
	RWg8emVGjgUiMwgsy+SVgwq9UsuS
X-Google-Smtp-Source: ANB0VdZycLDhY4TFFQQLyD1mWMUmbXO0X41JIymp57OzkatPUwsO+P2+0wM7V1ZL9sKZS46glvQjSw==
X-Received: by 2002:a17:902:2f43:: with SMTP id
	s61-v6mr3709153plb.176.1536254555308; 
	Thu, 06 Sep 2018 10:22:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:06 -0700
Message-Id: <20180906172210.42551-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/17] android-tools: Depend on openssl10
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index a85e8b6652..6972ad70a4 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre openssl zlib libcap"
+DEPENDS = "libbsd libpcre openssl10 zlib libcap"
 
 ANDROID_MIRROR = "android.googlesource.com"
 CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
-- 
2.18.0


