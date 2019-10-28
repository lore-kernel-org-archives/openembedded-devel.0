Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B892A7FA3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 17:46:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9SHk7EC022954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 10:46:07 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 28 Oct 2019 10:46:07 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id 4A828C61144;
	Mon, 28 Oct 2019 10:46:07 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 10:46:05 -0700
Message-ID: <20191028174605.11112-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] rsyslog: upgrade from v8.1908.0 to v8.1910.0
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
X-List-Received-Date: Mon, 28 Oct 2019 17:46:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade rsyslog to latest version for various
fixes including the following CVEs:

CVE: CVE-2019-17040
CVE: CVE-2019-17041

Backported patches for those fixes were removed since
they are contained in v8.1910.0.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../rsyslog/0001-Out-of-bounds-issue.patch    | 31 -------------
 ...edfrom-bugfix-potential-misadressing.patch | 43 -------------------
 ...syslog_8.1908.0.bb => rsyslog_8.1910.0.bb} |  6 +--
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
deleted file mode 100644
index b494ca687..000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b0894088b680666035a3418326e13bc99d4fed49 Mon Sep 17 00:00:00 2001
-From: Philippe Duveau <pduveau@users.noreply.github.com>
-Date: Tue, 24 Sep 2019 20:45:25 +0200
-Subject: [PATCH] Out of bounds issue
-
-Add a new sanity check after determining the level len.
----
- contrib/pmdb2diag/pmdb2diag.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/b0894088b6]
-CVE: CVE-2019-17040
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-diff --git a/contrib/pmdb2diag/pmdb2diag.c b/contrib/pmdb2diag/pmdb2diag.c
-index 2b5916301..5810eb4df 100644
---- a/contrib/pmdb2diag/pmdb2diag.c
-+++ b/contrib/pmdb2diag/pmdb2diag.c
-@@ -134,6 +134,10 @@ CODESTARTparse2
- 		ABORT_FINALIZE(0);
- 	}
- 
-+	/* let recheck with the real level len */
-+	if(pMsg->iLenRawMsg - (int)pMsg->offAfterPRI < pInst->levelpos+lvl_len)
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+
- 	DBGPRINTF("db2parse Level %d\n", pMsg->iSeverity);
- 
- 	end = (char*)pMsg->pszRawMsg + pMsg->iLenRawMsg ;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
deleted file mode 100644
index 0b32766a5..000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 10549ba915556c557b22b3dac7e4cb73ad22d3d8 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Fri, 27 Sep 2019 13:36:02 +0200
-Subject: [PATCH] pmaixforwardedfrom bugfix: potential misadressing
-
----
- contrib/pmaixforwardedfrom/pmaixforwardedfrom.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/pull/3884]
-CVE: CVE-2019-17041
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-diff --git a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-index 37157c7d4..ebf12ebbe 100644
---- a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-+++ b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-@@ -109,6 +109,10 @@ CODESTARTparse
- 	/* bump the message portion up by skipLen(23 or 5) characters to overwrite the "Message forwarded from
- " or "From " with the hostname */
- 	lenMsg -=skipLen;
-+	if(lenMsg < 2) {
-+		dbgprintf("not a AIX message forwarded from message has nothing after header\n");
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+	}
- 	memmove(p2parse, p2parse + skipLen, lenMsg);
- 	*(p2parse + lenMsg) = '\n';
- 	*(p2parse + lenMsg + 1)  = '\0';
-@@ -120,6 +124,11 @@ really an AIX log, but has a similar preamble */
- 		--lenMsg;
- 		++p2parse;
- 	}
-+	if (lenMsg < 1) {
-+		dbgprintf("not a AIX message forwarded from message has nothing after colon "
-+			"or no colon at all\n");
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+	}
- 	if (lenMsg && *p2parse != ':') {
- 	DBGPRINTF("not a AIX message forwarded from mangled log but similar enough that the preamble has "
- 		"been removed\n");
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index f9e44421d..f50f9a34b 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -23,16 +23,14 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
-           file://0001-Out-of-bounds-issue.patch \
-           file://0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch \
 "
 
 SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
-SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
+SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
+SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.23.0


