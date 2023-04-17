Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B1C77B7D
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48594.1681718186110245754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=czVguV33;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3471b6e0c9=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H6GhT2020197
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=U0DS5sJKkcyj3UliTX6rvNNORsAIxvmnPYYwvow/Km0=;
 b=czVguV33snHXyZxt3ND0/FEPotHQBUUEqZXhIL3BJXwVZhUKFuZJMI1xwM/XWvzBk0Cs
 Vc3txmWS4vecw3cPCXFUmgRfF8za2jOlc9AEXGMHKZMxf4RKnbLanYqZidjqqieZkhU2
 +yJZelOuxzd/91VHMlSr7wo5RZI/Qr02R7F5wJB+H7wY4ZWiaQ/a6MEkn7KafciOC2cn
 4sEj+Q1NU+MDCygtvZYG/6ba/UVvFgr2mo7Yo3zksHXxQM8p78MjwzE8wSNfP8rFFg84
 45rJ9GTSNOlPB4S/nHdg+FxSBSuLlU08olZPmx17thy069ZaGFpoAyO1kQTD+LS4Lo7h Aw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q01kdhnss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 00:56:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 00:56:24 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 00:56:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/4] xfce4-screensaver: 4.16.0 -> 4.18.1
Date: Mon, 17 Apr 2023 15:56:17 +0800
Message-ID: <20230417075617.35121-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417075617.35121-1-kai.kang@windriver.com>
References: <20230417075617.35121-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: zKBkg1CCrTM5NJHVHRuNyLrrhW4jDUst
X-Proofpoint-GUID: zKBkg1CCrTM5NJHVHRuNyLrrhW4jDUst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=750 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33H6GhT2020197
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102125

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-screensaver from 4.16.0 to 4.18.1

* rebase fix-cross-compile.patch

Release notes for 4.18.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This release is to fix a build issue on BSD systems

- Refactor spawn_make_environment_for_display()

Release notes for 4.18.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add copyright notice to configure.ac
- Make missing GNOME Keyring PAM module warning quiet (Fixes #46)
- build: Fix --disable-locking (Fixes #83)
- Remove duplicated lines in README (Fixes #109)
- savers: Fix critical warnings on exit
- savers: Fix critical warnings from GSThemeWindow on "realize"
- Do not redirect stderr for our own commands
- Round the user picture on lock dialog.
- build: Do not warn if PAM prefix is correct
- Improve lightdm detection (Fixes #39)
- build: Fix -Wunused-value compiler warning
- build: Fix -Wdeclaration-after-statement compiler warning
- build: Fix -Wsign-compare compiler warning
- build: Use XDT_FEATURE_DEBUG
- Fix use-after-free crash in xfce4-screensaver-dialog
- Fix D-Bus sleep inhibit when screen locker is disabled
- Complete previous commit
- Fix Xfconf memory management
- build: Set GLib macros via XDT_CHECK_PACKAGE
- autogen.sh: Do not `mkdir m4`
- Fix crash when XDG_PICTURES_DIR is not set (Fixes #86)
- Fix build warning from Clang
- --with-password-helper expects full pathname of password helper
- Add missing zeroing of timeout_id in dialog_timed_out() timer handler
- Fix wrong signal name for GtkSpinButton
- Remove ENABLE_NLS ifdefs and use xfce_textdomain()
- build: Fix intltool lock file problem during make distcheck
- Fix compilation warnings
- autoconf: Some updates
- Translation Updates:
  Albanian, Armenian (Armenia), Basque, Belarusian, Bulgarian, Catalan,
  Chinese (China), Chinese (Taiwan), Danish, Dutch, Eastern Armenian,
  English (Australia), Estonian, Finnish, French, Galician, German,
  Hebrew, Hungarian, Icelandic, Indonesian, Italian, Japanese, Kabyle,
  Korean, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Polish, Portuguese,
  Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Thai, Ukrainian

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-screensaver/fix-cross-compile.patch      | 14 +++++++++-----
 ...saver_4.16.0.bb =3D> xfce4-screensaver_4.18.1.bb} |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.16.=
0.bb =3D> xfce4-screensaver_4.18.1.bb} (91%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/f=
ix-cross-compile.patch b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-s=
creensaver/fix-cross-compile.patch
index f726064e2..eabcaaae6 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cros=
s-compile.patch
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cros=
s-compile.patch
@@ -6,11 +6,15 @@ Upstream-Status: Inappropriate [cross compile specific]
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
+---
+ configure.ac | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
 diff --git a/configure.ac b/configure.ac
-index f0ec537..05c393d 100644
+index 6f149bb..3890677 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -230,9 +230,9 @@ dnl ------------------------------------------------=
---------------------------
+@@ -237,9 +237,9 @@ dnl ------------------------------------------------=
---------------------------
  #
  AC_DEFUN([AC_CHECK_X_HEADER], [
    ac_save_CPPFLAGS=3D"$CPPFLAGS"
@@ -23,7 +27,7 @@ index f0ec537..05c393d 100644
    CPPFLAGS=3D"$CPPFLAGS $X_CFLAGS"
    AC_CHECK_HEADER([$1],[$2],[$3],[$4])
    CPPFLAGS=3D"$ac_save_CPPFLAGS"])
-@@ -241,9 +241,9 @@ AC_DEFUN([AC_CHECK_X_HEADER], [
+@@ -248,9 +248,9 @@ AC_DEFUN([AC_CHECK_X_HEADER], [
  #
  AC_DEFUN([AC_TRY_X_COMPILE], [
    ac_save_CPPFLAGS=3D"$CPPFLAGS"
@@ -34,9 +38,9 @@ index f0ec537..05c393d 100644
 +#    CPPFLAGS=3D"$CPPFLAGS -I$includedir"
 +#  fi
    CPPFLAGS=3D"$CPPFLAGS $X_CFLAGS"
-   AC_TRY_COMPILE([$1], [$2], [$3], [$4])
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[$1]], [[$2]])], [$3], [$4])
    CPPFLAGS=3D"$ac_save_CPPFLAGS"])
-@@ -257,15 +257,15 @@ AC_DEFUN([AC_CHECK_X_LIB], [
+@@ -264,15 +264,15 @@ AC_DEFUN([AC_CHECK_X_LIB], [
    ac_save_LDFLAGS=3D"$LDFLAGS"
  #  ac_save_LIBS=3D"$LIBS"
 =20
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4=
.16.0.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.1=
8.1.bb
similarity index 91%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.=
16.0.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18=
.1.bb
index 685c4c1f6..2c5cba0d8 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.b=
b
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.b=
b
@@ -13,7 +13,7 @@ DEPENDS =3D "dbus-glib garcon gtk+3 libxklavier libxscr=
nsaver virtual/libx11 xfcon
 inherit xfce-app
=20
 SRC_URI:append =3D " file://fix-cross-compile.patch"
-SRC_URI[sha256sum] =3D "6d4d143e3e62db679ce83ce7da97903390773ee0a8ceb05f=
f4c3dac36616268d"
+SRC_URI[sha256sum] =3D "b731e8abd68a18cc5d3b523351aa8f9f293c9f63290c1781=
c9155259deb04a5c"
=20
 do_install:append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sys=
confdir}/pam.d/xfce4-screensaver
--=20
2.17.1


