Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79745C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 18:51:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.4262.1755111063164140842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 11:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YUO897yx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202508131850581583134a2fff9f4664-tp11zo@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202508131850581583134a2fff9f4664
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 13 Aug 2025 20:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wLR+Dckno2zOu5HbCJALmRnx8Xstnwd+r7L8YrAokfs=;
 b=YUO897yxEhfDW8HzNZO9NA6aMdUcaIdN27I7U5z0icwKlwaSR7tbXi2auR/SqWClZK+yZN
 S1IL/FKBYmyU2TIW6lMcFWrE5aAxLQkZziBozHo4tsKbGBZHkidYlY9PVB9933YSTWs2G125
 wYJ/WSORt6zoJNziExm8heYhlR62ocqGJRkl3SM35n/huBX/KPYD2f1H8xOw3FuVJgbJkFPY
 UWdEqrejA22/DDjBOYwS4OdGWBY5g4NQLAZygxBvS7+ZHRnMStyMTr0pYJN79kd5bmRS48C3
 v4AfPrz6Vqq9I59vQXkLv8lVDCJ3o4SSdWnC5wGkggb89roR8QHdZ0qg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] 7zip: upgrade 24.09 -> 25.01
Date: Wed, 13 Aug 2025 20:50:07 +0200
Message-Id: <20250813185007.1423891-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 18:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118926

From: Peter Marko <peter.marko@siemens.com>

Handles CVEs:
* 25.00: CVE-2025-53816, CVE-2025-53817
* 25.01: CVE-2025-55188

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-extended/7zip/{7zip_24.09.bb => 7zip_25.01.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/7zip/{7zip_24.09.bb => 7zip_25.01.bb} (94%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_25.01.bb
similarity index 94%
rename from meta-oe/recipes-extended/7zip/7zip_24.09.bb
rename to meta-oe/recipes-extended/7zip/7zip_25.01.bb
index 74e44c44e3..779b708eee 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_25.01.bb
@@ -3,14 +3,15 @@ HOMEPAGE = "http://www.7-zip.org/"
 LICENSE = "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
-                    file://DOC/License.txt;md5=44483e232b64ffca25fe001f3d6418d0"
+                    file://DOC/License.txt;md5=e80f9280df93aa8da95cac449f9fd115 \
+                    "
 
 CVE_PRODUCT = "7-zip 7zip"
 SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main \
            file://0001-support-yocto-cross-compiling.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
+SRCREV = "5e96a8279489832924056b1fa82f29d5837c9469"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 

