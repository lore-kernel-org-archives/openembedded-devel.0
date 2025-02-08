Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F7DC0219E
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:04:13 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.10237.1739027047509623758
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HvmSUoAK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250208150409441afe844873bcf06e-coq8sy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250208150409441afe844873bcf06e
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 08 Feb 2025 16:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Wokqv164Q6SzMVB51BjWKNAV/6VQKe4CPNheo3XDd5U=;
 b=HvmSUoAK+6pqrkv6rCMCh6tpuWsJP8vwW+pznHpNrfFSb+0xh3xzUtXibo7T+dMkKf/kGy
 LLw3tBogWF/mA7GgdtIJCd/bzctUl7k2q0wteOAhjOvwhzrqGeFs4/c8h5xt+p10h7NEvr4R
 CBHKyPMnL203AXyGPVWqgLdbQlhpmuBx7iTye1+5vMzn3G2TOKmd0f0FiKPLukaWJnU2G1cA
 R0b0R7QftwrFJa6OUq1vALOdh5XcNnyo+MfNZ9yOUJ228mKJ+HJZwNWNzMMbkZfm5sqK2Acu
 98FP6NOC38kLvic1V4dcv4Y2MVwmmWWCE3va5PQsHBvzePZYT5om5vtg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package config
Date: Sat,  8 Feb 2025 16:03:07 +0100
Message-Id: <20250208150308.2451484-3-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115311

From: Peter Marko <peter.marko@siemens.com>

protobuf-lite is a package, not recipe, so current code leads to
ERROR: Nothing PROVIDES 'protobuf-lite'

Moving it to 4th part (rdepends) is not needed as grpc links against it
so that rdependency is asutomatic.

Therefore protobuf-lite should be removed.

Note: for native, this packageconfig does not even compile and for
target it fails to link.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index 1524168c78..6e729e9734 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[objective-c] = "-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=ON,-DgRPC_BUI
 PACKAGECONFIG[php] = "-DgRPC_BUILD_GRPC_PHP_PLUGIN=ON,-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF"
 PACKAGECONFIG[python] = "-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=ON,-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF"
 PACKAGECONFIG[ruby] = "-DgRPC_BUILD_GRPC_RUBY_PLUGIN=ON,-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF"
-PACKAGECONFIG[protobuf-lite] = "-DgRPC_USE_PROTO_LITE=ON,-DgRPC_USE_PROTO_LITE=OFF,protobuf-lite"
+PACKAGECONFIG[protobuf-lite] = "-DgRPC_USE_PROTO_LITE=ON,-DgRPC_USE_PROTO_LITE=OFF"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 
 do_configure:prepend() {

