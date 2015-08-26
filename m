Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id CD94B734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 23:49:10 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so3484574pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B2VGehg2y9VPckDAJVFZ68d/G/nBJscv+vVwhkdu838=;
	b=0B6GFtFhcokirRxBWW2YETy5eNgFUFP1d8mVSz7zRCC+AHlXXL05nNpxBtH4NhMYYH
	MeLPajXT3qzjy50XJSVLOwr6Z+fsdik/UNjip41lltwJmCONTJVByF9kXfkqRzznvB4W
	YSkwzMVVHPQ+jGFaYl29f2u9Z8LOkcRBCVIpy/r18KyZUokO57rBYw+QZ4IpaVMflCgx
	zaBuqXwpKqDxNsGEWSLu0dDCREsGgbIRR3vW724HAj9BdzC3mSolloq4/hhxcx6FXUhj
	gPwtj0LUWhHbRcs5ktPGmAomgg8cjbyiDvrAb34FKvj9vMTYcPX+gyeqsyX1XBEs2fiv
	2rHg==
X-Received: by 10.68.243.103 with SMTP id wx7mr1994978pbc.60.1440632950225;
	Wed, 26 Aug 2015 16:49:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id da6sm195907pdb.22.2015.08.26.16.49.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 16:49:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 09:49:16 +1000
Message-Id: <1440632956-2359-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qttools: fix invalid PACKAGECONFIG QA warning for linguistonly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 23:49:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qttools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 59f51bd..a13fb74 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -24,6 +24,7 @@ FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-native ??= "linguistonly"
 PACKAGECONFIG_class-nativesdk ??= "linguistonly"
+PACKAGECONFIG[linguistonly] = ""
 PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
-- 
2.5.0


