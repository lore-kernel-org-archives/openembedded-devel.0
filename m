Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CBCE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:34:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.79306.1734435288498680424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20816660d6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHB0YTr020065
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq2rw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 03:34:47 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 03:34:46 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/5] xfce4-appfinder: 4.19.3 -> 4.20.0
Date: Tue, 17 Dec 2024 19:34:33 +0800
Message-ID: <20241217113434.2082270-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113434.2082270-1-kai.kang@windriver.com>
References: <20241217113434.2082270-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 1tfNmCvv2shBTFYywfqUEhPO7umoIbIr
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676161d8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=6nhj6rkt46hsSTBCAVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1tfNmCvv2shBTFYywfqUEhPO7umoIbIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_06,2024-12-17_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=756 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170095
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BHB0YTr020065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 11:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114370

From: Kai Kang <kai.kang@windriver.com>

4.20.0 (2024-12-15)
=3D=3D=3D=3D=3D=3D
- Translation Updates:
  Finnish, Hebrew, Polish, Ukrainian
4.19.4 (2024-12-01)
=3D=3D=3D=3D=3D=3D
- Fix buffer overflow and leaks (#92)
- I18n: Update po/LINGUAS list
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong),
  Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian,
  English (Australia), English (Canada), English (United Kingdom),
  Estonian, Finnish, French, Galician, German, Greek, Hebrew, Hindi,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Norwegian
  Nynorsk, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Telugu, Thai, Turkish, Ukrainian, Uyghur, Vietnamese

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-appfinder_4.19.3.bb =3D> xfce4-appfinder_4.20.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.19.3.bb=
 =3D> xfce4-appfinder_4.20.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.=
3.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.3=
.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.b=
b
index b81dcb89d..f018a9927 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
@@ -8,6 +8,6 @@ inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "9ea2c1c2e5630d0670c9cd47793144ee63c04a63b8b68f03=
97432e043cd62d27"
+SRC_URI[sha256sum] =3D "82ca82f77dc83e285db45438c2fe31df445148aa986ffebf=
2faabee4af9e7304"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.34.1


