Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF62C6067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:55:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6CLtgOG025165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:55:42 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 14:55:42 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jul 2016 14:55:41 -0700
Message-ID: <1468360541-1788-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][ 1/1] atftp: do not create user nobody
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
X-List-Received-Date: Tue, 12 Jul 2016 21:55:47 -0000
Content-Type: text/plain

The recipe for atftp inherits useradd.bbclass and
re-creates the user nobody as a "system" user.  This
is not correct and is in vain because this new definition
will not be created on the target.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-networking/recipes-daemons/atftp/atftp_git.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index 0ece58f..0556fe2 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code \
 "
 S = "${WORKDIR}/git"
 
-inherit autotools update-rc.d useradd systemd
+inherit autotools update-rc.d systemd
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[pcre] = "--enable-libpcre,--disable-libpcre,libpcre"
@@ -28,9 +28,6 @@ INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME_${PN}d = "atftpd"
 INITSCRIPT_PARAMS_${PN}d = "defaults 80"
 
-USERADD_PACKAGES = "${PN}d"
-USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \
-                        --user-group nobody"
 
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"
 
-- 
1.7.9.5


