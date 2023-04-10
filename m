Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD6C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:17:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43661.1681132655206001169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 06:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=pRY2wjnr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3464c2a9ec=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ADG5ij013683
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 06:17:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=dzdn7LYJWTRKE3o1EXifGXX153IOq2hoS/Tfh/VYV0I=;
 b=pRY2wjnrn4wTJ3QKXARnkg0dmdzYVSv+bg/sJ7ircJpBRckSdaj6mlTYK7lNaYEF/wle
 bbGcRhm23oYL92svSc+uH4c0PKne4AWKzrPQrdke7o0HREnzGeDMCr2I1C6y8zSYHPV2
 NUyyIdYSW8OexEZLL5IetcQekZ2tTM/hoONc5FuLQ4QpwLhYvRSzMLS1HPPYxBEaPZnn
 LU5FNUzrPmPj/y9KzO0gHbPgPmCavvxu8rq768SIImHPMKhFaSWl+zDDp/Jw9kQvo3ge
 M0B9Pi50HZmLtm3dA3PGlCr92TVqfMOtf6ykXo5wlgoyRJjh+Oh7UctWGckH8qXnVFhi Qw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snhm1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 06:17:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 06:17:34 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 06:17:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/2] thunar: 4.18.0 -> 4.18.4
Date: Mon, 10 Apr 2023 21:17:30 +0800
Message-ID: <20230410131730.4445-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230410131730.4445-1-kai.kang@windriver.com>
References: <20230410131730.4445-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 6sVcTxRaN_OXZrj3Idt_fEeCmzqu0AbX
X-Proofpoint-ORIG-GUID: 6sVcTxRaN_OXZrj3Idt_fEeCmzqu0AbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_09,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=696 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33ADG5ij013683
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 13:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102030

From: Kai Kang <kai.kang@windriver.com>

Release notes for 4.18.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Bugfix and translation release on the 4.18 branch

Bugfixes:
- Don't open folder when mounting device (Issue #919)
- Don't show full menu for unmounted devices (#1049)
- Support handling URIs via desktop file (#1044)
- Focus correct split pane on mouse click (#1039)
- Prevent wrong undo/redo notify (#1036)
- Support undo trash for linked paths (#1030)
- Always ask before delete files via undo (#1027)
- Fix use after free fault (#1031)
- Allow symlink creation on remote locations (#875)
- Prevent crash when closing window (#884)
- Keep directory specific sort details (#1017)
- Don't add extra-dot when creating links (#1019)

Translation Updates:
  Albanian, Arabic, Armenian, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (United Kingdom),
  Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Latvian, Malay, Norwegian Bokm=C3=A5l, Norwegian Nynors=
k,
  Occitan (post 1500), Persian (Iran), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Serbian, Slovak, Slovenian, Spanish, Swedish,
  Thai, Turkish, Ukrainian, Uyghur, Vietnamese

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/thunar/{thunar_4.18.0.bb =3D> thunar_4.18.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.18.0.bb =3D> thunar_4.18.=
4.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_4.18.4.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb
index 508416b03..921dba063 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb
@@ -10,7 +10,7 @@ inherit xfce gobject-introspection features_check mime-=
xdg perlnative
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[sha256sum] =3D "d1f4b080c97b9e390eff199aaaac7562fb20f031686f8d5e=
e5207e953bfc2feb"
+SRC_URI[sha256sum] =3D "c4463ce2fb1d628adce70a828e8b4de5fa0802236894d2c4=
0f749471619bedcc"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
--=20
2.17.1


