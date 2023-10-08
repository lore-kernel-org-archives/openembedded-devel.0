Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66B7E95A67
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 06:31:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33527.1696746715449779336
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Oct 2023 23:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rEDTXyla;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8645064759=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3986K2S2000890
	for <openembedded-devel@lists.openembedded.org>; Sat, 7 Oct 2023 23:31:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=bzmuF89Kng0sZhSXa8
	8Mkfyai5LVrbRpacjb5/+/n6A=; b=rEDTXylaN/Skm8BTd8KkQRX9pmdYmMNgzS
	ZV8Sgz/8rpUAUYSVfZePm+nimdj0PFsoSs19hdJHMcddVFe9p7rRqv8oD82bT6W1
	/fBWJGRViszK76NIym85XbM7CSIZOWpyM7FCAqPN5zMOnG8+YXLKeH4ij7TQNAY2
	sOyiz9HTG+sOcHfbi9mYjnnQLkmEa8Nm4KJ6Pkd091gwaaSX0UiiKc10aX3PFmra
	dFQ4na3Qpx/wOqI8TZrOmavBqeE7R+7v4SNLNxTcak1ql+t/AGHqVJMIdZ9Z8kCI
	bBtbrxQJltvzhigUqqGMfjavRiWkJOu23mTPbBzOWNcPmNc+2d3Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk6ufgha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 23:31:54 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 7 Oct 2023 23:31:52 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][mickledore][PATCH 1/1] lldpd: upgrade 1.0.16 -> 1.0.17
Date: Sun, 8 Oct 2023 06:31:33 +0000
Message-ID: <20231008063133.2302460-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: e6S-qbd9457KfB5xc2wEole4tNAPbABq
X-Proofpoint-ORIG-GUID: e6S-qbd9457KfB5xc2wEole4tNAPbABq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-08_03,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2310080058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3986K2S2000890
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 06:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105385

This release only contains bugfixes and security fixes.

Highlighted bugfixes in 1.0.17:
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82Read overflow when =
parsing CDP addresses. Thanks to Matteo Memelli.
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82Don't output empty =
lines on configure commands.
Changelog:
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82https://github.com/=
lldpd/lldpd/releases/tag/1.0.17

References:=E2=80=82
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82https://nvd.nist.gov/vuln/de=
tail/CVE-2023-41910

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.16.bb =3D> lldpd_1.0.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.16.bb =3D> lldpd=
_1.0.17.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb b/meta=
-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
index 799270510..aa29f4158 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.17.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "\
     file://run-ptest \
     "
=20
-SRC_URI[sha256sum] =3D "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8=
bb984711df8465a9"
+SRC_URI[sha256sum] =3D "9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9=
d08268efdc6127ce"
=20
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion =
github-releases ptest
=20
--=20
2.40.0


