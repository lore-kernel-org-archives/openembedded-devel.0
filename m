Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD03065D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69FlG013590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:15 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:03 -0400
Message-ID: <cover.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe & meta-python][PATCH 0/9] add 9 recipes
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:17 -0000
Content-Type: text/plain

- 1 for meta-oe
- 8 for meta-python

//Hongxu

The following changes since commit 1cbd1bc195017312ba8cf670b340f61a2ac6207b:

  unionfs-fuse: 0.26 -> 2.0 (2017-07-14 23:45:53 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe1

Hongxu Jia (9):
  glade: add recipe 3.20.0
  python3-coverage: add recipe 4.4.1
  python3-langtable: add recipe 0.0.37
  python3-ntplib: add recipe 0.3.3
  python3-ordered-set: add recipe 2.0.2
  python3-requests-file: add recipe 1.4.2
  python3-requests-ftp: add recipe 0.3.1
  python3-pid: add recipe 2.1.1
  python3-prctl: add recipe 1.6.1

 .../glade/glade/remove-yelp-help-rules-var.patch   | 39 ++++++++++++++
 ...gnome-doc-utils.make-sysrooted-pkg-config.patch |  0
 .../{files => glade3}/0002-fix-gcc-6-build.patch   |  0
 meta-oe/recipes-devtools/glade/glade_3.20.0.bb     | 27 ++++++++++
 .../python/python3-coverage_4.4.1.bb               | 10 ++++
 .../python/python3-langtable_0.0.37.bb             | 22 ++++++++
 .../python/python3-ntplib_0.3.3.bb                 | 12 +++++
 .../python/python3-ordered-set_2.0.2.bb            | 10 ++++
 .../0001-remove-requirement-of-nose.patch          | 29 ++++++++++
 .../recipes-devtools/python/python3-pid_2.1.1.bb   | 14 +++++
 .../0001-support-cross-complication.patch          | 61 ++++++++++++++++++++++
 .../recipes-devtools/python/python3-prctl_1.6.1.bb | 22 ++++++++
 .../python/python3-requests-file_1.4.2.bb          | 14 +++++
 .../python/python3-requests-ftp_0.3.1.bb           | 14 +++++
 14 files changed, 274 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
 rename meta-oe/recipes-devtools/glade/{files => glade3}/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch (100%)
 rename meta-oe/recipes-devtools/glade/{files => glade3}/0002-fix-gcc-6-build.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/glade/glade_3.20.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pid/0001-remove-requirement-of-nose.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pid_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb

-- 
2.8.1


