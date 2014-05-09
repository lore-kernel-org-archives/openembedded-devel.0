Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB1AD60703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 08:40:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s498ebhh024656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 May 2014 01:40:37 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 01:40:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 May 2014 16:40:35 +0800
Message-ID: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] net-snmp: Using the target perl
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
X-List-Received-Date: Fri, 09 May 2014 08:40:37 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Set the PERLPROG to target perl to avoid host contamination.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index d21995a..f6656ad 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -37,6 +37,10 @@ EXTRA_OECONF = "--disable-embedded-perl \
                 --with-defaults \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 
+do_configure_prepend() {
+    export PERLPROG="${bindir}/env perl"
+}
+
 do_install_append() {
     install -d ${D}${sysconfdir}/snmp
     install -d ${D}${sysconfdir}/init.d
-- 
1.7.10.4


