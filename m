Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB4360778
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:59:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8K5xWCY004760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:59:32 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Sep 2016 22:59:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 13:42:22 +0800
Message-ID: <cover.1474348826.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/4] libtalloc/tevent/ldb/tdb: fixes for deterministic builds
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
X-List-Received-Date: Tue, 20 Sep 2016 05:59:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 24e387aaf78bc0f68a46abb1fab3a76364804bd1:

  openldap: fix CVE-2015-3276 (2016-09-19 16:24:10 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_waf-pkgs_160920_1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_waf-pkgs_160920_1

Jackie Huang (4):
  libtalloc: fixes for deterministic builds
  libtevent: fixes for deterministic builds
  libldb: fixes for deterministic builds
  libtdb: fixes for deterministic builds

 .../ldb-Add-configure-options-for-packages.patch   | 124 ++++++++++++++++++++
 .../recipes-support/libldb/libldb_1.1.27.bb        |  13 ++-
 ...talloc-Add-configure-options-for-packages.patch | 124 ++++++++++++++++++++
 .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |  16 ++-
 .../tdb-Add-configure-options-for-packages.patch   | 127 +++++++++++++++++++++
 .../recipes-support/libtdb/libtdb_1.3.10.bb        |  16 ++-
 ...tevent-Add-configure-options-for-packages.patch | 127 +++++++++++++++++++++
 .../recipes-support/libtevent/libtevent_0.9.29.bb  |  16 ++-
 8 files changed, 553 insertions(+), 10 deletions(-)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-options-for-packages.patch
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/talloc-Add-configure-options-for-packages.patch
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/tevent-Add-configure-options-for-packages.patch

-- 
2.8.3


