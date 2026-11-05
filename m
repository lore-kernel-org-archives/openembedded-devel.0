Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1700.1793900005037658075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 09:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eZvXvmEx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261105173321bb4fbd786600020752-qhhzsa@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261105173321bb4fbd786600020752
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 05 Nov 2026 18:33:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Z4jGoV4EsexaxY85Nu3J4EWFkpFl507bqREVhF8UIDA=;
 b=eZvXvmExtWx1c189ECwFLvFEDjwZMYbKdBc2b5mBWeWk8itsjf9nceNJemgZWC8/B0ogwR
 5Fo0hMZo76lUjq+KFPMwACmRu9n7B/W7iTMyZOrgGwxquYtJoaDSMNdWI82d+SSXQo0wC8WA
 9cQqyUKLHbhBDcR94KDlkrj6PUQse0tbxJ+DO6gyW4J318UfazKqrCSNoupkkBgfCeFmRfJE
 xiVb9YyQSQUOig2kA0Th8IHs84tP3Z8vQroVpBLtzfGPOP+xUNBPIjVfq7VD75a3mQq/61w9
 +2zEv1bl5Lqvto4T6bCrQri/S3SMdJF+OaPBJSzabTpZRxg5ujlLdZng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 1/2] crow: upgrade 1.3.2 -> 1.3.3
Date: Thu,  5 Nov 2026 18:32:59 +0100
Message-ID: <20261105173300.406894-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 17:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131926
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/CrowCpp/Crow/releases/tag/v1.3.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From OE-Core rev: 6034c7f14f1929d25ad73389e4b76639c9d0545b)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/crow/{crow_1.3.2.bb => crow_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crow/{crow_1.3.2.bb => crow_1.3.3.bb} (92%)

diff --git a/meta-oe/recipes-support/crow/crow_1.3.2.bb b/meta-oe/recipes-support/crow/crow_1.3.3.bb
similarity index 92%
rename from meta-oe/recipes-support/crow/crow_1.3.2.bb
rename to meta-oe/recipes-support/crow/crow_1.3.3.bb
index 09970fcfc2..da8da60aea 100644
--- a/meta-oe/recipes-support/crow/crow_1.3.2.bb
+++ b/meta-oe/recipes-support/crow/crow_1.3.3.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
 
 SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
-SRCREV = "f8c060c51feeca2c65828fb6f538603db4392d55"
+SRCREV = "7375d3dc1ffb8719778cdb29fb1c73141ce684e8"
 
 inherit cmake
 
