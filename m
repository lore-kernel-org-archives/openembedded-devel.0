Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4D41F60125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:47:26 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id y5-v6so6239140qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cbAsLK4Q+KfMoIVDbBjL2Hfb8CsioWFRnxA9Ni1OnNs=;
	b=ZvYCFGMWfo2BDy5fQie8OsMQMj1FLrF9To2lQBCyFeQpE8DFdoubVr0PDMdiue80+T
	2OA99Ktq9tHYYGGuYi7/0iUAE9OAO4MXAknJ9ZcBrr8NHEYGnWUdTxkz5NrFxXalJC/Q
	rDymLA0uNpw4UX/r2ljAQo3YgUx70UtXhxHARviXuj/hUquo8ltKvVyCNIC4E/444Dyg
	/JnlBXPke9NRpuO+bCIZkgQ3UpXGwy26MmnEZpX+i66AvaBQAOtICof3YcXwYjnNbClg
	PEPYASDPo4yvz3B8lslICLbWN0XgB1utMNjfWlVynxPYcQCofyNnjDiI1x9eYfn8+OWd
	rVUA==
X-Gm-Message-State: AOUpUlFelvspuRT9EYr3k83SpBnccILUbozNhT0S5wntZq366myvZOb1
	O3ll45xq94rtJfybiOROa+Zn4ovD7is=
X-Google-Smtp-Source: AAOMgpdxTWJIxO2PzMl9a5pK3bxMR3Scj4hK17c2TJwGWHdvfzib30+F7lNfiJ7WrBvRS65V5t2Uow==
X-Received: by 2002:ac8:3226:: with SMTP id
	x35-v6mr7644649qta.21.1532720846944; 
	Fri, 27 Jul 2018 12:47:26 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	p18-v6sm4378333qtp.3.2018.07.27.12.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 12:47:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 15:47:15 -0400
Message-Id: <1532720835-22690-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-ordered-set: update to version 3.0.1
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
X-List-Received-Date: Fri, 27 Jul 2018 19:47:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-ordered-set_3.0.0.bb => python3-ordered-set_3.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ordered-set_3.0.0.bb => python3-ordered-set_3.0.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb
index b731c28..662d3ee 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_3.0.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
 
-SRC_URI[md5sum] = "c8f5b99b717618803b914dd9cfe5ef43"
-SRC_URI[sha256sum] = "a34399fe6aa78358aaa00129d67c65b4aa099adfc023731b1d756c85776a89bb"
+SRC_URI[md5sum] = "a8059c7b99cde0f8dda01ddee6b43c2c"
+SRC_URI[sha256sum] = "3d6fd7bffbb15f613a9e8a6281bf97c2d67f7bb8677deca8249df2fbdd9cce7b"
 
 inherit pypi setuptools3
 
-- 
2.7.4


