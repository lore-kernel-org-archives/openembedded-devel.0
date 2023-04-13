Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1665C77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:27:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5637.1681363641191523110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O+M1uyzQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467d2966e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D5PVLj017449
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=p6TylTJCgf2f/F3zBMeK9P6eJm7F8xeUQ6UMU6QpsBM=;
 b=O+M1uyzQyGChsMQt1fIE2gdsJepxxtSs3AX4C1pu2cegN68LXQX6HuxpfI4+Hw3hKFUW
 s6lZcJcRNN6qvb+l5g61Kr9TZHbdV3KvXFSz1ATcIMEPykmQvnVrN9XqJAX7hgT0WF0Q
 9Gd8djq85WkYeXQLPGSoUO2u9Wt4hQRa6ALSPjHQclfp51P3z93KqLXydeBNxLHMgoE9
 l38+uebq1Ugp8PHE7m9hC5N78S1UT1lZLYKSl5nn/7vMO6C8WDAuAkmNeUKC+9tn0Gu7
 f6WfGjOq2RkA9XGQsTyQfZB4IqaXc5BmsGiZlBJ7f1UZzYSQlpiMI7goa8QTGrWst7Rz yw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7a2g6ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 22:27:20 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 22:27:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/5] xfce4-session: 4.18.0 -> 4.18.2
Date: Thu, 13 Apr 2023 13:27:13 +0800
Message-ID: <20230413052715.23982-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413052715.23982-1-kai.kang@windriver.com>
References: <20230413052715.23982-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sBRyaFQ8XqqH4OqoBSezZwK8QMcvFwid
X-Proofpoint-GUID: sBRyaFQ8XqqH4OqoBSezZwK8QMcvFwid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_02,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=15
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=852 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102070

From: Kai Kang <kai.kang@windriver.com>

Release notes for 4.18.2
========================
- manager: Fix GQueue memory management
- Fix Xfconf memory management
- Update bug report address
- Fix suspend/hibernation bug on ConsoleKit2 (Fixes #164)

Release notes for 4.18.1
========================
- Update copyright year
- Fix bus name acquisition/ownership (#54, !34)
- Use XfceScreensaver from Libxfce4ui (!35)
- build: Fix previous commit
- build: Fix autotools warnings
- Avoid duplicating directories in the tail of $XDG_* envs (#111, !21)
- settings: Fix memory leak
- libxfsm: Fix wrong return value
- Fix memory leaks when opening xfce4-session-settings
- Fix blurry session snapshots (!33)
- Fix blurry icons in autostart tab when UI scale > 1 (!33)
- build: Fix GTK deprecation warnings (!32)
- build: Fix some other GDK deprecation warnings (!32)
- build: Fix gdk_error_trap_push/pop() deprecation warnings (!32)
- build: Let xdt-depends.m4 macros set GLib macros (!32)
- build: Remove GDK_VERSION_MIN_REQUIRED/MAX_ALLOWED (!32)
- Make use of translations for run hooks (Fixes #156)
- Translation Updates:
  Greek, Portuguese, Turkish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-session_4.18.0.bb => xfce4-session_4.18.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.18.0.bb => xfce4-session_4.18.2.bb} (91%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
similarity index 91%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
index 25d30cebe..4021243e4 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
 inherit xfce update-alternatives features_check
 
 SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] = "38badb500b272012f494543a60a9c0563c381647cc95bed73b68aec0b0b89a7f"
+SRC_URI[sha256sum] = "01ff7fe8d4c2091adefc2925c6b7bb93152ba0732e95c9b9e64d8207fdbdeb8a"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.17.1


