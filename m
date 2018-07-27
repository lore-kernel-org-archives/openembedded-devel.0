Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6123D745A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:56:24 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c192-v6so3952614qkg.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j/vBlfLiLnnWZkgl1BiYSw0jaZ+cohT49XIGH1kAeJg=;
	b=O//e4p2A6gX+UO7cXDozyPiWErivaJLomYXpICpSQO48sf5RfQemSyqoKqKEXe0csV
	6Lzayb/KZL6xZmPlO/GUcwOfTP2WHnbIrLXNgTorqziV5AXtcBdSi3LoXXEjVypEl+we
	W4MpWr0iHpAwBl1YjgbfKpmyX6P0mNUW4BXH19vHGKDF+H7nKmyIpciT6AvQpf+VLGdR
	4fH5edCJJ7JuJ+hO1FmjnL20psJ9A5RwO609kyRrBAH3ti9ioGlHssry2opYTHQutAlH
	diTQkJniu1orR6A2awFtV2me7YUQvrYHs6u9iWvkqIw3pgN7/uqFQST260+V1rF6wbIc
	pKJA==
X-Gm-Message-State: AOUpUlH1AzcTCYMPJn3BalfEvTJeESvz684WQmT0/jB7AM/LM1AbHoWL
	kb/IOujFmGetWPmhve+aXRfl//iyojY=
X-Google-Smtp-Source: AAOMgpeX/v46I97Y0q6Y0jMaymEstBoHxBp4RDCpNGSL2eXc3layStZfeqeFvHsUgeikwygQ/LpKpg==
X-Received: by 2002:a37:a704:: with SMTP id
	q4-v6mr7081570qke.325.1532717784894; 
	Fri, 27 Jul 2018 11:56:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	l22-v6sm3833635qkh.72.2018.07.27.11.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:56:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:56:17 -0400
Message-Id: <1532717777-11274-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: update to version 4.2.0
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
X-List-Received-Date: Fri, 27 Jul 2018 18:56:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pbr.inc                    | 4 ++--
 .../python/{python-pbr_3.1.1.bb => python-pbr_4.2.0.bb}               | 0
 .../python/{python3-pbr_3.1.1.bb => python3-pbr_4.2.0.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_3.1.1.bb => python-pbr_4.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pbr_3.1.1.bb => python3-pbr_4.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
index d8847f6..225d78b 100644
--- a/meta-python/recipes-devtools/python/python-pbr.inc
+++ b/meta-python/recipes-devtools/python/python-pbr.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
-SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
+SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
+SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb
-- 
2.7.4


