Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5781E71482
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 05:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H5ufqX011841
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:56:42 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 22:56:41 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 01:56:37 -0400
Message-ID: <cover.1410932659.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2][meta-oe] talloc: fixes for sstate cache reuse & swig dependencies
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
X-List-Received-Date: Wed, 17 Sep 2014 05:56:41 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Patch 2/2:

Fixes for sstate cache reuse between different build dirs. The
${SWIGLIBDIR##${STAGING_DIR_NATIVE}} had confused bitbake, bitbake would
add the "SWIGLIBDIR##${STAGING_DIR_NATIVE}" to the deps of do_install,
which caused the sstate cached can't be re-used.

Use another way for SWIGLIBDIR to fix the problem.

Patch 1/2:

* talloc: fix swig dependencies

This patch had been sent before, to avoid merge conflict just put them
to the same contrib branch.

The following changes since commit 28e26a9b0ad37d0c92ba42b2727215eef1edf5a2:

  tcpslice: add recipe under tcpdump (2014-09-09 10:32:51 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-talloc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-talloc

Robert Yang (1):
  talloc: fixes for sstate cache reuse

Wenzong Fan (1):
  talloc: fix swig dependencies

 .../install-swig-interface-in-SWINGLIBDIR.patch    |    2 +-
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |   13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.7.9.5


