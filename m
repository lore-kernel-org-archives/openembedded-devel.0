Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 703E97F400
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 18:45:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9FIjb5r010166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 11:45:37 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 15 Oct 2019 11:45:36 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id BE7F8C61093;
	Tue, 15 Oct 2019 11:45:36 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 11:45:32 -0700
Message-ID: <20191015184532.44068-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH] rsyslog: fix CVE-2019-17041
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
X-List-Received-Date: Tue, 15 Oct 2019 18:45:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport fix to zeus; master branch already has v8.1910.0

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...edfrom-bugfix-potential-misadressing.patch | 43 +++++++++++++++++++
 .../rsyslog/rsyslog_8.1908.0.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
new file mode 100644
index 000000000..0b32766a5
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
@@ -0,0 +1,43 @@
+From 10549ba915556c557b22b3dac7e4cb73ad22d3d8 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Fri, 27 Sep 2019 13:36:02 +0200
+Subject: [PATCH] pmaixforwardedfrom bugfix: potential misadressing
+
+---
+ contrib/pmaixforwardedfrom/pmaixforwardedfrom.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/pull/3884]
+CVE: CVE-2019-17041
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+diff --git a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
+index 37157c7d4..ebf12ebbe 100644
+--- a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
++++ b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
+@@ -109,6 +109,10 @@ CODESTARTparse
+ 	/* bump the message portion up by skipLen(23 or 5) characters to overwrite the "Message forwarded from
+ " or "From " with the hostname */
+ 	lenMsg -=skipLen;
++	if(lenMsg < 2) {
++		dbgprintf("not a AIX message forwarded from message has nothing after header\n");
++		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
++	}
+ 	memmove(p2parse, p2parse + skipLen, lenMsg);
+ 	*(p2parse + lenMsg) = '\n';
+ 	*(p2parse + lenMsg + 1)  = '\0';
+@@ -120,6 +124,11 @@ really an AIX log, but has a similar preamble */
+ 		--lenMsg;
+ 		++p2parse;
+ 	}
++	if (lenMsg < 1) {
++		dbgprintf("not a AIX message forwarded from message has nothing after colon "
++			"or no colon at all\n");
++		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
++	}
+ 	if (lenMsg && *p2parse != ':') {
+ 	DBGPRINTF("not a AIX message forwarded from mangled log but similar enough that the preamble has "
+ 		"been removed\n");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
index bd0dbc1a2..f9e44421d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-Out-of-bounds-issue.patch \
+           file://0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.23.0


