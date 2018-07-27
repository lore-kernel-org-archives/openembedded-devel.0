Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE0BA78CD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 20:16:21 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y5-v6so6326201qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zPQZPGAH/1lSqFGsuCpmoaYswwNQ5gt6nX/qu5m7lyE=;
	b=gjMuT3nL/ybjoISp90ffy8btMoiAkzqqiYEfT2gGMDkqAlf7JbNADJ+kMJYeP6UisV
	quVqs9HEtQgerxMdjnavsSuS1okwGlfZlLd/NuYRCbV8xiocm/OCZ4satVD9ZoX4rCX+
	727o4fCaxeJZbVIRuAq02gcF4ciMfWQuuWEiCUuZLCLVf+nxAvdF9j9hCv/XAXpg0XjS
	jngZdSYZ3sEYqw/Xm/xtRoguE/PJWRgAg4+4oFeAkwjq6IUEqmmZ6tBe3zN/bjDDBGjE
	47XoXu1BUoSIJBSNtKVUfM0dIGHtjL7qaX1LqvfIZsUxz6vV2/b+1AAn1N5kqlTESi0m
	Lepg==
X-Gm-Message-State: AOUpUlE/jm5BfO0ZYTkmLdTjZD9wVArBonFW2xoUtrBAZAffFHBPbKx4
	F9iLFke0I264DJcvYIK66VHFVDsPBvw=
X-Google-Smtp-Source: AAOMgpc5Cz+FnBdWvOSMzxLPyaIejNNats+MiHD98f3fNbkASAMjYc59Qe++OSJeM1Y7N0mhWr+M5g==
X-Received: by 2002:a0c:afd5:: with SMTP id
	t21-v6mr7002079qvc.229.1532722582386; 
	Fri, 27 Jul 2018 13:16:22 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	f184-v6sm3208645qkc.23.2018.07.27.13.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 13:16:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:16:08 -0400
Message-Id: <1532722568-9134-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parse: update to version 1.8.4
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
X-List-Received-Date: Fri, 27 Jul 2018 20:16:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-parse_1.8.2.bb => python-parse_1.8.4.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-parse_1.8.2.bb => python-parse_1.8.4.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-parse_1.8.2.bb
rename to meta-python/recipes-devtools/python/python-parse_1.8.4.bb
index 8e16372..c66d4c8 100644
--- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Parse strings using a specification based on the Python format() syntax"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
 
-SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
-SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
+SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
+SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
 
 inherit pypi setuptools
 
-- 
2.7.4


