Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (unknown [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id C841777173
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Apr 2016 14:30:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [84.198.80.84])
	by mail.glycos.org (Postfix) with ESMTPSA id 55B4F42326;
	Sat,  9 Apr 2016 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1460212214;
	bh=pLryzQx/6pZxSMHPJd3POUZFo+VyNo3fQOjSAL8htLo=;
	h=From:To:Cc:Subject:Date;
	b=Kuivcg1oclPvPq+wyZdWAMLYceNw5t+FG0eWuTRRjZOzPOfB7fIMZy6twPRnht6b+
	dQN6XOYPO7eBLnFBSVaP6Uk6VUhPXNhNVE+VEunlo7zohVSJKjk7BkyrOhjElafjAr
	/8L17hBquXabXtwfHaTMsztxC/aP1Jc5R6DLZ1Wg=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2016 16:30:03 +0200
Message-Id: <1460212203-15909-1-git-send-email-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] Updated linuxptp to 1.6, most recent release.
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
X-List-Received-Date: Sat, 09 Apr 2016 14:30:18 -0000

No further updates were required, aside from changing the
checksums and renaming the file.

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 .../linuxptp/{linuxptp_1.4.bb => linuxptp_1.6.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_1.4.bb => linuxptp_1.6.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
index 4ee0c88..254b855 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.6.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
-SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
-SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
+SRC_URI[md5sum] = "6aa15d83f5a35f1fd076ba9adc4e7285"
+SRC_URI[sha256sum] = "e7fd16a9f235b059be527bd512e86f0c1d9f2e7c36736e6d6d9727a4427ac14c"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
 		EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
-- 
2.8.0


