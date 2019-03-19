Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id C42D17CDF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 19:07:30 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id d6so17002989eds.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2019 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=X8baPFpFYx/fnC9DnnNTcaIdnZ+Y5dncdc1enlV6gbE=;
	b=HxqrujDI5fU9/niEcL0EWLxzjJiEujuSc45CntS09HBoYdZPh49CCSysPmProRnWhW
	tXBx/hyapJUC/8ybBRbz70dOzMBO3X0eFN+i6iknv4WI7CbH4dW5vpRo2hIiPpj7aJwV
	zoaiomx3nxbDAqYNDpx8uxjeaj/WTkcIX0d5TmZBl3mYAqQqBaPZgJaYU9ChtKyKW5oe
	3UZV1kimpL6sV5aBAKHRvLl8cH40U7z47GxJDxvinUux4U0QW2P4ZJ9plpE7RVdLREYs
	Bb1eLuuRfTptfz4/1Bwap9H/ZVCPcMw40ZFvI7fyi6zwBTRI20X/+zOoqqR47roeA5PT
	D5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X8baPFpFYx/fnC9DnnNTcaIdnZ+Y5dncdc1enlV6gbE=;
	b=NQYZlnaqJnSKTD3O1x7kcPQa1wCYc7Ej7toFK9gRHoCh5eWTqIrRQU7wc0mXcG379x
	5/Qo45eVpgLWQN7+sylUWqN3oT33VpNeSrQDzqo0zUXK9xBQtbntPoHhhat0eetUMmZl
	6QEJlXCslpT/0OUpQDcItGtvA8FR5jYV2i1ZJAWNe0Pxi/quc8myaraAVD+XpQwUpWSI
	x74zvB6/qIKVN6G6CUwmIZoV6WFNJ1wD5ZlJX/HltTB0qx3MTKBDaoKScES9rTHpvjcO
	0Sf/UNWJG9ChdWX8aMMlMgiXL2mSsw53R0cLr0Hf2YS58u+dm60vfaRitJsFuGFhpKAe
	ZIzw==
X-Gm-Message-State: APjAAAXoEtizKt0iOph477l1SbhpYTp6/a64D0pld+TxBYwDKzMuYytq
	yWUELahhv47YU6yeJV9mII+J6qkVm5w=
X-Google-Smtp-Source: APXvYqyCRm7M7MalRMQPtfXJwEFXYx0UuxMY0TK+UWOUU0hcuT11wl9458Uxah3sYi7aWy3MwH3WXQ==
X-Received: by 2002:a17:906:3fd1:: with SMTP id
	k17mr14808431ejj.87.1553022451373; 
	Tue, 19 Mar 2019 12:07:31 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id v12sm936850eda.55.2019.03.19.12.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 12:07:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2019 20:07:13 +0100
Message-Id: <20190319190713.12321-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] log4cplus: update to 2.0.3
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
X-List-Received-Date: Tue, 19 Mar 2019 19:07:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../log4cplus/{log4cplus_2.0.2.bb => log4cplus_2.0.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.2.bb => log4cplus_2.0.3.bb} (81%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
similarity index 81%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
index d17d15c92..56c62f1f2 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.2.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
@@ -7,8 +7,8 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "b3bbeb2dc3e170768430cf87583016f8"
-SRC_URI[sha256sum] = "10539f2315271d370c7bc6a2b4808cbe369279837f4539ce5c789e456489fc62"
+SRC_URI[md5sum] = "20a87090cd8ec34ea11b3e59954234cb"
+SRC_URI[sha256sum] = "2d8f627aa6417e6c6a100bc09dc407684ca4605c929defc1690ee7d6a575ce6a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1


