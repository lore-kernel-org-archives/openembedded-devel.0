Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C701260746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:25:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO9Pc0T012173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 01:25:38 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 24 Nov 2015 01:25:36 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Nov 2015 17:25:25 +0800
Message-ID: <ddde4f5e5947759afc3ec2ab7e1770cf7cc4861b.1448356894.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448356894.git.yi.zhao@windriver.com>
References: <cover.1448356894.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 2/3] tmux: add PACKAGECONFIG for utempter
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
X-List-Received-Date: Tue, 24 Nov 2015 09:25:37 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: tmux rdepends on libutempter, but it isn't a build
dependency? [build-deps]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/tmux/tmux_2.1.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
index 6e2c88d..bf21de5 100644
--- a/meta-oe/recipes-extended/tmux/tmux_2.1.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
@@ -15,3 +15,7 @@ S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
+
-- 
1.7.9.5


