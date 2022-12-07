Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497EAC4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 15:41:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18728.1670427709003110823
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 07:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=CzyYOu84;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9340273a0e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7EQaR1010129
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 07:41:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=K40epa3S1vSA9p5ceL9y/mUB5d4PPbhDWOiwdN7B9x0=;
 b=CzyYOu848tu85+0f4+fglPUl0CPJDuCnIsE9njhMy0vaRwke2+uWnKk33OdNTUpXbw3i
 rsWZTWOaoz7tUk77a3W9R15G+zZQk95uLe/Nl0hc3lupP5WDv7LYNnFdLIC4bKthF8y3
 yjYdhqaflp24qr4kA3UtgfC5CQMMgmRNvjuvyLN4fRVfOII5wLWwlUid4mNdtJX98AfT
 EVSxW1ASjMqTXL9U/HpSaVCHqh03w9HuPvHnCn+7yIB8TpnJVJ3XVKya/fSAXmDBHQI8
 AMwRi2yuaU0vgj4VJmdGDi042ssNogtjoesz16OiUDl22IMEVaWLUFPl7s4aVNxYhiJv zA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6ueqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 07:41:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 7 Dec 2022 07:41:47 -0800
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 7 Dec 2022 07:41:47 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Archana Polampalli <archana.polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix CVE-2022-45062
Date: Wed, 7 Dec 2022 23:41:43 +0800
Message-ID: <20221207154143.3623331-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-ORIG-GUID: mBYQytTdnfvJfLuv0A05kwHx3r8l6xMF
X-Proofpoint-GUID: mBYQytTdnfvJfLuv0A05kwHx3r8l6xMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=709 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070136
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B7EQaR1010129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 15:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99976

In Xfce xfce4-settings before 4.16.4 and 4.17.x before 4.17.1, there is a=
n
argument injection vulnerability in xfce4-mime-helper.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45062
https://gitlab.xfce.org/xfce/xfce4-settings/-/issues/390

Upstream Status: Backport from
https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/f1cb5bdafc6b9c71c541=
de267cc84a8c2ac32049

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 58 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-=
45062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.p=
atch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..1e999a7c6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,58 @@
+commit f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
+Author: Ga=C3=ABl Bonithon <gael@xfce.org>
+Date:   Sat Nov 12 22:27:36 2022 +0100
+
+    mime-settings: Properly quote command parameters
+   =20
+    Fixes: #390
+    MR: !85
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-set=
tings/xfce-mime-helper.c
+index 7149951f..b2d8e50d 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -453,8 +453,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+       /* reset the error */
+       g_clear_error (&err);
+=20
++      /* prepare the command */
++      if (exo_str_is_empty (real_parameter))
++        command =3D g_strdup (commands[n]);
++      else
++        {
++          /* split command into "quoted"/unquoted parts */
++          gchar **cmd_parts =3D g_regex_split_simple ("(\"[^\"]*\")", c=
ommands[n], 0, 0);
++
++          /* walk the part array */
++          for (gchar **cmd_part =3D cmd_parts; *cmd_part !=3D NULL; cmd=
_part++)
++            {
++              /* quoted part: unquote it, replace %s and re-quote it pr=
operly */
++              if (g_str_has_prefix (*cmd_part, "\"") && g_str_has_suffi=
x (*cmd_part, "\""))
++                {
++                  gchar *unquoted =3D g_strndup (*cmd_part + 1, strlen =
(*cmd_part) - 2);
++                  gchar *filled =3D exo_str_replace (unquoted, "%s", re=
al_parameter);
++                  gchar *quoted =3D g_shell_quote (filled);
++                  g_free (filled);
++                  g_free (unquoted);
++                  g_free (*cmd_part);
++                  *cmd_part =3D quoted;
++                }
++              /* unquoted part: just replace %s */
++              else
++                {
++                  gchar *filled =3D exo_str_replace (*cmd_part, "%s", r=
eal_parameter);
++                  g_free (*cmd_part);
++                  *cmd_part =3D filled;
++                }
++            }
++
++          /* join parts to reconstitute the command, filled and quoted =
*/
++          command =3D g_strjoinv (NULL, cmd_parts);
++          g_strfreev (cmd_parts);
++        }
++
+       /* parse the command */
+-      command =3D !exo_str_is_empty (real_parameter) ? exo_str_replace =
(commands[n], "%s", real_parameter) : g_strdup (commands[n]);
+       succeed =3D g_shell_parse_argv (command, NULL, &argv, &err);
+       g_free (command);
+=20
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
+SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch"
 SRC_URI[sha256sum] =3D "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4=
b85be9197da03d7e"
=20
 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
--=20
2.25.1


