Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BDDC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 17:55:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.7509.1665165305934100657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 10:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AXOIg/sr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A4541C000C;
	Fri,  7 Oct 2022 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665165303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GHTfQ9AKiNiYEcH2/1oGzHkEFztydRobKRsDQYO2MSY=;
	b=AXOIg/srBvuJro7V5Z7biqe2D/37seDoXDE/M17EQGdL6hyX0GwSMDIttw2w607oENQ4bV
	zKtT68zXl0IRFElKoae5PGWHYVeNMs8bfL5xupNKYwuhVsyBCTz8m8Unp/kr/HHezpG+51
	e8b/WLgs84cNuomOgh9ZqUIuo+OJ8qw6xTSrlU/wOD7Scg3TeOkS2BDXyUYn1/b+qUPB0w
	SUySOhhUwwS/b1hgZMhcbGc+Mlq94bCYt923sY+Ubt2dQ+Z/QdJs1Ygm1HaD2OFtXSOeYp
	G0VLoL6f8++sPeQf8lJve19ye9/YMnqxB/iDdNHW6mv0U1lNUicRRg64X81Scw==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [meta-oe] tio: correct license information
Date: Fri,  7 Oct 2022 19:54:59 +0200
Message-Id: <20221007175459.3185715-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Oct 2022 17:55:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99089

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Source: https://github.com/tio/tio/blob/6618642acf28fec6d3e70ed75b50d4ce138ea08a/LICENSE
(corresponding to version 2.0, unchanged in latest master)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-oe/recipes-support/tio/tio_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tio/tio_2.0.bb b/meta-oe/recipes-support/tio/tio_2.0.bb
index 3cc510081..54e448b6d 100644
--- a/meta-oe/recipes-support/tio/tio_2.0.bb
+++ b/meta-oe/recipes-support/tio/tio_2.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "tio is a simple serial device tool which features a \
     straightforward command-line and configuration file interface to easily \
     connect to serial TTY devices for basic I/O operations."
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-- 
2.34.1


