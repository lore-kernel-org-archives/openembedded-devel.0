Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C05C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:23:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.969.1789313016944459693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=m7cGeb+J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202609131523336a4fc5140a0002074b-11fkdl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202609131523336a4fc5140a0002074b
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:23:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NwsyG0vRqi6drIlb2sq63+GJrWgdeIMMN2pCXh8zgLw=;
 b=m7cGeb+JT+MoLO0hbetUEs7e57cY0ANKECbAtSwG8eLzuldSuJ0fpJib1he97KJCoUuz2t
 MVQW1PREvD7tf180/EszrE6GtQb+AzllBu9mJ/KNoK0NU3ne0oLlFllnvg9FHzOWRXN7H5jW
 7mfIJ+4WHJC4kq2C+w21CCU3VhnKpmLZidu0tUmQDFoa3Tw0hwZg5dXSKLo6S5fIhS6shCQ1
 ZLK/Eq1YNQ7Nhlr9WcCvFL+btqTdNacLWpUGlX9FakT3h2/MwnKL07ibCSRzSanP7HXBZG+q
 bwIQURZyG9vyPN99T4A8VHeRFhEU1U7QEfzTpXMU0Y/jh1VgR85b1AUA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/4] msgpack-c: fix upstream check
Date: Sun, 13 Sep 2026 17:22:50 +0200
Message-ID: <20260913152253.3201491-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129995

From: Peter Marko <peter.marko@siemens.com>

By default it picks the highest version, which for this repository is
for msgpack-cpp. Set GITTAGREGEX to pick msgpack-c tag.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
index b7f3625c2a..1061c37345 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https"
 SRCREV = "445880108a1d171f755ff6ac77e03fbebbb23729"
 
+UPSTREAM_CHECK_GITTAGREGEX = "c-(?P<pver>\d+(\.\d+)+)"
+
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DMSGPACK_BUILD_TESTS=off"

