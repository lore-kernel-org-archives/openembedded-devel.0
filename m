Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OefiY-0005h9-Ok
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 04:53:04 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Oefi9-0002Bx-Qn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:52:37 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 29 Jul 2010 19:52:37 -0700
Received: from [172.30.80.35] ([172.30.80.35]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Jul 2010 20:52:36 -0600
Message-ID: <4C523E6D.8040109@mentor.com>
Date: Thu, 29 Jul 2010 19:52:29 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 30 Jul 2010 02:52:36.0283 (UTC)
	FILETIME=[4400E0B0:01CB2F92]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v4] Make multi-machine toolchains to co-exist	(revised again)
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
X-List-Received-Date: Fri, 30 Jul 2010 02:53:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

As one of the folks who suggested something else, here's my take.

We modify the prefix for cross stuff to dump everything into
MULTIMACH_TARGET_SYS in the sysroot.

Pro: It should work for all the cases
Con: We're back to having a 'special' directory of cross stuff
Pro: It's separate but still valid for $ORIGIN mangling, which is the
other problem we had before.

I've got a qemuarm console-image and then beagleboard console-image 
build going now and that's going to take time.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index db86192..b3f74a2 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -44,9 +44,9 @@ target_base_libdir := "${base_libdir}"
  target_prefix := "${prefix}"

  # Overrides for paths
-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}"
  base_prefix = "${STAGING_DIR_NATIVE}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+exec_prefix =
"${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}"
  base_sbindir = "${base_prefix}/bin"
  sbindir = "${exec_prefix}/bin"

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d523519..23281fd 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -299,7 +299,7 @@ STAGING_DIR_JAVA = "${STAGING_DIR}/java"
  STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
  STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
  STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
-STAGING_BINDIR_CROSS  =
"${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
+STAGING_BINDIR_CROSS  =
"${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}${base_bindir_native}"
  STAGING_BINDIR_CROSS_BASEPKG =
"${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
  STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
  STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"


-- 
Tom Rini
Mentor Graphics Corporation



