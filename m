Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D46C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 19:06:10 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4801.1789326368629091386
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 12:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kEeOTGrG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026091319060452e5dbcf3d00020730-x3jpjj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026091319060452e5dbcf3d00020730
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 21:06:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Y5yBdYWWta2/Ao2dC9y0GrWcAGWAG70HeLR/ts7XElw=;
 b=kEeOTGrGAEQFdpOJDJBx0NDzJwKybLnA2h3kinMQ3MGcOTJaI04lKb0KAEeoiNZGL0psTQ
 1971xTsBS6l2RhELCniYZdjP0+DwTCNt3qSMbmbfZx9OC4JOpDxGOyUltGO+5YnJpeVzlpxu
 yYYi+lUhl4Jg0vT4bWI4FjSiX1TwExaMNTcFnbXGmUEy20/bQdYHaZNuuRNLgtHIL72dimHC
 3aG/j6/1pk2gpJvW21ItAiY2w10mDVoY3/aAwjBLSI1ZQ+tfY+yzbMjZ0qA+2ugvUtZn/rJB
 lxsuInKLuqh9peO7zTZ50zOSTPlJi46OrFcNRCoa/Ys4oyswa5VIfuzA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 2/4] msgpack-c: upgrade 6.1.0 -> 7.0.2
Date: Sun, 13 Sep 2026 21:04:37 +0200
Message-ID: <20260913190437.3233830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 19:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130004

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-72854 (in 7.0.2).
Add tag to git SRC_URI.

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
 .../msgpack/{msgpack-c_6.1.0.bb => msgpack-c_7.0.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_6.1.0.bb => msgpack-c_7.0.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
index 1061c37345..6d71a5dfbf 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                     file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
                    "
 
-SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https"
-SRCREV = "445880108a1d171f755ff6ac77e03fbebbb23729"
+SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https;tag=c-${PV}"
+SRCREV = "e17beb371b59459a13b48e166a11e123bda5bf93"
 
 UPSTREAM_CHECK_GITTAGREGEX = "c-(?P<pver>\d+(\.\d+)+)"
 

