Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42B7A73D48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 06:25:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t466PZo6022502
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 23:25:35 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 23:25:34 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 May 2015 14:25:33 +0800
Message-ID: <1430893533-29093-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] cifs-utils: upgrade to 6.4
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
X-List-Received-Date: Wed, 06 May 2015 06:25:37 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

6.4 fixed a CVE defect:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-2830
Stack-based buffer overflow in cifskey.c or cifscreds.c in cifs-utils
before 6.4, as used in pam_cifscreds, allows remote attackers to have
unspecified impact via unknown vectors.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 2b7a0dd..66ec7b8 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "http://wiki.samba.org/index.php/LinuxCIFS_utils"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PV = "5.9"
-PR = "r1"
+PV = "6.4"
 
-SRCREV = "353d491dcb5d69d31434abeb962c8e9a49c36867"
+SRCREV = "487f46da737291877867cbd3acb40fea087d3863"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.1.0


