Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6010C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 13:54:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.157095.1672149256515008382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 05:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=mEnQjBrU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRDhmOc008170;
	Tue, 27 Dec 2022 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=A3KQalZWKQjHAMJ7kCdGRpyeMBYSZ4ODcwvVvEevvrA=;
 b=mEnQjBrUBFN1PjGYSDtBYp6JWGgsAdxE/9w1rQ2rpeCQtkVGnJchpolTe3+EZm7uTIox
 fRGoPdHWuTziS73w2b6u3IUw+UnufZLQRO2LfGoJxvIDN9qePnHB0MF3SWH4sbNP84+/
 yIF2qwIcYMiz4ddEQhtu9F8bpvgUIPv3g+6d4F4l8skkHpY/eAcDoks0lh5stpKhuSKf
 fXKMTl10zweHSk4uHTwpz+cE4023mXUj0ofTragvoXVa5hrvVbIDj5vQ39prek2j/M8M
 NrkCO4CrTRshm6z7cJj/wTnaPXofoQdTRrWBpDYs2nadqtQQxvsjMRrJsK1dlwjfLpBK iQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda1r1m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 13:54:14 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 05:54:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 05:54:13 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH v2 1/2] libxfce4ui: 4.16.1 -> 4.18.0
Date: Tue, 27 Dec 2022 21:54:10 +0800
Message-ID: <20221227135411.5608-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227135411.5608-1-kai.kang@windriver.com>
References: <20221227135411.5608-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: j5g22zLVc4rRvFenFJYUqwI35ITxDWzc
X-Proofpoint-GUID: j5g22zLVc4rRvFenFJYUqwI35ITxDWzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_10,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270114
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BRDhmOc008170
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 13:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100285

From: Kai Kang <kai.kang@windriver.com>

Update libxfce4ui from 4.16.1 to 4.18.0. And update license which should
be LGPL-2.0-or-later according to

https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/797b7a6b

and

https://gitlab.xfce.org/xfce/libxfce4ui/-/blob/master/COPYING#L457
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch | 10 +++++-----
 .../{libxfce4ui_4.16.1.bb =3D> libxfce4ui_4.18.0.bb}     |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb =3D> libx=
fce4ui_4.18.0.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-libxfce4kb=
d-private-xfce4-keyboard-shortcuts.xml-fix.patch b/meta-xfce/recipes-xfce=
/libxfce4ui/libxfce4ui/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.=
xml-fix.patch
index 616142761..53ba87374 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-libxfce4kbd-priva=
te-xfce4-keyboard-shortcuts.xml-fix.patch
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-libxfce4kbd-priva=
te-xfce4-keyboard-shortcuts.xml-fix.patch
@@ -11,15 +11,15 @@ Upstream-Status: Pending
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
=20
 ---
- libxfce4kbd-private/xfce4-keyboard-shortcuts.xml |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
+ libxfce4kbd-private/xfce4-keyboard-shortcuts.xml | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
 diff --git a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml b/libxfce4=
kbd-private/xfce4-keyboard-shortcuts.xml
-index 723a10d..e6502f3 100644
+index 32901e3..8189c4c 100644
 --- a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
 +++ b/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
-@@ -75,4 +75,8 @@
-       <property name=3D"<Super>KP_Next" type=3D"string" value=3D"tile_d=
own_right_key"/>
+@@ -96,4 +96,8 @@
+       <property name=3D"&lt;Super&gt;KP_Next" type=3D"string" value=3D"=
tile_down_right_key"/>
      </property>
    </property>
 +  <property name=3D"providers" type=3D"array">
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
index 692c79f3c..7ff9d1b12 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Xfce4 Widget library and X Window System interaction"
 SECTION =3D "x11/libs"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
 DEPENDS =3D "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-to=
ols xfconf"
=20
 inherit xfce gtk-doc gobject-introspection features_check
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 # TODO: Check if 0001-... can go
 SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.x=
ml-fix.patch"
-SRC_URI[sha256sum] =3D "d96946ae5af6bf078dda415419e0021909f763ee0020b42f=
3e26f603e51585f6"
+SRC_URI[sha256sum] =3D "532247c4387c17bb9ef94a73147039b8d013c3131c95cdbd=
2fa85fbcc848d06b"
=20
 EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
 EXTRA_OECONF +=3D "--disable-vala"
--=20
2.34.1


