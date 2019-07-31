Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDD577F462
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 13:23:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6VDNgMt014250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:23:42 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 31 Jul 2019 06:23:41 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2019 09:23:40 -0400
Message-ID: <20190731132340.9235-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: update from 8.1903.0 to 8.1907.0
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
X-List-Received-Date: Wed, 31 Jul 2019 13:23:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.1903.0.bb => rsyslog_8.1907.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1903.0.bb => rsyslog_8.1907.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb
index f1a6e8535..4092833fc 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1907.0.bb
@@ -29,9 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "f0d454c79d4040e3f25fcd12f8f33fe2"
-SRC_URI[sha256sum] = "d0d23a493dcec64c7b6807a1bb8ee864ed0f3760c2ff3088008bb661d304056f"
-
+SRC_URI[md5sum] = "97682af2b1d87f903458cfb41725fba6"
+SRC_URI[sha256sum] = "eb27535ece93174ef6b551c88467d2c9cd826b62479625bb881a53d50b079fb5"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.22.0


