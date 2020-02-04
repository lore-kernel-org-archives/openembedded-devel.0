Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A88A4611FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 05:54:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0145rhe8032136
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Feb 2020 21:53:53 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 3 Feb 2020 21:53:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Feb 2020 21:53:20 -0800
Message-ID: <20200204055320.107588-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: disable ptest as it requires python2
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
X-List-Received-Date: Tue, 04 Feb 2020 05:54:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
index 29bba2d9a..b109e4dec 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
@@ -35,7 +35,9 @@ SRC_URI[sha256sum] = "e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f9
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools pkgconfig systemd update-rc.d ptest
+inherit autotools pkgconfig systemd update-rc.d
+# ptest is disabled for now because it requires python2, after upstream solves  this problem, re-enable it
+# inherit ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 EXTRA_OECONF += "--enable-imfile-tests"
-- 
2.21.0


