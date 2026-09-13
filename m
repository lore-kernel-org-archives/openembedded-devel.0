Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274F3C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:23:49 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.999.1789313026233200567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PYGazPbI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202609131523433dd60f5d5d000207fe-6kx0d_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609131523433dd60f5d5d000207fe
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EZsy5D8zPVcDoOM++JTiUDtHWMplzfcxHtqDQJ/Mqx4=;
 b=PYGazPbIjp11aa0CBpX2nPdEK6CX8lBCvYJgXmH5u+MLiPlh7Qe+qgp5C3BwoE0d4+jeUS
 hXO7fkPFZv5G3g3Xrx2+5IWKuX3NFyyxdQ/elOr6NvB4j+LvOWm4AEBJZ/Fr4uePK4XyKB/7
 8T2QOxm69UBMov8Tw1SDZWHLLF7e2I0nL2CLdRdVWKBFuw55vo1Hwk2tiIFHSJNFsOOtmsb+
 xF5TTABbatkrz7n/ecXhmbb1WpHAme6WF+uHpTCN8MR3EnnuevFhjnDYYNZB46h0FL7JClDY
 cUTcKLebwRRfIcWx7TrDzub/uItbGpcKw3JieWg7RffVY+2/jgOwlIJQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/4] msgpack-c: upgrade 6.1.0 -> 7.0.2
Date: Sun, 13 Sep 2026 17:22:51 +0200
Message-ID: <20260913152253.3201491-2-peter.marko@siemens.com>
In-Reply-To: <20260913152253.3201491-1-peter.marko@siemens.com>
References: <20260913152253.3201491-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129996

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-72854 (in 7.0.2).

Release notes:
* https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.0
    Refine CI (#1152)
  << breaking changes >>
    Updated cmake minimum required to 3.5-4.0 (#1160)

* https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.1
  Set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR (#1177)

* https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.2
  Fix integer overflow on msgpack_unpacker_expand_buffer(). (#1182)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../msgpack/{msgpack-c_6.1.0.bb => msgpack-c_7.0.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_6.1.0.bb => msgpack-c_7.0.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
index 1061c37345..b5ff5d9780 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https"
-SRCREV = "445880108a1d171f755ff6ac77e03fbebbb23729"
+SRCREV = "e17beb371b59459a13b48e166a11e123bda5bf93"
 
 UPSTREAM_CHECK_GITTAGREGEX = "c-(?P<pver>\d+(\.\d+)+)"
 

