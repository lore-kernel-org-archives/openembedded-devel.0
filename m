Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD8C975733
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 11:08:21 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so45168256wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IE5IkQGc/lLsQ8f6FKNwRerxNt96oXOPWTFRYXnnug8=;
	b=gVDY49jpxRDMTT8CuIW5CCbyM6vY9aZ+CFBGKSttVdc+8br2RpUyZX0NTln/kFwTNg
	YbNSzIjjUFvkakkyQgdol5BHSUgNuuMmDw+cUTXX92Xh3KosrZBu+EiFvKMVnGtE1vBc
	5UF7Bv8gP1ZqshHEjlrOxnRtl0vVQ8S0OmKh1V3h0mKTe79fE4GnpNzaFKlWHZeJadtD
	DfUV8sKjSwWWcujfvm8GySIOacQ7mc7tk0vTysc/wV885Ui3N9HsX38869VygFYGsnVs
	xRWxqkqgbMm20qJcnm66OCkJarxgRnR71iXmsBBuOBz808B4EQNTT+6124lkNTR+nJhd
	YzBQ==
X-Gm-Message-State: ALoCoQlT0cWnLwmHixOI/Fgh5fZVAz13bljADJECChbp3mv0C+FGa0Mvs/EpAX8k8mfBg6REnDvm
X-Received: by 10.180.88.72 with SMTP id be8mr6823562wib.42.1433416102585;
	Thu, 04 Jun 2015 04:08:22 -0700 (PDT)
Received: from static.71.106.40.188.clients.your-server.de
	(static.71.106.40.188.clients.your-server.de. [188.40.106.71])
	by mx.google.com with ESMTPSA id
	dz4sm30737858wib.17.2015.06.04.04.08.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 04:08:22 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:08:09 +0200
Message-Id: <1433416089-1024-1-git-send-email-zoltan.kuscsik@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH] chromium, cef: fetch chromium source from git
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
X-List-Received-Date: Thu, 04 Jun 2015 11:08:23 -0000

Updated recipe to fetch Chromium from git.
LASTCHANGE file is now created using the proper
gclient hook.

Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ----------
 recipes-browser/chromium/cef3_280796.bb            | 73 +++++++++++++++-------
 2 files changed, 51 insertions(+), 54 deletions(-)
 delete mode 100644 recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch

diff --git a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
deleted file mode 100644
index 9b14429..0000000
--- a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fetch the revision from LASTCHANGE file programmatically
-
-Upstream-Status: Pending
-
-Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/cef/tools/make_version_header.py b/cef/tools/make_version_header.py
-index 84d49f5..395c2cf 100644
---- a/cef/tools/make_version_header.py
-+++ b/cef/tools/make_version_header.py
-@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version, cef_version, cpp_header_dir):
-       revision = svn.get_revision()
-     elif git.is_checkout('.'):
-       revision = git.get_svn_revision()
-+    elif os.path.isfile("../build/util/LASTCHANGE"):
-+      revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
-     else:
-       raise Exception('Not a valid checkout')
-
-diff --git a/cef/tools/revision.py b/cef/tools/revision.py
-index 1d94602..eb89e3b 100644
---- a/cef/tools/revision.py
-+++ b/cef/tools/revision.py
-@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
-   sys.stdout.write(svn.get_revision())
- elif os.path.exists(os.path.join('.', '.git')):
-   sys.stdout.write(git.get_svn_revision())
-+elif os.path.isfile("../build/util/LASTCHANGE"):
-+  revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
- else:
-   raise Exception('Not a valid checkout')
diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 9a9efe5..a3a4eca 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -7,21 +7,22 @@ RDEPENDS_${PN} += "pango cairo fontconfig pciutils pulseaudio freetype fontconfi
 SRCREV_tools = "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
 SRCREV_cef = "bbad53dfca9f98dddcb31a590410fece0a4f0234"
 SRCREV_egl = "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
-SRCREV_FORMAT = "cef_egl_tools"
+SRCREV_FORMAT = "cef_egl"
 
-SRC_URI = "http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${PV}.tar.xz \
-           git://github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=src/cef;branch=aura;name=cef \
-           git://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl \
-           git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools \
-           file://01_get_svn_version_from_LASTCHANGE.patch \
-	   file://cef-simple \
-	  "
-SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
-SRC_URI[sha256sum] = "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
+SRC_URI = "git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools \
+           git://github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=${S}/src/cef;branch=aura;name=cef \
+           git://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=${S}/src/ui/ozone/platform/egl;branch=master;name=egl\
+           file://cef-simple\
+  "
 
-S = "${WORKDIR}/chromium_rev_${PV}"
+export CHROMIUM_SRC_GIT_URL="https://chromium.googlesource.com/chromium/src"
+export CHROMIUM_SRC_GIT_COMMIT="e800fe7470fa87dc1ca5b148a7c2c41f603fdcbd"
 
-do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
+S = "${WORKDIR}/chromium_rev_${PV}/"
+
+B = "${S}/src/"
+
+do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl"
 
 GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
 GYP_ARCH_DEFINES_i586 = " target_arch=ia32"
@@ -30,22 +31,50 @@ export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
+do_fetch_chromium_source_from_git() {
+    cd ${S}
+    export PATH=${WORKDIR}/depot_tools:"$PATH"
+
+    # Note: --deps-file needs to set to .DEPS.git for syncing to old
+    # chromium versions
+    gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=".DEPS.git"
+
+    # Runhooks is disabled. Running the hooks will trigger the
+    # gyp_chromium command replaced with cef_create_projects.sh by
+    # cef3.
+
+    gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
+
+    # We need the lastchange hook to generate the LASTCHANGE revision info
+    # file.
+
+    python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
+}
+
+addtask fetch_chromium_source_from_git after do_patch before do_configure
+
 do_configure_append() {
-	export PATH=${WORKDIR}/depot_tools:"$PATH"
-	# End of LD Workaround
-	#-----------------------
-	# Configure cef
-	#------------------------
-	cd cef
-	./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
-	cd -
+    export PATH=${WORKDIR}/depot_tools:"$PATH"
+    # End of LD Workaround
+    #-----------------------
+    # Configure cef
+    #------------------------
+    cd ${S}/src/cef
+
+    # Fatal linker warnings need to be disalbed to avoid linker issu
+    # with GCC 4.9:
+    # http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095947.html
+
+    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../ -Ddisable_fatal_linker_warnings=
+    cd -
 }
 
 # Workaround to disable qa_configure
 do_qa_configure() {
-	echo "do_qa_configure"
+    echo "do_qa_configure"
 }
 
 do_compile() {
-	ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
+    cd ${S}/src
+    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
 }
-- 
1.9.1


