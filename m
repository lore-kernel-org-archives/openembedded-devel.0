Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OUQZv-00081f-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 22:41:48 +0200
Received: by gwj18 with SMTP id 18so1441139gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=E4M6lc5fd4lqL+fBRgBqqh8eBt03ho6AJPLbuJLfwoU=;
	b=Wl4b5fcXi7uiHuh8j7wYKIwqrp4KKWTJL9X9ImCmCvc0Oj6T2rIm24gKJAhb1mroWg
	Wm8fjMNqhpuGliq14PUgMvFmdUOm/fSkahtdmYwMMZDpIx/GTt6gDGWXnR0/Dc72OPoe
	v/8Yf0xDoRiYtnpGxX7thCTUCK++vzfIs3ui0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=q3/DSWukG3L+2g7futILTpde71sOpovmRYziqwANYSoKvE0QHF7OiyiWkgaK/a/bTV
	JbqoeDGG/8HBpjmrIKgpt/3VNbGoi8pwQYHTLUz4m111pKl55gwHKezZyCa6R8fd3l6G
	Fgpb//k2rRa4n+fyQzj7vbHgefpJaEQZ0m1Hs=
Received: by 10.100.106.7 with SMTP id e7mr84535anc.20.1278016620183;
	Thu, 01 Jul 2010 13:37:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v7sm135299ybe.6.2010.07.01.13.36.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 13:36:59 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jul 2010 15:30:25 -0500
Message-Id: <1278016225-11067-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1278016225-11067-1-git-send-email-chase.maupin@ti.com>
References: <1278016225-11067-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/1] sourceipk: add class to create source ipks
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
X-List-Received-Date: Thu, 01 Jul 2010 20:41:48 -0000

* Created the sourceipk.bbclass class that can be used to
  package the patched sources and recipe for an application
  into an ipk for installation.
* Allows specification of the installation directory for the
  sources using the SRCIPK_INSTALL_DIR variable.
* Can be enabled per package and controlled through the
  CREATE_SRCIPK variable.
* Creates a README file in the sources directory that
  explains the contents of the package.
* User can specify the package architecture for the source ipk
  using the SRCIPK_PACKAGE_ARCH variable.  The default value is
  "all".
