Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 88D3777117
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 22:07:35 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n63so51872056qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 15:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nD40gyPs6YchXX/475K4NXuQYXyiWsJhwHivYGRSlCU=;
	b=Q9oeTQbMdkUFH96blZsztCbyvklmMi41QIOhv74AYBMy9czegCOwLT3oXhvx8qk7sd
	X7PGoakoZssxNELjRpNJsYk1UeMZZkSYk/SR8w4sF3N4BikmecCPg9V3wBjU0vlzwhpz
	NoLX+XdfatMR4iNc92115E/yT/JdQIlOZclGb0JDKkZBMUGB4mdluLkwKpwwDfK3BbKn
	dHCOP5XseY/H/UeT8TT0qx6h9iKKNf66tQ/KhdpPNryPcHYglL5yeZpiHDO1f/zjQWJX
	xaIgcxpNZ6T2EvMWAieGcnAV3lGr+KBlSn/JzL0U0nmJrDUHeedpGXMv2Fm7pFzoXEd1
	UEyA==
X-Gm-Message-State: AOPr4FW6iVYGp7oXrgQrSKd89/+6rxrwodBlWcDX+i2suXoA8ou5MPBtx4e5B4YJFwSx+Q==
X-Received: by 10.55.21.34 with SMTP id f34mr22910125qkh.101.1461967656454;
	Fri, 29 Apr 2016 15:07:36 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	c68sm2020768qgc.12.2016.04.29.15.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 15:07:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 18:07:32 -0400
Message-Id: <1461967652-14543-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCHv2] tinymembench: update to version 0.4.0 plus bug fixes
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
X-List-Received-Date: Fri, 29 Apr 2016 22:07:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 9898a70..38e71be 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "https://github.com/ssvb/tinymembench/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b345"
 
-PV = "0.3.9+git${SRCPV}"
+PV = "0.4.0+git${SRCPV}"
 
-SRCREV = "95e68477588d41187b2d2e52ecf6be0e7eb06b8d"
+SRCREV = "2c789849709d837b4bd114c11ed2d9bdc65afbc6"
 SRC_URI = "git://github.com/ssvb/tinymembench.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


