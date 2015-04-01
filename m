Return-Path: <texier.pj2@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A1607724DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 09:13:50 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so58071104wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WJ7VibvEHs754fWnQytoXfJCXhdxMSrvcltxwbOO1yc=;
	b=TSQsdwJJoSW9vXufGBep7O9aW+06/qL//cxx9x4LmmYhV7WE1LU8zs54oEgwwWuXxd
	iSSx4OC3qjITUwuF1T5VT2jVdGvdPbmCYwOUeXmlHgxnKnmOjtopP/RoWfxIE8FvtAsX
	apHV4L5+FpKulaKCzut8ePMcqrlrJs+7VW57x1fxyx0NLoQleew8OJ1tJWS5gXc/pkoJ
	3f8rlps3es32uyYLYF185o8Zq4TEI6GD6mpQ9FiLh02Cu7SCKC+sn0wM2BFS9GEb5Oqt
	viG1DPu+2t5anj2dtIDVK1WpJbUsZBdoPeMWCK9swVe0DTCOf8zH6GtFhjefB5Z9WPBF
	oREQ==
X-Received: by 10.194.8.99 with SMTP id q3mr83607683wja.88.1427879631199;
	Wed, 01 Apr 2015 02:13:51 -0700 (PDT)
Received: from amplitude.amplitude.local ([46.20.167.230])
	by mx.google.com with ESMTPSA id pa4sm1754978wjb.11.2015.04.01.02.13.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 02:13:50 -0700 (PDT)
From: texierp <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Apr 2015 11:13:48 +0200
Message-Id: <1427879628-7499-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: texierp <ouf_du_45@hotmail.com>,
	Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
Subject: [meta-oe][PATCH] spitools : add new recipe
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
X-List-Received-Date: Wed, 01 Apr 2015 09:13:51 -0000

From: texierp <ouf_du_45@hotmail.com>

This tool allows you to test the SPI interface (through spidev).

Signed-off-by: Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/spitools/spitools_git.bb

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
new file mode 100644
index 0000000..20e545b
--- /dev/null
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "This package contains some simple command line tools to help using Linux spidev devices"
+HOMEPAGE = "https://github.com/cpb-/spi-tools"
+AUTHOR = "Christophe BLAESS"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
+
+SRCREV = "cc6a41fdcec60610703ba6db488c621c64952898"
+
+inherit autotools
+
-- 
1.9.1


