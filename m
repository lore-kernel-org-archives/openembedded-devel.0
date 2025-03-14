Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC7FC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4450.1741985533457889545
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CyVXJpKj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025031420521174ce15bb53d6844607-_v_0g9@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025031420521174ce15bb53d6844607
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ISlQcBGl7lmXcB9oWclOsfOJ4KOokjaFIiVCyYfpBXQ=;
 b=CyVXJpKjucrOgvFX0r/xwn6/2XqCjMDBUD/PLshSRg2rV70D5tM+xOyMuJekwFqzOELW66
 5poi6LjM/oieDH2qHbrx993X2f9gKWLiNUrREOmk3uL6vhVeGA6Xw2Ap1w45TaF0VTKYwut7
 PJMZYPFYw9WmR14JyducneSLpbjb2+cPnw5ykFriimEcn6roCPpcQn2BXmNo0X6zUWHrB04c
 xFzxFhxQbP3SMHRLui1l9BoefqWz7Q/3cbdymm5x0tT8WtSVbJFD4PRcE00teSIxM3PSDCr/
 5GSmKEmYJaDihwX8LvdxPc/49j3cFbqid1nfbVGj3TJ6zQaeEk5J6TWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/7] fluentbit: drop compiler optimization package configs
Date: Fri, 14 Mar 2025 21:50:31 +0100
Message-Id: <20250314205035.386919-3-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115990

From: Peter Marko <peter.marko@siemens.com>

These manipulate compiler flags instead of using what yocto provides.
* "coverage" adds paths to binaries and thus causes buildpaths errors
* "small" strips binaries, so causes already-stripped error.
* DEBUG_BUILD is the correct way to enable debug/release flags in yocto

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index fbaee9e121..94fbed0962 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -48,7 +48,6 @@ PACKAGECONFIG ??= "\
     proxy-go \
     record-accessor \
     regex \
-    release \
     signv4 \
     sqldb \
     stream-processor \
@@ -73,9 +72,7 @@ PACKAGECONFIG[backtrace] = "-DFLB_BACKTRACE=Yes,-DFLB_BACKTRACE=No"
 PACKAGECONFIG[binary] = "-DFLB_BINARY=Yes,-DFLB_BINARY=No"
 PACKAGECONFIG[chunk-trace] = "-DFLB_CHUNK_TRACE=Yes,-DFLB_CHUNK_TRACE=No"
 PACKAGECONFIG[config-yaml] = "-DFLB_CONFIG_YAML=Yes,-DFLB_CONFIG_YAML=No,libyaml"
-PACKAGECONFIG[coverage] = "-DFLB_COVERAGE=Yes,-DFLB_COVERAGE=No"
 PACKAGECONFIG[custom-calyptia] = "-DFLB_CUSTOM_CALYPTIA=Yes,-DFLB_CUSTOM_CALYPTIA=No"
-PACKAGECONFIG[debug] = "-DFLB_DEBUG=Yes,-DFLB_DEBUG=No"
 PACKAGECONFIG[enforce-alignment] = "-DFLB_ENFORCE_ALIGNMENT=Yes,-DFLB_ENFORCE_ALIGNMENT=No"
 PACKAGECONFIG[examples] = "-DFLB_EXAMPLES=Yes,-DFLB_EXAMPLES=No"
 PACKAGECONFIG[http-client-debug] = "-DFLB_HTTP_CLIENT_DEBUG=Yes,-DFLB_HTTP_CLIENT_DEBUG=No"
@@ -91,11 +88,9 @@ PACKAGECONFIG[posix-tls] = "-DFLB_POSIX_TLS=Yes,-DFLB_POSIX_TLS=No"
 PACKAGECONFIG[proxy-go] = "-DFLB_PROXY_GO=Yes,-DFLB_PROXY_GO=No"
 PACKAGECONFIG[record-accessor] = "-DFLB_RECORD_ACCESSOR=Yes,-DFLB_RECORD_ACCESSOR=No"
 PACKAGECONFIG[regex] = "-DFLB_REGEX=Yes,-DFLB_REGEX=No"
-PACKAGECONFIG[release] = "-DFLB_RELEASE=Yes,-DFLB_RELEASE=No"
 PACKAGECONFIG[run-ldconfig] = "-DFLB_RUN_LDCONFIG=Yes,-DFLB_RUN_LDCONFIG=No"
 PACKAGECONFIG[shared-lib] = "-DFLB_SHARED_LIB=Yes,-DFLB_SHARED_LIB=No"
 PACKAGECONFIG[signv4] = "-DFLB_SIGNV4=Yes,-DFLB_SIGNV4=No"
-PACKAGECONFIG[small] = "-DFLB_SMALL=Yes,-DFLB_SMALL=No"
 PACKAGECONFIG[sqldb] = "-DFLB_SQLDB=Yes,-DFLB_SQLDB=No"
 PACKAGECONFIG[stream-processor] = "-DFLB_STREAM_PROCESSOR=Yes,-DFLB_STREAM_PROCESSOR=No"
 PACKAGECONFIG[tests-runtime] = "-DFLB_TESTS_RUNTIME=Yes,-DFLB_TESTS_RUNTIME=No"
@@ -119,6 +114,10 @@ SYSTEMD_SERVICE:${PN} = "fluent-bit.service"
 
 inherit cmake systemd pkgconfig
 
+# disable manipulation of compiler flags and CMAKE_BUILD_TYPE
+# release and coverage are off by default, disable also debug
+EXTRA_OECMAKE += "-DFLB_DEBUG=No"
+
 FULL_OPTIMIZATION:remove = "${@'-O2' if bb.data.inherits_class('clang', d) else ''}"
 TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:remove = "-D_FORTIFY_SOURCE=2"

