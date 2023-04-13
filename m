Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C95C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:27:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5524.1681363640314853897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Djrpc1I3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467d2966e=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D5PSvT026956
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=EjR3mW0UfyHVQJ58cVD90+e0T0kn3yvAbh+lXTDBEss=;
 b=Djrpc1I3rlWwR77yL7yf932pTfxtfzk2ymUKGwQCoZV4aHEBt8luQcF40NkqRF+o4uZ+
 K7a7b4sWvBvmtSOzgPFD9535W7dBG0foMmXIl9YL/QW+SONbh0E/LVqwO8QMTI9o0feo
 4X3v0U+b8+2bbCekrL57QKyXt+aM6LkmhEKAb8ImroexcyN6rnDCIUytlOcclh4UiQ9E
 YUaDxSsKYKBQRDKcEFN7rVQFxV5miR5apvQMYSMH0jMdaIHfLS64E5YuQUU2xMV7w73T
 D6k3Lk6/X5hd1IkEfSlzVMKLRWpbn4KlxxtMR/rRmTpn70vsr2qDeVErmH8fIIN+28c5 QA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8r6br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 22:27:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 22:27:19 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 22:27:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/5] libxfce4ui: 4.18.0 -> 4.18.3
Date: Thu, 13 Apr 2023 13:27:12 +0800
Message-ID: <20230413052715.23982-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413052715.23982-1-kai.kang@windriver.com>
References: <20230413052715.23982-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: lYNEISA-k4m7ejDDEE7P7fA_CLeRP3LH
X-Proofpoint-ORIG-GUID: lYNEISA-k4m7ejDDEE7P7fA_CLeRP3LH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_02,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=797
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304130049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102069

From: Kai Kang <kai.kang@windriver.com>

Release notes for 4.18.3
========================
- Add comment about the need for gtk_widget_destroy()
- Fix memory management in Vala generated code
- Add annotation "(nullable)" where appropriate
- Replace deprecated annotation: "(allow-none)"
- Harden xfce_gtk_handle_tab_accels (thunar#1067)
- screensaver: Avoid Xfconf warning
- shortcuts-grabber: Ignore keyboard layout change
- screensaver: Fix Xfconf memory management

Release notes for 4.18.2
========================
- Update copyright year
- Add XfceScreensaver (!89)
- docs: Fix broken links
- shortcut-dialog: Use parent window for the grab if possible (Fixes #52)
- Fix memory leak
- Fix memory leaks

Release notes for 4.18.1
========================
Bugfix release on the 4.18 branch

- XfceFileNameInput - wrap error message (Issue #60)
- xfce4-about: Removed excess square brackets
- Revert "XfceShortcutsGrabber: Detect auto-repeat key press"
- Translation Updates:
  Hebrew, Russian, Swedish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxfce4ui/{libxfce4ui_4.18.0.bb => libxfce4ui_4.18.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.18.0.bb => libxfce4ui_4.18.3.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb
index 7ff9d1b12..417858c98 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "532247c4387c17bb9ef94a73147039b8d013c3131c95cdbd2fa85fbcc848d06b"
+SRC_URI[sha256sum] = "afa3a46eeed3ab612d2f7e1308edaf5819f6c33ccc16c13080efabd58f010abd"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.17.1


