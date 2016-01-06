Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51211731BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 06:42:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u066gTKY020741
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Jan 2016 22:42:30 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 22:42:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 14:42:41 +0800
Message-ID: <cover.1452061871.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/7 v3] waf-samba: fix build failure on targets unsupported by qemu
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
X-List-Received-Date: Wed, 06 Jan 2016 06:42:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

V3 Comments:
rebase since talloc is renamed to libtalloc

v2 comments:

rebase since samba reladted packages are move to meta-networking
from meta-oe.

V1 Comments:

samba and required packages started to use waf build
system since 4.x, and the waf bbclass use qemu user mode
to help configure checking by default, but not all targets
are supported by qemu user mode, so it definitely fail on those
targets (it failed on our fsl_t2xxx and cav-octeon3).

The solution here it so use waf cross-answer mode to avoid
using qemu, but we need to prepare the cross-answers, it's
easy and error-prone if we try to get these cross-answers manually,
but fortunately, waf provides another mode to help generate
them in newer version, so upgrade related packages and
backport patches for samba (I also tried to upgrad samba
to 4.3.1, but it still doesn't work in my runtime testing
after some bug fixing, so I keep in the current version for
now, I may upgrade it sometime later if I get better understand
about the new version).

Build tested on:

intel-x86-64
qemux86
qemuarm
qemuarma9
qemuarm64
qemumips
qemumips64
fsl-ls20xx
fsl-t2xxx
xilinx-zynq
cav-octeon3

--
The following changes since commit 2b6226e66f5339edc5e5f19aa3f1f5d7d2ce99ea:

  postfix.inc: fix start postfix failed while hostname is numeric (2016-01-05 12:43:34 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_samba_rebase_160106-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_samba_rebase_160106-0

Jackie Huang (7):
  libtdb: upgrade to 1.3.7
  libldb: upgrade to 1.1.21
  libtevent: upgrade to 0.9.25
  libtalloc: upgrade to 2.1.3
  samba: fix the incorrect tmpfiles installed directory
  samba: backport patches for cross-compiling
  waf-samba.bbclass: add cross-answers option and files

 ...1-waf-sanitize-and-fix-added-cross-answer.patch |  60 ++++++++
 ...-Adds-a-new-mode-to-samba-cross-compiling.patch | 112 ++++++++++++++
 ...-readability-of-cross-answers-generated-b.patch |  66 ++++++++
 ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |  72 +++++++++
 .../0005-build-unify-and-fix-endian-tests.patch    | 169 +++++++++++++++++++++
 ...006-avoid-using-colon-in-the-checking-msg.patch |  32 ++++
 ...sing-of-cross-answers-file-in-case-answer.patch |  36 +++++
 .../recipes-connectivity/samba/samba_4.1.12.bb     |  16 +-
 .../libldb/{libldb_1.1.17.bb => libldb_1.1.21.bb}  |   4 +-
 .../{libtalloc_2.1.1.bb => libtalloc_2.1.3.bb}     |   4 +-
 .../libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb}    |   4 +-
 .../{libtevent_0.9.21.bb => libtevent_0.9.25.bb}   |   4 +-
 meta-oe/classes/waf-samba.bbclass                  |  43 +++++-
 meta-oe/conf/layer.conf                            |   1 +
 meta-oe/files/waf-cross-answers/README             |   3 +
 .../waf-cross-answers/cross-answers-aarch64.txt    |  38 +++++
 .../files/waf-cross-answers/cross-answers-arm.txt  |  39 +++++
 .../files/waf-cross-answers/cross-answers-i586.txt |  39 +++++
 .../files/waf-cross-answers/cross-answers-i686.txt |  39 +++++
 .../files/waf-cross-answers/cross-answers-mips.txt |  39 +++++
 .../waf-cross-answers/cross-answers-mips64.txt     |  38 +++++
 .../waf-cross-answers/cross-answers-powerpc.txt    |  39 +++++
 .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 +++++
 .../waf-cross-answers/cross-answers-x86_64.txt     |  38 +++++
 24 files changed, 959 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0006-avoid-using-colon-in-the-checking-msg.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.1.17.bb => libldb_1.1.21.bb} (92%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.1.bb => libtalloc_2.1.3.bb} (91%)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.0.bb => libtdb_1.3.7.bb} (87%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.21.bb => libtevent_0.9.25.bb} (88%)
 create mode 100644 meta-oe/files/waf-cross-answers/README
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt
 create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt

-- 
1.9.1


