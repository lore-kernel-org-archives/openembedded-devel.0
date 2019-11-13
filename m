Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id F30C37F7B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 18:18:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z4so2172756pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 10:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l29AoYhQ4dS6LJVWMKA3suACRFvWd/bjBI2c8BolLCg=;
	b=GdR59ylh65jHqqti7JIyP938v3bddeLKqIozcymwvknIaVPUmM5hrr8wchLEgewoTB
	khyDQV0FndYFjZMNWIPgrRk8blJuoKUr1K2iida9FnmnU+rmD6CvSObJz4zdjaiySKvb
	LISOiHg+OEYQPCtQ72VVGWdyG/yFNLKVYlDv2ptwwfy7oYRHu6XjdRam7vcEBfyZLevi
	mW8JFrys4Qh9j1+358H4Hg02GojN2izeOnZ8GWSctC3bTSv38LFQI/hRFkAUEB31SdK7
	+RBzazZiW8qWh/6EohCi5hqx+3YG3eXjYXuwfgZi5U8MOF8LZQpGMQYShIn403ozOB1N
	8mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l29AoYhQ4dS6LJVWMKA3suACRFvWd/bjBI2c8BolLCg=;
	b=aHbzw43hbx40QT0YH6dhxfRP7OiuiK8gDaLDD8IYfbodybIwZ8n6TSHAxEQsjBtVyd
	AaizNjDMizIiSY0v3u2k6jdBtsjuKfy4Y4tnCVTLQ6i8t+F9H0uSXn4Qp5JQ0GgPh1wQ
	a4Tc8ciftv7/mUYCqtKfg0drHbY8Lfc8DRocIXSm5PwhG8bUNyrDP+I9HWD5CnTg22fk
	2c6yINUdYfJ9kBXwoc7dLY9B3jq2Y+ijnxASQONkGVyZG/MfPrRaXfgo+ay9JkSIiyjT
	HzgvERJ6D5Xba79l5LnpTY/VCG1VcRk+fgiD27LLKkQxlnovDUIrNDuJdAbNT7tjaBhG
	yN2Q==
X-Gm-Message-State: APjAAAVUmF7FEPsC9kbRgAXixrmUgrQQu214FPvcRYnWHm6hRbFqYapm
	6PuBCD6WSF5pa6xS/QRU6KjGi7IbSBo=
X-Google-Smtp-Source: APXvYqy/N4RBvRXbEDmlSfF9V24V+c6qETa5q4kIgTuy90eBfY1xROEVx6wmUyjxGA0YvuExjv1o1A==
X-Received: by 2002:a17:90a:2a44:: with SMTP id
	d4mr6703263pjg.91.1573669117406; 
	Wed, 13 Nov 2019 10:18:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	k6sm1138181pfi.119.2019.11.13.10.18.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 10:18:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 10:18:24 -0800
Message-Id: <20191113181824.38451-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] guider: upgrade 3.9.4 -> 3.9.6
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
X-List-Received-Date: Wed, 13 Nov 2019 18:18:37 -0000
Content-Transfer-Encoding: 8bit

From: Peace Lee <iipeace5@gmail.com>

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../guider/{guider_3.9.4.bb => guider_3.9.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/guider/{guider_3.9.4.bb => guider_3.9.6.bb} (92%)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.4.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
similarity index 92%
rename from meta-oe/recipes-devtools/guider/guider_3.9.4.bb
rename to meta-oe/recipes-devtools/guider/guider_3.9.6.bb
index 1a413452a3..0057db661c 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.4.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
@@ -6,12 +6,12 @@ AUTHOR = "Peace Lee <ipeace5@gmail.com>"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-PV = "3.9.4+git${SRCPV}"
+PV = "3.9.6+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://github.com/iipeace/${BPN}"
 #SRCREV = "${AUTOREV}"
-SRCREV = "b433f3805674ef4588c1a161986c74eeac6a48e7"
+SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
 
 S = "${WORKDIR}/git"
 R = "${RECIPE_SYSROOT}"
-- 
2.24.0


