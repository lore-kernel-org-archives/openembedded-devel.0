Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D7BC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48593.1681718183364202177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=TQ4ULm6r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3471b6e0c9=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H7cXew021839
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=yFfS1/nyG0ngP4+gaaZERkjJNBTvh1E5ZEPwO0cIEKo=;
 b=TQ4ULm6rAxSfnWr89+biPKAUP6vcb2dKxnMba5YyFlte27GXXUd52kcyA+CNbUMuIevB
 bMC8g4lv/jECnIy/RVd4bMw+h7svnYqlTxiKY6XcxlvwFOnvHPwmb8VKLz5ZzSQ39Eu4
 1CWFxMKR9WcKkeMZpiXsHZx/9v/O1hoIsDZiaoi0dTt1EiH1ZiD37CopegtH6PzZGl1n
 9jdlYFH0aVGJNqSm88DmGkn0d4hTgGeXLZ/6lHFm4WXWVFOVupjTRc4gR2dbVvbpjilc
 t/zZ68BrBVMot6SSmGEGr8oUQFMhqJqWPEw+lMav9jO1jtSFm70s2m2HyEl3hbIW02fk 4A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76j7br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 00:56:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 00:56:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/4] garcon: 4.18.0 -> 4.18.1
Date: Mon, 17 Apr 2023 15:56:15 +0800
Message-ID: <20230417075617.35121-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417075617.35121-1-kai.kang@windriver.com>
References: <20230417075617.35121-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: nVZbIHzVFBJgKr-hOzmvr8GZ3B7Qynbp
X-Proofpoint-GUID: nVZbIHzVFBJgKr-hOzmvr8GZ3B7Qynbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=946 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33H7cXew021839
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102122

From: Kai Kang <kai.kang@windriver.com>

Add GFDL-1.1-no-invariants-only to LICENSE since it states in license
file 'COPYING' [1]:

garcon's source code is licensed under the LGPLv2,
while its documentation is licensed under the GFDL 1.1 (with no
invariant sections).

Release notes for 4.18.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- garcon-gtk: Add missing lock when filling the GtkMenu
- Wait for any async operation to finish before releasing locks
- Use GIcons for menu icons instead of loading surfaces
- Revert "garcon-gtk: Fix menu icon blurriness when UI scale factor !=3D
1"
- Revert "Load icons using icon theme scaling functions correctly"
- garcon-gtk: Properly update GtkMenu is_populated state
- Load icons using icon theme scaling functions correctly
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Asturian,
  Basque, Belarusian, Bengali, Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Esperanto, Estonian, Finnish, French, Galician, Georgian,
  German, Greek, Hebrew, Hindi, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kabyle, Kazakh, Korean, Lithuanian,
  Malay, Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Telugu, Thai, Turkish,
  Ukrainian, Uyghur, Uzbek, Uzbek (Latin), Welsh

[1]: https://gitlab.xfce.org/xfce/garcon/-/blob/master/COPYING#L2

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../garcon/{garcon_4.18.0.bb =3D> garcon_4.18.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.18.0.bb =3D> garcon_4.18.=
1.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb b/meta-xfce/r=
ecipes-xfce/garcon/garcon_4.18.1.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb
index 6a1ee7b7f..c139bfd4c 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Xfce Menu Library"
 SECTION =3D "x11/libs"
-LICENSE =3D "LGPL-2.0-only"
+LICENSE =3D "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D04a01abcbdabffae1ca26335a2932=
76b"
 DEPENDS =3D "xfce4-dev-tools-native libxfce4ui intltool-native"
=20
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_che=
ck
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-xfce-applications.menu-don-t-bloat-settings-me=
nu-by-.patch"
-SRC_URI[sha256sum] =3D "54633487566a8b8502b71c11a7f719efe27c069bd5773cc9=
5f11ff4ea8f11a14"
+SRC_URI[sha256sum] =3D "fe7a932a6dac95eb1438f3fbfd53096756ff2e1cb179d10d=
0fb796cefbb4c20b"
=20
 EXTRA_OECONF =3D "--disable-gtk-doc"
=20
--=20
2.17.1


