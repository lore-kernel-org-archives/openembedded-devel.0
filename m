Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 368697602A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id j8-v6so2142611pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UXL/c/QgFUxMaDRp6CEUr5M5RMHpgXrapAEuFaGHXiM=;
	b=OgXg6LUVgFy8rLLyoL7DEpUNQy2Bf3Dr64OlBUR6lMyvbiT38sz5uSnwEpNNCiLMe8
	qVRkETI7igTTJgM5URuw4mxqqkom449Uf1p3Hyz5Aopk0moEXC43a+W29WB/ef0VaYoH
	oIx9Fj+tRYQSmkALx+SzvxLe9vbVYH/bcp4OvGtnx/ZbytM2j3yqSZVHnpH/mSo4bdH8
	4w2HvyKFNllUwb9goqvwbeuDRkPdbR/dOX7y/h8MTH8kI0a1E1iYPcDy09qyINpzK9Ye
	CFA3L/lNr8IsW68qqiQkMoV/2eW0ydFer+UsmQf4PcLr8BB81XHSdUBBsdhGLqWVTv+7
	IjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UXL/c/QgFUxMaDRp6CEUr5M5RMHpgXrapAEuFaGHXiM=;
	b=SVKa4wfgksQ1xRFrmmtsv1iXnGdKqNmse1zj0Dd93UmQm1haF5N/CztF/ol3us6lRk
	/HAVEfJBavap6XGTGHvMdevqlAJF6Zf81+iUw3Fwo17o5aj9McUz8i7xbP/pywLXyRo2
	LlG6+79Mo195GphpsTxlwUtZeiEE9E4vBT7S4dTf/9F3xTOxiMaeWHEubDeBhJDVJ1J6
	OwioV9Jh8KOM6uMY//5cvm9CJkAPmwm4P1UpE5APzb5g2wxGKvPLAYBKdhFEXutfXkqU
	3Rb+Y4LM0VSg09aJy7BpmkKfBGFQF4vaE5xURfUi+ncDzDOalqOa5etUNZ4aTELyy5Di
	8sfA==
X-Gm-Message-State: APzg51A4j05kDQWvkSiFpYkGh08GZ1WpfhggvzWSQg5UnBdm5138GR61
	t+mL8/Ikq1goQ9rQSzatUC1gGihx
X-Google-Smtp-Source: ANB0VdaymJzU7M8wQTsDNKBvUDbJCU79cXrGfO0Cz6DV9H5gZMdketFDCabqaxo+3q5qr6ZYxTwrPw==
X-Received: by 2002:a63:1750:: with SMTP id
	16-v6mr10318894pgx.31.1536087486946; 
	Tue, 04 Sep 2018 11:58:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:47 -0700
Message-Id: <20180904185750.23747-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904185750.23747-1-raj.khem@gmail.com>
References: <20180904185750.23747-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] libgit2: Upgrade to 0.27.4
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:06 -0000

License Update: Added SHA1 module which is under MIT license
Upgrade will fix build with openSSL 1.1+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgit2/{libgit2_0.24.3.bb => libgit2_0.27.4.bb}     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.24.3.bb => libgit2_0.27.4.bb} (69%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
similarity index 69%
rename from meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
index 8f580f9ff1..59fb09c65b 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
@@ -1,12 +1,13 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48bc2"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 
 DEPENDS = "curl openssl zlib libssh2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
-SRCREV = "4cf1ec7cff28da8838a2f0a9fb330e312ea3f963"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
+#v0.27.4
+SRCREV = "8b89f362a34fcccdf1c6c5f3445895b71d9c6d56"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


