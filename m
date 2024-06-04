Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA704C25B74
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 03:19:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12761.1717471178040530849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 20:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6885482200=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Nn3Pm020191
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Jun 2024 03:19:37 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7tenn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 03:19:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 20:19:35 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 20:19:35 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][master][meta-oe][PATCH] rrdtool: Fix do_populate_sysroot QA issues
Date: Tue, 4 Jun 2024 11:20:18 +0800
Message-ID: <20240604032018.419634-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: EW-cc8-jzteVo2ULiiLkzsLFud4WPxNp
X-Proofpoint-ORIG-GUID: EW-cc8-jzteVo2ULiiLkzsLFud4WPxNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406040025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 453Nn3Pm020191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 03:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110683

From: Jiaying Song <jiaying.song.cn@windriver.com>

This commit addresses the shebang size issue encountered in the
do_populate_sysroot task of the rrdtool-native recipe. The issue
was caused by the shebang line in the cgi-demo.cgi file exceeding
the maximum allowed length of 128 characters.

The following error was observed:

ERROR: rrdtool-native-1.8.0-r0 do_populate_sysroot: QA Issue: : /work/x86=
_64-linux/rrdtool-native/1.8.0/sysroot-destdir/work/x86_64-linux/rrdtool-=
native/1.8.0/recipe-sysroot-native/usr/share/rrdtool/examples/cgi-demo.cg=
i maximum shebang size exceeded, the maximum size is 128. [shebang-size]
ERROR: rrdtool-native-1.8.0-r0 do_populate_sysroot: do_populate_sysroot f=
or this recipe installed files with QA issues
=EF=BB=BF
The solution implemented involves modifying the shebang line in the
cgi-demo.cgi file to use '/usr/bin/env rrdcgi', ensuring it adheres
to the length limit.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.8.0.bb
index cbe1af285..5afb3f2f4 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -103,6 +103,11 @@ do_configure() {
         ${B}/examples/*.pl
 }
=20
+do_install:append:class-native() {
+    # Replace the shebang line in cgi-demo.cgi
+    sed -i '1s|^.*$|#!/usr/bin/env rrdcgi|' ${D}${datadir}/rrdtool/examp=
les/cgi-demo.cgi
+}
+
 PACKAGES =3D+ "${PN}-perl ${PN}-python"
 PACKAGES =3D+ "rrdcached"
=20
--=20
2.25.1


