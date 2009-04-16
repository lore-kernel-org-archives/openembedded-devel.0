Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LuVJN-0002pp-PR
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 19:23:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 57E2D140971A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 19:21:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6vCrNcmArsP
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 19:21:32 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 39D361417196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 19:21:32 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 19:19:45 +0200
Message-Id: <1239902385.21612.216.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [CLASSES][PATCH] fully support ${datadir}/pkgconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2009 17:23:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

${datadir}/pkgconfig is a legal pkg-config directory for arch
independent stuff. Only half of its support is done in global stuff (it
is in PKG_CONFIG_PATH). Attached patch makes its support complete:

- Adding ${datadir}/pkgconfig/*.pc to the default -dev package pattern.

- AUTOTOOLS_STAGE_PKGCONFIG knows about it.

Example of package fixed by this patch: iso-codes-dev

Signed-off-by: Stanislav Brabec <utx@penguin.cz>


diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 20f371a..e43b289 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -231,6 +231,10 @@ autotools_stage_all() {
 			echo "cp -f ${STAGE_TEMP}/${libdir}/pkgconfig/*.pc ${STAGING_LIBDIR}/pkgconfig/"
 			cp -f ${STAGE_TEMP}/${libdir}/pkgconfig/*.pc ${STAGING_LIBDIR}/pkgconfig/
 		fi
+		if [ -e ${STAGE_TEMP}/${datadir}/pkgconfig/ ] ; then
+			echo "cp -f ${STAGE_TEMP}/${datadir}/pkgconfig/*.pc ${STAGING_DATADIR}/pkgconfig/"
+			cp -f ${STAGE_TEMP}/${datadir}/pkgconfig/*.pc ${STAGING_DATADIR}/pkgconfig/
+		fi
 	fi
 	rm -rf ${STAGE_TEMP}/${mandir} || true
 	rm -rf ${STAGE_TEMP}/${infodir} || true
diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index 068eac4..cd6bdf2 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -19,6 +19,7 @@ FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${libdir}/${PYTHON_DIR}/site-packages/*.la \
+  ${datadir}/pkgconfig \
 "
 FILES_${PN}-dbg = "\
   ${libdir}/${PYTHON_DIR}/site-packages/.debug \
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f31e56d..2e6d38a 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -221,7 +221,7 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
 SECTION_${PN}-doc = "doc"
 
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
+                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                 ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



