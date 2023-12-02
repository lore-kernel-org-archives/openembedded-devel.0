Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE6EC46CA3
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 03:10:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11379.1701486604377804178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 19:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=edQEf6jh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=070003c0e1=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B234104020400;
	Sat, 2 Dec 2023 03:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=F90WB0N1+XHdXcQQIbPAZzdre4uq9Fc6g0ewJNv+2hI=; b=
	edQEf6jh+0lNeArfMf5v61KATGi4hPe3K9jJZBtABAK5lqwEI/1bSq9Yhkchk/6N
	MchSOLRXC1bpdhQPZNsm75YvMfOdrliSqMm0F9rO9lcb2k/NawOx6c1KP3KWKhOB
	CgUNFp1O2tBHhSkVkcsU6dnZb8ozdyYSKlBQuSbn++QuPXE4IX3zsGlyF6RjZ871
	U2BezHmhyQ+rhFfofnT6IU/BEHs4ziBv5qe3T+JbpEa94oSxXOas+FBgjupeDXp2
	dgc/Z2fjAXtoCEAVqIX4NUSrhx6/6p3l6F024jhYVh7e7qLZb1/BSBk8hAv1AeEj
	yes4VovxbPSOhD6O/Ggu3g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uquj680u5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 02 Dec 2023 03:10:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Dec 2023 19:09:58 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Dec 2023 19:09:58 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <alex.kanavin@gmail.com>
Subject: [kirkstone][PATCH 1/2] sip3: Add sipconfig.py
Date: Fri, 1 Dec 2023 19:09:49 -0800
Message-ID: <20231202030950.3357721-2-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231202030950.3357721-1-rob.woolley@windriver.com>
References: <20231202030950.3357721-1-rob.woolley@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 85MVF6bnM6OZZ1ILKIGW_2PUClhdhP9E
X-Proofpoint-ORIG-GUID: 85MVF6bnM6OZZ1ILKIGW_2PUClhdhP9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312020021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Dec 2023 03:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107193

Add the destdir option to ensure that sipconfig.py gets installed to the
site-packages directory and included in python3-sip3.

Remove references to the build paths from sipconfig.py as part of the
install stage.  One may then prepend STAGING_DIR_NATIVE to sip_bin and
STAGING_DIR_TARGET to *_dir in any recipe that uses sipconfig.py.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index d6335585e..064ab0a0c 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -29,11 +29,28 @@ do_configure:prepend() {
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
     echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+    ${PYTHON} configure.py --configuration sip.cfg --destdir /${D}${libdir}/${PYTHON_DIR}/site-packages/ --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
 }
 
 do_install() {
     oe_runmake install
+
+    sed -i \
+         -e "s@[^ ]*-fdebug-prefix-map=[^ ']*@@g" \
+         -e "s@[^ ]*-fmacro-prefix-map=[^ ']*@@g" \
+         -e "s@[^ ]*-ffile-prefix-map=[^ ']*@@g" \
+         ${D}${libdir}/${PYTHON_DIR}/site-packages/sipconfig.py
+
+    # Remove the destination directory
+    sed -i -e "s@${D}/@@g" ${D}${libdir}/${PYTHON_DIR}/site-packages/sipconfig.py
+
+    if [ -n "${STAGING_DIR_NATIVE}" ]; then
+        sed -i -e "s@${STAGING_DIR_NATIVE}@@g" ${D}${libdir}/${PYTHON_DIR}/site-packages/sipconfig.py
+    fi
+
+    if [ -n "${STAGING_DIR_TARGET}" ]; then
+       sed -i -e "s@${STAGING_DIR_TARGET}@@g" ${D}${libdir}/${PYTHON_DIR}/site-packages/sipconfig.py
+    fi
 }
 
 FILES:python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
-- 
2.39.0


