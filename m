Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5177C7710B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 07:26:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G7QqNI001029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 00:26:53 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 16 Oct 2015 00:26:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Oct 2015 15:27:09 +0800
Message-ID: <1444980429-14546-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH v2] vim: do not autoenable the mouse
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
X-List-Received-Date: Fri, 16 Oct 2015 07:26:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The mouse being autoenabled is just annoying in xfce4-terminal (mouse
drag make vim go into visual mode and there is no right click menu),
so remove the setting for xfce.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-support/vim/vim_%.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-xfce/recipes-support/vim/vim_%.bbappend

diff --git a/meta-xfce/recipes-support/vim/vim_%.bbappend b/meta-xfce/recipes-support/vim/vim_%.bbappend
new file mode 100644
index 0000000..25403e6
--- /dev/null
+++ b/meta-xfce/recipes-support/vim/vim_%.bbappend
@@ -0,0 +1,6 @@
+do_install_append() {
+	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
+	# drag make vim go into visual mode and there is no right click menu),
+	# delete the block.
+	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
+}
-- 
1.9.1


