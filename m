Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 584FB78CD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 16:41:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f1-v6so5889747pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=05sSUmB6i+QwRwvQz8S8LgKHBzicXrQafsx5esLtNPY=;
	b=ADb63e7//dqBx3SGEgNawCE4z2usouyHLNeAXk1UuZlLY90y9In7nicP49UP/S27sZ
	8Rl3SpYAYLgZDkMyvF+WHBH0z6T3SBD0wRXuxbwKzTW+I7iE6DN9ZqUo6J7zb0ks0oWC
	jjskUa2siorLqxAat4P3EtrGs0L33oQlc7KaDmU/D+sW+qrhkpjNJqHJOhZoG7G9d2CN
	J1I14lW0E2Y76sskVdfll/Sum47/UjzsdGH5CD/6ntJJyvg7sjMKfXK1IXtGiu1S6YDM
	bBvneCUNc7qrlSgRz2IPC7hfQ+o3Yzvxh4t37NbufC6Huop7Gwaq2Ow4b2DzlidwivZa
	bixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=05sSUmB6i+QwRwvQz8S8LgKHBzicXrQafsx5esLtNPY=;
	b=jc2Myw97A/TlwVWJeHkNKMFlOJoNWFLwE/3AHPzYRmykYv7o2GHyBEcaBk97U8MzwN
	DQDss6+ER+Kcy6OrBLN8D8zpqzDJgsSFMP4kILzuNMr+XhZrWhS+1Mm3+F0TkUghWby5
	1SyGShGoMDpvqor7+O7RUp7cSprAFzmLdqSX/PbUoPGtDODjTJNFfYe7cOIcV1eKdQUQ
	yXpcO9fqD/GZtBma7F8fEs0cNpkyRLCV2bw0ddrdg1FXI3mj6WQm25z45oUFKJwxfjFg
	DU06lzQIkDSEKKCoYkGqtXN1Y+O0RSxtoqIYoL4+a40ygkesG7H7KC7w/QcX5WEVT1NN
	gmJw==
X-Gm-Message-State: AOUpUlFbjdQ+o1fuTd8w0WugzE7NydCUm2rQStB4RykjjzesA/L1sOld
	95YAZ4oyfFgPVlDvGn3xkWw=
X-Google-Smtp-Source: AAOMgpcfzVg2Ua/mEwxaF9CiCvyxGOCYqu/oEfmcNPQFkktagPes7SRyzLBTrGqhsSL2WDYZPgFq5A==
X-Received: by 2002:a63:c50c:: with SMTP id
	f12-v6mr13104685pgd.88.1532882467517; 
	Sun, 29 Jul 2018 09:41:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1dbe:76c2:a88c:b8ab])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm18340681pfk.157.2018.07.29.09.41.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Jul 2018 09:41:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jul 2018 09:41:05 -0700
Message-Id: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][v3][PATCH] wireshark: update to 2.6.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Jul 2018 16:41:06 -0000

[v3]
Get  wireshark-gtk building again
split tshark, wireshark-gtk into their own pkgs

[v2]
Fix native build, lemon is the only one needed natively

[v1]
includes security fixes:

wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{wireshark_2.6.1.bb => wireshark_2.6.2.bb}     | 34 +++++++++++++++-------
 1 file changed, 24 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (70%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
similarity index 70%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
index 91c5e96..1735ae7 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
-SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
+SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
+SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
 
 PE = "1"
 
@@ -23,8 +23,11 @@ inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
+# Options: gtk+, gtk+3 and qt5
+GTK = "gtk+3"
+
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
-PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3 graphics ", "", d)}"
+PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
 
@@ -33,10 +36,8 @@ PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
 PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
 PACKAGECONFIG[libnl] = ",,libnl"
 PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
-PACKAGECONFIG[gtk2] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF, gtk+"
-PACKAGECONFIG[gtk3] = "-DENABLE_GTK3=ON,-DENABLE_GTK3=OFF, gtk+3"
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
-PACKAGECONFIG[graphics] = ",-DENABLE_GTK=OFF,"
+PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK=OFF, gtk+"
+PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
@@ -50,9 +51,9 @@ PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
 
-EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
-                  -DENABLE_NETLINK=ON \
+EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
                   -DBUILD_randpktdump=OFF \
                   -DBUILD_androiddump=OFF \
@@ -60,9 +61,11 @@ EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
                   -DM_INCLUDE_DIR=${includedir} \
                   -DM_LIBRARY=${libdir} \
                  "
+CFLAGS_append = " -lm"
+
 do_install_append_class-native() {
 	install -d ${D}${bindir}
-	for f in make-dissectors lemon make-taps
+	for f in lemon
 	do
 		install -m 0755 ${B}/run/$f ${D}${bindir}
 	done
@@ -75,6 +78,17 @@ do_install_append_class-target() {
 	done
 }
 
+PACKAGE_BEFORE_PN += "tshark"
+PACKAGE_BEFORE_PN += "${PN}-gtk"
+
+FILES_tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
+FILES_${PN}-gtk = "${bindir}/wireshark-gtk ${datadir}/icons ${datadir}/appdata \
+                   ${datadir}/applications ${datadir}/wireshark ${datadir}/mime \
+                   ${mandir}/man1/wireshark.* "
+
 FILES_${PN} += "${datadir}*"
 
+RDEPENDS_tshark = "wireshark"
+RDEPENDS_${PN}-gtk = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "${GTK}", "", d)} wireshark"
+
 BBCLASSEXTEND = "native"
-- 
2.7.4


