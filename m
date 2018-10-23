Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4125179C23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 02:43:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9N2hpLb005045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Oct 2018 19:43:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 22 Oct 2018 19:43:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 23 Oct 2018 10:43:47 +0800
Message-ID: <1540262627-38314-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540262627-38314-1-git-send-email-mingli.yu@windriver.com>
References: <1540262627-38314-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 2/2] adduser: Update SRC_URI
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
X-List-Received-Date: Tue, 23 Oct 2018 02:43:51 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SRC_URI for adduser as the previous
one is invalid.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.117.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.117.bb b/meta-perl/recipes-perl/adduser/adduser_3.117.bb
index e5cefd4..ca96e11 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.117.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.117.bb
@@ -6,7 +6,7 @@ SECTION = "base/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${PV}/${BPN}_${PV}.tar.xz \
            file://adduser-add-M-option-for-useradd.patch \
 "
 
-- 
2.7.4


