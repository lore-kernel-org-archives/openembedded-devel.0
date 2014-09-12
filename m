Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7453D71403
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 08:58:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8C8wlBR009373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 01:58:48 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 01:58:47 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Sep 2014 04:58:45 -0400
Message-ID: <cover.1410511720.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] talloc: fix swig dependencies
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
X-List-Received-Date: Fri, 12 Sep 2014 08:58:48 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Changes include:
    
* depens on swig-native to make sure that the talloc.i always be
  installed;

* remove relative path that from `swig -swiglib`:

    ${D}/usr/bin/../share -> ${D}/usr/share

  This prevents 'install' from creraing empty dir: ${D}${bindir};

* fix the path to talloc.i for separate build.

The following changes since commit 28e26a9b0ad37d0c92ba42b2727215eef1edf5a2:

  tcpslice: add recipe under tcpdump (2014-09-09 10:32:51 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/talloc-swig
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/talloc-swig

Wenzong Fan (1):
  talloc: fix swig dependencies

 .../install-swig-interface-in-SWINGLIBDIR.patch    |    2 +-
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.9.5


