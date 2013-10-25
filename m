Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E69766D2F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:04:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9P64YcO000915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 23:04:34 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 24 Oct 2013 23:04:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2013 14:04:34 +0800
Message-ID: <1382681074-9340-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] lowpan-tools: input python library and executable file dir
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
X-List-Received-Date: Fri, 25 Oct 2013 06:04:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

input python library and executable file dir, or else it will use the default
value /usr/lib/python*, which is wrong when enable multilibs

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index cf78b45..6e603ac 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -13,7 +13,10 @@ SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools python-dir
+
+EXTRA_OECONF += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR} \
+               am_cv_python_pyexecdir=${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_append() {
 	rmdir ${D}${localstatedir}/run
-- 
1.7.10.4


