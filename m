Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF08C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 12:31:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34170.1753878687766944191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 05:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306a9768e=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56UCTJwq3309590;
	Wed, 30 Jul 2025 05:31:27 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487ken802s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Jul 2025 05:31:27 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 30 Jul 2025 05:31:25 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 30 Jul 2025 05:31:23 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jeroen Hofstee <jhofstee@victronenergy.com>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG options
Date: Wed, 30 Jul 2025 18:01:08 +0530
Message-ID: <20250730123111.3858530-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d7f1yQjE c=1 sm=1 tr=0 ts=688a109f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=6riKLmWeAAAA:8 a=t7CeM3EgAAAA:8
 a=walv_tispb8CzY-TNDUA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ykqYCi_xeFNNVC5ly69F:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r_NIJ7EkU-S8zNL9lloNlZMtwQ5wCL33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4OSBTYWx0ZWRfX5dqLJnnO8e1x
 cDsMGCl/la7943Jo1Krk8AmB27yfJowbIRWGTpgu6wVISVlR/SnVqPZhfJLXRCFxQChXuyl8rJi
 cRoNRBFDeU3B0KE9RqPPKl52lv/PtAO7Q0Rp0rXwvxc+v6TR7BqunPNekS5BA5pp8Ml66Fe5qyE
 JB+K8GJKioCayNFHA8Dkrm4u57/YdEQcBwkXwITA9OkHQYtrslQte4G8jFlgKs0KHJBPLMHTGfW
 1srYlTjpmjHoKjHwDyvAxC6OnypSPa7XsbxebdOgyONnTAaFDirkI73KDdz3kvKyB1vpXzr+AN3
 avUvXouvKaljxRy31LI2URNMXEkjWzd8v4ZijnLcbh9V0NyqwrlrcP4d08K4gFz8Pu6MaTadpFM
 BhunJkzo
X-Proofpoint-ORIG-GUID: r_NIJ7EkU-S8zNL9lloNlZMtwQ5wCL33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507300089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 12:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118794

From: Jeroen Hofstee <jhofstee@victronenergy.com>

This backports commit bb896f6b6f92 ("php: sort PACKAGECONFIG options"),
which was missing in 8.4.5 and helps in reducing unnecessary diffs in
future upgrades.

Reference:
https://git.openembedded.org/meta-openembedded/commit/meta-oe?id=bb896f6b6f92863e8f5c49e5a1f7d9bcb2578db0

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.4.6.bb | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.6.bb b/meta-oe/recipes-devtools/php/php_8.4.6.bb
index 5629a3dd3d..1b8c019a5d 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.6.bb
@@ -92,27 +92,25 @@ PACKAGECONFIG ??= "mysql sqlite3 opcache openssl \
 "
 PACKAGECONFIG:class-native = ""
 
-PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
-
+PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
+PACKAGECONFIG[mbstring] = "--enable-mbstring,,"
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
                         ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
-
+PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
+PACKAGECONFIG[soap] = "--enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
-PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,postgresql"
-PACKAGECONFIG[soap] = "--enable-soap, --disable-soap, libxml2"
-PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
-PACKAGECONFIG[pam] = ",,libpam"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
-PACKAGECONFIG[mbstring] = "--enable-mbstring,,"
+PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
 
 export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
2.40.0


