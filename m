Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7776731B9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 02:53:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8I2rr8T016959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 19:53:53 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 17 Sep 2016 19:53:52 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 18 Sep 2016 10:52:59 +0800
Message-ID: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] bash2dash conversion
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
X-List-Received-Date: Sun, 18 Sep 2016 02:53:54 -0000
Content-Type: text/plain

From: "Tim K. Chan" <nirvanatk@gmail.com>

Change bash style to dash style

Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
[Adjust context]
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb          | 2 +-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb                 | 6 ++++--
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb                    | 2 +-
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb             | 2 +-
 meta-oe/recipes-support/postgresql/postgresql.inc                   | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
index 03f6459..17a5c1e 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
@@ -103,7 +103,7 @@ pkg_postinst_${PN}() {
 
     if [ -e /etc/init.d/populate-volatile.sh ]; then
         /etc/init.d/populate-volatile.sh update
-    elif command -v systemd-tmpfiles >/dev/null; then
+    elif command -p systemd-tmpfiles >/dev/null; then
         systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
     fi
 }
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 3c3b4b5..2961b6b 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -33,7 +33,9 @@ do_configure() {
 }
 
 do_compile () {
-    . ${CONFIG_SITE}
+    for CONFIG_SITE_ITEM in $CONFIG_SITE; do
+    	. $CONFIG_SITE_ITEM
+    done
     if [ X"$ac_cv_uint" = X"yes" ]; then
         CFLAGS="${CFLAGS} -DHAVE_uint"
     fi
@@ -68,7 +70,7 @@ do_install () {
 
 pkg_postinst_${PN} () {
     if [ -z "$D" ]; then
-        if command -v systemd-tmpfiles >/dev/null; then
+        if command -p systemd-tmpfiles >/dev/null; then
             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/lmbench.conf
         elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
             ${sysconfdir}/init.d/populate-volatile.sh update
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 3a3886b..ba0e2ac 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -108,7 +108,7 @@ do_install_append() {
 
 pkg_postinst_${PN} () {
     if [ -z "$D" ]; then
-        if command -v systemd-tmpfiles >/dev/null; then
+        if command -p systemd-tmpfiles >/dev/null; then
             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/krb5.conf
         elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
             ${sysconfdir}/init.d/populate-volatile.sh update
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 84e465d..b1346b3 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -67,7 +67,7 @@ pkg_postinst_${PN} () {
 
     if [ x"$D" != "x" ]; then
         OPTS="--root=$D"
-        if type systemctl >/dev/null 2>/dev/null; then
+        if command -p systemctl >/dev/null 2>/dev/null; then
                 systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
         fi
         exit 1
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index e473f58..9592c79 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -179,7 +179,7 @@ do_install_append() {
 
     # install COPYRIGHT README HISTORY
     install -d -m 0755 ${D}${docdir}/${BPN}
-    for i in ${B}/{COPYRIGHT,README,HISTORY} ${B}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
+    for i in ${B}/COPYRIGHT ${B}/README ${B}/HISTORY ${B}/doc/KNOWN_BUGS ${B}/doc/MISSING_FEATURES ${B}/doc/README* ${B}/doc/bug.template; do
         [ -f $i ] && install $i ${D}${docdir}/${BPN}
     done
 
-- 
2.8.1


