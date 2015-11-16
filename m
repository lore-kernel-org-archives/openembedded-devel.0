Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4417665F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 12:27:24 +0000 (UTC)
Received: by qkda6 with SMTP id a6so35505978qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 04:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=0IoT8JEdMoWOdRo7F5KYFqAHWVC3OPOCvkekJjQSheg=;
	b=O7mnMHMQn6xGfT+b6pFLo00MFEIfvZUpWpy77W/QLpQkxD4+fAKqKavTDvGu52Z7HO
	cuCKTHyS+kcVI32yimb87NAsKTbVcwOfIFkjujeOtxcWbUxFnkgZu84QRHzU8SuPznLZ
	05lCJh+Tfdf+29CXA7CDf3XfNUn6zQELPrbr4T3fN2hodvMQ527l/qIf1FiMV4edzIdw
	HqlJQ9ucVfp4aOALlbW/NWe3DlLgmulxx8CC6bJSnQvVEVkAgaxPYnp7pcOTk+rIf37e
	iBvMDdqc6SqTwPW00ASrxjKxCsqBabiL9brJITyoHULTjVbRu/w7RBij7yMETLXKc685
	14iQ==
X-Received: by 10.140.92.85 with SMTP id a79mr35602085qge.105.1447676844802;
	Mon, 16 Nov 2015 04:27:24 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	q185sm8580854qha.28.2015.11.16.04.27.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 04:27:24 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 10:27:19 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Nov 2015 10:27:10 -0200
Message-Id: <1447676831-2933-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447676831-2933-1-git-send-email-otavio@ossystems.com.br>
References: <1447676831-2933-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] mozilla: Remove unused variables
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
X-List-Received-Date: Mon, 16 Nov 2015 12:27:26 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

Change configure, compile and install functions

Mozilla build system has changed compared to old Firefox version 10.
For more information about new mozilla build system see
https://developer.mozilla.org/en-US/Firefox

Remove unused variables.

Add SHELL to EXTRA_OEMAKE. Mozilla build system needs pass explicitly
SHELL variable.

Configure variables needed by mozconfig work properly.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 classes/mozilla.bbclass | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/classes/mozilla.bbclass b/classes/mozilla.bbclass
index 940f381..a71c0e1 100644
--- a/classes/mozilla.bbclass
+++ b/classes/mozilla.bbclass
@@ -6,13 +6,21 @@ SRC_URI += "file://mozconfig"
 
 inherit gettext pkgconfig
 
+EXTRA_OEMAKE += "SHELL=/bin/sh"
 EXTRA_OECONF = "--target=${TARGET_SYS} --host=${BUILD_SYS} \
                 --build=${BUILD_SYS} --prefix=${prefix} --disable-elf-hack"
 SELECTED_OPTIMIZATION = "-Os -fsigned-char -fno-strict-aliasing"
 
 export CROSS_COMPILE = "1"
+
 export MOZCONFIG = "${WORKDIR}/mozconfig"
-export MOZ_OBJDIR = "${WORKDIR}/obj-${TARGET_SYS}"
+export OBJDIR = "${S}/firefox-build-dir"
+export MOZ_OBJDIR = "${S}/firefox-build-dir"
+export FOUND_MOZCONFIG = "${WORKDIR}/mozconfig"
+
+export TARGET_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
 
 export CONFIGURE_ARGS = "${EXTRA_OECONF}"
 export HOST_CC = "${BUILD_CC}"
@@ -22,49 +30,22 @@ export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
 export HOST_LDFLAGS = "${BUILD_LDFLAGS}"
 export HOST_RANLIB = "${BUILD_RANLIB}"
 export HOST_AR = "${BUILD_AR}"
-# Set the host libIDL stuff correctly.
-export HOST_LIBIDL_CONFIG="PKG_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
-# Due to sysroot we need to sed out references to the target staging
-# when building the native version of xpidl Symptons of the failure
-# include "gthread.h:344: error: size of array 'type name' is negative"
-export HOST_LIBIDL_CFLAGS="`${HOST_LIBIDL_CONFIG} --cflags | sed -e s:${STAGING_DIR_TARGET}::g`"
-export HOST_LIBIDL_LIBS="`${HOST_LIBIDL_CONFIG} --libs`"
-
 
 mozilla_do_configure() {
-	(
-		set -e
-		for cg in `find ${S} -name config.guess`; do
-			install -m 0755 \
-			${STAGING_DATADIR_NATIVE}/gnu-config/config.guess \
-			${STAGING_DATADIR_NATIVE}/gnu-config/config.sub \
-			`dirname $cg`/
-		done
-	)
-
 	# Put PARALLEL_MAKE into mozconfig
 	if [ ! -z "${PARALLEL_MAKE}" ] ; then
 		echo mk_add_options MOZ_MAKE_FLAGS=\"${PARALLEL_MAKE}\" \
 			>> ${MOZCONFIG}
 	fi
-
-	if [ -e ${MOZ_OBJDIR}/Makefile ] ; then
-		oe_runmake -f client.mk ${MOZ_OBJDIR}/Makefile \
-					${MOZ_OBJDIR}/config.status
-	fi
-
-	sed -i -e 's,@prefix@,${prefix},g' \
-	       -e 's,@STAGING_INCDIR@,${STAGING_INCDIR},g' \
-	       -e 's,@STAGING_DIR_TARGET@,${STAGING_DIR_TARGET},g' \
-	       ${MOZCONFIG}
+	oe_runmake -f client.mk -s configure
 }
 
 mozilla_do_compile() {
-	oe_runmake -f client.mk build_all
+	oe_runmake -f client.mk build
 }
 
 mozilla_do_install() {
-	oe_runmake DESTDIR="${D}" destdir="${D}" install
+	oe_runmake -f client.mk install INSTALL_SDK= DESTDIR="${D}"
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.6.2


