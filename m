Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4260976E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:59:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7F5xtuQ009513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 22:59:56 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 22:59:54 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:08 +0800
Message-ID: <cover.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/6] Upgrade samba and related packages
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
X-List-Received-Date: Mon, 15 Aug 2016 05:59:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit e231b028048231cf05fe27b52c805ed138446cee:

  libgit2: add a recipe for libgit2 version 0.24.1 (2016-08-08 13:54:06 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_uprev_samba_160815_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_uprev_samba_160815_0

Jackie Huang (6):
  libtalloc: upgrade to 2.1.8
  libtevent: upgrade to 0.9.29
  libtdb: upgrade to 1.3.10
  ctdb: upgrade to 2.5.6
  libldb: upgrade to 1.1.27
  samba: upgrade to 4.4.5

 .../samba/samba-4.4.2/10-use-only-libsystemd.patch | 81 ----------------------
 .../00-fix-typos-in-man-pages.patch                |  0
 ...006-avoid-using-colon-in-the-checking-msg.patch |  0
 .../samba/samba-4.4.5/10-use-only-libsystemd.patch | 30 ++++++++
 .../16-do-not-check-xsltproc-manpages.patch        |  0
 ...-import-target-module-while-cross-compile.patch |  0
 .../21-add-config-option-without-valgrind.patch    |  0
 .../volatiles.03_samba                             |  0
 .../samba/{samba_4.4.2.bb => samba_4.4.5.bb}       |  4 +-
 .../ctdb/{ctdb_2.5.1.bb => ctdb_2.5.6.bb}          |  4 +-
 .../libldb/{libldb_1.1.26.bb => libldb_1.1.27.bb}  |  4 +-
 .../{libtalloc_2.1.6.bb => libtalloc_2.1.8.bb}     |  4 +-
 .../libtdb/{libtdb_1.3.8.bb => libtdb_1.3.10.bb}   |  4 +-
 .../{libtevent_0.9.28.bb => libtevent_0.9.29.bb}   |  4 +-
 14 files changed, 42 insertions(+), 93 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/10-use-only-libsystemd.patch
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/00-fix-typos-in-man-pages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/0006-avoid-using-colon-in-the-checking-msg.patch (100%)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/10-use-only-libsystemd.patch
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/16-do-not-check-xsltproc-manpages.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/20-do-not-import-target-module-while-cross-compile.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/21-add-config-option-without-valgrind.patch (100%)
 rename meta-networking/recipes-connectivity/samba/{samba-4.4.2 => samba-4.4.5}/volatiles.03_samba (100%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.4.2.bb => samba_4.4.5.bb} (99%)
 rename meta-networking/recipes-support/ctdb/{ctdb_2.5.1.bb => ctdb_2.5.6.bb} (93%)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.26.bb => libldb_1.1.27.bb} (93%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.6.bb => libtalloc_2.1.8.bb} (91%)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.8.bb => libtdb_1.3.10.bb} (87%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.28.bb => libtevent_0.9.29.bb} (88%)

-- 
1.9.1


