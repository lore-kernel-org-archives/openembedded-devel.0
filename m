Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5537CC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 10:21:29 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.9143.1648117287516257592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 03:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1nXKap-000889-JG; Thu, 24 Mar 2022 12:21:24 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1nXKap-0008IR-DG; Thu, 24 Mar 2022 12:21:23 +0200
From: mikko.rapeli@bmw.de
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][PATCH v2 0/2] polkit: switch from mozjs to duktape
 javascript engine
Date: Thu, 24 Mar 2022 12:21:13 +0200
Message-Id: <20220324102115.31112-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220324102115.31112-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 10:21:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96192

From: Mikko Rapeli <mikko.rapeli@bmw.de>

polkit 0.121 will contain support for duktape but the patch applies
to 0.119 already so use it to get rid of mozjs and free 20 Mb of space.
Pick some CVE patches from master while at it.

v2: added Signed-off-By lines to all patches

Mikko Rapeli (2):
  polkit: add patches for CVE-2021-4034 and CVE-2021-4115
  polkit: switch from mozjs to duktape javascript engine

 ...l-privilege-escalation-CVE-2021-4034.patch |   84 +
 ...0002-CVE-2021-4115-GHSL-2021-077-fix.patch |   88 +
 .../0002-jsauthority-port-to-mozjs-91.patch   |   38 -
 ...ded-support-for-duktape-as-JS-engine.patch | 3463 +++++++++++++++++
 ...re-to-call-JS_Init-and-JS_ShutDown-e.patch |   63 -
 .../recipes-extended/polkit/polkit_0.119.bb   |    8 +-
 6 files changed, 3640 insertions(+), 104 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch

-- 
2.20.1


