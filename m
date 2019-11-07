Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE167F9F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:42:35 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 2E36CBE4811; Thu,  7 Nov 2019 21:42:34 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:42:33 +0100
Message-Id: <20191107204234.17053-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/2] autofs: set some paths for configure script
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
X-List-Received-Date: Thu, 07 Nov 2019 20:42:36 -0000

The configure script used by autofs tries to detect paths on the
build system. Avoid it by presetting fixed values.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
index aeadc9d5dd..4f61562731 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
@@ -47,13 +47,19 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
                 --enable-ignore-busy --with-openldap=no \
+                --with-confdir=${sysconfdir}/default \
+                --with-fifodir=/run \
+                --with-flagdir=/run \
                 --with-sasl=no --with-libtirpc \
+                --with-mapdir=${sysconfdir} \
                 --with-path=${STAGING_BINDIR_NATIVE} \
                 --with-fifodir=${localstatedir}/run \
                 --with-flagdir=${localstatedir}/run \
 "
 CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
                         ac_cv_path_RPCGEN=rpcgen \
+                        initdir=${INIT_D_DIR} \
+                        piddir=/run \
 "
 
 do_configure_prepend () {
-- 
2.17.1


