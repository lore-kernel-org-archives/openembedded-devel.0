Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1815.1793900013516610343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 09:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BduSU4L0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202611051733315b44eb658500020725-9dwvwp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202611051733315b44eb658500020725
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 05 Nov 2026 18:33:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VyUfdB9zEbWKklx8qox//iFVMA0RlSDGPwCC/2C9vnU=;
 b=BduSU4L0HKh1z5RUGx/aTYgYiT3noJbdDXf8hfVdM8gDBddIwOBfJtTORYR69yOxHj8xQ6
 yGozfUVXXA0oQxb/+W6Tf5YXG6usaBDWx2fVFxMGxQrUmC/eNjI0sGCE06jRRhzKGbUMxoyQ
 5FFHzdmgVkhxq0J8X0L3F9bwXF6cfVxFY8G0QulUoDHSKgEwCzgMXZK+C5vRooC7JyYf1ygH
 YoOnfCWUgwSlBV6ZL3TIJnk1GTP4Av7by0eePbIlrtvkhm98ZK7rJNHika0o3p/4FopAAlwu
 nywnhmkWlSiNJ/qN0mEcwt/3J7Sjeu549PbGALog6JszHLtjDPnSzlyg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 2/2] crow: upgrade 1.3.3 -> 1.3.4
Date: Thu,  5 Nov 2026 18:33:00 +0100
Message-ID: <20261105173300.406894-2-peter.marko@siemens.com>
In-Reply-To: <20261105173300.406894-1-peter.marko@siemens.com>
References: <20261105173300.406894-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 17:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131927
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://github.com/CrowCpp/Crow/releases/tag/v1.3.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From OE-Core rev: 9bf293a9d1d2d0f7f3f469427e7500b3d6988ba2)
Resolves CVE-2026-116011
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/crow/{crow_1.3.3.bb => crow_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/crow/{crow_1.3.3.bb => crow_1.3.4.bb} (92%)

diff --git a/meta-oe/recipes-support/crow/crow_1.3.3.bb b/meta-oe/recipes-support/crow/crow_1.3.4.bb
similarity index 92%
rename from meta-oe/recipes-support/crow/crow_1.3.3.bb
rename to meta-oe/recipes-support/crow/crow_1.3.4.bb
index da8da60aea..6642ab0724 100644
--- a/meta-oe/recipes-support/crow/crow_1.3.3.bb
+++ b/meta-oe/recipes-support/crow/crow_1.3.4.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
 
 SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
-SRCREV = "7375d3dc1ffb8719778cdb29fb1c73141ce684e8"
+SRCREV = "ae0fef0ee67eec897e401321b99b6dd7cfbdc155"
 
 inherit cmake
 
