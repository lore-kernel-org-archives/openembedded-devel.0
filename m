Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id A3ABC78740
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 15:10:32 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s3so10860572qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 07:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pFgPLdunBUI/yYPNiZyaiQJwjfg2yivGDGy0VTIHpR0=;
	b=PiToDlaXIYbXLIAOQ5IXdGCA2MeAI7SMjWm3hXhwSrnTEYMzavsT4Jr/I0h2w/NfD8
	7s1Gh5sXKAmeaYY6ta/TcPYejIkLGkVo374R+QA8slEffXhxeJ5lBFjJZBFKQG8t91xa
	QNm09aWtdPpp/Oh7Xn3j++16076AvxD1jvgkOzaaCAo/GRfwAnOblVZHjiGM5QyLspmP
	5PHSzbgpRLbJZRp/tYLD0mDZn1PedFoQZC6zeKeq/Xl1PaVLDOQvFCg/FZTJ4dOb1HpX
	ZlYPsWcYj6q3utgDIpHRsOf962W2eP1P2e9kfloFGQQYEki3Yxh7HK9HSRty6DXGRerM
	oEIg==
X-Gm-Message-State: AKwxytdLQxRmiytbQCaKWjONznd3SIuC/hvxJ1aj2EQaPIwHw0aJuWJr
	r/lMexjgerf6OD0fXOlcykDM+idm
X-Google-Smtp-Source: AH8x224qt9Sl2hr0TT5eWcHKyz7uaIYNUDbFTsjuqbV1NqKftCHLh7ugCftHtKeEU8TH5NXB0f/VJQ==
X-Received: by 10.55.24.96 with SMTP id j93mr2571452qkh.113.1516461033540;
	Sat, 20 Jan 2018 07:10:33 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n3sm7642803qke.25.2018.01.20.07.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Jan 2018 07:10:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 10:10:26 -0500
Message-Id: <1516461026-27473-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2018.1.18
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
X-List-Received-Date: Sat, 20 Jan 2018 15:10:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2017.11.5.bb => python-certifi_2018.1.18.bb}      | 0
 .../{python3-certifi_2017.11.5.bb => python3-certifi_2018.1.18.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2017.11.5.bb => python-certifi_2018.1.18.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2017.11.5.bb => python3-certifi_2018.1.18.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 97be1fb..26df5c1 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "c15ac46ed1fe4b607ff3405928f9a992"
-SRC_URI[sha256sum] = "5ec74291ca1136b40f0379e1128ff80e866597e4e2c1e755739a913bbc3613c0"
+SRC_URI[md5sum] = "068fd5c3c690ae47504b3e0bf4e56c4c"
+SRC_URI[sha256sum] = "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2017.11.5.bb b/meta-python/recipes-devtools/python/python-certifi_2018.1.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2017.11.5.bb
rename to meta-python/recipes-devtools/python/python-certifi_2018.1.18.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2017.11.5.bb b/meta-python/recipes-devtools/python/python3-certifi_2018.1.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2017.11.5.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2018.1.18.bb
-- 
2.7.4


