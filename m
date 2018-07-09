Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 60DD26011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:42:23 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u21-v6so10137256qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IQiqQyng4bKiGHUH0c6/O3DmQB/Gg/rp++2oE36xr5k=;
	b=ARzc2dh/1ZqTjYh42+u2DVYs/bvdPJgCkU8h9W21megRKycekGdJoFlRRNePsi4V1f
	2woYch5KLqW4mGCHqiniP2WfhFi8itACzLRBBUCo3AoX6NkWG46PZ7mqQTQdsf+MzVNa
	g60KZ8+0bu4nLKqqwYAuYUWEpassSs6kw3xdA2fKaxrzLtf97DAhv4H7AEOqiUfev6VQ
	L9abp1Z+MLpVFjLWJ3pW/h/cQJ/nfZSwEmeKcr9yGwadJaSVe0ks+SKYlx6bPEzj9obu
	o18GTKCZO01adSTUPuxV33/lGuAmqtY4qI00+Iri0YJIb/cDTfgRhAmKNbO3U7EuNi+S
	Cxdw==
X-Gm-Message-State: AOUpUlGWvMk7vVmo9FZCVdCCKU9STN3Ng3Gjamac066Z/i8t89L76m4t
	iiO4D414TieRpSskDVKgHHB3WygI
X-Google-Smtp-Source: AAOMgpfEuuCHw3Fzbj/0oDljY+2k0lQJ16Hwt4zmEVDBscWflbjTE+oPWfU6/dOKwurKOJtVrt7CNg==
X-Received: by 2002:a37:8dc2:: with SMTP id
	p185-v6mr2220722qkd.53.1531158144038; 
	Mon, 09 Jul 2018 10:42:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q15-v6sm2507266qte.55.2018.07.09.10.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:42:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:42:17 -0400
Message-Id: <1531158137-8080-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-progress: update to version 1.4
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
X-List-Received-Date: Mon, 09 Jul 2018 17:42:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-progress.inc               | 4 ++--
 .../python/{python-progress_1.3.bb => python-progress_1.4.bb}         | 0
 .../python/{python3-progress_1.3.bb => python3-progress_1.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-progress_1.3.bb => python-progress_1.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-progress_1.3.bb => python3-progress_1.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
index 297c0d3..9f00615 100644
--- a/meta-python/recipes-devtools/python/python-progress.inc
+++ b/meta-python/recipes-devtools/python/python-progress.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/verigak/progress/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
 
-SRC_URI[md5sum] = "f65ccfcc2339d522b2dd5801aaa40dc7"
-SRC_URI[sha256sum] = "c88d89ee3bd06716a0b8b5504d9c3bcb3c1c0ab98f96dc7f1dc5f56812a4f60a"
+SRC_URI[md5sum] = "057981e2f09029288f5255b1ea3ab64d"
+SRC_URI[sha256sum] = "5e2f9da88ed8236a76fffbee3ceefd259589cf42dfbc2cec2877102189fae58a"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-progress_1.3.bb b/meta-python/recipes-devtools/python/python-progress_1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-progress_1.3.bb
rename to meta-python/recipes-devtools/python/python-progress_1.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.3.bb b/meta-python/recipes-devtools/python/python3-progress_1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-progress_1.3.bb
rename to meta-python/recipes-devtools/python/python3-progress_1.4.bb
-- 
2.7.4


