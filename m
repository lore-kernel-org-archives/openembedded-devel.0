Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0C1C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:51:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17360.1658908271452991792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=URe5r6yz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4207d6b26a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26R7p9ZD002784
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=zCegc3aEc4Ji5hByOOiJq8IqdKTnZbhhsg/ffhnu/xk=;
 b=URe5r6yzuNZ1GeHD+mdSRkY6wyjozLVxq7z1G5AXBFMcIno2rvfW4xHR+p60+vTKA4KF
 RzQPTseLDoItOG5V/TJH3F697zQ4Ka2fr4bWFLU/Pp/Z/+nYL8a/55GinACX2Li19wXP
 UUcfZo25OHp2izDwncmZxwPkEfXvRBxE98jWYNTN1rajOoFXWbV5LlEGVglpcN0njPkE
 RqnVR+S31yWQHV7/DtnLGDuNIbsaM1XDv1794u+TcubnhZPTv98OcZ36fGjeaJQCZW22
 M3NUIEUjj/7i7uq5gUKjGtujRxGt+qZtKCoJW5AittueqmbO4wh3t9iYT6VQr4IoDmQ7 ig==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg671b4u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:51:09 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Jul 2022 00:51:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Jul 2022 00:51:03 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 27 Jul 2022 00:51:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] s-nail: fix buildpaths issue
Date: Wed, 27 Jul 2022 15:51:02 +0800
Message-ID: <20220727075102.3671939-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZTqJHN_pvtchEeQQ8TTy_M2qr0JF1Kmh
X-Proofpoint-GUID: ZTqJHN_pvtchEeQQ8TTy_M2qr0JF1Kmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 07:51:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98001

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: s-nail-14.9.24-r0 do_package_qa: QA Issue: File /usr/bin/s-nail in package s-nail contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e-config.sh-not-reveal-the-build-env.patch | 43 +++++++++++++++++++
 .../recipes-extended/s-nail/s-nail_14.9.24.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-mk-make-config.sh-not-reveal-the-build-env.patch

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-mk-make-config.sh-not-reveal-the-build-env.patch b/meta-oe/recipes-extended/s-nail/files/0001-mk-make-config.sh-not-reveal-the-build-env.patch
new file mode 100644
index 000000000..18ef6cae2
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/0001-mk-make-config.sh-not-reveal-the-build-env.patch
@@ -0,0 +1,43 @@
+From fa93dab6393527673e642f26b6ea2c4413dd3cfe Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 27 Jul 2022 13:40:12 +0800
+Subject: [PATCH] make-config.sh: hidden the build info
+
+Use the CC as placeholder to replace the real build information which
+will be collected via src/mx/accmacvar.c and then added in the final
+binary s-nail, so hidden the build info to avoid revealing the detailed
+build info.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ mk/make-config.sh | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/make-config.sh b/mk/make-config.sh
+index 2d7c619..9146004 100644
+--- a/mk/make-config.sh
++++ b/mk/make-config.sh
+@@ -3637,15 +3637,15 @@ LIBS=`squeeze_ws "${LIBS}"`
+ COMMLINE=`printf '%s\n' "${COMMLINE}" | ${sed} -e 's/.*--\(.*\)/\1/'`
+ COMMLINE=`squeeze_ws "${COMMLINE}"`
+ 
+-i=`printf '%s %s %s\n' "${CC}" "${CFLAGS}" "${i}"`
++i="CC"
+    printf '#define VAL_BUILD_CC "%s"\n' "$i" >> ${h}
+    i=`string_to_char_array "${i}"`
+    printf '#define VAL_BUILD_CC_ARRAY %s\n' "$i" >> ${h}
+-i=`printf '%s %s %s\n' "${CC}" "${LDFLAGS}" "${LIBS}"`
++i="CC"
+    printf '#define VAL_BUILD_LD "%s"\n' "$i" >> ${h}
+    i=`string_to_char_array "${i}"`
+    printf '#define VAL_BUILD_LD_ARRAY %s\n' "$i" >> ${h}
+-i=${COMMLINE}
++i="CC"
+    printf '#define VAL_BUILD_REST "%s"\n' "$i" >> ${h}
+    i=`string_to_char_array "${i}"`
+    printf '#define VAL_BUILD_REST_ARRAY %s\n' "$i" >> ${h}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
index 6e004fc90..bcdb1e478 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
            file://0001-make.rc-set-VAL_MTA.patch \
            file://0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch \
            file://0001-su_INLINE-eh-no-give-up-share-detection.patch \
+           file://0001-mk-make-config.sh-not-reveal-the-build-env.patch \
 "
 SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
 
-- 
2.25.1


