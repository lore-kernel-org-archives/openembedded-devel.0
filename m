Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Lc49H-0004LB-T0
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 21:45:04 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Lc465-0004ei-Di
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 04:41:57 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1235507304.8911.56.camel@alap>
References: <1235501736.8911.52.camel@alap>  <go1jd3$mlv$1@ger.gmane.org>
	<1235507304.8911.56.camel@alap>
Date: Tue, 24 Feb 2009 13:41:33 -0700
Message-Id: <1235508093.8911.58.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: [PATCH] add the openmoko git kernel stable branch to fso/milestone5
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
X-List-Received-Date: Tue, 24 Feb 2009 20:45:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Round 3 per Mickey's and Koen's sugestions

Angus


---
 conf/distro/include/sane-srcrevs.inc        |    1 +
 packages/linux/linux-openmoko-stable_git.bb |   33 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletions(-)                             
 create mode 100644 packages/linux/linux-openmoko-stable_git.bb                

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 2f4e913..328e612 100644                                                           
--- a/conf/distro/include/sane-srcrevs.inc                                              
+++ b/conf/distro/include/sane-srcrevs.inc                                              
@@ -97,6 +97,7 @@ SRCREV_pn-linux-ixp4xx ?= "1085"                                      
 SRCREV_pn-linux-openmoko-2.6.24 ?= "fb42ce6724576fc173faf8abfb04aa2c36d213b7"          
 SRCREV_pn-linux-openmoko-2.6.28 ?= "34240a1c06ae36180dee695aa25bbae869b2aa26"          
 SRCREV_pn-linux-openmoko-devel ?= "34240a1c06ae36180dee695aa25bbae869b2aa26"           
+SRCREV_pn-linux-openmoko-stable ?= "0e5fe639e234cdeb11d8441f19c5b3109a8b6a17"          
 SRCREV_pn-linux-eten ?= "ab2d414f4f13816af0ec0401b608133ca946624a"                     
 SRCREV_pn-llvm-gcc4 ?= "374"                                                           
 SRCREV_pn-llvm-gcc4-cross ?= "374"                                                     
diff --git a/packages/linux/linux-openmoko-stable_git.bb b/packages/linux/linux-openmoko-stable_git.bb
new file mode 100644                                                                                  
index 0000000..a7b74b8                                                                                
--- /dev/null                                                                                         
+++ b/packages/linux/linux-openmoko-stable_git.bb
@@ -0,0 +1,33 @@
+require linux.inc
+require linux-openmoko.inc
+
+DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
+
+DEFAULT_PREFERENCE = "-1"
+
+KERNEL_RELEASE = "2.6.28"
+KERNEL_VERSION = "${KERNEL_RELEASE}"
+
+OMV = "stable"
+PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCREV}"
+PR = "r2"
+
+SRC_URI = "\
+  git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
+#  file://defconfig-oe.patch \
+"
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+       if [ ${MACHINE} = "om-gta01" ] ; then
+               install -m 644 ./arch/arm/configs/gta01_moredrivers_defconfig ${WORKDIR}/defconfig-oe
+       fi
+       if [ ${MACHINE} = "om-gta02" ] ; then
+               install -m 644 ./arch/arm/configs/gta02_packaging_defconfig ${WORKDIR}/defconfig-oe
+       fi
+       if [ ${MACHINE} = "om-gta03" ] ; then
+               install -m 644 ./arch/arm/configs/gta03_defconfig ${WORKDIR}/defconfig-oe
+       fi
+#      cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
+}
+
--
1.5.6.5



