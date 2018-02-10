Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD5B606D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 14:36:18 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d8so14112223qtm.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 06:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oLwZDRH9cT2FIXZwUGOkV6Z3P94beydWtWov7bb/zhw=;
	b=DfRsxhTXge2ILdJrvVIrSWzH3T4ecBE9uO+Gpe93N1fbri1quGyQbE1U0vGZ0Ksweq
	AgNKUxsFr0ZeIBOJT8gGbJNQV8fXPk/EOZxoDza+DC/jB85lRpjg6XuXw5irzUrSOaZf
	WNKdPAT3As40RM2GnwFlPhBYicz2fW7hhgpYTCQD/yBrOTPLp3MlTNn4Jh266piQTUmo
	stPgFxlLtFkAX34/amEBfkAt1WO2Yw399A6AfUBbOLh9+pn+PhTGu5TuPCNR+l4zJ17B
	G4D9sXjUQUjoDADoPc/UPb2V9iaGqJwMD63enAeONnDpixPyTg2VwaZ4BVoXYMnDCo7J
	p70Q==
X-Gm-Message-State: APf1xPDLl4W0k90wRBU5ox439kRNYoNPOiUFs299n+rSdwWKcFxYL46V
	SnB/ch6m1W5vTYarQF+xsIbj8ejm
X-Google-Smtp-Source: AH8x227t5RUpvnw0i56OV81spAp4XMS8/nLIcf7E0lUfbMABvrz/UI8anjm369mLNcXCowEgnguccg==
X-Received: by 10.237.59.201 with SMTP id s9mr7202402qte.83.1518273379336;
	Sat, 10 Feb 2018 06:36:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id z66sm3246132qkc.9.2018.02.10.06.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Feb 2018 06:36:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Feb 2018 09:36:10 -0500
Message-Id: <1518273370-11110-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.8.0
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
X-List-Received-Date: Sat, 10 Feb 2018 14:36:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.9.bb => python-cmd2_0.8.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.9.bb => python-cmd2_0.8.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb b/meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb
index e740099..c4bdceb 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.8.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=50;endline=50;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "eeb80d5c29715b4ac39ecc032842a25f"
-SRC_URI[sha256sum] = "f518d30c641483c8d6c246afae6e4447f816f8300befc6a11c476eeb62a496e6"
+SRC_URI[md5sum] = "0988674436fde36bbfc5cd650f4808ac"
+SRC_URI[sha256sum] = "4b3a9d9f305039ca94deb93e0a54ba896f12d1aae7206c6283fe02c6dbb0b7ba"
 
 inherit pypi setuptools
 
-- 
2.7.4


