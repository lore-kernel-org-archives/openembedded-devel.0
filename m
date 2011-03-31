Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Q5Q8v-0008Dr-7O
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 00:15:05 +0200
Received: from localhost.localdomain (79.25.134.226) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A960842D56C; Fri, 1 Apr 2011 00:13:03 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri,  1 Apr 2011 00:12:59 +0200
Message-Id: <1301609579-27642-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Cc: BUG-dev <bug-dev@lists.buglabs.net>,
	openembedded-devel@lists.openembedded.org
Subject: [PATCH] fix com.buglabs.bug.jni.* 'could not read symbols: Bad value' error
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
X-List-Received-Date: Thu, 31 Mar 2011 22:15:05 -0000

Without that fix we have :
  | .../sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: CharDevice.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
  | CharDevice.o: could not read symbols: Bad value
  | collect2: ld returned 1 exit status
  | make: *** [libCommon.so] Error 1
For the following recipes:
  com.buglabs.bug.jni.common
  com.buglabs.bug.jni.input
  com.buglabs.bug.jni.lcd
  com.buglabs.bug.jni.accelerometer
  com.buglabs.bug.jni.libmatthew
  com.buglabs.bug.jni.vonhippel
  com.buglabs.bug.jni.camera
  com.buglabs.bug.jni.rxtx
  com.buglabs.bug.jni.gps

The solution was to pass -fPIC to the Makefile:
For instance in com.buglabs.bug.jni.common/src/c the Makefile contained:
  ALL_CXXFLAGS += $(INCLUDE) $(CXXFLAGS)
  [...]
  %.o: %.cpp
          $(CXX) $(ALL_CXXFLAGS) -c -v $^ -o $@
So passing -fPIC to CXXFLAGS solved all of the compilation failures but com.buglabs.bug.jni.camera
com.buglabs.bug.jni.camera which failed that way:
  | .../sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: Camera.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
  | Camera.o: could not read symbols: Bad value
  | collect2: ld returned 1 exit status
  | make: *** [libCamera.so] Error 1
Had that in its Makefile:
  ALL_CCFLAGS += $(INCLUDE) $(CCFLAGS)
  [...]
  %.o: %.c
          $(CC) $(ALL_CCFLAGS) -c $^ -o $@
which corresponded to the compilation of bug_v4l.c
Altough just setting CCFLAGS += "-fPIC" wasn't sufficent since CFLAGS was not exported
(see run.do_jni_install script)
So I had to export it.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/buglabs-osgi/bug-osgi.inc                  |    4 +++-
 recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb |    3 +++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/buglabs-osgi/bug-osgi.inc b/recipes/buglabs-osgi/bug-osgi.inc
index b5b6e9f..75908bb 100644
--- a/recipes/buglabs-osgi/bug-osgi.inc
+++ b/recipes/buglabs-osgi/bug-osgi.inc
@@ -8,7 +8,7 @@ inherit bug-java-library
 JARFILENAME = "${BPN}.jar"
 ALTJARFILENAMES = ""
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRCREV = "12839"
 
@@ -28,6 +28,8 @@ EXTRA_OEMAKE+="CLASSPATH_INCDIR=${STAGING_INCDIR}/classpath"
 
 JAVAC_OPTIONS="-source 1.6"
 
+CXXFLAGS += "-fPIC"
+
 do_compile() {
   mkdir -p build
   oe_makeclasspath cp -s ${DEPENDS} ${EXTRA_CP}
diff --git a/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb b/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
index dced292..28a22e1 100644
--- a/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
+++ b/recipes/buglabs-osgi/com.buglabs.bug.jni.camera.bb
@@ -2,6 +2,9 @@ require bug-osgi.inc
 inherit jni-library
 
 PR = "${INC_PR}.7+svnr${SRCREV}"
+
+export CCFLAGS  += "-fPIC"
+
 FILES_${PN} += "${JNI_LIB_DIR}/libCamera.so"
 
 DEPENDS += "com.buglabs.common com.buglabs.bug.jni.common classpath jpeg virtual/kernel jpeg"
-- 
1.7.0.4