* Using the -L flag to the cp command to copy files pointed to by
  symlinks and not the symlinks themselves.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/sourceipk.bbclass |  127 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 127 insertions(+), 0 deletions(-)
 create mode 100644 classes/sourceipk.bbclass

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
new file mode 100644
index 0000000..e3f2c41
--- /dev/null
+++ b/classes/sourceipk.bbclass
@@ -0,0 +1,127 @@
+# sourceipk.bbclass enables the creation of an ipk file that contains the
+# sources used during the build.  The sources contained in the ipk are the
+# patched sources before configuration has been done.
+#
+# This class is used to provide an easy method to ship the corresponding
+# sources for a package to end users so that they can install them on their
+# host or target systems.
+#
+# This package uses the following variables to control its operations:
+#   - CREATE_SRCIPK         = When set to 1 this variable indicates that 
+#                             a source ipk should be generated for the package.
+#   - SRCIPK_INSTALL_DIR    = This variable indicates the directory to install
+#                             the sources into.
+#   - SRCIPK_PACKAGE_ARCH   = This variable allows specific recipies to
+#                             specify an architecture for the sourcetree
+#                             package is "all" is not appropriate
+#
+# The default installation directory for the sources is:
+#   /usr/src/${PN}-src
+#
+# By setting the SRCIPK_INSTALL_DIR this default can be changed to any
+# location desired.  When combined with the opkg -o option this allows for the
+# system building to specify a relative package install location to the
+# install root given to opkg.  Each source ipk can have a different directory.
+# 
+# Creation of the source ipk can be controlled per package by setting
+# CREATE_SRCIPK = "1" in the package recipe or by setting
+# CREATE_SRCIPK_pn-<package name> = "1" in your local.conf
+#
+#TODO: 
+# Need to figure out how to use ipkg-build in this class.
+# I tried adding it as a dependency for the do_create_srcipk
+# task using:
+#   do_create_srcipk[depends] += "ipkg-utils-native:do_populate_sysroot"
+# But then there is a circular dependency between sourcipk.bbclass and
+# ipkg-utils-native.  Until I can figure out how to resolve this
+# circular dependency I am extracting the needed pieces from ipkg-build
+# into this class and building the source ipk myself.
+
+
+# Default is to not create the source ipk
+CREATE_SRCIPK ?= "0"
+
+# Default installation prefix
+SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
+
+# Default PACKAGE_ARCH for sources is "all"
+SRCIPK_PACKAGE_ARCH ?= "all"
+
+# Create a README file that describes the contents of the source ipk
+sourceipk_create_readme() {
+    readme="$1/README.${PN}-src"
+    touch $readme
+    echo 'This package contains the patched sources for ${PN} that' >> $readme
+    echo 'were used to generate the ${PN} binary ipk package(s).' >> $readme
+    echo 'This package does not build or generate the binaries' >> $readme
+    echo 'directly.  To build the binaries you must either' >> $readme
+    echo 'configure and build the sources yourself or use:' >> $readme
+    echo '    bitbake ${PN}' >> $readme
+    echo '' >> $readme
+    echo 'NOTE: The patches applied to the sources can be found in' >> $readme
+    echo "      the \"patches\" directory" >> $readme
+}
+
+# Create the source ipk file.  The ipk is manually created here instead
+# of using the normal ipk system because some recipes will over write
+# the PACKAGES variable.  Thus if this class added a -src package
+# to the list of packages to be created that package would be lost.
+# See the linux kernel recipe for an example of this issue.
+sourceipk_do_create_srcipk() {
+    if [ ${CREATE_SRCIPK} != "0" ]
+    then
+        tmp_dir="${WORKDIR}/sourceipk-tmp"
+        srcipk_dir="${WORKDIR}/sourceipk-data"
+        mkdir -p $tmp_dir/CONTROL
+        mkdir -p $srcipk_dir
+        control_file="$tmp_dir/CONTROL/control"
+
+        # Write the control file
+        echo "Package: ${PN}-src" > $control_file
+        echo "Version: ${PV}-${PR}" >> $control_file
+        echo "Description: Patched sources for ${PN}" >> $control_file
+        echo "Section: ${SECTION}" >> $control_file
+        echo "Priority: Optional" >> $control_file
+        echo "Maintainer: ${MAINTAINER}" >> $control_file
+        echo "Architecture: ${SRCIPK_PACKAGE_ARCH}" >> $control_file
+        srcuri="${SRC_URI}"
+        if [ "$srcuri" == "" ]
+        then
+            srcuri="OpenEmbedded"
+        fi
+        echo "Source: $srcuri" >> $control_file
+
+        #Write the control tarball
+        tar -C $tmp_dir/CONTROL --owner=0 --group=0 -czf $srcipk_dir/control.tar.gz .
+
+        # Get rid of temporary control file
+        rm -rf $tmp_dir/CONTROL
+
+        # Copy sources for packaging
+        mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
+        cp -rLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
+
+        #Write the data tarball
+        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
+
+        # Create the debian-binary file
+        echo "2.0" > $srcipk_dir/debian-binary
+
+        #Write the ipk file
+        mkdir -p ${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}
+        pkg_file=${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
+        rm -f $pkg_file
+        tar -C $srcipk_dir -czf $pkg_file .
+
+        # Remove the temporary directory
+        rm -rf $tmp_dir
+    fi
+}
+
+EXPORT_FUNCTIONS do_create_srcipk
+
+do_create_srcipk[deptask] = "do_patch"
+
+addtask create_srcipk after do_patch before do_configure
-- 
1.7.0.4



