Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Oz8dm-0004u9-2U
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 15:48:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5D1F08ABD49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:43:10 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08624-04 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Sep 2010 09:43:10 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 3CC288AC4C8; Fri, 24 Sep 2010 09:43:10 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 7DF6E8ABD49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:43:07 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 87A655000E3; Fri, 24 Sep 2010 09:43:07 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 09:43:07 -0400
Message-Id: <1285335787-10383-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libvpx: fix 0.9.1 build when prefix=""
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
X-List-Received-Date: Fri, 24 Sep 2010 13:48:47 -0000

The configure script was changed in 0.9.1 and introduced some logic that
breaks when prefix is an empty string.

Also switch to INC_PR for 0.9.0 and 0.9.1.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../libvpx-configure-support-blank-prefix.patch    |   43 ++++++++++++++++++++
 recipes/webm/libvpx.inc                            |    2 +-
 recipes/webm/libvpx_0.9.0.bb                       |    2 +-
 recipes/webm/libvpx_0.9.1.bb                       |    9 ++++
 4 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 recipes/webm/libvpx-0.9.1/libvpx-configure-support-blank-prefix.patch

diff --git a/recipes/webm/libvpx-0.9.1/libvpx-configure-support-blank-prefix.patch b/recipes/webm/libvpx-0.9.1/libvpx-configure-support-blank-prefix.patch
new file mode 100644
index 0000000..1bf863d
--- /dev/null
+++ b/recipes/webm/libvpx-0.9.1/libvpx-configure-support-blank-prefix.patch
@@ -0,0 +1,43 @@
+Upstream: not yet
+
+Fix configure to accept "--prefix=" (a blank prefix).
+
+--- libvpx-0.9.1/build/make/configure.sh.orig	2010-06-17 09:08:56.000000000 -0400
++++ libvpx-0.9.1/build/make/configure.sh	2010-09-23 14:27:48.000000000 -0400
+@@ -444,6 +444,8 @@
+         ;;
+         --prefix=*)
+         prefix="${optval}"
++        # Distinguish between "prefix not set" and "prefix set to ''"
++        prefixset=1
+         ;;
+         --libdir=*)
+         libdir="${optval}"
+@@ -471,13 +473,23 @@
+ 
+ 
+ post_process_common_cmdline() {
+-    prefix="${prefix:-/usr/local}"
++    if [ "$prefixset" != "1" ]
++    then
++        prefix=/usr/local
++    fi
++
++    # Strip trailing slash
+     prefix="${prefix%/}"
++
+     libdir="${libdir:-${prefix}/lib}"
+     libdir="${libdir%/}"
+-    if [ "${libdir#${prefix}}" = "${libdir}" ]; then
+-        die "Libdir ${libdir} must be a subdirectory of ${prefix}"
+-    fi
++
++    case "$libdir" in
++        "${prefix}/"*) ;;
++        *)
++            die "Libdir ${libdir} must be a subdirectory of ${prefix}"
++            ;;
++    esac
+ }
+ 
+ 
diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
index a0aebff..d773d3a 100644
--- a/recipes/webm/libvpx.inc
+++ b/recipes/webm/libvpx.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-PR = "r1"
+INC_PR = "r4"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-${PV}.tar.bz2"
 
diff --git a/recipes/webm/libvpx_0.9.0.bb b/recipes/webm/libvpx_0.9.0.bb
index 8992c04..3447c6f 100644
--- a/recipes/webm/libvpx_0.9.0.bb
+++ b/recipes/webm/libvpx_0.9.0.bb
@@ -2,7 +2,7 @@ require libvpx.inc
 
 LICENSE = "VP8"
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "9eb8e818d2f3263623c258fe66924082"
 SRC_URI[sha256sum] = "a0096ac6859cfb61cf06dd9bc0a79a3333a4ec389ba311911d84df8ff2a1b9dc"
diff --git a/recipes/webm/libvpx_0.9.1.bb b/recipes/webm/libvpx_0.9.1.bb
index b5471b8..bcb7358 100644
--- a/recipes/webm/libvpx_0.9.1.bb
+++ b/recipes/webm/libvpx_0.9.1.bb
@@ -1,5 +1,14 @@
 require libvpx.inc
 
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://libvpx-configure-support-blank-prefix.patch;apply=yes"
+
+CONFIGUREOPTS += " \
+        --prefix=${prefix} \
+        --libdir=${libdir} \
+"
+
 SRC_URI[md5sum] = "e1442e74d0cca228785083fa520735a2"
 SRC_URI[sha256sum] = "c4e8e463e079ffde5b6948366a1d0873f1bf685dccd89ca137585c2b8247ec59"
 
-- 
1.7.0.4



