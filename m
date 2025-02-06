Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E536C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:27 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.50467.1738869625929561627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JF4Ypa04;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250206192023f007527db17e1e907d-mrfpsi@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250206192023f007527db17e1e907d
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bc8grW1TTsHogQxrWHbc8qNUxVn1/XgpppfIR4+sfwc=;
 b=JF4Ypa04cSQZG+oh/E6R7C/JUFZ0EyQs+v2LzeGWM034EOqUg+cFI7g2aGyonl7/vc2w6y
 FjdfWHUR1ywexTHbUTtjG/ll8TP1cdjoPgxPkX4D6VtmTZvpm36PTfXS/o0KLiWZWHlN+zis
 HiFutBBVb+XqcNz7XuaMHW6N1D//R8qaWnpmPjSMHziJiZXZJe1iSU3isMHtzPjnRQh8E9v9
 JYYUO9LwZ62pi/DXZAeCT9ftr+fGQnpf1WMBaAIgyhzgTTvDTHRMDfmlvTYT3J7GtyvBamP/
 8ZtTcgcBj+rJ6Wve1SfvWHViMcBLgTzRCsEeBkjqBxWY90cd2QNNNXmQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 9/9] python3-grpcio: add licenses from third party components
Date: Thu,  6 Feb 2025 20:19:03 +0100
Message-Id: <20250206191903.2324783-9-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115301

From: Peter Marko <peter.marko@siemens.com>

After switching to unbundled build, there are still 4 components in
third_party directory which are used. Add their licenses.

* address_sorting - BSD-3-Clause (already present in main LICENSE)
  https://github.com/grpc/grpc/blob/master/third_party/address_sorting/LICENSE
* upb - BSD-3-Clause (already present in main LICENSE)
  there is a note in all files
* utf8_range - MIT
  https://github.com/grpc/grpc/blob/master/third_party/utf8_range/LICENSE
* xxhash - BSD-2-Clause
  https://github.com/grpc/grpc/blob/master/third_party/xxhash/LICENSE

License-Update: added missing licenses

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-grpcio_1.69.0.bb      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 8482240b68..b076298fef 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -1,8 +1,12 @@
 DESCRIPTION = "Google gRPC"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
+LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906 \
+    file://third_party/utf8_range/utf8_validity.h;beginline=1;endline=5;md5=db08ddb5817e660489678e7c3653805a \
+    file://third_party/xxhash/xxhash.h;beginline=1;endline=34;md5=d41d564db2353fc80a713956d85b1690 \
+"
 
 DEPENDS += "abseil-cpp c-ares openssl python3-protobuf re2 zlib"
 

