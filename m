Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 687047017C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:22 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s5so6266700qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xXT5mcq+J1OuPhs50MqJBXCnDD5pdyfdB5sGaPyY/H0=;
	b=BrtbcKKwsCnIOk1HazmbT7ZC0ogORHeY5XRNL+Vyayi7XPr2hQKca3ict/RnKkcDyR
	b0yq+WnLYeqBDH4N2O/8p6tazq/SNSmvL5tVXpdWThxMSSCU7ICS7W2fIFsGE8TkhK9K
	oqElHT8LRdLYfMnNy+E/n5xXkZS2P9GqegMNtW6NgNU1FAVmZ4UlbNfI5aQQdEk92oUM
	Bp15Ts+cBb1Df1whzb/jBoyJuRZXW7+zHS8BnZZjYkxakFMAXTkhOf0N0vwOUMM0g5AM
	rCzCRhpK8ibfcDKQnBlB/6d/5YilLiLOL+QbmsJa0VZFxL53b+PIq1+Netg8Fx08QFIb
	gMyw==
X-Gm-Message-State: AD7BkJKfnCsoiekbGvtfWXPKqZU51dQrU3NWGBqgxN2WtCoHogadO2XEEp/qkg/LMBMFXg==
X-Received: by 10.55.41.205 with SMTP id p74mr24000239qkp.65.1458997523191;
	Sat, 26 Mar 2016 06:05:23 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:44 -0400
Message-Id: <ec2445068d281e09e7aa912ba2ff3c4edf18c6a1.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 24/30] python-pyparsing: update to 2.1.1
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyparsing_2.0.3.bb => python-pyparsing_2.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.0.3.bb => python-pyparsing_2.1.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
index 18a3077..9862907 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
 
-SRC_URI[md5sum] = "0a5ec41bb650aed802751a311b5d820d"
-SRC_URI[sha256sum] = "43d7710fdaa194a3bccf3127d06dec8e2de99a7efe6c47f01d4b748a1d04b192"
+SRC_URI[md5sum] = "2a1d3a63ddc2ec9a3da961d1b7f258b2"
+SRC_URI[sha256sum] = "4bd04badfda39b1e2fd0d77cb78b488c881d88c31734791a0ae902979ae10575"
 
 PYPI_PACKAGE_EXT = "zip"
 inherit pypi distutils
-- 
1.9.1


