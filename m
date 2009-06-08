Received: from [17.148.16.92] (helo=asmtpout017.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDibK-0001w1-IA
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 19:25:38 +0200
MIME-version: 1.0
Received: from [87.201.169.95] by asmtp017.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKX007IDJYAWN10@asmtp017.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	08 Jun 2009 10:15:52 -0700 (PDT)
Message-id: <FAAA64B6-CC5D-42C3-ADC0-96174388CAA4@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Holger Freyther <zecke@selfish.org>, Denys Dmytriyenko <denis@denix.org>
In-reply-to: <200906040644.46800.zecke@selfish.org>
Date: Mon, 08 Jun 2009 21:15:40 +0400
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
	<200906040644.46800.zecke@selfish.org>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] Added recipe for Ralink rt2570-k2wrlz-1.6.4 WiFi USB driver
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
X-List-Received-Date: Mon, 08 Jun 2009 17:25:38 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	Here is a patch for the ralink 1.6.4 driver. I've added the checksum  
entry and added the bitbake recipe.

Best regards,

Elvis Dowson


 From b4346275d30e29779decbc65e060510719c30652 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis,dowson@gmail.com>
Date: Mon, 8 Jun 2009 21:10:30 +0400
Subject: [PATCH] Added recipe for Ralink rt2570-k2wrlz-1.6.4 WiFi USB  
driver

---
  conf/checksums.ini                    |    4 ++++
  recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb |   27 ++++++++++++++++++++++++ 
+++
  2 files changed, 31 insertions(+), 0 deletions(-)
  create mode 100644 recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9a47979..eac5093 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -21022,6 +21022,10 @@  
sha256=31248ac19b7935638c373aeced6187262a440d195dabfef6128845b4b16bee6c
  md5=87947cf1868ac37d4d756f3585dbf1e6
   
sha256=11d2c4a1b69a4b2b49811128a41c33f25c71e590b019ace392761598ca3d419f

+[http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2 
]
+md5=21f6e873ad7ee34843dbcd1204f9eda3
+sha256=5b2d382504d0aee14cf24f0eb3c483a79c712f8aa1ca027a7d4425891f1bb2ec
+
  [http://folks.o-hand.com/sameo/rt2860/rt2860-1.7.0.0.tar.bz2]
  md5=9ba1b8fdc9726931d5820226d48b9a33
   
sha256=1d8fb8980025a0126520bb8f92dd0a5ce59c72e10889323212d3b4fd5496390a
diff --git a/recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb b/recipes/rt2x00/ 
rt2570-k2wrlz_1.6.4.bb
new file mode 100644
index 0000000..98fe660
--- /dev/null
+++ b/recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Enhanced Driver for Ralink rt2570 USB 802.11g WiFi  
sticks"
+HOMEPAGE = "http://homepages.tu-darmstadt.de/~p_larbig/wlan"
+SECTION = "kernel/modules"
+LICENSE = "GPL"
+
+PR = "r1"
+
+SRC_URI = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/${PN}-$ 
{PV}.tar.bz2"
+
+inherit module
+
+S = "${WORKDIR}/${PN}-${PV}/Module/"
+
+do_compile_prepend_arm () {
+  MAKE_TARGETS="arm"
+}
+
+do_compile() {
+  export KERNDIR=${STAGING_KERNEL_DIR}
+  module_do_compile
+}
+
+do_install() {
+	install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/extra
+	install -m 0644 rt2570${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/ 
modules/${KERNEL_VERSION}/extra/
+}
+
-- 
1.6.0.3



