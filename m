Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFA2FD9E20
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 23:03:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83242.1772146974116676439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 15:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TE+CXB9b;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026022623025089cda0c02c0002073c-iqncb_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026022623025089cda0c02c0002073c
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Feb 2026 00:02:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hdWu6maSaCtLBfP60Xun/krHpuXEX6IuVGjytoRUhj0=;
 b=TE+CXB9bij6Aqouty6LxdeB1Gvm2S6fhabX8soQ4KCoZIHZIDAlnt51XpXu9F2xB74CndT
 z/BUrCMJBMRql8crAjQDNKJ7JwkKUtLwj5LoXWUFUum4ph+3wsZ1/9zjY8j/1k+Ed6ylQAmY
 5H7QURCdJ8ajl4FQ0bmflK2eKkqPMm/SPBVCGKkoQFa1D1InnA0sI4rkD/pZ2+wdD05s3mCA
 4aLqpxRdJnGNY6VTJ7D0hlNjiAK+0bSQfhIeIZgpGMJYS6FofvtP197TnRLAU9+Jw3C2qdFI
 z8SXenpWPtCGaiYOQh1QIkcMJRTDhbv6YHzZCTaTVGlvJtofgSXGHCHQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] 7zip: upgrade 25.01 -> 26.00
Date: Fri, 27 Feb 2026 00:02:49 +0100
Message-Id: <20260226230249.2845169-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 23:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124689

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:
* improved code for ZIP, CPIO, RAR, UFD, QCOW, Compound.
* 7-Zip File Manager: improved sorting order of the file list. It uses
  file name as secondary sorting key.
* 7-Zip File Manager: improved Benchmark to support systems with more
  than 64 CPU threads.
* the bug was fixed: 7-Zip could not correctly extract TAR archives
  containing sparse files.
* some bugs were fixed.

License-Update: copyright years refreshed

[1] https://github.com/ip7z/7zip/releases/tag/26.00

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-extended/7zip/{7zip_25.01.bb => 7zip_26.00.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/7zip/{7zip_25.01.bb => 7zip_26.00.bb} (94%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_25.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.00.bb
similarity index 94%
rename from meta-oe/recipes-extended/7zip/7zip_25.01.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.00.bb
index f4ea6506e1..85219b5052 100644
--- a/meta-oe/recipes-extended/7zip/7zip_25.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.00.bb
@@ -3,16 +3,16 @@ HOMEPAGE = "http://www.7-zip.org/"
 LICENSE = "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
-                    file://DOC/License.txt;md5=e80f9280df93aa8da95cac449f9fd115 \
+                    file://DOC/License.txt;md5=a4ae6e492874f0008c7600c2ef80daa4 \
                     "
 
 CVE_PRODUCT = "7-zip 7zip"
-SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main \
+SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-support-yocto-cross-compiling.patch \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "5e96a8279489832924056b1fa82f29d5837c9469"
+SRCREV = "839151eaaad24771892afaae6bac690e31e58384"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 

