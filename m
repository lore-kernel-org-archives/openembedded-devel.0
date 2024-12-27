Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538B0E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:40 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.11069.1735297051658574649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eVEA8PJv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024122710572963bd6939eb918a7565-e45saa@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024122710572963bd6939eb918a7565
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aJpS2U3wVN5PCpyphYM+ePAH/76kOOcKWqHP0TeYM7E=;
 b=eVEA8PJv4tSOwJi2U3X9z9yQXK4L/DmEid8jLd24DefcOb5QTrWV6AMCmlSlHejjA6/dLX
 ZHrvWieFUxUNDA4+APj1P0rfKniNRsVqMIOl05+NOj7DBDwwncLUv9pkwy2HFADPGZNMVAXY
 Q7o//uioCMUvjyrxW3uTiPKawFGtkQwyo1QPFulEPQZKg7Lq2xAlxOck27SCCryOuN0kuKkr
 L3nYrYggzkBf6yiBfBL01xCpAPilYX3iKHroo9G66a8mOKzliXy0fHu7Fccej1FxZ6oVLhyw
 pYRSAcZG1BHhPddd/hKbichbXAINcUL0YdgRWQd+qRNxulGKYbIJG0Aw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 03/15] id3lib: mark CVE-2007-4460 as fixed
Date: Fri, 27 Dec 2024 11:56:03 +0100
Message-Id: <20241227105615.3303193-4-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114561

From: Peter Marko <peter.marko@siemens.com>

This is fixed in id3lib3.8.3_3.8.3-16.2.debian.tar.xz patch included in
SRC_URI.
Version 3.8.3-7 contains patch for this CVE, we use 3.8.3-16.2.
This can be verified by checking the debian/changelog within this patch
or diffing [1] and [2] and verifying that this can be reverse-applied.

[1] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-6.diff.gz
[2] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.diff.gz

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 379c7e1b63..7ae262345b 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -14,6 +14,8 @@ SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b687
 SRC_URI[patch.md5sum] = "997c764d3be11c9a51779d93facf1118"
 SRC_URI[patch.sha256sum] = "ac2ee23ec89ba2af51d2c6dd5b1b6bf9f8a9f813de251bc182941439a4053176"
 
+CVE_STATUS[CVE-2007-4460] = "patched: fix is included in debian patch"
+
 inherit autotools
 
 # Unlike other Debian packages, id3lib*.diff.gz contains another series of
-- 
2.30.2


