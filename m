Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8DAC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:17 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.50829.1738869608125769224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KX3QdXda;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250206192009e297715aecbd3de99b-6o4nz4@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250206192009e297715aecbd3de99b
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=l/+NpJZ2xy0GS+Yb+rvSJZu4wmVmSNQds52dXNjblHY=;
 b=KX3QdXdaLzTy+vrKn6kfj9T/W+M6TTq4w6WGku5xn/qeeM1Zr6NqzHdRvheYjVgyGhE71t
 uaNWCl/mEazBDad2nmPRlbPJYwb860cdUO1d+7LZoUv7emz1WoBLslmkrCMVo3PzxMxFUiaV
 wMCESHg4nYwAdIP3TMXZ9Tkcp14YuogPkZxxBDti2phePKPrkdfH5A8XPwbFAL9/JvJOFzsa
 QxAcCXafPfnYhOIDXHjmzmCkEJZusFhbE3Z8yXSrSRaxzi87HpFnv4ysn5kyGiqFVWC/obTY
 Dzg/k0Sb+ndZDqx0Y0CYJvoIk/ZhOdy/neXfQ2IRHVgq9aIw1HclXefQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 5/9] python3-grpcio: use system c-ares
Date: Thu,  6 Feb 2025 20:18:59 +0100
Message-Id: <20250206191903.2324783-5-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115297

From: Peter Marko <peter.marko@siemens.com>

This also corrects license, SPDX and CVE handling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index d621f840f1..ab615d38e5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "openssl python3-protobuf zlib"
+DEPENDS += "c-ares openssl python3-protobuf zlib"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://0001-Include-missing-cstdint-header.patch \
@@ -19,6 +19,7 @@ inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
+export GRPC_PYTHON_BUILD_SYSTEM_CARES = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_ZLIB = "1"
 

