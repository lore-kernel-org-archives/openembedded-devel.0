Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F159CCD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 06:57:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73806.1780988236210178432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 23:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=U6O73vgb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062099a0b7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6595744R1636737
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 06:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=M5oe+D1OXmHVJftdwDMu
	kM0r0G2aZSA3vmIMJ7f/qbU=; b=U6O73vgbl6NnI0CfItlHq2JlRnSFZHLpLcyg
	imZGkTyRfEKr82YylE5/dHeHsBfXh/N6M6G3st4DHKbXUVUmFDdRVkDqCBsoWpaH
	tmI1JpX//+0drrtQleI6B7C+JEazjic1ldQddVWojp5A6GJ9arVO6MATwTwhqxvE
	3IknOSA0veHOBYUnQVi/Agevz9VMODtMvDbgGF7u0ZK7vqyr5cg1ozLx2fOtx59M
	vXyzpnU2EO5QXCextA+pMITlXaM2Kql55yZQr7Mztgilx0T71JGUQsOOqa/fhiw5
	Z7FIkQQLfy12kwPTIxugsbPV5q3dGKo87Qj6Tnq02AfnuvCrtw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7c244-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 23:57:13 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 23:57:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/4] xfce4-cpufreq-plugin: Fix aggregate init failure with gcc16
Date: Mon, 8 Jun 2026 23:57:09 -0700
Message-ID: <20260609065712.2888126-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX+wbuiuSeCGFt
 KaNWu7EUzlZkkG61NqX5MFX0dvNmj5pq1dEXd/Me+T4rmVwXWU62dz0B9Va+ohq6++ehDzREzJd
 IQduDGUEmAhLZnUYNCxIGxxy/uNUPKLLeLF3GY6eq+g7Jh5eQ5YltO3QQNPsxPHhQNThMjrbDLG
 c6TmJDey47Ql11lR2fr1f4wPMhM5DKnGpNC7PzXB11VhzecWQLplj2aUntbIDcw9jRmv9a8dJuB
 QaEXuqJZvCFwjjPRK+J5qc5PDKX/kTg3Hp1CIcPSiKwatZFATe3km3Z27Nna+RqRQ/KgKiLbCyN
 nJMwt17IWBuOLfaB4Lvb2Ajb7jAZmXutiK0tcejKpyKdK1HowFqoiKs4kvDeE3wWwvqPZBUeZeg
 ZdrdEmZ7guCPF5Cj7mvH994UYeurINqVi/EQciwN7ZD7+wc68N5WHhXH7+VSdQcjPNHirDxi1Hd
 V22dqZRVI6JtANbBogA==
X-Proofpoint-GUID: RKQzH54SO7890prqJMt048Z2Ux8zYcUX
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a27b94a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=eqq2J0SsU1-HwUAAjYkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=SYBONWESK5muIIdMMRMZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RKQzH54SO7890prqJMt048Z2Ux8zYcUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6595744R1636737
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127433

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   ../../../sources/xfce4-cpufreq-plugin-1.3.0/xfce4++/util/gtk.cc:25:37:=
 error: no matching function for call to 'xfce4::PluginSize::PluginSize(<=
brace-enclosed initializer list>)'
   25 | const PluginSize      RECTANGLE{true}, SQUARE{false};
      |                                     ^
  =E2=80=A2 there are 2 candidates
In file included from ../../../sources/xfce4-cpufreq-plugin-1.3.0/xfce4++=
/util/gtk.cc:21:
    =E2=80=A2 candidate 1: 'constexpr xfce4::PluginSize::PluginSize(const=
 xfce4::PluginSize&)'
      ../../../sources/xfce4-cpufreq-plugin-1.3.0/xfce4++/util/gtk.h:64:8=
:
         64 | struct PluginSize {
            |        ^~~~~~~~~~
      =E2=80=A2 no known conversion for argument 1 from 'bool' to 'const =
xfce4::PluginSize&'
    =E2=80=A2 candidate 2: 'constexpr xfce4::PluginSize::PluginSize(xfce4=
::PluginSize&&)'
      =E2=80=A2 no known conversion for argument 1 from 'bool' to 'xfce4:=
:PluginSize&&'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ix-aggregate-init-failure-with-gcc16.patch | 49 +++++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.3.0.bb     |  4 ++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq=
-plugin/0001-Fix-aggregate-init-failure-with-gcc16.patch

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin=
/0001-Fix-aggregate-init-failure-with-gcc16.patch b/meta-xfce/recipes-pan=
el-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-aggregate-init-failure-w=
ith-gcc16.patch
new file mode 100644
index 0000000000..b786d0d153
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-F=
ix-aggregate-init-failure-with-gcc16.patch
@@ -0,0 +1,49 @@
+From b9dc593f2843bd0f18309bde4d79b88d9f37e32f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 2 Jun 2026 23:07:08 -0700
+Subject: [PATCH] Fix aggregate init failure with gcc16
+
+Replace deleted default constructors with explicit bool constructors
+to fix aggregate init failure with gcc16.
+
+Upstream-Status: Submitted [https://gitlab.xfce.org/panel-plugins/xfce4-=
cpufreq-plugin/-/merge_requests/68]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ xfce4++/util/gtk.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xfce4++/util/gtk.h b/xfce4++/util/gtk.h
+index 1443cb2..ef03dd1 100644
+--- a/xfce4++/util/gtk.h
++++ b/xfce4++/util/gtk.h
+@@ -63,22 +63,22 @@ void connect(GtkToggleButton *widget, const char *si=
gnal, const std::function<vo
+=20
+ struct PluginSize {
+     bool rectangle; /* Whether the panel plugin size is forced to be a =
square. Otherwise, the plugin can be a rectangle. */
+-    PluginSize() =3D delete;
++    constexpr explicit PluginSize(bool r) : rectangle(r) {}
+ };
+=20
+ struct Propagation {
+     bool stop; /* Whether to prevent the event from propagating to othe=
r handlers */
+-    Propagation() =3D delete;
++    constexpr explicit Propagation(bool s) : stop(s) {}
+ };
+=20
+ struct TimeoutResponse {
+     bool again; /* Invoke the timeout handler again, otherwise stop the=
 timer */
+-    TimeoutResponse() =3D delete;
++    constexpr explicit TimeoutResponse(bool a) : again(a) {}
+ };
+=20
+ struct TooltipTime {
+     bool now; /* Whether to show the tooltip now or later */
+-    TooltipTime() =3D delete;
++    constexpr explicit TooltipTime(bool n) : now(n) {}
+ };
+=20
+ extern const PluginSize      RECTANGLE, SQUARE;
+--=20
+2.49.0
+
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin=
_1.3.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_=
1.3.0.bb
index a0b48b8671..093b43c88f 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.3.0.=
bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.3.0.=
bb
@@ -7,4 +7,8 @@ XFCE_COMPRESS_TYPE =3D "xz"
=20
 inherit xfce-panel-plugin perlnative
=20
+SRC_URI +=3D "\
+           file://0001-Fix-aggregate-init-failure-with-gcc16.patch \
+"
+
 SRC_URI[sha256sum] =3D "baa5b90f72e8c262777f1e246acae125af489e2c168a5f7f=
890d9d2b5567ec20"
--=20
2.49.0


