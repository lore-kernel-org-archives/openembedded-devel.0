Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BCDC83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 10:54:25 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.33779.1752317662422297910
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 03:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EdzmWr0L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250712105419238a4599f0a9662419-fle7kf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250712105419238a4599f0a9662419
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 12:54:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KSHPO8yR4Tw8XfP4qOTa3GYLDHZ0IA9sAx3fRbMhCIw=;
 b=EdzmWr0Lb1BEolyudFjyNOTplPZmmJJYrQ3T53DE/63av0B3i0fQwKqo5wNjJSaiIE5iWq
 /mc6Vh3bbqfmiNqK6K2S58XHC6UufluBK9A1WY/ccyAkAXuTTNOE9AMl9htVP90IiqRQ1nyd
 WaJ4uWV8//SiHbOfJK08MTlshBOtNNcOwjI60/DLn5Y9E/9a9gQi+tgoJyEHMcs9qjk27wXo
 EigT/uUMjHYfiToZh4zlewkw2stZDvL1uTazkz3V/oM/nTuHrKRpBbQ6D24pVF5nOheMOsYY
 I9L/3Z7zfYp6RFRFN/aMcf3N2HZU57vvLhfdr4SfU3eae/bB/bw9GHYg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] minifi-cpp: upgrade spdlog 1.15.1 -> 1.15.3
Date: Sat, 12 Jul 2025 12:53:17 +0200
Message-Id: <20250712105317.2524650-2-peter.marko@siemens.com>
In-Reply-To: <20250712105317.2524650-1-peter.marko@siemens.com>
References: <20250712105317.2524650-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118473

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2025-6140 (in 1.15.2).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index ab08322805..04f2488a61 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/thirdparty/date-src \
            git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
            git://github.com/fmtlib/fmt.git;protocol=https;branch=master;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
-           git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
+           git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
            https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
            file://0001-Do-not-use-bundled-packages.patch \
@@ -48,8 +48,8 @@ SRCREV_date = "5bdb7e6f31fac909c090a46dbd9fea27b6e609a4"
 SRCREV_asio = "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
 # fmt: 11.1.4
 SRCREV_fmt = "123913715afeb8a437e6388b4473fcc4753e1c9a"
-# spdlog: 1.15.1
-SRCREV_spdlog = "f355b3d58f7067eee1706ff3c801c2361011f3d5"
+# spdlog: 1.15.3
+SRCREV_spdlog = "6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
 
 SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog"
 

