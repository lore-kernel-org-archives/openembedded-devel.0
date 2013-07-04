Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id CC718607F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 12:49:15 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id i57so472204yha.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=9K1zZU7FBDo8G/STy4mbO27qw3kwBlWpT+N8r/CNQ+U=;
	b=GN1qvZu6DrXirJGCWP5PxVP96Y/BnCDHwg8AjyJNv/D37Yjws/sPZHudJcYNF3vVYH
	EywgUnRWhyuUaRUgdGgOvUhcKMDkErujxT5Vh75IcoqAVjOcVjHZlju2pRlgoXb+uEtH
	5INDsbXLx0S5JRSOhUiQiVVJ8uGosP+mpBzGNai2GnGpJzDPQSjPPvSmlREOs0O3+k48
	1+zc5qViiwdNatDLNmPCrKnXh+pLIvA0jp/8Ofg00OsfoLmDJRdqLDFVDlHN8ae3ZGq5
	/AA+lKIGBSYFIfQkZ2069XkHAWLURkMGwOAfpC9CJsRJNPXffMjNArRK167NByBwK4fC
	uEhQ==
X-Received: by 10.236.131.50 with SMTP id l38mr2894863yhi.149.1372942156462;
	Thu, 04 Jul 2013 05:49:16 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id j63sm4489695yhh.17.2013.07.04.05.49.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 05:49:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  4 Jul 2013 09:48:55 -0300
Message-Id: <1372942135-7083-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCHv2] lmbench: remove /run/lmbench from package
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
X-List-Received-Date: Thu, 04 Jul 2013 12:49:16 -0000

Create /run/lmbench on startup using populate-volatiles.sh and
tmpfiles.d for systemd.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 31a1109..d42d62c 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -37,9 +37,18 @@ do_compile () {
 }
 
 do_install () {
-    install -d ${D}${localstatedir}/run/lmbench \
+    install -d ${D}${sysconfdir}/default/volatiles \
            ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
            ${D}${datadir}/lmbench/scripts
+
+    echo "d root root 0755 ${localstatedir}/run/${BPN} none" \
+           > ${D}${sysconfdir}/default/volatiles/99_lmbench
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /run/${BPN} - - - -" \
+              > ${D}${sysconfdir}/tmpfiles.d/lmbench.conf
+    fi
+
     oe_runmake 'BASE=${D}${prefix}' \
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
@@ -52,5 +61,15 @@ do_install () {
     install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
 }
 
+pkg_postinst_${PN} () {
+    if [ -z "$D" ]; then
+        if command -v systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
+
 RDEPENDS_${PN} = "debianutils"
 FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench"
-- 
1.8.3.1


