Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D894C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:22:21 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6831.1642166539445286407
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Pij/VyuH;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642166540;
  x=1673702540;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1MNODiZATf6kp8BR0JOCisTgA3+TBxyQMUXOmYQgAAA=;
  b=Pij/VyuHe+Uh+UJBHQDIlabT3++M/Q+oS/wNN16Pyh/GC2TNPnc/RXiS
   T1jSelPKZPE3v8oSt7JUZekFT23IU6Cg2PfOwMYDLFGyjYkECCMStOzfJ
   VVsFj4BM6clHRqdj733V4c9IhE010uyLoH2zOB2FOd/UMg4RxxwEHaMRE
   H41nKKRJwO/Gkb0i8neGm8I6r3D+CQ06VXMbKmLUS1cxAdEFcz55Gjz+w
   ZAZcKbxhiNotSzXF+Liy5sQVi7OljC1yjW8fl7CfR+hcIzOZQZagWQXJa
   tbk0JYGEJ7Gtn81IeP/7Mp8mFfHDStykioGetDOyg81Kn94+VxZKVR6WK
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] nodejs: Drop workaround for a Python 2
 dependency
Date: Fri, 14 Jan 2022 14:22:13 +0100
Message-ID: <20220114132215.31442-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:22:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94830

The gyp samples directory was removed in version 15.0.0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index c8d942538..f31648082 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -157,10 +157,6 @@ do_compile () {
 
 do_install () {
     oe_runmake install DESTDIR=${D}
-
-    # wasn't updated since 2009 and is the only thing requiring python2 in runtime
-    # ERROR: nodejs-12.14.1-r0 do_package_qa: QA Issue: /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples contained in package nodejs-npm requires /usr/bin/python, but no providers found in RDEPENDS:nodejs-npm? [file-rdeps]
-    rm -f ${D}${exec_prefix}/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
 }
 
 do_install:append:class-native() {

