Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE6EC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:47:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.89093.1749566864318512454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8256ed4fc1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEXUN4010170
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:47:43 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2k5wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:47:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 10 Jun 2025 07:47:42 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 10 Jun 2025 07:47:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nodejs: Disable for powerpc64le
Date: Tue, 10 Jun 2025 22:47:40 +0800
Message-ID: <20250610144740.1026927-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNyBTYWx0ZWRfX38o9E6qMNp2V nM52yfHx1pME9QSxik0IY+Fj3sw0Iv4OvX/ZOMbunGyow4Xlmt3C+rozk7XJpae4ScuVcbT4heO qeJDEIy7zv8uKplOE+0oOGLsBaxFVYYXZeIqe74qyGtC2W33Dz5++WVmhp14zjVlmA0eP7DmrdI
 fKxuvOThnNo7l/p5ZYJoK/gKOhSDZUSt390e5rnFzO2Q3OxeuqN/bD+AmCpe+TFRS94ZBacgtON Q7a42QMaHsLskxz+hPCQP5b86Owzr7VWXkwECwDaTMpXogiCCV9oDttUfAptXB5v4p7d4MisH/2 vLtzbOT6vQJpiThshjxtHxKJRDj2Vzz+ggpBlsgc+JVgRw/EeT50V0Bar+a7eeZrEXpncXnVT5v
 SC5KQFkmuMNOHPQXsQxfzSPVnsXcNL16Tbi78nBQ3xQAvFWw8QBN9xQryuE8kMT3usWDO3gn
X-Proofpoint-GUID: AuL4PA4Lm_GQmkeviBSWeGz2qPMo-b_l
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6848458f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-LCu6K_DAAAA:8 a=t7CeM3EgAAAA:8 a=BKFLrg-tKnoQ1W-ekQIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AuL4PA4Lm_GQmkeviBSWeGz2qPMo-b_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100117
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55AEXUN4010170
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117871

Fixes:
1. Compile failure with host gcc 11.4.0 (on ubuntu 22.04)
$ echo 'MACHINE =3D "qemuppc64"' >> conf/local.conf
$ bitbake nodejs
'''
../deps/v8/src/execution/ppc/simulator-ppc.cc:5126:33: error: =E2=80=98ce=
ilf=E2=80=99 is not a member of =E2=80=98std=E2=80=99; did you mean =E2=80=
=98ceil=E2=80=99?
 5126 |       VECTOR_FP_ROUNDING(float, ceilf)
      |                                 ^~~~~
'''

2. Segment fault on qemuppc64
$ runqemu qemuppc64 slirp nographic ext4 snapshot qemuparams=3D"-m 8192"
root@qemuppc64:~# node --help
Segmentation fault (core dumped)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.16.0.bb
index 43d9b99fd8..b29c83400a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -18,6 +18,7 @@ COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
 COMPATIBLE_HOST:riscv64 =3D "null"
 COMPATIBLE_HOST:riscv32 =3D "null"
 COMPATIBLE_HOST:powerpc =3D "null"
+COMPATIBLE_HOST:powerpc64le =3D "null"
=20
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Do-not-use-glob-in-deps.patch \
--=20
2.34.1


