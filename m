Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F03207E508
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:14:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5PDEOTI030285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 06:14:34 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 06:14:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Jun 2019 21:14:06 +0800
Message-ID: <1561468448-24834-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
References: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 3/5] xfce4-session: optional support polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 13:15:00 -0000
Content-Type: text/plain

If polkit not in DISTRO_FEATURES, it failed
...
|ERROR: Nothing PROVIDES 'polkit' (but meta-openembedded/meta-xfce/recipes-xfce/
xfce4-session/xfce4-session_4.13.2.bb DEPENDS on or otherwise requires it)
|polkit was skipped: missing required distro feature 'polkit' (not in DISTRO_FEATURES)
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xfce4-session', 'polkit']
...

Upstream optional support polkit:
https://github.com/xfce-mirror/xfce4-session/commit/560219ad500c73e0fc2c3d959f96bcb8e2a54556

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
index dc44c4b..7f7888e 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
     libsm \
     libxfce4ui \
     libxfce4util \
-    polkit \
     virtual/libx11 \
     xfconf \
 "
@@ -20,6 +19,9 @@ inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
+
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-- 
2.7.4


