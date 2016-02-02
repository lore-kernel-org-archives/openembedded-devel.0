Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 0F4AB77208
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:48:02 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Tue, 2 Feb 2016
	14:47:59 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id AA1E628BA24;
	Tue,  2 Feb 2016 14:47:59 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Feb 2016 14:47:58 +0100
Message-ID: <1454420878-29968-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454420878-29968-1-git-send-email-tudor.florea@enea.com>
References: <1454420878-29968-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/2] [meta-oe] rsyslog: add tls related tests
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
X-List-Received-Date: Tue, 02 Feb 2016 13:48:04 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../rsyslog/rsyslog/enable_tls_ptests.patch        | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch
new file mode 100644
index 0000000..c858f32
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/enable_tls_ptests.patch
@@ -0,0 +1,28 @@
+Enable tls ptest
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+--- rsyslog-7.4.4/tests/Makefile.am.orig	2013-08-30 18:30:41.000000000 +0200
++++ rsyslog-7.4.4/tests/Makefile.am	2015-10-01 09:38:45.176289031 +0200
+@@ -118,15 +118,13 @@
+ endif
+ 
+ if ENABLE_GNUTLS
+-# TODO: re-enable in newer version
+-#TESTS +=  \
+-	#sndrcv_tls_anon.sh \
+-	#sndrcv_tls_anon_rebind.sh \
+-	#imtcp-tls-basic.sh
++TESTS +=  \
++	 imtcp-tls-basic.sh \
++	 imtcp_conndrop_tls.sh
+ if HAVE_VALGRIND
+ TESTS += imtcp-tls-basic-vg.sh \
+-	 imtcp_conndrop_tls-vg.sh 
+-	 manytcp-too-few-tls-vg.sh 
++	 imtcp_conndrop_tls-vg.sh \
++	 manytcp-too-few-tls.sh
+ endif
+ endif
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index 928434e..0f6b6cf 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://json-0.12-fix.patch \
            file://replace_deprecated_GnuTLS_functions.patch \
            file://use_gnutls_certificate_type_set_priority_only_if_available.patch \
+           file://enable_tls_ptests.patch \
 "
 
 SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
-- 
1.9.1


