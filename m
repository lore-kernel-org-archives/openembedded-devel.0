Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1C1C606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:18:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R8I99b004493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:18:09 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 01:18:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jul 2016 04:18:04 -0400
Message-ID: <3cf1856fd355bd299b70261cb98dc6b882d0d97c.1469607093.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469607093.git.jackie.huang@windriver.com>
References: <cover.1469607093.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libssh: upgrade to 0.7.3
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
X-List-Received-Date: Wed, 27 Jul 2016 08:18:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changelog:
version 0.7.3 (released 2016-01-23)
  * Fixed CVE-2016-0739
  * Fixed ssh-agent on big endian
  * Fixed some documentation issues

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.1.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.7.1.bb
rename to meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index 371e1ab..c0b8913 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.1.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
-SRCREV = "053f72c671a83b32238dc01b56a66752fb15b7ec"
+SRCREV = "cdf7690e038230623cbbf6b024ece62f41efa98d"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \
-- 
2.8.1


