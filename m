Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D385D7849B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 22:54:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7PMsOaW003403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 15:54:24 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 Aug 2017 15:54:23 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 15:54:23 -0700
Message-ID: <20170825225423.7248-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] enscript ndisc6: specify target location of perl
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
X-List-Received-Date: Fri, 25 Aug 2017 22:54:24 -0000
Content-Type: text/plain

configure finds the host perl, so we do not let it look
by setting PERL in the environment.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb | 5 +++++
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
index bea5e13..7771069 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
@@ -49,6 +49,11 @@ or IPv4."
 DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
 servers through slateless IPv6 autoconfiguration."
 
+# We do not run perl during the build, but only use it on the target.
+do_configure_prepend() {
+    export PERL="/usr/bin/perl"
+}
+
 do_install_append () {
     rm -rf ${D}${localstatedir}
     # Enable SUID bit for applications that need it
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 9612988..bf63ccf 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -19,4 +19,10 @@ inherit autotools gettext
 SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
 
+# We do not run perl during the build, but only use it on the target.
+do_configure_prepend() {
+    export PERL="/usr/bin/perl"
+}
+
 RDEPENDS_${PN} = "perl"
+
-- 
2.7.4


