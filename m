Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UUlLA-0005Ss-2N
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 00:05:32 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 6F404EA040
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 00:18:41 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A5438A460F3; Tue, 23 Apr 2013 23:48:34 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 23:48:23 +0200
Message-Id: <cover.1366753073.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-opie][PATCH 0/1] Pull request 20130423
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 22:06:38 -0000

Hello,

The patch that comes as a follow-up of this message fix a compile
error when building uicmoc-native with GCC-4.7.

The modifications are done on top of the master branch in the
meta-opie layer, and tested by building uicmoc-native from scratch.

Please pull into the meta-opie layer.

The following changes since commit c242efc6ca55772a88602f1f8f94dff697b38430:

  layer.conf: use ??= to set variables (2013-03-25 22:42:32 +0000)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-opie.git fix-uicmoc-build

Apelete Seketeli (1):
  uicmoc: fix compile issue with GCC-4.7

 recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch |   11 +++++++++++
 recipes-qt/uicmoc/uicmoc_2.3.10.bb           |    1 +
 2 files changed, 12 insertions(+)
 create mode 100644 recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch

-- 
1.7.10.4



