Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDBC73176
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 12:40:11 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id n16so4927988ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 05:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=84tOc4cldHNLG3RU4Hh7tJFrkOYjLtGc5FUfJQtse20=;
	b=WER57Clh2xLKVIy4WZhQ6KuRU5NFh2fDznefUpCDJclOqM6cc/nZ7RFyF9cBgymYin
	ko0vhzYEWQOO99sgFct1vdAMSVT3DqLpgJd9LYROjf9jn6KfrFMMEiisR6iQQVfBXKoY
	t/m1cZourv7YZh/YWgKY77PKKPQ2DcF7qnCxChCF0rTAmERaBv2NRxY14QtwpjZVwove
	u+oIQUzrZqQsgEk6VLA+1W/jsW3d7JveV+1hhgclL93CvbciLCugIzpGjsLb6LRKJn/W
	4pP5OTztMxZorHZw00BWIIE49gElcWe4VLlb6YZwgSdUwTfVyFzw9ZZ5x7Qh8XB1ZMhI
	hojg==
X-Gm-Message-State: AOPr4FWRtPITs6Z03mjf3qiWBnD8rcIBSoGp3RYcMAbtoZzquWJkM/UsOaKXOfiWl+p4Dg==
X-Received: by 10.37.68.137 with SMTP id r131mr4378347yba.22.1463834411893;
	Sat, 21 May 2016 05:40:11 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.70])
	by smtp.gmail.com with ESMTPSA id
	i196sm13905799ywg.33.2016.05.21.05.40.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 05:40:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 08:39:59 -0400
Message-Id: <1463834399-4971-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-greenlet: update to version 0.4.9
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
X-List-Received-Date: Sat, 21 May 2016 12:40:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-greenlet_0.4.7.bb => python-greenlet_0.4.9.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.7.bb => python-greenlet_0.4.9.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
index a69eb64..703a151 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
@@ -3,8 +3,9 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "c2333a8ff30fa75c5d5ec0e67b461086"
-SRC_URI[sha256sum] = "f32c4fa4e06443e1bdb0d32b69e7617c25ff772c3ffc6d0aa63d192e9fd795fe"
+SRC_URI[md5sum] = "c6659cdb2a5e591723e629d2eef22e82"
+SRC_URI[sha256sum] = "58b2f3a2e7075c655616bf95e82868db4980f3bb6661db70ad02a51e4ddd2252"
+PYPI_PACKAGE_HASH = "4e3d9d421539b74e33608b245092870156b2e171fb49f2b51390aa4641eecb4a"
 
 PYPI_PACKAGE_EXT = "zip"
 inherit pypi distutils
-- 
1.9.1


