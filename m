Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38157C4708C
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:00:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.51704.1670342424259512005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 08:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ku1BJWGP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9339df9779=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6EinBK019000
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Dec 2022 08:00:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=iar1EnjFHswszByPSJ1M7PU0+K/pKkuQoSNh7sWg2Qk=;
 b=Ku1BJWGPw4DPcOTdROfdxap2Oybl7F63/62S4jAw6C7SHhxIZLr0+9zzC8nW/DjFL+mF
 Hri0O+M3/WhUvArXTHPkmEJoRLp4Vt6ZndIKhi5FUipJSgdV4aOJiWFc7wBXJX5zi8bO
 ryaq6fpRjnPslzWXIERMcydVLi80oJE2oLsofkiHdij6xYc/HnoKEPfaUzLrEQKXLjgL
 IUYHI4PL8MJqUp9knTrZF4DX4mrvzfYd5aFtR3FTr4yvUhK1/NpNQhDf46ckXWubyqzd
 bVTZjMptrltRPYMdJKdEK1bWlRMwUFSyGe3NkuagRXsl2RNK+NPra1YDE9UKByyLiK1v ig== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqtbu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 08:00:23 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 6 Dec 2022 08:00:22 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 6 Dec 2022 08:00:21 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <narpat.mali@windriver.com>,
        "Archana
 Polampalli" <archana.polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix CVE-2022-45062
Date: Tue, 6 Dec 2022 16:00:16 +0000
Message-ID: <20221206160016.4029521-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yNARN47xu0RH37yOdOV6tm_KPLzvRHS9
X-Proofpoint-GUID: yNARN47xu0RH37yOdOV6tm_KPLzvRHS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_10,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=740 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99959

Escape characters which do not belong into an URI/URL
In order to prevent argument injection in Xfce xfce4-settings

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45062

Upstream Status: Backport from
https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/55e3c5fb667e96ad1412cf249879262b369d28d7

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 83 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..5384617d5
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,83 @@
+commit 55e3c5fb667e96ad1412cf249879262b369d28d7
+Author: Alexander Schwinn <alexxcons@xfce.org>
+Date:   Mon Nov 7 09:56:31 2022 +0100
+
+    Escape characters which do not belong into an URI/URL (Issue #390)
+    
+    In order to prevent argument injection
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-settings/xfce-mime-helper.c
+index 7149951f..b797e03b 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -415,7 +415,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   gint          status;
+   gint          result;
+   gint          pid;
+-  const gchar  *real_parameter = parameter;
++  gchar        *real_parameter = NULL;
+ 
+   // FIXME: startup-notification
+ 
+@@ -427,23 +427,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   if (G_UNLIKELY (screen == NULL))
+     screen = gdk_screen_get_default ();
+ 
+-  /* strip the mailto part if needed */
+-  if (real_parameter != NULL && g_str_has_prefix (real_parameter, "mailto:"))
+-    real_parameter = parameter + 7;
++  if (parameter != NULL)
++    {
++      if (helper->category == XFCE_MIME_HELPER_WEBBROWSER || helper->category == XFCE_MIME_HELPER_FILEMANAGER)
++        {
++          /* escape characters which do not belong into an URI/URL */
++          real_parameter = g_uri_escape_string (parameter, ":/?#[]@!$&'()*+,;=%", TRUE);
++        }
++      else if (g_str_has_prefix (real_parameter, "mailto:"))
++        {
++          /* strip the mailto part if needed */
++          real_parameter = g_strdup (parameter + 7);
++        }
++      else
++        {
++          real_parameter = g_strdup (parameter);
++        }
++    }
+ 
+   /* determine the command set to use */
+-  if (exo_str_is_flag (real_parameter)) {
+-    commands = helper->commands_with_flag;
+-  } else if (exo_str_is_empty (real_parameter)) {
+-    commands = helper->commands;
+-  } else {
+-    commands = helper->commands_with_parameter;
+-  }
++  if (exo_str_is_flag (real_parameter))
++    {
++      commands = helper->commands_with_flag;
++    }
++  else if (exo_str_is_empty (real_parameter))
++    {
++      commands = helper->commands;
++    }
++  else
++    {
++      commands = helper->commands_with_parameter;
++    }
+ 
+   /* verify that we have atleast one command */
+   if (G_UNLIKELY (*commands == NULL))
+     {
+       g_set_error (error, G_SPAWN_ERROR, G_SPAWN_ERROR_INVAL, _("No command specified"));
++      g_free (real_parameter);
+       return FALSE;
+     }
+ 
+@@ -533,6 +553,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   if (G_UNLIKELY (!succeed))
+     g_propagate_error (error, err);
+ 
++  g_free (real_parameter);
+   return succeed;
+ }
+ 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
+SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch"
 SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
-- 
2.34.1


