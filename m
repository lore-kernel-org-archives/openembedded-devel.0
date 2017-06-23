Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED21C70178
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 05:36:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5N5akEB016420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:36:46 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Jun 2017 22:36:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 13:36:42 +0800
Message-ID: <cover.1498195991.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] rdate and rdist: add new recipe
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
X-List-Received-Date: Fri, 23 Jun 2017 05:36:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit d2da8b82cfb2f8e55236751c1c56c9e7f3b5f68d:

  scsirastools: Upgrade to 1.6.6 (2017-06-22 16:04:14 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_rdate-rdist_170623_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_rdate-rdist_170623_0

Jackie Huang (2):
  rdate: add new recipe
  rdist: add new recipe

 .../recipes-connectivity/rdate/rdate_1.5.bb        |   18 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch   |   75 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-bison.patch      |  147 ++
 .../rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch    | 2087 ++++++++++++++++++++
 .../rdist-6.1.5-fix-msgsndnotify-loop.patch        |   37 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch   |   25 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch        |  142 ++
 .../rdist/rdist-6.1.5/rdist-6.1.5-links.patch      |   79 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-linux.patch      |   28 +
 .../rdist-6.1.5-makefile-add-ldflags.patch         |   23 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch    |   16 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch    |   28 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch    |   59 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch        |   14 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch     |   85 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch       |   15 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch    |   16 +
 .../recipes-connectivity/rdist/rdist_6.1.5.bb      |   37 +
 18 files changed, 2931 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bison.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-msgsndnotify-loop.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-links.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-linux.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb

-- 
2.11.0


