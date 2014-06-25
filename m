Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08C6560CF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:36:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9aTai018124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:36:29 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 25 Jun 2014 02:36:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jun 2014 05:36:27 -0400
Message-ID: <1403688987-26915-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: work around rpm picking up perl as a dep
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
X-List-Received-Date: Wed, 25 Jun 2014 09:36:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Some perl example scripts cause RPM to add perl as a
dep, which we don't want, so remove x bit as work around
just like the ones for csh and awk.

Refer to:
1b088e4 vim: workaround nawk dependency problem with RPM
280d150 vim: workaround a dependency problem with RPM

I think a better solution might be:
Split the tools directory into a new package ${PN}-tools
and add RDEPENDS on csh, awk and perl for it and we don't
put it in RRECOMMENDS to install along with vim.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/vim/vim_7.4.258.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 7f88fa0..844be10 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -60,9 +60,10 @@ EXTRA_OECONF = " \
 "
 
 do_install_append() {
-    # Work around rpm picking up csh or awk as a dep
+    # Work around rpm picking up csh or awk or perl as a dep
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
 
     # Install example vimrc from runtime files
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-- 
2.0.0


