Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D57C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 04:02:34 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.140852.1669694552324670611
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 20:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fBQwFsue;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669694554;
  x=1701230554;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pIPTgxUpRNKcIBqRiQTo8Mmc5o3KADwKM18h8sI78m4=;
  b=fBQwFsueRi9V/dMpR4GRI/p1KNPZwGGJ7o8tuqg8Jnbz6pFatKOelbRz
   C1qcV0RThmNL80Vml5f7WH8AdP5MDwlJb9L93BagwSIdADAQr+uLFUbx5
   +Nk2qMw6BN2NcKGZxdVMXKe3iImm6wUwxBC18/adgxXVVDtI+KIEbQOZQ
   DPJ/VkkMyShhpU0bIjjao8APRJwMljp9soFA+aiMSOBO8bgKfqTc4VXdF
   Ye4KoMn7UY2nTYh/f2nK8FIiqtc10FFxSWQplcKf3FTzoj2Kna06wkC3G
   SMshRxhXpEcPWEx6mB4MuHl1mUZIhRvMtc9KSnuXvXcyWCc86cXBIT3Qt
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] lldpd: Correct the checksum for the tar ball to match 1.0.16
Date: Tue, 29 Nov 2022 05:02:05 +0100
Message-ID: <20221129040205.2142015-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129040205.2142015-1-pkj@axis.com>
References: <20221129040205.2142015-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 04:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99836

The checksum was not updated when the recipe version was stepped.

Also simplify the SRC_URI by replacing "${BPN}-${PV}" with "${BP}".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
index c7237d74b..799270510 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
 DEPENDS = "libbsd libevent"
 
 SRC_URI = "\
-    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
+    http://media.luffy.cx/files/${BPN}/${BP}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
+SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 

