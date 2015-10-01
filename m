Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 89753770A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:39 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so39001714wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2gFL7ynaI7/UYo2a7n9TuDZ7qG/aWkR/fNG5DnTCK6g=;
	b=HnazQmSo0ZsdDaQoG47a103eRVFyxBgF/OY2qgggJy1EX0833kBGymiaFR9ZLAS0+L
	XEFwduEtV0ZwEqK70CPpeRQs7FxQlkhklOKMDihBtIydYHWJZyz42eSQGwvaIAm+xvnq
	lN1pMQHc2WK5JsusuNmSPz+wLbMJeNr8GI9VUdloFng3Cc+MktiSaaJhB8kmtoULDZN9
	Hv2Msm+BsgCXAGVwpOOsq6mbbt3NUZv8YLRFwv/EkUC8n5a+eOi7bY+wPhc6PksPQCV8
	AQXiRM8ce7pnVoVvF+pdNDe7RDfWxX5vDQHTytGLbaSxeGN1D9s4Sd56eEFyqes1avl9
	mBrA==
X-Received: by 10.180.211.8 with SMTP id my8mr3765315wic.21.1443713379583;
	Thu, 01 Oct 2015 08:29:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id w1sm6659074wjz.37.2015.10.01.08.29.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:23 +0200
Message-Id: <1443713428-8635-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 05/10] epdf: Blacklist, old and not compatible with current poppler
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index e91eec5..a2adf6a 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -23,3 +23,5 @@ EXTRA_OECONF = "\
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
 
+# 2_0.1.0+svnr82070-r0/epdf/src/lib/poppler/epdf_poppler_main.cpp:52:24: error: 'class GlobalParams' has no member named 'getAntialias'
+PNBLACKLIST[epdf] ?= "BROKEN: fails to build with newer poppler"
-- 
2.6.0


