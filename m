Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0177E6D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 00:45:53 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s1so2307580plp.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 16:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rXIb6Zhpiex6gZpMeyqbavoG8AzBICoNhd+uFf5apVk=;
	b=OlecX2QjIt9J6Q3+S3tLw/JYUthNRge/BwXKAWZJ7NPA9HSuNBg4D2Pvd6vit/tuWo
	JfBTtYC+IIm/d72cQonLY6dnzTFwU9i5CCmKWLlMoy/rRq22vmHmQJyEyF2e/NXw20LZ
	A1ROwWe7O9pNOAz/SnEhzP2TgQg84w8K/t84TQxK5MABno16eoZtqWZ9EKwWvX7YacvN
	fmeWNr83/dQFyiasCUbiQQ7+pbFICMZBg6Jbo35Ch48JFNgQz9ca1Ro90HSW2++hmNjw
	21IWbHG6gG1onHRFfckrdihS1HF1BOuHRfN2JY/NJDJ769L74zZe7b9udMI2QTWFTCIq
	liAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rXIb6Zhpiex6gZpMeyqbavoG8AzBICoNhd+uFf5apVk=;
	b=VNfq1Y9rHKzbyw+Lls+DfFzBeKsB2H4CLropqQnE9ppLyDL0LyJKngegHXD2ASNTs2
	QZtq3oRChZ0DVAFaCIbemQafocZErhiw4uZVjkZIYSJXtNDweT5WS57ye3TTdcsn7N4H
	KJ6I+RJagsAK/1W6NnV0sMa0uGDwxMGUU8C0KBdBXou4zTnWfDetKtqlIaNzBi7T7YqE
	n+lQFjOVX7RrfnD7ljF+V+8sWKWidLeiZVEndK/8eWWvAs9UBu7lhd5yya4hWBqDC8Kw
	b8tFOnS8ngGJUVXNG3hXo7SNmCpEjlMDTTv/MDkomVoZ40UdwdR7BJTQnd0bJRHACaYR
	XQhg==
X-Gm-Message-State: AHQUAubk61WmSaWpPvbrLBAk4O4ojxAG2otyLrsOWZcaIPohWArv0aLh
	0NuREKIaWwhqZcVZvnl3cK8WEMaD
X-Google-Smtp-Source: AHgI3IYG1FGWICyFJVCqyF3raSOG1HRxUMLMC/LXILzaHmUujmaq5SI5wqx21c2prh+ISg4044nSXg==
X-Received: by 2002:a17:902:b943:: with SMTP id
	h3mr8031599pls.12.1549413954241; 
	Tue, 05 Feb 2019 16:45:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	l74sm7684098pfb.145.2019.02.05.16.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 16:45:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 16:45:42 -0800
Message-Id: <20190206004547.32351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] catch2: Upgrade to 2.6.0
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
X-List-Received-Date: Wed, 06 Feb 2019 00:45:54 -0000
Content-Transfer-Encoding: 8bit

Drop backported patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../catch2/0001-Remove-redundant-move.patch   | 37 -------------------
 .../{catch2_2.5.0.bb => catch2_2.6.0.bb}      |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
 rename meta-oe/recipes-test/catch2/{catch2_2.5.0.bb => catch2_2.6.0.bb} (80%)

diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch b/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
deleted file mode 100644
index dc8a8915eb..0000000000
--- a/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7d7428fd09d1bcee281f7b678df8fb71e9365b17 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Ho=C5=99e=C5=88ovsk=C3=BD?=
- <martin.horenovsky@gmail.com>
-Date: Thu, 27 Dec 2018 16:08:04 +0100
-Subject: [PATCH] A different approach
-
----
- include/internal/catch_session.cpp | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
---- a/include/internal/catch_session.cpp
-+++ b/include/internal/catch_session.cpp
-@@ -42,14 +42,20 @@ namespace Catch {
-                 return createReporter(config->getReporterName(), config);
-             }
- 
--            auto multi = std::unique_ptr<ListeningReporter>(new ListeningReporter);
-+            // On older platforms, returning std::unique_ptr<ListeningReporter>
-+            // when the return type is std::unique_ptr<IStreamingReporter>
-+            // doesn't compile without a std::move call. However, this causes
-+            // a warning on newer platforms. Thus, we have to work around
-+            // it a bit and downcast the pointer manually.
-+            auto ret = std::unique_ptr<IStreamingReporter>(new ListeningReporter);
-+            auto& multi = static_cast<ListeningReporter&>(*ret);
- 
-             auto const& listeners = Catch::getRegistryHub().getReporterRegistry().getListeners();
-             for (auto const& listener : listeners) {
--                multi->addListener(listener->create(Catch::ReporterConfig(config)));
-+                multi.addListener(listener->create(Catch::ReporterConfig(config)));
-             }
--            multi->addReporter(createReporter(config->getReporterName(), config));
--            return std::move(multi);
-+            multi.addReporter(createReporter(config->getReporterName(), config));
-+            return ret;
-         }
- 
- 
diff --git a/meta-oe/recipes-test/catch2/catch2_2.5.0.bb b/meta-oe/recipes-test/catch2/catch2_2.6.0.bb
similarity index 80%
rename from meta-oe/recipes-test/catch2/catch2_2.5.0.bb
rename to meta-oe/recipes-test/catch2/catch2_2.6.0.bb
index 26149b31e4..13beb9e8b5 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.6.0.bb
@@ -6,11 +6,9 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git \
-           file://0001-Remove-redundant-move.patch \
           "
-# v2.5.0
-#SRCREV = "6ccd467094973824d89efb16cbc553e279f79823"
-SRCREV = "461843b1f02a4bf5c59db88ff201d2c56fabf3a4"
+# v2.6.0
+SRCREV = "d75e9b3c0f24fe42553131873459611ed155e297"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


