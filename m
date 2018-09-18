Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEC57966B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:12:49 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id D8543220510;
	Tue, 18 Sep 2018 11:12:49 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 11:12:43 +0200
Message-Id: <20180918091244.3569-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] [oe-core] openssh: make OpenSSL optional
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
X-List-Received-Date: Tue, 18 Sep 2018 09:12:49 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Without OpenSSL, OpenSSH can still do ed25519, which is enough for
many users; and it saves a rather heavy dependency.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.8p1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
index f4b295f2df..6dfa2cfd2c 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
@@ -8,8 +8,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
-# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
-DEPENDS = "zlib openssl10"
+DEPENDS = "zlib"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
@@ -71,6 +70,10 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 # We don't want to depend on libblockfile
 CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
+PACKAGECONFIG ??= "openssl"
+# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
+PACKAGECONFIG[openssl] = ",--without-openssl,openssl10"
+
 do_configure_prepend () {
 	export LD="${CC}"
 	install -m 0644 ${WORKDIR}/sshd_config ${B}/
-- 
2.18.0


