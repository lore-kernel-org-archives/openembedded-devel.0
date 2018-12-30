Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE4126BE3A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 16:50:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a14so11889692plm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v4aXunt7oZofu6UhcCU22E/v2Js4HOLafURuJuE5i2g=;
	b=lg593ZihPUe9TZlQnIbXw+/o0bMbzNhixMmbN7aln0Lo8ygn/ZuCUHHe/uvNcqPQLF
	nOp118MYbYv83Hyxst5emC49g9ou21BWovu4/l93Fn/udm214KoBhPgQkqYM2WZIxjLH
	iQ0rKzNw3pjNinmAvwRdWwnmAYjorrJcKILO568Vi2hQEVJhX9ytBRmi540Hbpn85AkL
	1cpX+HipgmfpIqwPgrpDBo++afDZBEfuQ+gJJYHyXUS8HT9DspMJxjxvTOFdFjEAckkp
	ichg6KxrMy3P/hG2JK8qLvP+/gwDAOJ8/DD0LA9FG9QlHL1wXqY5nHiooj83XeQsw9FP
	N+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v4aXunt7oZofu6UhcCU22E/v2Js4HOLafURuJuE5i2g=;
	b=cOpMiZ25tgkDcsib4T59IDI0f6yfl5raLYU1ZRwmNfF5pe+oIZX9U21xgW4pTEAsh0
	yJn+1/RaPxP4MaVA0yGnk+0absTOMcYpVM4sNzRPGvTrx9bTDkX3ZkMtVneNQB3NQL/U
	g3PtIUOgSNJTFsUFYhiAf6Ippvtq52UmrfZmcGjUZzD7n2jFs0Ldjw0NMQufSRbd/ED0
	grOW8r31eeAyarXD+OFNiPwIwXoD+vHvnawZ28snh/0VC/RZZyYFUjicyLAVOOO2jW2k
	GijVr6sIwUvqS5DZaJVUQGaOccF8tnMOKP5r14K7+LgQRtr3LP4v+lMd9JPRITR1eiVh
	/3LA==
X-Gm-Message-State: AJcUukePC7oB7qCJy+kXK2KvDih846xA5wTKEKJqv2IQyO4QA9D75N+m
	arsDJsWLX97dWDKEDV4uDZNjF3kodJI=
X-Google-Smtp-Source: ALg8bN73PV46mTEwAKsiOqVwy8TiBU51OGMe75bATcmaHAFYCPMZEz/FOx2dhSDTdl+u/6l4ScCPQw==
X-Received: by 2002:a17:902:b112:: with SMTP id
	q18mr34854145plr.255.1546188650384; 
	Sun, 30 Dec 2018 08:50:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::9c8c])
	by smtp.gmail.com with ESMTPSA id
	w5sm59111465pfn.89.2018.12.30.08.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Dec 2018 08:50:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Dec 2018 08:50:33 -0800
Message-Id: <20181230165033.8850-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181230165033.8850-1-raj.khem@gmail.com>
References: <20181230165033.8850-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] catch2: Replace the patch with upstreamable patch
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
X-List-Received-Date: Sun, 30 Dec 2018 16:50:49 -0000
Content-Transfer-Encoding: 8bit

Update to tip of master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../catch2/0001-Remove-redundant-move.patch   | 53 ++++++++++---------
 meta-oe/recipes-test/catch2/catch2_2.5.0.bb   |  4 +-
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch b/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
index c3f5fc9ce7..dc8a8915eb 100644
--- a/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
+++ b/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
@@ -1,36 +1,37 @@
-From b2bd82a0c0d3d5dda588d12cc1672a03a9630784 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Dec 2018 17:27:43 -0800
-Subject: [PATCH] Remove redundant move
+From 7d7428fd09d1bcee281f7b678df8fb71e9365b17 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Ho=C5=99e=C5=88ovsk=C3=BD?=
+ <martin.horenovsky@gmail.com>
+Date: Thu, 27 Dec 2018 16:08:04 +0100
+Subject: [PATCH] A different approach
 
-fixes errors like below
-
-/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux-musl/catch2/2.5.0-r0/git/include/internal/catch_session.cpp:52:29:
-error: redundant move in return statement [-Werror=redundant-move]
-   52 |             return std::move(multi);
-      |                    ~~~~~~~~~^~~~~~~
-/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux-musl/catch2/2.5.0-r0/git/include/internal/catch_session.cpp:52:29:
-note: remove 'std::move' call
-
-Upstream-Status: Submitted [https://github.com/catchorg/Catch2/pull/1474]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- include/internal/catch_session.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ include/internal/catch_session.cpp | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
 
-diff --git a/include/internal/catch_session.cpp b/include/internal/catch_session.cpp
-index 0920521c..b66d57ac 100644
 --- a/include/internal/catch_session.cpp
 +++ b/include/internal/catch_session.cpp
-@@ -49,7 +49,7 @@ namespace Catch {
-                 multi->addListener(listener->create(Catch::ReporterConfig(config)));
+@@ -42,14 +42,20 @@ namespace Catch {
+                 return createReporter(config->getReporterName(), config);
+             }
+ 
+-            auto multi = std::unique_ptr<ListeningReporter>(new ListeningReporter);
++            // On older platforms, returning std::unique_ptr<ListeningReporter>
++            // when the return type is std::unique_ptr<IStreamingReporter>
++            // doesn't compile without a std::move call. However, this causes
++            // a warning on newer platforms. Thus, we have to work around
++            // it a bit and downcast the pointer manually.
++            auto ret = std::unique_ptr<IStreamingReporter>(new ListeningReporter);
++            auto& multi = static_cast<ListeningReporter&>(*ret);
+ 
+             auto const& listeners = Catch::getRegistryHub().getReporterRegistry().getListeners();
+             for (auto const& listener : listeners) {
+-                multi->addListener(listener->create(Catch::ReporterConfig(config)));
++                multi.addListener(listener->create(Catch::ReporterConfig(config)));
              }
-             multi->addReporter(createReporter(config->getReporterName(), config));
+-            multi->addReporter(createReporter(config->getReporterName(), config));
 -            return std::move(multi);
-+            return multi;
++            multi.addReporter(createReporter(config->getReporterName(), config));
++            return ret;
          }
  
  
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-test/catch2/catch2_2.5.0.bb b/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
index 14a1ebe80d..26149b31e4 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
@@ -9,7 +9,8 @@ SRC_URI = "git://github.com/catchorg/Catch2.git \
            file://0001-Remove-redundant-move.patch \
           "
 # v2.5.0
-SRCREV = "6ccd467094973824d89efb16cbc553e279f79823"
+#SRCREV = "6ccd467094973824d89efb16cbc553e279f79823"
+SRCREV = "461843b1f02a4bf5c59db88ff201d2c56fabf3a4"
 
 S = "${WORKDIR}/git"
 
@@ -23,4 +24,3 @@ do_install_append() {
 # Header-only library
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-
-- 
2.20.1


