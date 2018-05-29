Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A78C3747B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:20:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7KGrv032479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:20:37 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:20:34 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:47 +0800
Message-ID: <1527578277-26494-15-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 14/24] rsyslog: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:20:45 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
index 476540d..03f21c6 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
@@ -33,6 +33,9 @@ SRC_URI_append_libc-musl = " \
 SRC_URI[md5sum] = "3805617f65a4b4bea34606487a5255a0"
 SRC_URI[sha256sum] = "220ba30b5afb0f3ddb328613fea7aa3966b01e4d0c52d6de9ab27b0858f19738"
 
+UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
-- 
2.7.4


