Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PbK9w-0006YR-Or
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 22:47:45 +0100
Received: (qmail 10252 invoked by uid 503); 7 Jan 2011 21:19:26 -0000
Received: from b9.ovh.net (HELO mail421.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Jan 2011 21:19:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2011 23:47:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2011 23:47:18 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 22:47:16 +0100
Message-Id: <1294436836-28074-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1294436836-28074-2-git-send-email-eric@eukrea.com>
References: <1294436836-28074-1-git-send-email-eric@eukrea.com>
	<1294436836-28074-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9936629629558631755
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 3/3] i2c-tools: update to latest 3.0.3
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
X-List-Received-Date: Fri, 07 Jan 2011 21:47:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

from CHANGES :
  Makefile: Let the environment set CC and CFLAGS
            Integrate py-smbus into the build system
  README: Point users to the linux-i2c mailing list
  decode-dimms: Handle CRC of FB-DIMM and DDR3 SDRAM memory modules
                Add support for DDR3 SDRAM
                Fix decoding of SDR SDRAM bytes 12-14
                Add side-by-side formatting option
                Add merged cells formatting option
                Try harder to decode the manufacturing date
                Handle read errors on sysfs
                Decode voltage interface level of DDR SDRAM
  decode-xeon: Delete
  eepromer: Fix array initialization overrun
  i2cdetect: Drop legacy reference to ISA bus
  i2cset: Add support for short writes with PEC
  i2c-stub-from-dump: Use udev settle to speed up initialization
                      Unload i2c-stub automatically if needed
                      Add support for multiple dumps
  tools: Properly handle /dev/i2c not being a directory
         Increase limit on I2C bus number

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/i2c-tools/i2c-tools_3.0.2.bb |   27 ---------------------------
 recipes/i2c-tools/i2c-tools_3.0.3.bb |   26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 recipes/i2c-tools/i2c-tools_3.0.2.bb
 create mode 100644 recipes/i2c-tools/i2c-tools_3.0.3.bb

diff --git a/recipes/i2c-tools/i2c-tools_3.0.2.bb b/recipes/i2c-tools/i2c-tools_3.0.2.bb
deleted file mode 100644
index 44559ef..0000000
--- a/recipes/i2c-tools/i2c-tools_3.0.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Set of i2c tools for linux"
-SECTION = "base"
-LICENSE = "GPLv2"
-
-PR = "r5"
-
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
-           file://Module.mk \
-          "
-
-inherit autotools
-
-do_compile_prepend() {
-        cp ${WORKDIR}/Module.mk ${S}/eepromer/
-        sed -i 's#/usr/local#/usr#' Makefile
-        sed -i 's#CC\t:= gcc#CC\t:= ${CC}#' Makefile
-        echo "include eepromer/Module.mk" >> Makefile
-}
-
-do_install_append() {
-        install -d ${D}${includedir}/linux
-        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
-	rm -f ${D}${includedir}/linux/i2c-dev.h
-}
-
-SRC_URI[md5sum] = "b546345ac19db56719dea6b8199f11e0"
-SRC_URI[sha256sum] = "0b4d6455a30a3264a60b4d3be55855d996d52ea4f162a2f04ffff378e24f98a2"
diff --git a/recipes/i2c-tools/i2c-tools_3.0.3.bb b/recipes/i2c-tools/i2c-tools_3.0.3.bb
new file mode 100644
index 0000000..7d6d668
--- /dev/null
+++ b/recipes/i2c-tools/i2c-tools_3.0.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Set of i2c tools for linux"
+SECTION = "base"
+LICENSE = "GPLv2"
+
+PR = "r0"
+
+SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
+           file://Module.mk \
+          "
+
+inherit autotools
+
+do_compile_prepend() {
+        cp ${WORKDIR}/Module.mk ${S}/eepromer/
+        sed -i 's#/usr/local#/usr#' Makefile
+        echo "include eepromer/Module.mk" >> Makefile
+}
+
+do_install_append() {
+        install -d ${D}${includedir}/linux
+        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
+	rm -f ${D}${includedir}/linux/i2c-dev.h
+}
+
+SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
+SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
-- 
1.6.3.3



