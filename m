Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9AC731B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 08:19:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0E8JGjg001206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 00:19:16 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 14 Jan 2016 00:19:16 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jan 2016 16:19:06 +0800
Message-ID: <70276f3d9db0704d8aaee44f36bcb64547985c61.1452759356.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452759356.git.yi.zhao@windriver.com>
References: <cover.1452759356.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 1/4] debootstrap: fix host-user-contaminated
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
X-List-Received-Date: Thu, 14 Jan 2016 08:19:17 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: debootstrap: /debootstrap/usr/share/debootstrap/scripts/gutsy is owned by uid 1000,
which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debootstrap/debootstrap_1.0.67.bb              |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
index 73dea9b..62b2796 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
@@ -31,4 +31,5 @@ do_compile_prepend() {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
+    chown -R root:root ${D}${datadir}/debootstrap
 }
-- 
1.7.9.5


