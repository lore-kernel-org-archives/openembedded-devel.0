Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E96937F5BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 15:11:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9BFBnMi002162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:11:49 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 11 Oct 2019 08:11:48 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Oct 2019 11:11:48 -0400
Message-ID: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: upgrade from 8.1908.0 to 8.1910.0
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
X-List-Received-Date: Fri, 11 Oct 2019 15:11:50 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Upgrade to latest version for CVE-2019-17040 fix plus
other upstream bug fixes.

[GitHub Issue] -- https://github.com/rsyslog/rsyslog/pull/3875

CVE: CVE-2019-17040
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index bbb4b119a..f50f9a34b 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
-SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
+SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
+SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.18.1


