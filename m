Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OMKDv-0002fO-Ky
	for Openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 14:17:38 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 2B769F8602;
	Wed,  9 Jun 2010 08:13:03 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 09 Jun 2010 08:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	s=smtpout; bh=UQbLpCsLiTxHuHZKqB0rlBnSiBA=;
	b=jaDkOTz+pMYCVSp8ur0StOt4o87cdVLYJuuVXUjQptcwMiSzTRiGYg54VNgx9y6QBArsPLGhTbKn4p8PKAA/JeNxfAL/RjgG9tJJ5gUzeYVT9UtdbO7rw8Yc+SiPpCNOSxZY0wLrCq2+6NR1gS58f3dHJeOe7kVbwmazRze/9U0=
X-Sasl-enc: q6HWVn79Fm+MWV4zh2RFxccgfRiNNmWvUns9J38qgUkD 1276085582
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d079fe3.pool.mediaWays.net [77.7.159.227])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4C0E41EFD9;
	Wed,  9 Jun 2010 08:13:02 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 14:13:59 +0200
Message-Id: <1276085639-26941-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
In-Reply-To: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH][STABLE] gcc-pacpake-cross.inc: Clean up do_install function massively (from Poky)
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
X-List-Received-Date: Wed, 09 Jun 2010 12:17:38 -0000

This fixes floating-point problems on machine n1200 and others caused by
installing softfloat libraries while the toolchain creates hardfloat
programs.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/gcc/gcc-package-cross.inc |   81 +++++++++++++-----------------------
 1 files changed, 29 insertions(+), 52 deletions(-)

diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 77da3fe..b205b8c 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -18,58 +18,35 @@ FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 
-	# Move libgcc_s into /lib
-        mkdir -p ${D}${target_base_libdir}
-        if [ -f ${D}${target_base_libdir}/libgcc_s.so.? ]; then
-                # Already in the right location
-                :
-        elif [ -f ${D}${prefix}/lib/libgcc_s.so.? ]; then
-                mv -f ${D}${prefix}/lib/libgcc_s.so* ${D}${target_base_libdir} || true
-
-        elif [  -f ${D}${prefix}/*/lib/nof/libgcc_s.so.? ]; then
-                mv -f ${D}${prefix}/*/lib/nof/libgcc_s.so* ${D}${target_base_libdir}
-        else
-                mv -f ${D}${prefix}/*/lib/libgcc_s.so* ${D}${target_base_libdir} || true 
-        fi
-
-
-
-	# Move libstdc++ and libg2c into libdir (resetting our prefix to /usr
-        mkdir -p ${D}${target_libdir}
-
-        if [ -f ${D}${prefix}/*/lib/nof/libstdc++.so ]; then
-
-           mv -f ${D}${prefix}/*/lib/nof/libstdc++.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libg2c.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libgfortran*.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/nof/libssp*.so* ${D}${target_libdir} || true 	
-
-        else
-           mv -f ${D}${prefix}/*/lib/libstdc++.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libg2c.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libgfortran*.so* ${D}${target_libdir} || true
-           mv -f ${D}${prefix}/*/lib/libssp*.so* ${D}${target_libdir} || true
-        fi
-
-
+	install -d ${D}${target_base_libdir}
+	install -d ${D}${target_libdir}
+
+	for d in ${TARGET_SYS}/lib/nof ${TARGET_SYS}/lib64 ${TARGET_SYS}/lib; do
+		if [ -d ${D}${prefix}/$d/ ]; then
+			mv -f ${D}${prefix}/$d/libgcc* ${D}${target_base_libdir} || true
+			mv -f ${D}${prefix}/$d/* ${D}${target_libdir} || true
+		fi
+	done
+
+	# Manually run the target stripper since we won't get it run by
+	# the packaging.
+	if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
+		${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.*
+		${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
+		${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
+		${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
+	fi
 
-       # Manually run the target stripper since we won't get it run by
-       # the packaging.
-       if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libstdc++.so.*
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
-               ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
-               ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
+	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
+	# gfortran is fully backwards compatible. This is a safe and practical solution.
+	if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
+		currdir="$PWD"
+		cd ${CROSS_DIR}/bin/
+		ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
+		if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then
+			cd ${CROSS_DIR}/${TARGET_SYS}/bin/
+			ln -sf gfortran g77 || true
+		fi
+		cd $currdir
 	fi
-     
-       # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
-       # gfortran is fully backwards compatible. This is a safe and practical solution.
-       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
-              currdir="$PWD"
-              cd ${CROSS_DIR}/bin/
-              ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
-              cd ${CROSS_DIR}/${TARGET_SYS}/bin/
-              ln -sf gfortran g77 || true
-              cd $currdir
-       fi
 }
-- 
1.7.1



