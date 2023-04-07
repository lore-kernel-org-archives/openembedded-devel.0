Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49624C77B71
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:17:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3450.1680859050336503516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sRWL91a2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379BxVd006853
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 09:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=Nbm+la3jUDWmtFZcsIsRkWVjsA9RrlVkWXW5QTQY5bU=;
 b=sRWL91a2k4/F0Vx9fnWZvtQN9zK5iR95isKQzDdPbdEqtZmHVUA7J25QxtTQG2ixTiRK
 Yi1J/XEU2FO1vZLNe1S9/e6GBdP/JsJLU8kFZ5pRce5FOuPYpzPgWfgE3sWJitE8cOae
 zBaEg8cPvpxb6nvNV5j6KduwTKsukAXIDOa8YcEihJkhYmp1Ib4kgpv12PkfdUR1687m
 jjXclmtsX/EwsBlFxjeqaWfJ0jZGxMGJHiYviKoINKP/b74t3Qr0QEKXRl4f7cwPOATO
 7lMx9bOIt0sKhj6uODNbxxck73VsPlhSapmb4W3VDqaL4NUbMqdkMCl69zmbTAzxuNch rw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppbkbptb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 02:17:27 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 02:17:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/4] xfce4-notifyd: 0.6.3 -> 0.8.2
Date: Fri, 7 Apr 2023 17:17:19 +0800
Message-ID: <20230407091722.5576-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: k2w2S0egMm1N08jIlxV_l-VYmBpeJSOR
X-Proofpoint-ORIG-GUID: k2w2S0egMm1N08jIlxV_l-VYmBpeJSOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101979

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-notifyd from 0.6.3 to 0.8.2

* update HOMEPAGE that goodies.xfce.org has been decommissioned
* the content of license file has been updated but license not changed
* patch for configure.ac to get the absolute path of pkg-config variables
* drop dependencies dbus and dbus-glib that xfce4-notifyd has been
  ported to gdbus

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-notifyd-get-var-abs-path.patch      | 41 +++++++++++++++++++
 ...otifyd_0.6.3.bb => xfce4-notifyd_0.8.2.bb} | 12 +++---
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.3.bb => xfce4-notifyd_0.8.2.bb} (66%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
new file mode 100644
index 000000000..719267fd1
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
@@ -0,0 +1,41 @@
+Native pkg_config only return basename of the variable queried. Invoke `which`
+to get the absolute path.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0f49e2b..a589147 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,7 +116,7 @@ AC_MSG_CHECKING([for gdbus-codegen])
+ if test x"$GDBUS_CODEGEN" = x""; then
+     GDBUS_CODEGEN=`$PKG_CONFIG --variable=gdbus_codegen gio-2.0`
+ fi
+-if test -x "$GDBUS_CODEGEN"; then
++if test -x "$(which $GDBUS_CODEGEN)"; then
+     AC_MSG_RESULT([$GDBUS_CODEGEN])
+ else
+     AC_MSG_ERROR([could not find gdbus-codegen in \$PATH. You can run
+@@ -129,7 +129,7 @@ AC_MSG_CHECKING([for glib-compile-resources])
+ if test x"$GLIB_COMPILE_RESOURCES" = x""; then
+     GLIB_COMPILE_RESOURCES=`$PKG_CONFIG --variable=glib_compile_resources gio-2.0`
+ fi
+-if test -x "$GLIB_COMPILE_RESOURCES"; then
++if test -x "$(which $GLIB_COMPILE_RESOURCES)"; then
+     AC_MSG_RESULT([$GLIB_COMPILE_RESOURCES])
+ else
+     AC_MSG_ERROR([could not find glib-compile-resources in \$PATH. You can run
+@@ -142,7 +142,7 @@ AC_MSG_CHECKING([for glib-genmarshal])
+ if test x"$GLIB_GENMARSHAL" = x""; then
+     GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
+ fi
+-if test -x "$GLIB_GENMARSHAL"; then
++if test -x "$(which $GLIB_GENMARSHAL)"; then
+     AC_MSG_RESULT([$GLIB_GENMARSHAL])
+ else
+     AC_MSG_ERROR([could not find glib-genmarshal in \$PATH. You can run
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
similarity index 66%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
index 608660811..7dbd90c18 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Easily themable notification daemon with transparency effects"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
+HOMEPAGE = "https://docs.xfce.org/apps/notifyd/start"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
 DEPENDS = " \
-    dbus \
-    dbus-glib \
+    glib-2.0-native \
     libnotify \
     libxfce4util \
     libxfce4ui \
@@ -14,7 +14,9 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[sha256sum] = "56a9f895aed460042f2abe09bb1a899e29b7c7d5a76ecac63dead3ced990859f"
+SRC_URI:append = " file://xfce4-notifyd-get-var-abs-path.patch"
+
+SRC_URI[sha256sum] = "e3a28adb08daa1411135142a0d421e4d6050c4035a4e513a673a59460ff2ae84"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.17.1


