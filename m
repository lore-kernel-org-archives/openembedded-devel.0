Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1NwJZO-00036A-SP
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 20:20:19 +0200
Received: by ey-out-1920.google.com with SMTP id 26so905512eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8h/thJ0pa32rxsF63PGxS/j23mPNOA6E3Y/ytLFobz8=;
	b=OjyxH9N9dVHdvN1irJaXB6gbUuyh/nGs959HaoEswiG58fNxL4tjjLM6VRkMEUQ4YJ
	MQRD3hDZ9mfzOp0EGEXEjqt4Ulcem9BvNkXZ9f+xxFcGWf/fFjJusz36OCGCIwMUJxJx
	zKc/1D31e3UCH346m3Fo1ST1zzemB6ywgdTXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ABIET1pb0tOpuN1a/+hZxVnRTodD4iiFVt+6F6+xqO4yKQy+pVSoa90lGklgqKmgMD
	oueOnyPmvMYYmPY+QLLninZsFCJ3TN/181Z5FEa+XbT4MwUFzjrrTk4nMTDiBs0IYL+7
	+GBcl85j3VBiQFwP8uvHRhBIrxcFANjAF1i/E=
Received: by 10.213.37.195 with SMTP id y3mr537223ebd.72.1269886622773;
	Mon, 29 Mar 2010 11:17:02 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 16sm2462247ewy.7.2010.03.29.11.16.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Mar 2010 11:17:00 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 20:16:32 +0200
Message-Id: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] gcc-cross: fix gfortran -> g77 linking logic
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
X-List-Received-Date: Mon, 29 Mar 2010 18:20:20 -0000

From: Koen Kooi <koen@openembedded.org>

---
 recipes/gcc/gcc-configure-cross.inc |   13 +++++++++++++
 recipes/gcc/gcc-package-cross.inc   |   14 ++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-configure-cross.inc
index 1c37de8..7dde9de 100644
--- a/recipes/gcc/gcc-configure-cross.inc
+++ b/recipes/gcc/gcc-configure-cross.inc
@@ -51,5 +51,18 @@ do_stage_append () {
 		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libsupc++.la || true
 		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libstdc++.la || true
 	done
+
+    # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
+    # gfortran is fully backwards compatible. This is a safe and practical solution.
+    if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
+           currdir="$PWD"
+           cd ${CROSS_DIR}/bin/
+           ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
+           if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
+               cd ${CROSS_DIR}/${TARGET_SYS}/bin/
+               ln -sf gfortran g77 || true
+           fi
+           cd $currdir
+    fi
 }
 
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 6c4f9bb..0f91861 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -63,16 +63,18 @@ do_install () {
                ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
                ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
                ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
-	fi
+       fi
      
        # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
        # gfortran is fully backwards compatible. This is a safe and practical solution.
-       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
+       if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
               currdir="$PWD"
-              cd ${CROSS_DIR}/bin/
+              cd ${D}${CROSS_DIR}/bin/
               ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
-              cd ${CROSS_DIR}/${TARGET_SYS}/bin/
-              ln -sf gfortran g77 || true
+              if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
+                  cd ${CROSS_DIR}/${TARGET_SYS}/bin/
+                  ln -sf gfortran g77 || true
+              fi
               cd $currdir
-       fi
+        fi
 }
-- 
1.6.6.1



