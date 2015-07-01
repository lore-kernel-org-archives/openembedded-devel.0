Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8F360017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 09:06:31 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so22456763pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0hDWnmGQN0GtBDVOxTzgpnrrIzFgR0QAj9fscYTjpns=;
	b=oYDSlopCsP75igGz4zQeQiJzEl9EHISRmz4qeHUSmRj6scgwhwJ47R2UGAHiQ3HUw8
	1sFiTO7b/p96JLmKFnSgolqyBK31rJFF5L8yuor6AjV3X+ZxXvvboqtZdI8u8aFLWYyM
	FybDUOY83Dqvf1senjZV6Eh6vorzgf0MRpPUK5niX8qy0v9IV2Si6xopVqAI8OEU2CwJ
	adFGZ8OlqFxdHFEYhAVKuuZORcciFWacUqqfW4nJlsjhDBxuO0f44ctgJWCtnzkurEj7
	V2ahfURMz8SU44kXlWHGjk4E66YQFnGwQmeekWk2vy4e5B/Ii+K3i+jXvnXX2iJZkGkW
	l4xA==
X-Received: by 10.68.224.72 with SMTP id ra8mr53101704pbc.29.1435741591847;
	Wed, 01 Jul 2015 02:06:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id oo3sm1493111pac.31.2015.07.01.02.06.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 02:06:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2015 19:05:31 +1000
Message-Id: <1435741531-30306-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-qt5][PATCH] libconnman-qt5: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 09:06:39 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
new file mode 100644
index 0000000..0ca57e2
--- /dev/null
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -0,0 +1,17 @@
+require recipes-qt/qt5/qt5.inc
+
+SUMMARY = "Qt Library for ConnMan"
+HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
+DEPENDS += "qtbase qtdeclarative"
+PV = "1.0.89+git${SRCPV}"
+
+SRCREV = "79a8d10479ba55951ffa375a66797eedff230dd3"
+SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+RDEPENDS_${PN} += "connman"
-- 
2.4.4


