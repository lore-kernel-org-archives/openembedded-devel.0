Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B550A65E6F
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:06:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A861DO026919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:06:01 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 01:06:01 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 16:05:56 +0800
Message-ID: <671510a94c564ebff683cb256f7c75eed4bb2085.1397117000.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397117000.git.Chong.Lu@windriver.com>
References: <cover.1397117000.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lvm2: add explicit selinux support control
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
X-List-Received-Date: Thu, 10 Apr 2014 08:06:01 -0000
Content-Type: text/plain

package has configure options controlling selinux support,
so we want to explicitly use them via PACKAGECONFIG.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 63d2cdb..c6a9ec0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -30,6 +30,10 @@ EXTRA_OECONF = "--with-user= \
                 --with-udev-prefix= \
 "
 
+PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+
 inherit autotools
 
 do_install_append() {
-- 
1.8.1.2


