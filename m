Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 044656FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:04:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v52850he021273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jun 2017 01:05:00 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Jun 2017 01:05:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jun 2017 16:04:55 +0800
Message-ID: <cover.1496390474.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] umip: several fixes
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
X-List-Received-Date: Fri, 02 Jun 2017 08:05:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit b063789560bfb9c60a7a15277b5b3a9839b5ba74:

  libgpiod: add new recipe (2017-05-23 15:59:31 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_umip_170602_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_umip_170602_0

Jackie Huang (3):
  umip: fix for parallel compilation
  umip: add systemd and sysvinit support
  umip: fix EXTRA_OECONF and add RRECOMMENDS

 ...ependency-to-support-parallel-compilation.patch |  23 +++++
 meta-oe/recipes-connectivity/umip/files/mip6d      | 112 +++++++++++++++++++++
 .../recipes-connectivity/umip/files/mip6d.service  |  10 ++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |  27 ++++-
 4 files changed, 168 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
 create mode 100755 meta-oe/recipes-connectivity/umip/files/mip6d
 create mode 100644 meta-oe/recipes-connectivity/umip/files/mip6d.service

-- 
2.11.0


