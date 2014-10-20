Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5BEE6AC20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9K6hHaX017230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 23:43:18 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 19 Oct 2014 23:43:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 02:43:15 -0400
Message-ID: <1413787395-12866-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] net-snmp: add ac_cv_header_valgrind_* to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Mon, 20 Oct 2014 06:43:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There have been occasions that net-snmp sees valgrind and then later it's
not available, adding this setting ensures determinism by disabling it by
default

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index eb97748..9012615 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -35,6 +35,11 @@ EXTRA_OECONF = "--disable-embedded-perl \
                 --with-defaults \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 
+CACHED_CONFIGUREVARS = " \
+    ac_cv_header_valgrind_valgrind_h=no \
+    ac_cv_header_valgrind_memcheck_h=no \
+"
+
 do_configure_prepend() {
     export PERLPROG="${bindir}/env perl"
 }
-- 
2.0.0


