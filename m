Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75068C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 11:40:32 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.17072.1708774822680891110
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Feb 2024 03:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oR8iN/Gm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240224114019751f042e0f4c1cdf3e-h4uo5_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240224114019751f042e0f4c1cdf3e
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 24 Feb 2024 12:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=A1tXLE5OgVdcKOdIniV0SUTQ3aebvan7BPJyoEeQDi0=;
 b=oR8iN/GmwST5eKO2S5YmjYghhUpWa+cwNCU9gxYj9CVLpXTMxDTUHsrwXLs5/isX5Kjwe9
 Iwko9n4MXJGVQr4Tbp3U27r3us+R63eALOHJRpfm6Tq8XeaBnA8NlwwajevM54c1bAZAu82D
 pfFhps7E5DvbUVhAzIXAYiuvywc3Y=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-java][PATCH] jsch,xerces-j: fix CVE_STATUS
Date: Sat, 24 Feb 2024 12:39:42 +0100
Message-Id: <20240224113942.11482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 11:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109025

From: Peter Marko <peter.marko@siemens.com>

Last commit tried to convert CVE_CHECK_IGNORE to CVE_STATUS,
however it was done in wrong way and caused the CVEs
to be reported as open again.

This fixes CVE_STATUS syntax.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 recipes-core/jcraft/jsch_0.1.40.bb       | 3 +--
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 8ef5c85..aeb04b4 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -25,8 +25,7 @@ do_compile() {
 SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
 SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
 
-# Ignore the CVE because it only affects Windows platforms
-CVE_STATUS += "CVE-2016-5725"
+CVE_STATUS[CVE-2016-5725] = "not-applicable-platform: Issue only applies on Windows"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index c7a54ab..45d3c43 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://archive.apache.org/dist/xerces/j/source/Xerces-J-src.${PV}.tar
 # Already fixed with updates and closed.
 # https://access.redhat.com/security/cve/CVE-2018-2799
 # https://bugzilla.redhat.com/show_bug.cgi?id=1567542
-CVE_STATUS += "CVE-2018-2799"
+CVE_STATUS[CVE-2018-2799] = "not-applicable-platform: Issue only applies on some Oracle Java SE and Red Hat Enterprise Linux versions"
 
 S = "${WORKDIR}/xerces-2_11_0"
 
-- 
2.30.2


