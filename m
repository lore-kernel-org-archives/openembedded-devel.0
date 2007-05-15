Received: from [194.158.229.27] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <robin.farine@terminus.org>) id 1Hnv7E-0001Lr-Kz
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 13:22:58 +0200
Received: from acn.212.98.42.40.adslpremium.ch (212.98.42.40) by
	mail-ps.sunrise.ch (7.2.073)
	id 46493BD8000074B6 for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 13:22:36 +0200
Received: from halftrack.hq.acn-group.ch ([172.16.145.83])
	by van.hq.acn-group.ch with esmtp (Exim 3.36 #1 (Debian))
	id 1Hnv6y-0002rE-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 13:22:36 +0200
Received: from ip6-localhost ([::1])
	by halftrack.hq.acn-group.ch with esmtp (Exim 4.63)
	(envelope-from <robin.farine@terminus.org>) id 1Hnv71-0005Rx-Bi
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 13:22:39 +0200
From: Robin Farine <robin.farine@terminus.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2007 13:22:39 +0200
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200705151322.39110.robin.farine@terminus.org>
Subject: RFC: machine customized ixp4xx NPE firmware
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
X-List-Received-Date: Tue, 15 May 2007 11:23:14 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello everyone,

The platform I am working on is using NPE-B and NPE-C as Ethernet
interfaces. The ixp4xx-npe package from the OE snapshot I am 
currently
using builds firmware for NPE-B only and the firmware type is 
hard-coded
in "IxNpeMicrocode.h".

The patch below proposes a means of letting the machine 
configuration file
decide which NPE firmware to build.

Another but somewhat related point is the COMPATIBLE_MACHINE 
variable. If
my machine's name does not start with nslug or ixp4xx, I am forced 
to
change many package recipes (I suspect it is a FAQ but I do not seem 
to
able to access the mailing-list archive at the moment), perhaps a
COMPATIBLE_ARCH variable would be help here ?

Thanks,

Robin

diff --git 
a/packages/ixp4xx/ixp4xx-npe-native-2.3.2/IxNpeMicrocode.h 
b/packages/ixp4xx/ixp4xx-npe-native-2.3.2/IxNpeMicrocode.h
--- a/packages/ixp4xx/ixp4xx-npe-native-2.3.2/IxNpeMicrocode.h
+++ b/packages/ixp4xx/ixp4xx-npe-native-2.3.2/IxNpeMicrocode.h
@@ -42,7 +42,7 @@
 // #define IX_NPEDL_NPEIMAGE_NPEB_DMA
 // #define 
IX_NPEDL_NPEIMAGE_NPEB_ETH_SPAN_FIREWALL_VLAN_QOS_HDR_CONV
 // #define 
IX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL_VLAN_QOS
-#define IX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL
+// #define IX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL
 
 
 // #define 
IX_NPEDL_NPEIMAGE_NPEC_ETH_SPAN_MASK_FIREWALL_VLAN_QOS_HDR_CONV_EXTMIB
@@ -51,7 +51,7 @@
 // #define IX_NPEDL_NPEIMAGE_NPEC_DMA
 // #define IX_NPEDL_NPEIMAGE_NPEC_CRYPTO_AES_ETH_LEARN_FILTER_SPAN
 // #define 
IX_NPEDL_NPEIMAGE_NPEC_CRYPTO_AES_ETH_LEARN_FILTER_FIREWALL
-#define IX_NPEDL_NPEIMAGE_NPEC_CRYPTO_AES_CCM_ETH
+// #define IX_NPEDL_NPEIMAGE_NPEC_CRYPTO_AES_CCM_ETH
 // #define 
IX_NPEDL_NPEIMAGE_NPEC_CRYPTO_ETH_LEARN_FILTER_SPAN_FIREWALL
 // #define 
IX_NPEDL_NPEIMAGE_NPEC_ETH_SPAN_FIREWALL_VLAN_QOS_HDR_CONV
 // #define 
IX_NPEDL_NPEIMAGE_NPEC_ETH_LEARN_FILTER_SPAN_FIREWALL_VLAN_QOS
diff --git a/packages/ixp4xx/ixp4xx-npe-native_2.3.2.bb 
b/packages/ixp4xx/ixp4xx-npe-native_2.3.2.bb
--- a/packages/ixp4xx/ixp4xx-npe-native_2.3.2.bb
+++ b/packages/ixp4xx/ixp4xx-npe-native_2.3.2.bb
@@ -7,9 +7,14 @@ inherit native
 inherit native
 S = "${WORKDIR}/ixp400_xscale_sw/src/npeDl"
 
+# A space-separated list of CPP defines that select the firmware 
images
+# to build for the target machine.
+IXP4XX_NPE_FIRWMARE_DEFINES ?= "\
+-DIX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL"
+
 do_compile() {
 	mv ${WORKDIR}/IxNpeMicrocode.h ${S}/
-	gcc -Wall IxNpeMicrocode.c -o IxNpeMicrocode
+	gcc -Wall ${IXP4XX_NPE_FIRWMARE_DEFINES} IxNpeMicrocode.c -o 
IxNpeMicrocode
 }
 
 do_stage() {
diff --git a/packages/ixp4xx/ixp4xx-npe_2.3.2.bb 
b/packages/ixp4xx/ixp4xx-npe_2.3.2.bb
--- a/packages/ixp4xx/ixp4xx-npe_2.3.2.bb
+++ b/packages/ixp4xx/ixp4xx-npe_2.3.2.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/ixp400_xscale_sw/src/npe
 
 COMPATIBLE_MACHINE = "(nslu2|ixp4xx)"
 
-FILES_${PN} = "${base_libdir}/firmware/NPE-B"
+FILES_${PN} = "${base_libdir}/firmware/NPE-*"
 
 do_compile() {
 	${STAGING_BINDIR_NATIVE}/IxNpeMicrocode-${PV} -be
@@ -21,13 +21,20 @@ do_compile() {
 
 do_install() {
 	install -d ${D}/${base_libdir}/firmware/
-	rm ${S}/NPE-B
-	mv ${S}/NPE-B.* ${S}/NPE-B
-	install ${S}/NPE-B ${D}/${base_libdir}/firmware/
+	for npe in A B C; do
+		rm ${S}/NPE-${npe} 2>/dev/null || true
+		mv ${S}/NPE-${npe}.* ${S}/NPE-${npe} 2>/dev/null || true
+		if test -f ${S}/NPE-${npe}; then
+			install -m 644 ${S}/NPE-${npe} ${D}/${base_libdir}/firmware/
+		fi
+	done
 }
 
 do_populate_staging() {
 	install -d ${STAGING_FIRMWARE_DIR}
-	install ${S}/NPE-B ${STAGING_FIRMWARE_DIR}/
+	for npe in A B C; do
+		if test -f ${S}/NPE-${npe}; then
+			install -m 644 ${S}/NPE-${npe} ${STAGING_FIRMWARE_DIR}/
+		fi
+	done
 }
-



