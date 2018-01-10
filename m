Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0741A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:58:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a8so908967qkb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TcD7ls0WJZYF/SMc1UPMccc8rYN4YsMZCAtyq1ZtEgA=;
	b=ipEuV/d4o1HD3472rqbySxWO+2q0RG7t0T1nd62d/fjk1dhTBweI4z7hsHUZ6DVUfI
	gApd3MibpRQolAhHI7QmgPu+9T2aFRrKRNavcK/xPw10QRaZiYOl1cc3PTuVAg2jPUF0
	s0UYRvW0riwYBRwnySz4HhjjpYiMFFG2JuWEaF67rlLuTc2xEiOY+lUzq4Iy4IjavO1c
	Dse5jTrjs7wy3CSJSOX8WP4QAGfyjTOhzUMRpEVIW+3hdPbOZzdj6sOTABegF8tEuPls
	yTsPDehts/RknvPEhj1b7uxcMZTnIFCsZMfKZHBvYXkYv59GJQdjyab1UVBu1ts7rmUn
	TjrQ==
X-Gm-Message-State: AKwxytfA70Aaq1o7gKfNGHfcdmhqhFFH6xd7AZ1MA7e1srN8e1It+4Cs
	lGzEx2sRrRhvMTyGMEALem5PHz3x
X-Google-Smtp-Source: ACJfBot9WWefmIzKIVLj4PBtoIuFf4lnaiuSD0e7cwFN64QGtBi5eitLu1BxmYTqoeer8TKcQXbKhA==
X-Received: by 10.237.60.9 with SMTP id t9mr29029715qte.228.1515617934205;
	Wed, 10 Jan 2018 12:58:54 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x66sm1941601qkd.50.2018.01.10.12.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:58:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:58:48 -0500
Message-Id: <1515617928-4469-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: update to the released version of 2.0.0
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
X-List-Received-Date: Wed, 10 Jan 2018 20:58:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-can.inc                    | 4 ++--
 .../python/{python-can_2.0.0b1.bb => python-can_2.0.0.bb}             | 0
 .../python/{python3-can_2.0.0b1.bb => python3-can_2.0.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-can_2.0.0b1.bb => python-can_2.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-can_2.0.0b1.bb => python3-can_2.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index ecfae3c..802098a 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
 
-SRC_URI[md5sum] = "b2a164887c1c6a2a2490b5afb36e36db"
-SRC_URI[sha256sum] = "b961b6ce75a7f08b586f4d2cae8cdc409881731b851fc405fa21cb16bad00d87"
+SRC_URI[md5sum] = "d899550617614d542c0319773989920c"
+SRC_URI[sha256sum] = "da89e94fa234d4ebe7f43a26d4b06a5d14ea767fbd2c4767732e4d964473dfb0"
 
 PYPI_PACKAGE="python-can"
 
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python-can_2.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
rename to meta-python/recipes-devtools/python/python-can_2.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python3-can_2.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
rename to meta-python/recipes-devtools/python/python3-can_2.0.0.bb
-- 
2.7.4


