Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 322A87CFE9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 20:41:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8LKfiQR005408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 13:41:45 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 21 Sep 2019 13:41:44 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 21 Sep 2019 16:41:43 -0400
Message-ID: <20190921204143.31098-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] rsyslog: update from 8.1907.0 to 8.1908.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Sep 2019 20:41:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Enable imfile-tests even if they take a while.

ptest results for qemux86-64 with kvm and a timeout
of 1000 seconds to allow stress tests to complete:

Recipe           | Passed      | Failed   | Skipped   | Time(s)
rsyslog-8.1907.0 | 365         | 4        | 2         | 2452
rsyslog-8.1908.0 | 379         | 4        | 2         | 2538

The failed tests for both 8.1907 and 8.1908 are:
  FAIL: Test ./omfile-read-only-errmsg.sh (took 2 seconds)
  FAIL: Test ./omfile-read-only.sh (took 2 seconds)
  FAIL: Test ./privdropuser.sh (took 580 seconds)
  FAIL: Test ./privdropuserid.sh (took 580 seconds)
They are not fixed in this update.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.1907.0.bb => rsyslog_8.1908.0.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1907.0.bb => rsyslog_8.1908.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
index 4092833fc..bbb4b119a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "97682af2b1d87f903458cfb41725fba6"
-SRC_URI[sha256sum] = "eb27535ece93174ef6b551c88467d2c9cd826b62479625bb881a53d50b079fb5"
+SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
+SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -38,6 +38,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
+EXTRA_OECONF += "--enable-imfile-tests"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.22.0


