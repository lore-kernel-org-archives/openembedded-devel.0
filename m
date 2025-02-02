Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA359C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:04 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.73882.1738532404378798114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=U+/iCR0s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250202214002164a6d8e9855f06e79-gzpohg@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250202214002164a6d8e9855f06e79
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=k9YyOxO7YOpoJwxaJ2TPmDAiMFIxou5fd1kdl5L8bLE=;
 b=U+/iCR0s2ZFDgJTwJCUJwIhnugfFhYKtWCF2sfkeaJ3MKgUVoqx0m7UX5kwdZ61oT6/QWk
 JpwYj0/xgjo/PyDjeLVe+bqhCRq6p3HKCj4NyrTEPrf1/ex+k/rWkDN7VNlmITbjLSfUy9sr
 XS7KseeGlKfbKFW9NUfkXa/U/ET9gXrtShWE3kU7vNUPJaeI76k8W4ERtGbZ4CbQH+U/WjQ1
 Qfb2UNdSYbslkyG97sJVTkRVKGhEqId2r5VyLJNs68xg+65AnZ0mpI7borSVsoV2vjmb3wes
 x1CXy3LWFzGyEN+OdDUu+k1xxhdRlED3SMIPQaTiY8n2dWUQbuXkGgaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/8] protobuf: remove rdepends on abseil-cpp
Date: Sun,  2 Feb 2025 22:39:04 +0100
Message-Id: <20250202213910.284312-2-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115221

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

