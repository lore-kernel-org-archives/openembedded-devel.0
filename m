Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00C597F5A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 16:06:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9BG6wFS013764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 09:06:59 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 11 Oct 2019 09:06:58 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Oct 2019 12:06:57 -0400
Message-ID: <20191011160657.16240-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH] rsyslog: fix CVE-2019-17040
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
X-List-Received-Date: Fri, 11 Oct 2019 16:06:58 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport CVE-2019-17040 fix to zeus.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../rsyslog/0001-Out-of-bounds-issue.patch    | 31 +++++++++++++++++++
 .../rsyslog/rsyslog_8.1908.0.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
new file mode 100644
index 000000000..b494ca687
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
@@ -0,0 +1,31 @@
+From b0894088b680666035a3418326e13bc99d4fed49 Mon Sep 17 00:00:00 2001
+From: Philippe Duveau <pduveau@users.noreply.github.com>
+Date: Tue, 24 Sep 2019 20:45:25 +0200
+Subject: [PATCH] Out of bounds issue
+
+Add a new sanity check after determining the level len.
+---
+ contrib/pmdb2diag/pmdb2diag.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/b0894088b6]
+CVE: CVE-2019-17040
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+diff --git a/contrib/pmdb2diag/pmdb2diag.c b/contrib/pmdb2diag/pmdb2diag.c
+index 2b5916301..5810eb4df 100644
+--- a/contrib/pmdb2diag/pmdb2diag.c
++++ b/contrib/pmdb2diag/pmdb2diag.c
+@@ -134,6 +134,10 @@ CODESTARTparse2
+ 		ABORT_FINALIZE(0);
+ 	}
+ 
++	/* let recheck with the real level len */
++	if(pMsg->iLenRawMsg - (int)pMsg->offAfterPRI < pInst->levelpos+lvl_len)
++		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
++
+ 	DBGPRINTF("db2parse Level %d\n", pMsg->iSeverity);
+ 
+ 	end = (char*)pMsg->pszRawMsg + pMsg->iLenRawMsg ;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
index bbb4b119a..bd0dbc1a2 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
+           file://0001-Out-of-bounds-issue.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.18.1


