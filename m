Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FAAC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:04:13 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.10237.1739027047509623758
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ASnMsHL1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250208150405e9aaf5447c92eecb50-feqa2_@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250208150405e9aaf5447c92eecb50
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 08 Feb 2025 16:04:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YzQ8cFJe2iUIScWULkELap2jrNKHpcTjXX0Szr4CZWk=;
 b=ASnMsHL1fulKjKIOVO8D7rXxGK+pdjJmrMA9prWA0iT5h/aeYudLqWlcylM75R2Qfypm97
 dvne67NBKoZlzSTYRKQ9H9OQLxS8Vgpc2fEtIfufq5CfUBSYY/FSivSuy8ID/REEXGhi6NBi
 gsURTyBIk0HEaqNUb2F6IpVzglMtCh8JaHqvjP4PLwJxtwcriZ2PR6MEmyTYZJ+MjXBKhzfD
 3uQdth2nZR7xow50dMgGypsOUlhQx/+L1c33R+XQX9/rcPKWon4FB83CeuLgv3VpryDgPfSD
 odV4DmrWSEexaEAiPR2H6FQ3hRDOI4JJiWJq2CBC4wVeeCtQG9FAWF8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/4] grpc: remove workaround for GCC 4.8 in Ubuntu-14.04
Date: Sat,  8 Feb 2025 16:03:06 +0100
Message-Id: <20250208150308.2451484-2-peter.marko@siemens.com>
In-Reply-To: <20250208150308.2451484-1-peter.marko@siemens.com>
References: <20250208150308.2451484-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 15:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115310

From: Peter Marko <peter.marko@siemens.com>

Minimum distro version and gcc version is now higher.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index b82b802e3c..1524168c78 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -25,8 +25,6 @@ BRANCH = "v1.68.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
-# Fixes build with older compilers 4.8 especially on ubuntu 14.04
-CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
 
 inherit cmake pkgconfig
 

