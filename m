Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBA7C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 03:35:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35030.1702870518811192892
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Dec 2023 19:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZgUYyjDm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0716d966a8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI2dZgn007259
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 19:35:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ozBDd
	dsk6S8+2LklNtHp4ks9zzxZN5/LaaW/IPuwKdY=; b=ZgUYyjDmLqDoYdxWvNqs2
	f2rvHD4Kp3E3wJ0obKi+3/P4HbHaZMGpGBDHaFrNsyuLSGVSfGZu4vFxABr7Qc63
	Bhle8PtbiRJN2kT6+HAXp2n4f1v2K7p8jBk8BkoMNR+XbOhIQZapqjr47FoNtvON
	/Bqb780j2IgAZlqtssC9HwI95GIwF9ynm7guep0SriJodm6Y0Oy9O1Q+0Jl0ZD2s
	rGpKjWtedj+KIiF97V2QMS3+ntD8ayGhARpuHyNAc4OBk+RfatHOc61TCvJapGXf
	BYecBS2ZbqDCp1aNCLZ3t89VZV0FHcsO5Sq8V95d34PIq0V8iHdOqpxcyf7zZNcG
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kh5ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 19:35:18 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 19:35:22 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] strongswan: upgrade 5.9.6 -> 5.9.12
Date: Mon, 18 Dec 2023 03:34:59 +0000
Message-ID: <20231218033459.1501952-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: fU69ApFDXbl15o3fcHCMIcIheKX7povV
X-Proofpoint-ORIG-GUID: fU69ApFDXbl15o3fcHCMIcIheKX7povV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 03:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107541

From: Archana Polampalli <archana.polampalli@windriver.com>

* Drop backport patch 0001-enum-Fix-compiler-warning.patch.
* Drop backport patch CVE-2022-40617.patch
* Update RDEPENDS to fix strongswan startup failures:
    plugin 'mgf1': failed to load - mgf1_plugin_create not found and no plugin file available
    plugin 'fips-prf': failed to load - fips_prf_plugin_create not found and no plugin file available
    plugin 'kdf': failed to load - kdf_plugin_create not found and no plugin file available
    plugin 'drbg': failed to load - drbg_plugin_create not found and no plugin file available
* Drop PACKAGECONFIG[scep] as scepclient has been removed.
* Add plugin-gcm to RDEPENDS as gcm plugin has been added to the default
  plugins.

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/5.9.7
https://github.com/strongswan/strongswan/releases/tag/5.9.8
https://github.com/strongswan/strongswan/releases/tag/5.9.9
https://github.com/strongswan/strongswan/releases/tag/5.9.10
https://github.com/strongswan/strongswan/releases/tag/5.9.11
https://github.com/strongswan/strongswan/releases/tag/5.9.12

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{strongswan_5.9.6.bb => strongswan_5.9.12.bb}    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.12.bb} (96%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
similarity index 96%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
index b8d44db26..c734b43b6 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-enum-Fix-compiler-warning.patch \
-           file://CVE-2022-40617.patch \
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
+SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -41,7 +39,6 @@ PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,${PN}-plugin-openssl"
-PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
 PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
@@ -146,11 +143,16 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-attr \
     ${PN}-plugin-cmac \
     ${PN}-plugin-constraints \
+    ${PN}-plugin-drbg \
+    ${PN}-plugin-fips-prf \
     ${PN}-plugin-des \
     ${PN}-plugin-dnskey \
+    ${PN}-plugin-gcm \
     ${PN}-plugin-hmac \
+    ${PN}-plugin-kdf \
     ${PN}-plugin-kernel-netlink \
     ${PN}-plugin-md5 \
+    ${PN}-plugin-mgf1 \
     ${PN}-plugin-nonce \
     ${PN}-plugin-pem \
     ${PN}-plugin-pgp \
-- 
2.40.0


