Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECE2606A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 23:41:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6JNfFc8012561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 16:41:15 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 16:41:14 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 16:41:14 -0700
Message-ID: <1468971674-18178-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] proftpd: fix PACKAGECONFIG settings
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
X-List-Received-Date: Tue, 19 Jul 2016 23:41:14 -0000
Content-Type: text/plain

When using '??=' to set a variable, '+=' will cause
the '??=' value to be discarded.  We change how PACKAGECONFIG
is defined.  We also do not make sia support a default
since it is not likely to be available.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index 2a36083..c9dffee 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -21,9 +21,10 @@ SRC_URI[sha256sum] = "a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67f
 
 inherit autotools-brokensep useradd update-rc.d systemd
 
-PACKAGECONFIG ??= "sia shadow"
-PACKAGECONFIG += " ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
-PACKAGECONFIG += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "shadow \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                  "
 
 PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
 PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl, openssl"
-- 
1.7.9.5


