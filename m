Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C9AC3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:20:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.96197.1747207234899475825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 00:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7229a66c4d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E5XHR3014257
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 00:20:34 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcb8qpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 00:20:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 00:20:31 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 00:20:31 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-flask: Update the homepage
Date: Wed, 14 May 2025 15:20:31 +0800
Message-ID: <20250514072031.4080612-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2MiBTYWx0ZWRfXwb+041uYQLhI wZ/eV+3Jsmdk2D9O4gwRl2ETjif/0fU//RDqfX+qMhcrO0TJo508fLeaPVu8I7gPiMgWz0q8Pgs Dj6a1OKIgLKCUwDpHgIDskEF4iWJwGQgyuWw22cNNRi2Pcog/R/YHFwptzuYv4qSDF10UHwFwDM
 yf5ZfoDTIUh7RHHSXEXUHlyi4dR/zDxNv3L2H6imxqgZDCMjLPYc070hV97EYwQEFuTKCCF+Qkw HiiZRhgOu5mi7xJSMlxkljJ2yPGx9kgDYJ4EKtJEXofjM/EOYGYb4FOmAiNhUB1XmR8O4fqRzT9 P8xwJWBQTXIbbSZexu4tOJAh+UCdPlRHUN8lUnG/Y3QccgCo6CNxcRl1jttKcJh2PFBlFtj61PY
 GmbOh+fgg/HRFrFxwamTMP1i/Z9QsijXnB3jTZpCnn0Uo+IOJvj8bumSiNA4lxmc3Cn1WZYr
X-Proofpoint-GUID: Pu4nVZbprqDxHEKThXghaxloMePZIzUY
X-Proofpoint-ORIG-GUID: Pu4nVZbprqDxHEKThXghaxloMePZIzUY
X-Authority-Analysis: v=2.4 cv=LpWSymdc c=1 sm=1 tr=0 ts=68244442 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5qBrznAP3dz6ixwHqT4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=979 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505070000 definitions=main-2505140062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54E5XHR3014257
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 07:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117410

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb b=
/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
index 4d1d2d12e6..7e1988606e 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A microframework based on Werkzeug, Jinja2 a=
nd good intentions"
 DESCRIPTION =3D "\
 Flask is a microframework for Python based on Werkzeug, Jinja 2 and good=
 \
 intentions. And before you ask: It=E2=80=99s BSD licensed!"
-HOMEPAGE =3D "https://github.com/mitsuhiko/flask/"
+HOMEPAGE =3D "https://github.com/pallets/flask"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dffeffa59c90c9c4a033c7574f=
8f3fb75"
=20
--=20
2.34.1


