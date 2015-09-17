Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18FD076FF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:51:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7pSsU021708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:51:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:51:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Sep 2015 03:51:24 -0400
Message-ID: <cover.1442475733.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] [meta-initramfs] dracut: RDEPEND on systemd optionally & install modules to /usr/lib
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
X-List-Received-Date: Thu, 17 Sep 2015 07:51:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* Move the "PACKAGECONFIG" next to "EXTRA_OECONF".

The following changes since commit 1692d5c3020434404fc1ee6911a60b88287a5efb:

  netmap: add new package (2015-09-15 10:49:30 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/dracut
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/dracut

Robert Yang (1):
  dracut: RDEPEND on systemd optionally

Wenzong Fan (1):
  dracut: install modules to /usr/lib

 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
1.9.1


