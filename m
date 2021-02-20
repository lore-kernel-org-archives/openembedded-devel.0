Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web09.13050.1613858155151981140
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 13:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=ELC/G2dG;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.158.5, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11KLjE95102216
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 16:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2y+n5oeM1pbrf3NUKH+mlIpdDU5AcVvWX1s229A/8kU=;
 b=ELC/G2dGB8ern9vpzxNU/3tixgjdD/HPXBl8c4atFJQToH+jb19ZLtajIUyrB3RQQqyB
 h5bEkarUGMr/xKnDltsEJvs6sZArUaHVux1aIaJFDHs78DZ2HPxUfeoCSIHSRAuYT2cv
 9H0F49JHKB2Yzo/lqLyKQSo5q8K2SZ0STgXt4b6LDjoaK3U5xZZmiwN2tqfCGbsM6qoB
 KubpK7AjerU4LYsKS8Ry3quoh2hYQn0epQHVCKrawI5aOacIWD+PVBKimipHQVLMPyRv
 BUpn8ZJsXCeQTzAJzmKra3AuotADHqbLZA32aWHZkW/grBWCmC68qGKji7GkBjoPxsVh gw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 36uam7r4cq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 16:55:54 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11KLSCDb016136
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 21:40:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma04dal.us.ibm.com with ESMTP id 36tt29nrfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 21:40:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11KLek2K37814554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 Feb 2021 21:40:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08C33AE05C;
	Sat, 20 Feb 2021 21:40:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 639F0AE060;
	Sat, 20 Feb 2021 21:40:45 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.194.203])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Sat, 20 Feb 2021 21:40:45 +0000 (GMT)
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Subject: [PATCH] [meta-oe] kernel-fitimage: Fix CVE-2021-27138
Date: Sat, 20 Feb 2021 18:40:42 -0300
Message-Id: <20210220214042.4882-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-20_03:2021-02-18,2021-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102200199
Content-Transfer-Encoding: 8bit

Das U-Boot 2021.4-rc1 has the following commit:

    commit 3f04db891a353f4b127ed57279279f851c6b4917
    Author: Simon Glass <sjg@chromium.org>
    Date:   Mon Feb 15 17:08:12 2021 -0700

        image: Check for unit addresses in FITs

        Using unit addresses in a FIT is a security risk. Add a check for
        this and disallow it.

        CVE-2021-27138

Adjust the kernel-fitimage.bbclass accordingly to not use unit
addresses. In addition to fixing a CVE, this is also required before we
can bump U-Boot to 2021.4.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 meta/classes/kernel-fitimage.bbclass | 40 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2414870817..f5082c93df 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -161,7 +161,7 @@ fitimage_emit_section_kernel() {
 	fi
 
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description = "Linux kernel";
                         data = /incbin/("${3}");
                         type = "kernel";
@@ -170,7 +170,7 @@ fitimage_emit_section_kernel() {
                         compression = "${4}";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <${ENTRYPOINT}>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${kernel_csum}";
                         };
                 };
@@ -179,7 +179,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${kernel_csum},${kernel_sign_algo}";
                                 key-name-hint = "${kernel_sign_keyname}";
                         };
@@ -210,14 +210,14 @@ fitimage_emit_section_dtb() {
 		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description = "Flattened Device Tree blob";
                         data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
                         ${dtb_loadline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${dtb_csum}";
                         };
                 };
@@ -226,7 +226,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${dtb_csum},${dtb_sign_algo}";
                                 key-name-hint = "${dtb_sign_keyname}";
                         };
@@ -283,7 +283,7 @@ fitimage_emit_section_setup() {
 	setup_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description = "Linux setup.bin";
                         data = /incbin/("${3}");
                         type = "x86_setup";
@@ -292,7 +292,7 @@ fitimage_emit_section_setup() {
                         compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${setup_csum}";
                         };
                 };
@@ -321,7 +321,7 @@ fitimage_emit_section_ramdisk() {
 	fi
 
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
@@ -330,7 +330,7 @@ fitimage_emit_section_ramdisk() {
                         compression = "none";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${ramdisk_csum}";
                         };
                 };
@@ -339,7 +339,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${ramdisk_csum},${ramdisk_sign_algo}";
                                 key-name-hint = "${ramdisk_sign_keyname}";
                         };
@@ -377,7 +377,7 @@ fitimage_emit_section_config() {
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
-	conf_node="conf@"
+	conf_node="conf-"
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
@@ -396,19 +396,19 @@ fitimage_emit_section_config() {
 	if [ -n "${kernel_id}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel@${kernel_id}\";"
+		kernel_line="kernel = \"kernel-${kernel_id}\";"
 	fi
 
 	if [ -n "${dtb_image}" ]; then
 		conf_desc="${conf_desc}${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt@${dtb_image}\";"
+		fdt_line="fdt = \"fdt-${dtb_image}\";"
 	fi
 
 	if [ -n "${ramdisk_id}" ]; then
 		conf_desc="${conf_desc}${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
+		ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
 	fi
 
 	if [ -n "${bootscr_id}" ]; then
@@ -419,16 +419,16 @@ fitimage_emit_section_config() {
 
 	if [ -n "${config_id}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup@${config_id}\";"
+		setup_line="setup = \"setup-${config_id}\";"
 	fi
 
 	if [ "${default_flag}" = "1" ]; then
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "${dtb_image}" ]; then
-			default_line="default = \"conf@${dtb_image}\";"
+			default_line="default = \"conf-${dtb_image}\";"
 		else
-			default_line="default = \"conf@${kernel_id}\";"
+			default_line="default = \"conf-${kernel_id}\";"
 		fi
 	fi
 
@@ -441,7 +441,7 @@ fitimage_emit_section_config() {
 			${ramdisk_line}
 			${bootscr_line}
 			${setup_line}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${conf_csum}";
                         };
 EOF
@@ -478,7 +478,7 @@ EOF
 		sign_line="${sign_line};"
 
 		cat << EOF >> ${its_file}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
-- 
2.25.1

