Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8D1CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 05:14:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1093.1764652440125381991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 21:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JCOUoJCO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4431c6a92f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24hjWt118957
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Dec 2025 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LjuYFPR9fWRqtcvUlzsZ
	ZVgo7OxJ5dvPLyMLhSJ+Rfw=; b=JCOUoJCOyXfiwH/r6SNjal7xXc7i4RjbD+5G
	0S8v/ZZybAYpqsLd+IxAIT2ttuEK4PFlepHaoIZC6m4yJvWBCkirwJb6zO+JaLzw
	/86IEBu8g6uhABORkvdkdeEaxANmn2BplelroBRdtPZN0nyN9adZRwL0A8zF4/wA
	Wkh0RMVzxrBAjaFv/9mSAvl9MA5JdXRz4xhIbHx/f3OyKPTaTxkAi1C5y4sfSgMu
	Dd39IrUbYxTIzpMKWcTLxcKlcmB9F1y6tE4oIkP0I2yStbJQHxB/A7dZClfDG8Qj
	0TPS2DNIsww+sJI1iAhsiiKo1K9gO8hnJw0u2vCqKvcHm4fIvw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6aprn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 05:13:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 21:13:55 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 21:13:55 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA
Date: Tue, 2 Dec 2025 13:13:54 +0800
Message-ID: <20251202051354.3815601-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAzOSBTYWx0ZWRfX95p9t3nZ2Ac7
 YuH0y3p7QqGotx8FfXWHeNQyeL5tE/IWXV2yfSFjVSIwGUVNvw7HYn2C9gdxpbg9fbCnMIePsHb
 hD1Tebry8yV8gh54anuX6R+5v4Ge06tuJ7eX4SaXylOMC39PyryGOzgw+aKGHxEtl/hBl2FmTti
 FaZRVvCcUhO71XEl1hoAq/kxNQI6SwcNJEU/rn+52kjZ4kw5ssZiOZXqs3X/iHJZySwwRUsxWsS
 gmXEZ69968ZYlwPoCccalEm/qBkq0kncC0kr+HRXidRj7/qrcFSBi2SnbNQwsGBE8Z32YvJiIZ0
 wh88MhK4X8v7zZ3T3OEs+EbPl2mLHH3KJAi7ijLH+rXipynTJFg3WWWeKsZ4h6LY0RIzovm7Mem
 EHf+X7UbwZeGv+vQeP+bW6qidh+ifA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692e7596 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=KvDfHoeZS9cCADGIgRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HLgFHq6pq5bUCx0tQM-lRyFGY55BPbST
X-Proofpoint-GUID: HLgFHq6pq5bUCx0tQM-lRyFGY55BPbST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B24hjWt118957
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 05:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122230

From: Mingli Yu <mingli.yu@windriver.com>

Most host gcc doesn't support -fcanon-prefix-map right now, so
empty DEBUG_PREFIX_MAP_EXTRA to fix the below build error.
 | gcc: error: unrecognized command-line option =E2=80=98-fcanon-prefix-m=
ap=E2=80=99; did you mean =E2=80=98-fmacro-prefix-map=3D=E2=80=99?

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta=
-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index bc7712ce4d..fe3ad6138e 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "1a4be2fe6b5246aa4ac8987a8a4af34=
c42a8dd7d08b46ab48516bcc1be
=20
 S =3D "${UNPACKDIR}/linux-${PV}"
=20
+DEBUG_PREFIX_MAP_EXTRA:toolchain-gcc =3D ""
+
 EXTRA_OEMAKE =3D "\
     V=3D1 \
     -C ${S}/tools/bpf/bpftool \
--=20
2.34.1


