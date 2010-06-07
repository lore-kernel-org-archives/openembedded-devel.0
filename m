Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OLi8w-0002Cz-7X
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 21:37:58 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OLi4j-0005T3-8T from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 12:33:33 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 7 Jun 2010 12:33:33 -0700
Received: from [172.30.80.218] ([172.30.80.218]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 13:33:31 -0600
Message-ID: <4C0D498A.4030709@mentor.com>
Date: Mon, 07 Jun 2010 12:33:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 07 Jun 2010 19:33:31.0970 (UTC)
	FILETIME=[5016BA20:01CB0678]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, RFC] Add linux-libc-headers-native, make it default dep for native
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
X-List-Received-Date: Mon, 07 Jun 2010 19:37:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On some host distributions the provided linux kernel headers are too old
to compile utilities we need[1].  Given that we need these utilities to
run things on the target the best solution is to provide
linux-libc-headers-native.  Rather than get things into an inconsistent
state, we make linux-libc-headers-native be a default dependency.

[1]: A prime example of this would be mtd-utils-native and UBI

diff --git a/classes/base.bbclass b/classes/base.bbclass
index e0f9184..e26a45e 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -75,6 +75,12 @@ def base_dep_prepend(d):
  		if (bb.data.getVar('HOST_SYS', d, 1) !=
  	     	    bb.data.getVar('BUILD_SYS', d, 1)):
  			deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
+		elif bb.data.inherits_class('native', d) and \
+				bb.data.getVar('PN', d, True) not in \
+				("linux-libc-headers-native", "quilt-native",
+				 "unifdef-native", "shasum-native",
+				 "stagemanager-native", "coreutils-native"):
+			deps += " linux-libc-headers-native"
  	return deps

  DEPENDS_prepend="${@base_dep_prepend(d)} "
diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc
b/recipes/linux-libc-headers/linux-libc-headers.inc
index 0487e65..0b0d05a 100644
--- a/recipes/linux-libc-headers/linux-libc-headers.inc
+++ b/recipes/linux-libc-headers/linux-libc-headers.inc
@@ -1,7 +1,8 @@
  DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's
use."
  SECTION = "devel"
  LICENSE = "GPL"
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"

  RDEPENDS_${PN}-dev = ""
  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
-
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
index b66e768..0a1159a 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
@@ -1,6 +1,7 @@
  require linux-libc-headers.inc

  INHIBIT_DEFAULT_DEPS = "1"
+NATIVE_INSTALL_WORKS = "0"
  PR = "r4"
  # NOTE: no need to package these headers, since the c library includes
them.
  PACKAGES = ""
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
index 4893cab..6cbd8ba 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
@@ -1,5 +1,6 @@
  require linux-libc-headers.inc

+NATIVE_INSTALL_WORKS = "0"
  HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
  # license note from the package:
  #   Linux-libc-headers are derived from linux kernel headers. For
license of a

-- 
Tom Rini
Mentor Graphics Corporation



