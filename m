Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A40B6093B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 07:09:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4C7944V029491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 00:09:04 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 12 May 2017 00:09:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 May 2017 15:08:59 +0800
Message-ID: <cover.1494572274.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/3] update vblade and add freediameter and keepalived
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
X-List-Received-Date: Fri, 12 May 2017 07:09:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit fc03b3d9382dd5b6a8fff5f84e4c86a1acc9a73a:

  drbd-utils: fix dependency for perl under small-fs (2017-05-09 12:29:15 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_upstream-diameter-keepalived-vblade_170512_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_upstream-diameter-keepalived-vblade_170512_0

Jackie Huang (3):
  keepalived: add new recipe
  freediameter: add new recipe
  vblade: update to version 22

 .../recipes-daemons/keepalived/keepalived_1.3.5.bb |  49 +++++
 .../recipes-daemons/vblade/files/vblade.conf       |   2 +
 .../recipes-daemons/vblade/files/vblade.init       | 193 ++++++++++++++++++
 .../recipes-daemons/vblade/files/vblade.service    |  11 +
 .../vblade/files/volatiles.99_vblade               |   1 +
 .../recipes-daemons/vblade/vblade_20.bb            |  22 --
 .../recipes-daemons/vblade/vblade_22.bb            |  51 +++++
 ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223 +++++++++++++++++++++
 .../freediameter/files/freediameter.init           |  72 +++++++
 .../freediameter/files/freediameter.service        |  11 +
 .../freediameter/files/install_test.patch          |  22 ++
 .../freediameter/files/pass-ptest-env.patch        |  72 +++++++
 .../recipes-protocols/freediameter/files/run-ptest |  11 +
 .../freediameter/freediameter.inc                  |  98 +++++++++
 .../freediameter/freediameter_1.2.1.bb             |   7 +
 15 files changed, 823 insertions(+), 22 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.conf
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.init
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.service
 create mode 100644 meta-networking/recipes-daemons/vblade/files/volatiles.99_vblade
 delete mode 100644 meta-networking/recipes-daemons/vblade/vblade_20.bb
 create mode 100644 meta-networking/recipes-daemons/vblade/vblade_22.bb
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
 create mode 100755 meta-networking/recipes-protocols/freediameter/files/freediameter.init
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/freediameter.service
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/install_test.patch
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/run-ptest
 create mode 100644 meta-networking/recipes-protocols/freediameter/freediameter.inc
 create mode 100644 meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb

-- 
2.11.0


