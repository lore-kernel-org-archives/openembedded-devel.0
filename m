Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C49A6CF40
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s089WXwb001952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:33 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:32 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:20 -0500
Message-ID: <cover.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 00/10] selinux userspace: uprev packages to release 20131030
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:33 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Changes:
1) Uprev selinux packages to release 20131030;
2) Fix build dependency to libsemanage;
3) Fix QA issues to policycoreutils;
4) Update LIC_FILES_CHKSUM for selinux packagegroups.

Some Tests:
1) build test:
- add meta-selinux path to conf/bblayers.conf;
- add DISTRO_FEATURES_append=" pam selinux" to conf/local.conf;
- build selinux image:
  $ bitbake core-image-selinux

- add below configs to conf/local.conf and run image build:
  PREFERRED_VERSION_checkpolicy = "2.2+gitAUTOINC+edc2e99687"
  PREFERRED_VERSION_libselinux = "2.2+gitAUTOINC+edc2e99687"
  PREFERRED_VERSION_libsemanage = "2.2+gitAUTOINC+edc2e99687"
  PREFERRED_VERSION_libsepol = "2.2+gitAUTOINC+edc2e99687"
  PREFERRED_VERSION_policycoreutils = "2.2.5+gitAUTOINC+edc2e99687"
  PREFERRED_VERSION_sepolgen = "1.2.1+gitAUTOINC+edc2e99687"

All builds successfully.

2) basic verification on target:
$ runqemu qemux86 core-image-selinux ext3 nographic qemuparams="-m 1024"

qemux86 login: root
root@qemux86:~# id -Z
root:sysadm_r:sysadm_t:s0-s15:c0.c1023

root@qemux86:~# sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             mls
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      28


The following changes since commit 2209cb5fc21c1ad5a7471897528ed64170f70219:

  policy: Create compressed_policy distro feature (2013-12-05 09:03:41 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/selinux-uprev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/selinux-uprev

Wenzong Fan (10):
  selinux userspace: uprev packages to release 20131030
  checkpolicy: migrate SRC_URI to 2.2
  libselinux: migrate SRC_URI and patches to 2.2
  libsemanage: migrate SRC_URI to 2.2
  libsepol: migrate SRC_URI to 2.2
  policycoreutils: migrate SRC_URI and patches to 2.2.5
  sepolgen: migrate SRC_URI to 1.2.1
  libsemanage: add audit dependency
  policycoreutils: fix QA issues
  selinux packagegroups: update LIC_FILES_CHKSUM

 recipes-security/audit/audit_2.3.2.bb              |    8 ++++-
 .../packagegroups/packagegroup-core-selinux.bb     |    2 +-
 .../packagegroups/packagegroup-selinux-minimal.bb  |    2 +-
 .../packagegroup-selinux-policycoreutils.bb        |    2 +-
 recipes-security/selinux/checkpolicy_2.1.12.bb     |    9 ------
 recipes-security/selinux/checkpolicy_2.2.bb        |    9 ++++++
 recipes-security/selinux/checkpolicy_git.bb        |    2 +-
 .../libselinux-fix-init-load-policy.patch          |   27 ----------------
 .../libselinux/libselinux-pcre-link-order.patch    |   31 ------------------
 .../{libselinux_2.1.13.bb => libselinux_2.2.bb}    |    8 ++---
 recipes-security/selinux/libselinux_git.bb         |   10 ++++--
 recipes-security/selinux/libsemanage.inc           |    2 +-
 .../libsemanage/libsemanage-fix-path-nologin.patch |    9 +++---
 .../{libsemanage_2.1.10.bb => libsemanage_2.2.bb}  |    6 ++--
 recipes-security/selinux/libsemanage_git.bb        |    3 +-
 recipes-security/selinux/libsepol.inc              |    5 ++-
 ...ibsepol-Change-ranlib-for-cross-compiling.patch |   31 ------------------
 recipes-security/selinux/libsepol_2.1.9.bb         |   11 -------
 recipes-security/selinux/libsepol_2.2.bb           |    9 ++++++
 recipes-security/selinux/libsepol_git.bb           |    4 +--
 recipes-security/selinux/policycoreutils.inc       |   12 ++++---
 ...policycoreutils-fix-sepolicy-install-path.patch |   18 +++++------
 .../policycoreutils-fix-strict-prototypes.patch    |   34 --------------------
 .../policycoreutils-make-O_CLOEXEC-optional.patch  |   28 ++++++++--------
 ...oreutils_2.1.14.bb => policycoreutils_2.2.5.bb} |    9 +++---
 recipes-security/selinux/policycoreutils_git.bb    |    8 +++--
 recipes-security/selinux/selinux_20130423.inc      |   12 -------
 recipes-security/selinux/selinux_20131030.inc      |   12 +++++++
 recipes-security/selinux/selinux_git.inc           |    4 +--
 recipes-security/selinux/sepolgen_1.1.9.bb         |    9 ------
 recipes-security/selinux/sepolgen_1.2.1.bb         |    9 ++++++
 recipes-security/selinux/sepolgen_git.bb           |    2 +-
 32 files changed, 117 insertions(+), 230 deletions(-)
 delete mode 100644 recipes-security/selinux/checkpolicy_2.1.12.bb
 create mode 100644 recipes-security/selinux/checkpolicy_2.2.bb
 delete mode 100644 recipes-security/selinux/libselinux/libselinux-fix-init-load-policy.patch
 delete mode 100644 recipes-security/selinux/libselinux/libselinux-pcre-link-order.patch
 rename recipes-security/selinux/{libselinux_2.1.13.bb => libselinux_2.2.bb} (58%)
 rename recipes-security/selinux/{libsemanage_2.1.10.bb => libsemanage_2.2.bb} (70%)
 delete mode 100644 recipes-security/selinux/libsepol/libsepol-Change-ranlib-for-cross-compiling.patch
 delete mode 100644 recipes-security/selinux/libsepol_2.1.9.bb
 create mode 100644 recipes-security/selinux/libsepol_2.2.bb
 delete mode 100644 recipes-security/selinux/policycoreutils/policycoreutils-fix-strict-prototypes.patch
 rename recipes-security/selinux/{policycoreutils_2.1.14.bb => policycoreutils_2.2.5.bb} (55%)
 delete mode 100644 recipes-security/selinux/selinux_20130423.inc
 create mode 100644 recipes-security/selinux/selinux_20131030.inc
 delete mode 100644 recipes-security/selinux/sepolgen_1.1.9.bb
 create mode 100644 recipes-security/selinux/sepolgen_1.2.1.bb

-- 
1.7.9.5


