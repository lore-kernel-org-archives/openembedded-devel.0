Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7AC78836
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9cQg013312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:38 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:09 -0500
Message-ID: <d543cde85ded7792c5f46df684ae6867f334a56e.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/15] meta-installer: add multipath-tools bbappend
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:37 -0000
Content-Type: text/plain

- Explicitly disable auto service to help installer work

- Copy multipath.conf from example

The bbappend works only if DISTRO = "anaconda".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/multipath-tools/multipath-tools_%.bbappend    | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-installer/recipes-support/multipath-tools/multipath-tools_%.bbappend

diff --git a/meta-installer/recipes-support/multipath-tools/multipath-tools_%.bbappend b/meta-installer/recipes-support/multipath-tools/multipath-tools_%.bbappend
new file mode 100644
index 0000000..5bd2b03
--- /dev/null
+++ b/meta-installer/recipes-support/multipath-tools/multipath-tools_%.bbappend
@@ -0,0 +1,8 @@
+SYSTEMD_AUTO_ENABLE_anaconda = "disable"
+
+do_install_append_anaconda () {
+    install -d ${D}${sysconfdir}/multipath
+    install -m 0644 ${WORKDIR}/multipath.conf.example \
+    ${D}${sysconfdir}/multipath.conf
+}
+
-- 
2.8.1


