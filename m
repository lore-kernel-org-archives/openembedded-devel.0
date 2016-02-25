Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEB876102
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:13:01 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b205so50124227wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k6KZYf5DlwUC/AMlR1wNWz/5ET0kGWTfexOr5GlJ+jo=;
	b=JIjE4Xk/WfVaLd0JVuQhwFz6TuvWiLHqnREA+6fmCs5at/DdhBVBufnmxuZef0DJdw
	q3EsVNIrkBeu9y02dcyt+IvR+dtCGCsLZEw6VUMNn/VREbBLPsCVhTgw/oHX2iM2GgJt
	Mr4RCMa42C+ynEsBiIiW0vc6Ua7LDBZ7OVJhVIGN0V5evEZkZhpVgmE0C9eJsmaYDXeo
	uSi1tao9fI3lSiku1oLkTGhBbxwQl5st4PNnGHMT5XpF+G6cZAISck+MFa4+dgbS4X+g
	7CRh3Vk8YizHCfM4qq99VsdbH3opPy7jEfnkVCkUzGauk1sBsL2QXlgmG3m/Q/zviDMa
	exvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k6KZYf5DlwUC/AMlR1wNWz/5ET0kGWTfexOr5GlJ+jo=;
	b=R5esz06YdHnA9iFe3dr4P2Cbp4fMDVbLFS8B3LFYWu3D465fmJMEE9ysxEN3H+sIYy
	hR+Yz7CEUNd8yHy4WdikCRH8DdLimRTLUWrq8yCfTIY7CBa/vWS1OCOt3LFCC0Bqu9RH
	Qhh0hhQQDwo4r0NoMUZgMslKdxgFmyCPp9G5rgdr6TvLyqjMQcMLg9g1o9ntuoSlV2bc
	Vzny19FY5Ok2m8u6FlRiMNtrbXUh7XQD5WqkS2zQJ7bDzqlhCpSE+N2Ugz+3dx8GoTJn
	PoroOdJociDTgj1YbDy7W8HxvIP5qhvuip7JqhiBqan5xz2w7hwCXwN7C42lJR7hPSeo
	FUoA==
X-Gm-Message-State: AG10YOQjVUTffNYA47yN2xsMD6becafMCnYmgrzAPe/GAnYrsTiJs8fN6Q/WSfK8WyyhTA==
X-Received: by 10.28.228.213 with SMTP id b204mr876494wmh.82.1456438381492;
	Thu, 25 Feb 2016 14:13:01 -0800 (PST)
Received: from localhost.localdomain (p4FDF1458.dip0.t-ipconnect.de.
	[79.223.20.88]) by smtp.googlemail.com with ESMTPSA id
	hx10sm2163102wjb.25.2016.02.25.14.13.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 14:13:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 23:12:47 +0100
Message-Id: <1456438369-28621-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/3] gtkmathview: fix and unblacklist
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
X-List-Received-Date: Thu, 25 Feb 2016 22:13:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

do_configure_prepend/sed can be removed: configure.ac does not contain
'AM_BINRELOC' anymore.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index bfd8ec6..3edbeed 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -17,9 +17,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-do_configure_prepend() {
-    sed -i -e s:AM_BINRELOC::g ${S}/configure.ac
+do_configure_append() {
+    # avoid host polution inf pkg-config files
+    sed -i "s:${STAGING_DIR_HOST}::g" `find -name '*.pc'`
 }
-
-# http://errors.yoctoproject.org/Errors/Details/35122/
-PNBLACKLIST[gtkmathview] ?= "BROKEN: ERROR: QA Issue: mathview-frontend-libxml2.pc, mathview-frontend-libxml2-reader.pc failed sanity test (tmpdir)"
-- 
2.5.0


