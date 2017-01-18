Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E23F71A62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 22:26:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IMQflj000701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 14:26:41 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 14:26:40 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jan 2017 14:26:40 -0800
Message-ID: <1484778400-11041-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] gnulib: derive PV from SRCPV
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
X-List-Received-Date: Wed, 18 Jan 2017 22:26:42 -0000
Content-Type: text/plain

Currently, PV is "git" and contains no version information.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-oe/recipes-support/gnulib/gnulib_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
index 5b2ed49..96f0893 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_git.bb
@@ -12,8 +12,10 @@ LICENSE = "LGPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4cf3810f33a067ea7ccd2cd889fed21"
 SRCREV = "b6b3ed1fa4c6de12908a9f01d1689f156c3cd441"
+PV = "git+${SRCPV}"
 SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
 "
+
 S = "${WORKDIR}/git"
 
 do_install () {
-- 
1.7.9.5


