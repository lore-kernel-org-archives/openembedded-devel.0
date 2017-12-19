Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 73B4478480
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:48:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i190so3379680qka.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EYXYP1aa/04KzXHUwSnnnVlgQFmK2tFVKlwjYkkj/8Q=;
	b=QUyusCfbWJ6/gV4Z/ve5Khq6mMgmGr/133PJ9KSO1obWT7bxXWP1da0koKGlC/AXOW
	hr7SE0ZPHcBcbrySVmWpXIL075Q75njUByPpnnVtZQw7+yXAC+hCBCtqIwj9dT8iGGDU
	00lhTDkFzV8C39kQEPTJc7Ixma1GuclXra6dtKbl0dhEmzLuFQE10wmGjhnpnhSWGDVq
	FEr+KpL2/CpUYSwcDmQu34CXnF3F5MZ7iQITQY4VwNnozoNq7F1zArHRE3+cCaruHnbZ
	a3nS5kYhUt6EyKQ7o4WAq/cPq520WchYlUcVZ9yPajmBElQJIAvemOMSl4DrdUV/Uwos
	HgOA==
X-Gm-Message-State: AKGB3mJl5Pm96CkXm95/JsgjILRa+QqG8/c4bQ1oJorHcP71/rVdGblF
	rA8Cdv3/7VjnrOyAVHFgKMC0XZLm
X-Google-Smtp-Source: ACJfBotfBwWeJOIIP1D94HLVTySxj450W3k2uzwwcfZ90w0UwBfhrUnNnS46pzt2d1SYgfd4AdQn1g==
X-Received: by 10.55.129.134 with SMTP id c128mr6010178qkd.162.1513709335161; 
	Tue, 19 Dec 2017 10:48:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h32sm10014573qtk.8.2017.12.19.10.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 10:48:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 13:48:47 -0500
Message-Id: <1513709327-19749-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: update to version 1.8.1
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
X-List-Received-Date: Tue, 19 Dec 2017 18:48:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pylint.inc                 | 4 ++--
 .../python/{python-pylint_1.7.4.bb => python-pylint_1.8.1.bb}         | 0
 .../python/{python3-pylint_1.7.4.bb => python3-pylint_1.8.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.7.4.bb => python-pylint_1.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pylint_1.7.4.bb => python3-pylint_1.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index 5398ca1..9dd1d65 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "98a1ee985a3ebc876a20eb7577dbab68"
-SRC_URI[sha256sum] = "1f65b3815c3bf7524b845711d54c4242e4057dd93826586620239ecdfe591fb1"
+SRC_URI[md5sum] = "b7cca873fb60d420a4db8d3bfa4824b1"
+SRC_URI[sha256sum] = "3035e44e37cd09919e9edad5573af01d7c6b9c52a0ebb4781185ae7ab690458b"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.7.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pylint_1.7.4.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.7.4.bb b/meta-python/recipes-devtools/python/python3-pylint_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pylint_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-pylint_1.8.1.bb
-- 
2.7.4


