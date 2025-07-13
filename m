Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114AC83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:47:22 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.53947.1752400034654100070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WPfNAjkk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250713094712b4bfef942787a27f6f-vvutaq@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250713094712b4bfef942787a27f6f
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:47:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HYBIwZ8+ec2C6OANX9cn3B9MwCjVLe8ZTVRSj5SSSFA=;
 b=WPfNAjkkYFO+1bGUX6BI403v6yr1Wn4Q4KnWLZ+xY3L5HkbF1IrGUOJpCeRB9e73Sw1Gjc
 yPCpTj7Qs0TwdD/PSJvKOptVzmBgnuj16lj6vhJ/CeV/+tiPCQ5V9vIq0LUFFWjvhZUXpdiT
 6og9Vqw+1XXn9VzOdx532IsMYok/IU3jz6jUewDEvROKfAZzuy9i6Pf5NNWfarT0qsrduTRg
 d1tXDEiX5nxAoUIKH9MonK5DXb1IQ6O+Kp7uLq6h9dtawuG0k95NxpSm4E6SA3yRk+ToKTrS
 140Oafg7S1b1oCdjG5O7p7Uyf+ft2/5FV1ROkJW7Pi7PIpywZVTiYYhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 2/3] poco: Remove pushd/popd from run-ptest
Date: Sun, 13 Jul 2025 11:46:13 +0200
Message-Id: <20250713094614.501804-2-peter.marko@siemens.com>
In-Reply-To: <20250713094614.501804-1-peter.marko@siemens.com>
References: <20250713094614.501804-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118502

From: Khem Raj <raj.khem@gmail.com>

This could be worked out without needing to add bash dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index c479f7ac10..c9896eadee 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,9 +1,8 @@
 #!/bin/sh
 while read runner; do
-  pushd . >/dev/null
+  oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
   ./$runner-testrunner -all
-  popd >/dev/null
+  cd $oldpath >/dev/null
 done < testrunners
-

