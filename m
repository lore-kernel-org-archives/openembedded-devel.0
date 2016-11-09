Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29F8D605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 08:06:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA985wus015913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Nov 2016 00:06:02 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 00:05:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2016 15:58:50 +0800
Message-ID: <20161109075853.12636-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] Upgrade 3 benchmark packages
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
X-List-Received-Date: Wed, 09 Nov 2016 08:06:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build PASS on qemux86-64 qemuarm qemuppc and qemuarm64.
Build PASS iozone3 and phoronix-test-suite on qemumips64 that mips* are not compatible hosts for libhugetlbfs.


Kai Kang (3):
  iozone3: 434 -> 465
  libhugetlbfs: 1.19 -> 1.20
  phoronix-test-suite: 6.0.1 -> 6.6.1

 .../iozone3/{iozone3_434.bb => iozone3_465.bb}     |  9 +++---
 ...ugetlbfs-avoid-using-restrict-as-var-name.patch | 34 ----------------------
 .../libhugetlbfs/libhugetlbfs_git.bb               |  5 ++--
 ...suite_6.0.1.bb => phoronix-test-suite_6.6.1.bb} |  5 ++--
 4 files changed, 10 insertions(+), 43 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_434.bb => iozone3_465.bb} (92%)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_6.0.1.bb => phoronix-test-suite_6.6.1.bb} (89%)

-- 
2.10.1


