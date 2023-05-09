Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50186C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:55:51 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.26436.1683618941683671034
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=ZIPxpw1V;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683618941; x=1715154941;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mfLggCkkk681nSVIJlplOKKSUfsXjyISyExBVVnRoMA=;
  b=ZIPxpw1VXZu+PFEkpb+uhmyLwT46mHjD1fOr0yiWoTNWOXh1+h38Im1E
   P/l3TtL+YdIpVOf5Pzc5EwgmY7w2lp8IhFil4ks+PpC4ij2wlKSrYLepw
   tW4l2Ig/xlY1r4P9MA2D/cTQ9YfDBv8BzhMHCMhEUcLBEevZGrBwG/tP9
   PJimo3iocUCYEx0iFMw+SUNwiWAr5W/0EFH30GVXkeobFjMQ8/fBQ18jV
   tCRNG3TeOXcOIhOqZNlJ7uSEaxLUwCu0m5YWFNtF9ydup7hfw5973l7n/
   TwE2g+VXTxyWSi+zz5c0orIR7ypnK7oIVDTuk+cusurJcl0v6qhRRGsqF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="352894193"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="352894193"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 00:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731580469"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="731580469"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 09 May 2023 00:53:55 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone] tinyproxy: fix CVE-2022-40468
Date: Tue,  9 May 2023 15:42:17 +0800
Message-Id: <20230509074217.3874975-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102492

From: Chee Yang Lee <chee.yang.lee@intel.com>

(cherry-picked from 795ccdd86cad05c425adae15af27797f42f33c56)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.0.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
new file mode 100644
index 0000000000..4e2157ca75
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
@@ -0,0 +1,33 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7
+Upstream-Status: Backport
+CVE: CVE-2022-40468
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
index 388f7aecbb..4ddb202268 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2022-40468.patch \
            "
 
 SRC_URI[md5sum] = "658db5558ffb849414341b756a546a99"
-- 
2.37.3


