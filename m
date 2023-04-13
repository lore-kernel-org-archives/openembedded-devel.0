Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1693C77B71
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:27:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5639.1681363643469593037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=AV/3AcLa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467d2966e=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D5PSvU026956
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=dJ7KoSjfqbRpcagOdSHF9sNQ2cIoXwfdQ87jqELbyLE=;
 b=AV/3AcLaAF3MxMsjPQAPgd14bi/X/mmpBWEete0ipMAlhGd4XTupZkrJzzLJ2iwlcYLP
 C03ZCgHOqn9qHI9g0w2gP8PqImxysc1IahwYfHjprRTdEGLszm4NTP9OsQAH4XbCZFCb
 8RbYyaz3GHrS2ls88AL2ZZeVhH7LItFJCQ9+2tahtzLG++2nW3R3Ml06mAFIFTbqzP5X
 4SaiI+HvdIuBFnWTDtdq11Lwr3jnY2e96oRYXRPPur2llaE8lUqyRTl54eq19m3bpSuO
 nfID780dk0MZtd7auuXvX7k55eBx1ATEe+CFkk8AaU9UkrVx3/28PxxsaSVPtn4kcGYa Vg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8r6bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 22:27:22 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 22:27:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 5/5] xfce4-settings: 4.18.0 -> 4.18.2
Date: Thu, 13 Apr 2023 13:27:15 +0800
Message-ID: <20230413052715.23982-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413052715.23982-1-kai.kang@windriver.com>
References: <20230413052715.23982-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: VdHDe2oLfVlmx0RZch19HgoHGoT9PoX9
X-Proofpoint-ORIG-GUID: VdHDe2oLfVlmx0RZch19HgoHGoT9PoX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_02,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=604
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304130049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33D5PSvU026956
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102072

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-settings from 4.18.0 to 4.18.2

* rebase 0001-xsettings.xml-Set-default-themes.patch

Release notes for 4.18.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Update copyright year
- mime-settings: Increase dialog size (!96)
- display: fix blurry 'help' indicator on output (#400, !95)
- display: fix blurry icon in profiles treeview
- display: fix blurry icons in minimal display settings dialog
- mime: fix blurry icons in default app menus
- mouse: fix blurriness in cursor theme previews
- appearance: fix blurry subpixel antialias icons
- appearance: fix blurry icon theme previews
- xfsettingsd: Make xsettings.xml well-formed (Fixes #431, !94)
- xfsettingsd: Remove duplicated config line (Fixes #425)
- Translation Updates:
  Albanian, Chinese (China), Dutch, English (Canada), English (United
  Kingdom), Finnish, Greek, Korean, Portuguese (Brazil), Turkish

Release notes for 4.18.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Bugfix release on the Xfce-4.18 branch. Here the changelog:

Bugfixes:
- xfsettingsd: Make CSD (client side decorations) for dialogs opt-in

Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Asturian, Basque, Belarusian,
  Belarusian (Tarask), Bulgarian, Catalan, Chinese (China), Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (Canada), English
  (United Kingdom), Estonian, Finnish, French, Galician, Georgian,
  German, Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlingue,
  Italian, Japanese, Kabyle, Kazakh, Korean, Lithuanian, Malay,
  Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/0001-xsettings.xml-Set-default-themes.patch       | 6 +++---
 .../{xfce4-settings_4.18.0.bb =3D> xfce4-settings_4.18.2.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.18.0.bb =3D=
> xfce4-settings_4.18.2.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.x=
ml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files=
/0001-xsettings.xml-Set-default-themes.patch
index 274454c01..3a4c00913 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-=
default-themes.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-=
default-themes.patch
@@ -22,11 +22,11 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index 65ba1ee..9efb3cd 100644
+index d8fe2ac..0f5246b 100644
 --- a/xfsettingsd/xsettings.xml
 +++ b/xfsettingsd/xsettings.xml
-@@ -1,8 +1,8 @@
- <?xml version=3D"1.0" encoding=3D"UTF-8"?>
+@@ -6,8 +6,8 @@
+=20
  <channel name=3D"xsettings" version=3D"1.0">
    <property name=3D"Net" type=3D"empty">
 -    <property name=3D"ThemeName" type=3D"empty"/>
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.b=
b
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
index 0692970f7..0a182273b 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] =3D "ed3f75837cb33cd694610fc87cd569c4782b7ac4e099143a=
3dbe8fff1f1c6a9d"
+SRC_URI[sha256sum] =3D "4661361087faae57efb49741ffcf90bf9078760e163bbdef=
63b924083bdc4f22"
=20
 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
=20
--=20
2.17.1


