Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA88D2CE17
	for <webhook@archiver.kernel.org>; Sun,  7 Dec 2025 09:08:37 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23651.1765098507582463385
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Dec 2025 01:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=k400pInZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025120709082422c87e56ff000207b0-fngh7c@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025120709082422c87e56ff000207b0
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 07 Dec 2025 10:08:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6rPrQCxhuYI83IzMgyLtGz/L36MyIyBU1RVW2COAQfE=;
 b=k400pInZRyi8sqPAuPccWkpXo1TMl4sTjIw5zmT40FMx4S6/ec6Lo/kMqK7iTSufDgEPMk
 koZ4jOxxDS22I0CVKFoh6VOpEZYZG+Fwv5NzYhisdhA6GEX1l6aw9lPeVRJFMMtnbaf5BFVw
 mbOGFymLyhwq5phTy8cigElho6zOneK2g4c9ce7xJXKV7B6GGgr3qxTlI1LfX1mAllnX6ba3
 f4+dukdkwtTXIaYzwqwUrbHBJFKNRVCloyr2QrcIPa2J8zErsKPZZO0N+RE3szxseoH7SCHU
 qKQgUoob4RLrLztV/HNSVLouUTOnOZx4wNkkhiT5m+rmK/2GcIlQW3zA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][scarthgap][PATCH] nftables: remove python dependency from main package
Date: Sun,  7 Dec 2025 10:08:20 +0100
Message-Id: <20251207090820.7341-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Dec 2025 09:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122367

From: Peter Marko <peter.marko@siemens.com>

The recipe splits python code to nftables-python package, however
setuptools classes add the dependency to main package.
Since nftables-python package already has python3-core explicit
dependency, remove it from the main package.

(From meta-openembedded rev: 331126a6d0a48ebcf12069df554b3abacaeb512a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 569ab6f6af..26fa72aff2 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -40,6 +40,8 @@ inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '',
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
+# setuptools3-base.bbclass adds this to main package, but this recipe is moving it to python sub-package
+RDEPENDS:${PN}:remove:class-target = "python3-core"
 
 # Explicitly define do_configure, do_compile and do_install because both autotools and setuptools3
 # have EXPORT_FUNCTIONS do_configure do_compile do_install

