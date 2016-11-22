Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBB92719C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7XKUo007464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:20 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:19 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:30:59 +0800
Message-ID: <169bc585a5cef19ad249773e84500a0f98770be5.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 14/27] xfce-app.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

All xfce apps depend on gtk+ or xfce4-panel or libxfce4ui
which require x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/classes/xfce-app.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
index 8780ebf..1c31c2f 100644
--- a/meta-xfce/classes/xfce-app.bbclass
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -1,4 +1,6 @@
-inherit xfce
+inherit xfce distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-- 
2.8.3


