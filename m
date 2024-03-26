Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B521C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 20:31:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.20994.1711485086769277286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 13:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RobeGgax;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240326203122a4c01b38285318dcaf-xogndp@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240326203122a4c01b38285318dcaf
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 26 Mar 2024 21:31:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b6q9WKK2gQ+uLeNQPYdzWs2H/pITut/ISJviNqCd1Tw=;
 b=RobeGgaxGvfyBEV4eYVbh/HCHfasXshAA9X8USFsHWgjVrajrRaxdoaHQooA8hlar9mTwO
 LZTQCOR/q3pBv4eoRmrkMKJXaQ+lFfQQAQrJZHCboV18EdP5o5koJC392B5S16B2SJEIOKRH
 VBfUPuR1rz8PcnLEFkopAeZUGpyRA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] libcpr: add new recipe
Date: Tue, 26 Mar 2024 21:30:34 +0100
Message-Id: <20240326203034.532236-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 20:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109628

From: Peter Marko <peter.marko@siemens.com>

Curl for People C++ Requests is a simple wrapper around
libcurl inspired by the excellent Python Requests project.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../packagegroup-meta-networking.bb           |  1 +
 .../recipes-support/libcpr/libcpr_1.10.5.bb   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 941efedd6..2e3aa5441 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -241,6 +241,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     vnstat \
     wpan-tools \
     ettercap \
+    libcpr \
 "
 RDEPENDS:packagegroup-meta-networking-support:remove:mipsarch = "memcached"
 RDEPENDS:packagegroup-meta-networking-support:remove:riscv64 = "memcached"
diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb b/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
new file mode 100644
index 000000000..93fdb78eb
--- /dev/null
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Curl for People - C++ Requests"
+DESCRIPTION = "Curl for People C++ Requests is a simple wrapper around \
+    libcurl inspired by the excellent Python Requests project."
+HOMEPAGE = "https://docs.libcpr.org/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
+
+DEPENDS = "curl openssl"
+
+SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.10.x"
+SRCREV = "3b15fa82ea74739b574d705fea44959b58142eb8"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# building tests is currently using FetchContent for mongoose
+EXTRA_OECMAKE += "\
+    -DCPR_USE_SYSTEM_CURL=ON \
+    -DCPR_BUILD_TESTS=OFF \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


