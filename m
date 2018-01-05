Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23871786CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 06:53:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w056rxYT000171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jan 2018 22:53:59 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 4 Jan 2018 22:53:59 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jan 2018 14:52:06 +0800
Message-ID: <1515135126-3325-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515135126-3325-1-git-send-email-yi.zhao@windriver.com>
References: <1515135126-3325-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-oe][PATCH 3/3] vim: set CLEANBROKEN to fix rebuild
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
X-List-Received-Date: Fri, 05 Jan 2018 06:53:58 -0000
Content-Type: text/plain

Rebuilding vim would cause the following error:
  Makefile:4: ../auto/config.mk: No such file or directory
  make[1]: *** No rule to make target '../auto/config.mk'.  Stop.

Set CLEANBROKEN to "1" to fix this issue.

Also remove the redundant "inherit autotools".

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/vim/vim_8.0.0983.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
index f2edd51..44c868c 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
@@ -17,8 +17,9 @@ S = "${WORKDIR}/git/src"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools update-alternatives
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
+
+CLEANBROKEN = "1"
 
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
 do_configure () {
-- 
2.7.4


