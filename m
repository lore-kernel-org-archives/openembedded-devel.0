Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 361FA60112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK9Woii016471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:32:50 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 01:32:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 01:32:42 -0800
Message-ID: <3145e4053027fcba97cb7b34ef267c2131fd99a8.1448011904.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448011904.git.liezhi.yang@windriver.com>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] nbd: use BPN in Files
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
X-List-Received-Date: Fri, 20 Nov 2015 09:32:49 -0000
Content-Type: text/plain

Issue: LIN8-1626

Fixed when build with multilib:
lib32-nbd-3.11: lib32-nbd: Files/directories were installed but not shipped in any package:
  /usr/sbin/nbd-client
  /usr/bin/nbd-trdump
  /usr/bin/nbd-server
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-nbd: 3 installed and not shipped files. [installed-vs-shipped]

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/nbd/nbd_3.11.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.11.bb b/meta-networking/recipes-support/nbd/nbd_3.11.bb
index 70dc7e9..0f0ae8e 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.11.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.11.bb
@@ -14,6 +14,6 @@ inherit autotools pkgconfig
 
 PACKAGES = "${PN}-client ${PN}-server ${PN}-dbg ${PN}-trdump ${PN}-doc"
 
-FILES_${PN}-client = "${sbindir}/${PN}-client"
-FILES_${PN}-server = "${bindir}/${PN}-server"
-FILES_${PN}-trdump = "${bindir}/${PN}-trdump"
+FILES_${PN}-client = "${sbindir}/${BPN}-client"
+FILES_${PN}-server = "${bindir}/${BPN}-server"
+FILES_${PN}-trdump = "${bindir}/${BPN}-trdump"
-- 
1.7.9.5


