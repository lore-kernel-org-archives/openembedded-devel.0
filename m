Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66DC46BCDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 03:18:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x463IoNY002450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 20:18:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 20:18:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 5 May 2019 20:18:49 -0700
Message-ID: <20190506031849.37334-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pmtools: use update-alternatives for acpidump
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
X-List-Received-Date: Mon, 06 May 2019 03:18:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

acpidump is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:
...
|Error: Transaction check error:
|  file /usr/bin/acpidump conflicts between attempted installs of
pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 8491fc904..9afcbbb7f 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_${PN} = "acpixtract"
+ALTERNATIVE_${PN} = "acpixtract acpidump"
 
 do_configure[noexec] = "1"
 do_compile() {
-- 
2.21.0


