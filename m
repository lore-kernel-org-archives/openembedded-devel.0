Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ABAE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:46:03 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.32658.1735044355836027423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=p78F/NTF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241224124554158e2c8e87ce5d2a4f-rsuhra@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241224124554158e2c8e87ce5d2a4f
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9a2JyBwvFbH5PGDp6NhmS82YtgTQbkgvsZMfZe7aS20=;
 b=p78F/NTFeKf0tKY+OtSGlwxQspteIdKZc+pJpbtDWq2aQKdQTIr3stfJuQQy05Ii7yRLCb
 RJ33eClvUQ8Fbr2RXN1n3q1VpGnNp8+YN/ULH/2j4zVPKAjgE3a4bPCleH+lRfQOGSUFbQre
 A9Lmcnpbf0H66xHe42LuXsAxeABpO2ampogDGM1Ga0hP9EnnM1lINr1NmuO9wWKv1xUSvwF9
 yssjJE40i6B6D94HoAjeeI4lfk2VVwAvmdWY17JvARMOsm1tz8+X2KOl29rHlTcOxRVAKKtj
 pIH5AC1NsCFPyK2AS2t4Wpj8pVLGMs0+TaELg//zL3e2kfuVexFNsh+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 6/6] synergy: patch CVE-2020-15117
Date: Tue, 24 Dec 2024 13:44:17 +0100
Message-Id: <20241224124417.2547005-7-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114547

From: Peter Marko <peter.marko@siemens.com>

Pick commit based on [1].

Note that the pick is node from deskflow, which is open-source successor
of synergy.
If anyone uses thie recipe, it should be switched.

[1] https://github.com/deskflow/deskflow/security/advisories/GHSA-chfm-333q-gfpp

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../synergy/synergy/CVE-2020-15117.patch      | 48 +++++++++++++++++++
 .../recipes-support/synergy/synergy_git.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch

diff --git a/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
new file mode 100644
index 0000000000..4ad2a45275
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
@@ -0,0 +1,48 @@
+From 79efdb7c617b809e1a2daf17441d7a30f7046aa5 Mon Sep 17 00:00:00 2001
+From: Jnewbon <48688400+Jnewbon@users.noreply.github.com>
+Date: Tue, 14 Jul 2020 13:14:40 +0100
+Subject: [PATCH] Merge pull request from GHSA-chfm-333q-gfpp
+
+Attempts to fis DoS to servers with less then 4GB memory
+
+CVE: CVE-2020-15117
+Upstream-Status: Backport [https://github.com/deskflow/deskflow/commit/0a97c2be0da2d0df25cb86dfd642429e7a8bea39]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/synergy/ProtocolUtil.cpp | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/synergy/ProtocolUtil.cpp b/src/lib/synergy/ProtocolUtil.cpp
+index d9f5dc324..7d2c37ff8 100644
+--- a/src/lib/synergy/ProtocolUtil.cpp
++++ b/src/lib/synergy/ProtocolUtil.cpp
+@@ -61,6 +61,9 @@ ProtocolUtil::readf(synergy::IStream* stream, const char* fmt, ...)
+     catch (XIO&) {
+         result = false;
+     }
++    catch (std::bad_alloc & exception) {
++        result = false;
++    }
+     va_end(args);
+     return result;
+ }
+@@ -216,7 +219,15 @@ ProtocolUtil::vreadf(synergy::IStream* stream, const char* fmt, va_list args)
+                 // allocate a buffer to read the data
+                 UInt8* sBuffer = buffer;
+                 if (!useFixed) {
+-                    sBuffer = new UInt8[len];
++                    try{
++                        sBuffer = new UInt8[len];
++                    }
++                    catch (std::bad_alloc & exception) {
++                        // Added try catch due to GHSA-chfm-333q-gfpp
++                        LOG((CLOG_ERR "ALLOC: Unable to allocate memory %d bytes", len));
++                        LOG((CLOG_DEBUG "bad_alloc detected: Do you have enough free memory?"));
++                        throw exception;
++                    }
+                 }
+ 
+                 // read the data
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index fb767942fe..2717320886 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
+SRC_URI += "file://CVE-2020-15117.patch"
 
 # Version 1.10.1-stable
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"
-- 
2.30.2


