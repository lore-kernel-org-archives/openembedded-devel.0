Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E8E8A72D36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:02 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id fl12so204502pdb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=4gav+0eSyeOvEyz7uxG7ZrQn2NOziKVEpdKRU0sANlE=;
	b=PczdKHh8GUaw16CUzM6kwJs9kI+fkAEUcoYBP6rgiwiAzxk96FJ1xHW6F8biTdP1ES
	BZK9xtaPO+ixWYddmF08lRhnQDAx78xNy7oizXpC1vhOkXTg1xU0N4KFFvlOBHj9Zdhh
	+hOev87rfHcfCuMQJq34X5lT87G94r7UnhKb7atz0nVPZPo/IWk0T32odqnG0vYpCpJ+
	6MVdBQonPWsz3sGZx5fD5XH48vsvQh4ykkzsuSaw8MBJfYyrZ+llR7a/40nZPYFY4Elf
	mmrdyTti6lAnCLBNW1wMgNH4FcSaCe9+2Q+om5hg/BXVgex5aC1pBuN7iUb4TyfvXnV1
	eMIw==
X-Received: by 10.66.65.75 with SMTP id v11mr14680081pas.81.1422053643340;
	Fri, 23 Jan 2015 14:54:03 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:40 -0800
Message-Id: <cover.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/11] [Dizzy next] pull merge request
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:10 -0000

Please consider this changes for meta-openembedded dizzy

The following changes since commit 3b83aa44186fac44a679cd24a5ae64560cb4118f:

  xf86-video-glamo: fix build with xserver 1.16 (2015-01-18 16:40:55 -0800)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/dizzy-next
  https://github.com/akuster/meta-openembedded/tree/akuster/dizzy-next

Belal, Awais (1):
  iperf: fix out of tree configuration

Jackie Huang (8):
  meta-gnome: Add LAYERVERSION and LAYERDEPENDS
  meta-perl: Add LAYERVERSION and LAYERDEPENDS
  meta-python: Add LAYERVERSION and LAYERDEPENDS
  meta-ruby: Add LAYERVERSION and LAYERDEPENDS
  toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
  meta-efl: Add LAYERVERSION and LAYERDEPENDS
  meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
  meta-gpe: Add LAYERVERSION and LAYERDEPENDS

Otavio Salvador (1):
  nbench-byte: Fix license QA error

Qi.Chen@windriver.com (1):
  xmlto: remove recipe as it's in OE core

 meta-efl/conf/layer.conf                           |  6 +++
 meta-filesystems/conf/layer.conf                   |  6 +++
 meta-gnome/conf/layer.conf                         |  6 +++
 meta-gpe/conf/layer.conf                           |  6 +++
 meta-oe/licenses/nbench-byte                       | 10 +++++
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  1 +
 .../nbench-byte/nbench-byte_2.2.3.bb               |  2 +-
 .../xmlto-0.0.25/obsolete_automake_macros.patch    | 12 -----
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb      | 18 --------
 meta-perl/conf/layer.conf                          |  6 +++
 meta-python/conf/layer.conf                        |  6 +++
 meta-ruby/conf/layer.conf                          |  6 +++
 toolchain-layer/conf/layer.conf                    |  5 +++
 14 files changed, 111 insertions(+), 31 deletions(-)
 create mode 100644 meta-oe/licenses/nbench-byte
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
 delete mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 delete mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb

-- 
1.9.1


