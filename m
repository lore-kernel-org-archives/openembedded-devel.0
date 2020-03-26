Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.32773.1585211154146463033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ex/1RzQZboyMtN5fsH0vV7MGHf43n7QLPmwyk0l3BQnr00ck1vp2ULBovI+jmJWlIkqc7PgzYG
 e52rbJRGshZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:25:54 -0700
IronPort-SDR: M8uQkk4wK3zyD7dKpN6ylOtrZ2J89cmzuNh+9us4hQgU3KGCu3wC805asxgDdy1fMn2jcavDGt
 V5KbjTSgsQsg==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420611501"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:25:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus][meta-oe][PATCH] glog: fix do_fetch error
Date: Thu, 26 Mar 2020 16:25:39 +0800
Message-Id: <1585211139-14799-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4

From: Quanyang Wang <quanyang.wang@windriver.com>

This fixes the build error as below:
WARNING: glog-0.3.5-r0 do_fetch: Failed to fetch URL git://github.com/google/glog.git;branch=v035, attempting MIRRORS if available
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure: Unable to find revision a6a166db069520dbbd653c97c2e5b12e08a8bb26 in branch v035 even from upstream
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure for URL: 'git://github.com/google/glog.git;branch=v035'. Unable to fetch URL from any source.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fab032f70de330dc618b9419a42ec90d49253f9b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/glog/glog_0.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 3de01ef..70eef72 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 DEPENDS = "libunwind"
 
 SRC_URI = " \
-    git://github.com/google/glog.git;branch=v035 \
+    git://github.com/google/glog.git;nobranch=1 \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
     file://0002-Find-Libunwind-during-configure.patch \
     file://0003-installation-path-fix.patch \
-- 
2.7.4

