Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HQ4JB-0003jh-Rh
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Mar 2007 17:20:40 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1768837ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Mar 2007 08:20:37 -0800 (PST)
Received: by 10.115.23.12 with SMTP id a12mr374388waj.1173543635927;
	Sat, 10 Mar 2007 08:20:35 -0800 (PST)
Received: by 10.114.60.9 with HTTP; Sat, 10 Mar 2007 08:20:35 -0800 (PST)
Message-ID: <74d0deb30703100820p5f840c5bief6d31baa9672c0b@mail.gmail.com>
Date: Sat, 10 Mar 2007 17:20:35 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Can cross binutils and gcc be made independent of ARM version?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2007 16:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

currently binutils-cross, glibc-intermediate and gcc-cross have the
PACKAGE_ARCH set by the MACHINE, in my case armv4t or armv5te,
depending on the device. This causes them to be built twice,
overwriting each other in CROSS_DIR when building a single
distribution for all machines. Is it possible to change PACKAGE_ARCH
to just "arm" for arm cross packages and glibc-intermediate so that
binutils/gcc only have to be built once?

I'm currently testing the patch below (it sets cross packages' and
glibc-intermediate's  PACKAGE_ARCH to TARGET_ARCH for arm). Is there a
good reason not to do this, and if yes, could anything be done to work
around it?

regards
Philipp

#
# old_revision [b7093a0b54878418e08732a71380ec1eff1b1456]
#
# patch "classes/cross.bbclass"
#  from [c0fd2d21a749ceca1bef334641e20b66e044c5b4]
#    to [c6677dd5c700994a52b3f075078894c9a4a4b843]
#
# patch "packages/glibc/glibc-intermediate_2.5.bb"
#  from [d23bfd05eea7dd65fd5c7db7cdcb75dc34fa2953]
#    to [a872fc4fd91d6b0063f30dcac20714d23be8c09d]
#
============================================================
--- classes/cross.bbclass       c0fd2d21a749ceca1bef334641e20b66e044c5b4
+++ classes/cross.bbclass       c6677dd5c700994a52b3f075078894c9a4a4b843
@@ -1,10 +1,10 @@ OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
 # Cross packages are built indirectly via dependency,
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"

 # Save PACKAGE_ARCH before changing HOST_ARCH
 OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
-PACKAGE_ARCH = ${OLD_PACKAGE_ARCH}
+PACKAGE_ARCH =
"${@["arm",bb.data.getVar('OLD_PACKAGE_ARCH',d,1)][bb.data.getVar('TARGET_ARCH',d,1)
!= 'arm']}"

 PACKAGES = ""

============================================================
--- packages/glibc/glibc-intermediate_2.5.bb
d23bfd05eea7dd65fd5c7db7cdcb75dc34fa2953
+++ packages/glibc/glibc-intermediate_2.5.bb
a872fc4fd91d6b0063f30dcac20714d23be8c09d
@@ -9,8 +9,10 @@ do_configure_prepend() {
        sed -i s:-Werror:: ${S}/configure
 }

+# don't build a new glibc-intermediate/gcc-cross for each arm*
+OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
+PACKAGE_ARCH =
"${@["arm",bb.data.getVar('OLD_PACKAGE_ARCH',d,1)][bb.data.getVar('TARGET_ARCH',d,1)
!= 'arm']}"

-
 PACKAGES = ""
 PROVIDES = "virtual/${TARGET_PREFIX}libc-for-gcc"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"


