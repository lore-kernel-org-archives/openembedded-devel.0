Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C7EC35FF1
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 05:37:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1315.1742362634531353903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 22:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517343f5fc=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J5QqkC019877
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:37:13 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h945da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:37:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Mar 2025 22:37:11 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Mar 2025 22:37:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-sensors-plugin: 1.4.4 -> 1.4.5
Date: Wed, 19 Mar 2025 13:37:08 +0800
Message-ID: <20250319053708.952859-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 7ynfbL6nOqWLA13ITZtq-fgCWUCFq0kE
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67da5808 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=y-b_LaQjxMZayHeHhaIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7ynfbL6nOqWLA13ITZtq-fgCWUCFq0kE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=873 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52J5QqkC019877
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116064

From: Kai Kang <kai.kang@windriver.com>

1.4.5 (2024-12-25)
=3D=3D=3D=3D=3D
- Update copyright year
- build: Bump dependency versions and fix deprecation warnings
- I18n: Update po/LINGUAS list
- I18n: Update po/LINGUAS list
- sensors-plugin: Drop subtitle from properties dialog
- build: Fix -Werror=3Ddeprecated-declarations
- build: Fix LDFLAGS
- scan-build: Fix false positive file
- build: Use XDT_VERSION_INIT and get rid of configure.ac.in
- scan-build: Add false positive file
- scan-build: Fix unix.Malloc
- build: Use AM_DISTCHECK_CONFIGURE_FLAGS
- build: Fix -Werror=3Dformat=3D
- I18n: Update po/LINGUAS list
- build: Get rid of intltool
- Update copyright year
- build: Add missing includes of config.h
- build: Fix autotools warnings
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Taiwan), Croatian,
  Czech, Danish, Dutch, Eastern Armenian, English (Australia), English
  (United Kingdom), Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Latvian, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Occitan (pos=
t
  1500), Polish, Portuguese, Portuguese (Brazil), Romanian, Russian,
  Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkish,
  Ukrainian, Urdu, Urdu (Pakistan), Uyghur

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-sensors-plugin_1.4.4.bb =3D> xfce4-sensors-plugin_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.4=
.4.bb =3D> xfce4-sensors-plugin_1.4.5.bb} (92%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin=
_1.4.4.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_=
1.4.5.bb
similarity index 92%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_=
1.4.4.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.=
4.5.bb
index de3232c64a..596feacba2 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.=
bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.=
bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 inherit xfce-panel-plugin
=20
 SRC_URI +=3D "file://0001-Do-not-check-for-sys-class-power_supply-we-are=
-cross.patch"
-SRC_URI[sha256sum] =3D "6c1605a738e5df40e084d08ac93f962cd445093396de1e9b=
fadc7ab4588c36b6"
+SRC_URI[sha256sum] =3D "f69fdf79b7f76d2a81724828124a6fce76803a9122a4c82d=
e8f3dfa3efbb179a"
=20
 EXTRA_OECONF =3D " \
     --disable-procacpi \
--=20
2.34.1


