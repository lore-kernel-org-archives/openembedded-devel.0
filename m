Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA108EFCD82
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10760.1773050801474482469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=V9Vlct7E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1334352-20260309100639574c9c6d35000207d6-xlfwyn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260309100639574c9c6d35000207d6
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8xFEoxs+jztozXBNY1aq7PbfxNxNuxkXN1abjVYON6U=;
 b=V9Vlct7EYkhHrEviA+JtzriFWXqtk+9YZjdtjD5FwmyVJp8y56O6CkY2GTj9rwxlg5gHuq
 +utdHOqFPfgoFrXRM+wHuugEX8DGuPoWCz6ZGNRc2zIDd/Dao5TrIRcC6EbO0yq99u6MDO0k
 fxaSq5Xc712pCqCUUlWk7I1amBqttg5/9QLwJK/gmVGErvfzqP/xj4lXcozx358FGAvycI2E
 Ig7SFMzGRzZaZJqb2wHc/1b9qY1d9ysm3370LsHV6ScFa/sgTF56E7scju7NlIvehuGXKOkj
 FSFwSD/ajdFfpcBNd/rMPk5/whE3/DY5S25PhHhvv2XX7i8+FwXqUROQ==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 10/14] poco: upgrade 1.14.2 -> 1.15.0
Date: Mon,  9 Mar 2026 11:06:26 +0100
Message-ID: <20260309100630.404637-10-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124982

Changelog:
  https://github.com/pocoproject/poco/releases/tag/poco-1.15.0-release

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../poco/{poco_1.14.2.bb => poco_1.15.0.bb}            | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.14.2.bb => poco_1.15.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poco/poco_1.14.2.bb b/meta-oe/recipes-support/poco/poco_1.15.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poco/poco_1.14.2.bb
rename to meta-oe/recipes-support/poco/poco_1.15.0.bb
index 8cdcf3649c..a22694031a 100644
--- a/meta-oe/recipes-support/poco/poco_1.14.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://run-ptest \
            "
-SRCREV = "96d182a99303fb068575294b36f0cc20da2e7b25"
+SRCREV = "52c558fbcda0578467e4f59c96961eb629ed3c77"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
@@ -126,8 +126,12 @@ PACKAGES_DYNAMIC = "poco-.*"
 ALLOW_EMPTY:${PN} = "1"
 
 # cppunit and datatest is only built if tests are enabled
-PACKAGES =+ "${PN}-cppunit ${PN}-datatest"
-FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
+# Upstream only ships libCppUnit.so.1 + symlink libCppUnit.so (no patch version),
+# so split: runtime in poco-cppunit, dev symlink in poco-cppunit-dev
+PACKAGES =+ "${PN}-cppunit-dev ${PN}-cppunit ${PN}-datatest"
+FILES:${PN}-cppunit-dev += "${libdir}/libCppUnit.so"
+RDEPENDS:${PN}-cppunit-dev += "${PN}-cppunit"
+FILES:${PN}-cppunit += "${libdir}/libCppUnit.so.1"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 FILES:${PN}-datatest += "${libdir}/libPocoDataTest.so*"
 ALLOW_EMPTY:${PN}-datatest = "1"
-- 
2.47.3


