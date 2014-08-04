Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30D5E65CAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:39:23 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so11631421vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=379e1p73iRFljKL4Y2MGCGlJoA8j49bZJabP96zMRZY=;
	b=cccD17+jerQVGz5QRT2ZcYs3prPWzlNE182ZqiomunJuRkTPwg4pdCwj4jGMJeIEQb
	PwuLqE3YMHO0XfbmdXVOZh69H6wjWUuRMJ7WIxlv37Een126YZ8fPffoEoIM4hqoOC+j
	CjPOpa0PvV2vCgE24H960Y1KxYiYeACX1jh5aGWwkIkuBDNtyi4X5fOgr5vFUn0BDKCS
	wfx2YyFiYpsGGfOUWX5elztZGHHqE5DHSaECLVsWXRg0tkpY7nODvAnXjo1HJU2mEhgd
	O3XLVQqNu+Bqi5KVKF8ZdCYLI2JXmIpFPUB8240DmMTeB+0Wg8Ng/+ZpLYYEvhU105SG
	bqog==
X-Received: by 10.221.41.135 with SMTP id tu7mr3601390vcb.70.1407177564013;
	Mon, 04 Aug 2014 11:39:24 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	u18sm45672879vdi.20.2014.08.04.11.39.21 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 11:39:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 15:38:34 -0300
Message-Id: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/2] evtest: Stop using Cgit based archive
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
X-List-Received-Date: Mon, 04 Aug 2014 18:39:29 -0000

The Cgit based archive may change depending on the order of images,
timestamp and like causing checksum to change.

This patch uses the same 1.25 version but fetching it using Git, so no
code changes are done.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/evtest/{evtest_1.25.bb => evtest_git.bb}  |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/evtest/{evtest_1.25.bb => evtest_git.bb} (55%)

diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_git.bb
similarity index 55%
rename from meta-oe/recipes-support/evtest/evtest_1.25.bb
rename to meta-oe/recipes-support/evtest/evtest_git.bb
index 640cec0..e4e4347 100644
--- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
+++ b/meta-oe/recipes-support/evtest/evtest_git.bb
@@ -7,8 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"
-SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
-SRC_URI[archive.sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
+SRCREV = "67f3dfefb0b5708ad5b692f19c1a3a5b135264ca"
+SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
+
+PV = "1.25+${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
1.7.10.4


