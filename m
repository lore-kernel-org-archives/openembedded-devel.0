Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 069F97F818
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 16:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 005GhB08030233
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jan 2020 08:43:22 -0800
Received: from fidler.wrs.com (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 5 Jan 2020 08:43:01 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jan 2020 11:42:58 -0500
Message-ID: <20200105164258.32759-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
References: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] rsyslog: update from 8.1910 to 8.1911
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
X-List-Received-Date: Sun, 05 Jan 2020 16:43:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ptest results for qemux86-64 with kvm and a timeout
of 1000 seconds to allow stress tests to complete:

Recipe           | Passed      | Failed   | Skipped
rsyslog-8.1908.0 | 379         | 4        | 2
rsyslog-8.1911.0 | 381         | 4        | 3

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.1910.0.bb => rsyslog_8.1911.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1910.0.bb => rsyslog_8.1911.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
index e8afae4ef..02ac03eae 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
-SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
+SRC_URI[md5sum] = "154e33feb587216f2955050a8301104c"
+SRC_URI[sha256sum] = "e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f91ee104"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.22.0


