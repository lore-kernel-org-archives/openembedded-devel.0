Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68292C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 20:04:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.33092.1722801868088366194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Aug 2024 13:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QJWI37Xe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240804200424aea44d610715b35f46-5pv2ci@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240804200424aea44d610715b35f46
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 04 Aug 2024 22:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=g2nj8epyQcdVZFl+F68Rs+LU6qANnJlLm+o+THbaeXQ=;
 b=QJWI37XeTZbWrJVjSRBDcxuGBEWv2nxAXetHzD8UNRc1F2I3N8tUcV93coKDWsUEz1hcrN
 ia8mvnVz4I43tFArHCRbY9ywkEtsTDLmWH1+f3xDUeCFro/5D2WbKOQ/BjE6JC0oPbVzNl7H
 jHaTH5HdPRjW2TeOuWSc7hyUxSFQEGDJ40T/GAVn3pZ+h5n1F4XSmpiIsn+Sp49Dm4XykQeA
 LypdoAdYpn+f+S2mvPQKuabBu7lLFG17wEPDUl8PVxjKRs/+a/q5R6wCuExteyOCbmghsIB+
 Sd/zNGkBGcUgiLOzIKEHRFx8smnBjn/VbbwrKKmm7XN7fJkljFNb8tjQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] squid: Upgrade to 6.10
Date: Sun,  4 Aug 2024 22:03:36 +0200
Message-Id: <20240804200336.268419-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Aug 2024 20:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111507

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-37894

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch  | 2 +-
 .../recipes-daemons/squid/{squid_6.9.bb => squid_6.10.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.9.bb => squid_6.10.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index e0d002c68c..489850e3bd 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -37,7 +37,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    ])
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_
+@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
    [
     AC_MSG_RESULT([no])
    ],
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.10.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_6.9.bb
rename to meta-networking/recipes-daemons/squid/squid_6.10.bb
index f670a776eb..984209ad21 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
+SRC_URI[sha256sum] = "0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
-- 
2.30.2


