Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OKgwC-0007im-Ai
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 02:08:34 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OKgs1-0005FM-MI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 17:04:13 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 4 Jun 2010 17:04:06 -0700
Received: from [172.30.80.93] ([172.30.80.93]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Jun 2010 18:04:05 -0600
Message-ID: <4C09946F.9040401@mentor.com>
Date: Fri, 04 Jun 2010 17:03:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 05 Jun 2010 00:04:05.0210 (UTC)
	FILETIME=[9C9D53A0:01CB0442]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add locking on tasks that add package_update_index_ipk
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
X-List-Received-Date: Sat, 05 Jun 2010 00:08:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

We add a lockfile of do_populate_sdk and do_rootfs (in rootfs_ipk) that 
is also the lockfile that package_update_index_ipk uses.  With enough 
threads it is possible that one image (or meta-toolchain) is attempting 
to use the package index while another has only reached the point of 
generating the index leading to an empty index being seen later on.

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 9fa1d5e..0303c54 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -6,6 +6,7 @@
  #

  do_rootfs[depends] += "opkg-native:do_populate_sysroot"
+do_rootfs[lockfiles] = "${DEPLOY_DIR_IPK}.lock"

  IPKG_TMP_DIR = "${IMAGE_ROOTFS}-tmp"
  IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t 
${IPKG_TMP_DIR} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", 
"-nodeps", "", d)}"
diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 47529a2..2160441 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -169,5 +169,6 @@ do_populate_sdk() {
  }

  do_populate_sdk[nostamp] = "1"
+do_populate_sdk[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
  addtask package_update_index_ipk before do_populate_sdk
  addtask populate_sdk before do_build after do_install
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 064fc3b..82918ad 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -177,5 +177,6 @@ do_populate_sdk() {
  }

  do_populate_sdk[nostamp] = "1"
+do_populate_sdk[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
  addtask package_update_index_ipk before do_populate_sdk
  addtask populate_sdk before do_build after do_install

-- 
Tom Rini
Mentor Graphics Corporation


