Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9646C43217
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 18:06:45 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.16035.1641146804703790184
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 10:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=SYJSRc9I;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641146805;
  x=1672682805;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5dXtFXve8rgfmsvgoW9vtHIddyyneI8v3KvOEEOIi7c=;
  b=SYJSRc9IYoI1iufryEI5qIaJb0ildnitg7VhUuRdeKtN8TLCZXaa3PGP
   U8A7HZc/lVjfE4KpPAjc5BDN6xx4gNAx53I35N4xp7vkN04Tu1q7d9iJ8
   AmQ5nghaWUskyXkOZo3MgRVpcYLcEL1IGe5ahajykAHTyhSfvK5oPyPER
   Q1877QMfw2eEnevtSwnLzbWS37GSORlwuiGzHs+Hail+9zsLBIelot05R
   pd8x9sfbrrhv7sjJhBkpM/rvx+X8EIDqHqoSpCOh9H0eIxt8ofB0PAfWv
   UhsmoiNPVxgyU+aO0//cPcq17YuUIBEmePvSOoNz/g0c54M5MDSspN50e
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH] libsrtp: Add support for specifying the
 crypto library
Date: Sun, 2 Jan 2022 19:06:34 +0100
Message-ID: <20220102180634.1448-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jan 2022 18:06:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94643

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
index 0946aec60..b17e4767b 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
@@ -13,4 +13,8 @@ SRCREV = "90d05bf8980d16e4ac3f16c19b77e296c4bc207b"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[nss] = "-Dcrypto-library=nss,, nss,,, openssl"
+PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,, openssl,,, nss"
+
 inherit meson pkgconfig

