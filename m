Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88E5F6FA3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 00:46:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D0kR4O001193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 17:46:27 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 17:46:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 08:46:10 +0800
Message-ID: <1402620392-7425-6-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/14] tftp-hpa: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 13 Jun 2014 00:46:29 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

It needs autotools-brokensep, otherwise do_install error:

make: *** No rule to make target `install'.  Stop.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 '                                                  |   21 ++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 '

diff --git a/' b/'
new file mode 100644
index 0000000..244cc72
--- /dev/null
+++ b/'
@@ -0,0 +1,21 @@
+radvd: inherit autotools-brokensep
+
+It needs autotools-brokensep, otherwise do_install error:
+
+install: cannot stat `radvd.conf.example': No such file or directory
+
+(LOCAL REV: NOT UPSTREAM) -- Waiting for updating upstream-master
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+# Please enter the commit message for your changes. Lines starting
+# with '#' will be ignored, and an empty message aborts the commit.
+# On branch wr-7.0-20140426
+# Your branch is ahead of 'origin/wr-7.0-20140426' by 10 commits.
+#   (use "git push" to publish your local commits)
+#
+# Changes to be committed:
+#   (use "git reset HEAD <file>..." to unstage)
+#
+#	modified:   recipes-daemons/radvd/radvd.inc
+#
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 6978e06..5baa61b 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
 SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
 
-inherit autotools update-rc.d update-alternatives
+inherit autotools-brokensep update-rc.d update-alternatives
 
 EXTRA_OECONF += "--disable-option-checking"
 
-- 
1.7.10.4


