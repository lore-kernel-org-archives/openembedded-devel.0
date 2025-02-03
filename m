Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E73BC02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.95227.1738606989180142908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=F/LlWm4r;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250203182306e4a1910cbffe2fe6cf-eaiy_m@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250203182306e4a1910cbffe2fe6cf
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=k9YyOxO7YOpoJwxaJ2TPmDAiMFIxou5fd1kdl5L8bLE=;
 b=F/LlWm4r350IDCOseDE7x3Zae797wsMlCFXPbPgQaL9rYQbusXD+hjUexc0wJYAUeasoOi
 AUnDM9jYwI51CByXETl+ilzfY3rhKtSE2gTnbe1qAWwX0fzghLpdvrC1EzDVwicFchuENcSR
 qlkA2A0/bWn1bqyrYp2GIYpk1oV7F5CqmmXB0TlNSf2uiJ6kBljAy/JMuRxyFuYHa9JK7oog
 sbHRAohHD3DjOQwKmICuFwmQ3GjRubnkHHFSlB91JZsv3gTmXLquWjUOkK0qSr3AVkXFA7y3
 arljQSjKAtxCaZZLdLQfKKq9A2b18qLtuFT9cTZ4ZOJFkj2+i5WpB0UQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 2/9] protobuf: remove rdepends on abseil-cpp
Date: Mon,  3 Feb 2025 19:22:03 +0100
Message-Id: <20250203182210.574300-2-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115246

From: Peter Marko <peter.marko@siemens.com>

This commit reverts
https://git.openembedded.org/meta-openembedded/commit/?id=5af1cd3ada4cc86864810a12c82771ba1afdce64

That commit prefers sdk development instead of release images.
The additional libraries are not needed for protobuf at runtime.
Also any component depending on protobuf will have whole abseil-cpp in
sysroots so linking all the libraries is possible and any additional
ones will be installed.

What may not work is if protobuf is installed in sdk image and
application using it wants to use an additional abseil-cpp library.
However that is easily fixable by adding also abseil-cpp to sdk.
Removing hard-dependency in release images is much harder.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index efd70d6474..c7e9408870 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -106,8 +106,6 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 # CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
 SYSROOT_DIRS += "${bindir}"
 
-RDEPENDS:${PN} = "abseil-cpp"
-RDEPENDS:${PN}-lite = "abseil-cpp"
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${@bb.utils.contains('PACKAGECONFIG', 'compiler', '${PN}-compiler', '', d)}"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"

