Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8662760043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 06:15:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0T6FciA015405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 22:15:38 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 28 Jan 2015 22:15:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Jan 2015 14:15:43 +0800
Message-ID: <1422512143-30506-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rsyslog: add packageconfig for imfile module
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 06:15:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* imfile: Text file input module, added as default

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index a9d9464..422def3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -38,7 +38,7 @@ EXTRA_OECONF += "--enable-cached-man-pages"
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
     zlib rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
-    imdiag gnutls \
+    imdiag gnutls imfile \
     ${@base_contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'ptest', 'testbench ${VALGRIND}', '', d)} \
@@ -58,6 +58,7 @@ PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
 # default no in configure
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[imdiag] = "--enable-imdiag,--disable-imdiag,,"
+PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
-- 
1.9.1


