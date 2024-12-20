Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC3FE7718D
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.154107.1734709045262892714
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aQ6aRCjy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024122015372897b546c9dd89bcdf2a-q6ymho@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024122015372897b546c9dd89bcdf2a
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AQFbAADHZI4BaSaQrAePU0Rpq5EPKOEn6ny5AMPpCyk=;
 b=aQ6aRCjyKpo/+EUsqQvTyiycwnZFZcvClmCAeE0fH+2haMkBm/E5wwPPlhpiMgV9ob3Azd
 rKLVeTlLTQj/IHKV5BO5LTsvk0hR8I+0TEV2UMSMUBQ5UKIX/CJSJ5IsFSCdENGBSfkMVgEv
 v5be1iy7ywRftSnNBUf31o05ci/wBd8xGEObPIIjEax2H2UiTCQXIMtWQktaz954NQWYsvCO
 D6geg3GiY0TC9KK7zUmN0DHAjjIWvohB9QQa6O93Vxs5pvWTPtQZ4mxFa7SBYsbMYulr8PVQ
 N9BXSfohQMYg+D3we8duvLDeB8Hf44BNtzICiUi1+v9vkm0ojQpPeiXw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 01/11] opensc: upgrade 0.25.1 -> 0.26.0
Date: Fri, 20 Dec 2024 16:36:19 +0100
Message-Id: <20241220153629.2499631-2-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114437

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-45615, CVE-2024-45616, CVE-2024-45617, CVE-2024-45618,
CVE-2024-45619 and CVE-2024-45620.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../opensc/{opensc_0.25.1.bb => opensc_0.26.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.25.1.bb => opensc_0.26.0.bb} (91%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
similarity index 91%
rename from meta-oe/recipes-support/opensc/opensc_0.25.1.bb
rename to meta-oe/recipes-support/opensc/opensc_0.26.0.bb
index 636bfa0366..3e4d476ff4 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
@@ -11,8 +11,8 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 DEPENDS = "openssl"
 
-SRCREV = "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
-SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https"
+SRCREV = "fe857cc4c68da4873071f168c9aaf9860040ff4e"
+SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


