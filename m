Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16101C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:05 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.39868.1742165703940307652
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DiH/u6t9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202503162255019724f96e9db80abfc7-vtzu5q@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202503162255019724f96e9db80abfc7
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iX9djCopBK8RKMDANcHbgECd3TzF5HWS4TNyzCG9964=;
 b=DiH/u6t9OBMA/NDgvGlgrwNzIDo6+TFBQGQIHC5ThHXbzCCGt9L7zqoSODjXLnHTVUq44O
 /7LvMdGSXbDIMJ+gaw537XgWCt+evOPOQMk4TCrmZFcKo3EWqhCWK3Tp25soY/faB318ijzY
 XXEOlC8TnMfau9+6mVjUod/uM0B/hZJ5+fcIhZGVwljA8geVX4ocLmOe69yKOhAlkwMauygX
 hJYNd5rPDvvtscr8ghAk1/KOMjyl9v8jHKtekESJ7RdyyaP7tWzNfh013+bE6ck+AP9LbdqQ
 WbB7W5z+LIrW7UIzI6NRSRkbfObSNMpoyLC8dvv5gU6FsE2D6yok8FIQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 02/12] sox: build from git
Date: Sun, 16 Mar 2025 23:53:48 +0100
Message-Id: <20250316225358.2816208-2-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116007

From: Peter Marko <peter.marko@siemens.com>

Last release was done in 2015 but development still continues.
Switch to git sources to allow update.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index c1edd0fad7..48dba45420 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -27,13 +27,14 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
+SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://0001-Update-exported-symbol-list.patch \
            file://0001-tests-Include-math.h-for-fabs-definition.patch \
            "
-SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
-SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
+
+SRCREV = "45b161d73ec087a8e003747b1aed07cd33589bca"
+S = "${WORKDIR}/git"
 
 CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"
 

