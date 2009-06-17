Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MH1BW-0005k0-Ek
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:52:38 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MH11L-000GRZ-Cu; Wed, 17 Jun 2009 23:42:08 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 23:41:58 +0400
Message-Id: <1245267720-13612-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8770 [Jun 17 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: [PATCH 1/3] Make package_update_index_ipk proper task with locking
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
X-List-Received-Date: Wed, 17 Jun 2009 19:52:38 -0000

Parallel image builds race in package_update_index_ipk, so locking is
needed and for a proper lock package_update_index_ipk needs to be a
proper task.
---
 classes/package_ipk.bbclass    |    9 ++++++++-
 classes/rootfs_ipk.bbclass     |    4 +---
 recipes/meta/canadian-sdk.bb   |    3 +--
 recipes/meta/meta-toolchain.bb |    3 +--
 recipes/meta/package-index.bb  |    6 +-----
 5 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index d4cb3b6..1f1b5c9 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -67,10 +67,16 @@ python package_ipk_install () {
 		raise bb.build.FuncFailed
 }
 
+do_package_update_index_ipk[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
+do_package_update_index_ipk[nostamp] = "1"
+do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
+do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
+do_package_update_index_ipk[depends] += "ipkg-utils-native:do_populate_staging"
+
 #
 # Update the Packages index files in ${DEPLOY_DIR_IPK}
 #
-package_update_index_ipk () {
+do_package_update_index_ipk () {
 	set -x
 
 	ipkgarchs="${PACKAGE_ARCHS}"
@@ -322,3 +328,4 @@ python do_package_write_ipk () {
 }
 do_package_write_ipk[dirs] = "${D}"
 addtask package_write_ipk before do_package_write after do_package
+addtask package_update_index_ipk before do_rootfs
diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 99a8ed2..16dd511 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -5,8 +5,7 @@
 # See image.bbclass for a usage of this.
 #
 
-do_rootfs[depends] += "opkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
-do_rootfs[recrdeptask] += "do_package_write_ipk"
+do_rootfs[depends] += "opkg-native:do_populate_staging"
 
 IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
 
@@ -29,7 +28,6 @@ PACKAGE_INSTALL_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "non
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
 
-	package_update_index_ipk
 	package_generate_ipkg_conf
 
 	mkdir -p ${T}
diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 809173b..86b645b 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -56,7 +56,6 @@ do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
 
-	package_update_index_ipk
 	package_generate_ipkg_conf
 
 	for arch in ${PACKAGE_ARCHS}; do
@@ -170,5 +169,5 @@ do_populate_sdk() {
 }
 
 do_populate_sdk[nostamp] = "1"
-do_populate_sdk[recrdeptask] = "do_package_write"
+addtask package_update_index_ipk before do_populate_sdk
 addtask populate_sdk before do_build after do_install
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index b641be1..b8ed801 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -56,7 +56,6 @@ do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
 
-	package_update_index_ipk
 	package_generate_ipkg_conf
 
 	for arch in ${PACKAGE_ARCHS}; do
@@ -170,5 +169,5 @@ do_populate_sdk() {
 }
 
 do_populate_sdk[nostamp] = "1"
-do_populate_sdk[recrdeptask] = "do_package_write"
+addtask package_update_index_ipk before do_populate_sdk
 addtask populate_sdk before do_build after do_install
diff --git a/recipes/meta/package-index.bb b/recipes/meta/package-index.bb
index f52fb6c..ce8b999 100644
--- a/recipes/meta/package-index.bb
+++ b/recipes/meta/package-index.bb
@@ -23,8 +23,4 @@ do_stage() {
 
 do_build[nostamp] = "1"
 do_build[dirs] = "${DEPLOY_DIR_IPK}"
-do_build() {
-	set -ex
-	package_update_index_ipk
-	set +ex
-}
+addtask package_update_index_ipk before do_build
-- 
1.6.3.1



