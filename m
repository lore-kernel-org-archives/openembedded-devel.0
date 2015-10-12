Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6657B65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 09:15:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9C9FH6p003940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 02:15:18 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 12 Oct 2015 02:15:17 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Oct 2015 17:15:33 +0800
Message-ID: <1444641333-11313-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] vim: do not autoenable the mouse
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
X-List-Received-Date: Mon, 12 Oct 2015 09:15:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The mouse being autoenabled is just annoying in xfce4-terminal (mouse
drag make vim go into visual mode and there is no right click menu),
so remove the setting for mouse.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-support/vim/vim_%.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-xfce/recipes-support/vim/vim_%.bbappend

diff --git a/meta-xfce/recipes-support/vim/vim_%.bbappend b/meta-xfce/recipes-support/vim/vim_%.bbappend
new file mode 100644
index 0000000..abd3128
--- /dev/null
+++ b/meta-xfce/recipes-support/vim/vim_%.bbappend
@@ -0,0 +1,6 @@
+do_install_append() {
+	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
+	# drag make vim go into visual mode and there is no right click menu),
+	# delete the block.
+	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${PN}/vimrc
+}
-- 
1.9.1


