Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1770DC5B56B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28237.1786364493599475068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vJpXdDBp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46F5414BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFB633F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364493; bh=5U/fEF8Eb80TbMVne6p+0RFz5BwziUMDuUJNSUTm3BA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vJpXdDBpZBbYbq4CA5w27P9BKwjZsrClWaLvruWH050h+GKKQrl6mK8CzypyWHS+f
	 Y/4WKyBa6Al3vxIFwrVLd2Q7E+fZqPsFTqPHBn4XjCoIPMnGzM7oNnkX8RCI07Mqcr
	 7qCjOC99UmaXu5KyH/VF+/1zsxDtfHzwCSmrHdic=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/24] python3-cachecontrol: switch dependency from lockfile to filelock
Date: Mon, 10 Aug 2026 13:21:08 +0100
Message-ID: <20260810122130.633299-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128882

cachecontrol moved to filelock in 0.12.12[1].

[1] https://github.com/psf/cachecontrol/pull/284

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-cachecontrol_0.14.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.1=
4.3.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.=
bb
index 0ea263b8b5..d617de8ce3 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} +=3D "\
     python3-crypt \
     python3-datetime \
     python3-email \
-    python3-lockfile \
+    python3-filelock \
     python3-json \
     python3-logging \
     python3-msgpack \
--=20
2.43.0


