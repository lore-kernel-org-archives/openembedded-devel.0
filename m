Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED375C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:17 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.454.1649192425186502950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 14:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=c1NbRTem;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649192425;
  x=1680728425;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bJehmaaSXkt37/uB2LBU7Je0hC3nubQtq3Xad3yYjXQ=;
  b=c1NbRTemPxdEytojcV0alu8tMGvhYYrS24zn5qLzsBF46/TLYj5RFhkZ
   jS5ZToASYcbC525XSUYyn378M1UZj5a2xaVITcd7+FYNl18m3ALim03K1
   1B7/Lg6niqh27nS+LDgbkK8qGPB2DXASFjHmWEKZN8FR3ZijzBPNXJz55
   nsOGbezm25R9Jv2Qg7n1ULc55b0buqM4uxbSaDpmEAcHyflTOdqFExeYZ
   /N+kbpBbFlkOq5JTVrFr6zESKt50KuSaVmpmUGDgtgmuUBGHd3+xl5hbO
   hin2ZdjxwZuEmIPbikvEND+g1FuFx982vfoWCv6FIuNHVuJAaTgg3NK1c
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [honister][meta-networking][PATCH] net-snmp: Avoid running `make
 clean` as it may fail
Date: Tue, 5 Apr 2022 23:00:20 +0200
Message-ID: <20220405210020.20184-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96435

Rebuilding net-snmp may cause autotools_preconfigure() to run `make
clean`, which in turn can cause `configure`to be run. However, since
CACHED_CONFIGUREVARS is not set under those circumstances, `configure`
will run with an incorrect configuration and the build will fail with:

  checking for /etc/printcap... configure: error: cannot check for
  file existence when cross compiling

Avoid the problem by setting CLEANBROKEN = "1".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index e5a28de40..eb60750e2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -40,6 +40,7 @@ EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${B
 
 PARALLEL_MAKE = ""
 CCACHE = ""
+CLEANBROKEN = "1"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 

