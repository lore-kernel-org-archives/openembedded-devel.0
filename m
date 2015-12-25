Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30A50607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uM2Z028302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:23 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:22 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:20 +0800
Message-ID: <cover.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 00/15] meta-java: fixes for some issues
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These patches had been in our local branch for some times, I think
they are needed here as well, I rebased and did basic build/runtime
tests on x86-64 and ppc, please review and see if they are fine to
be merged.

--
The following changes since commit c88d019434b5ba0eb7ee1a3b0e27a74587ad9d49:

  openjdk-8-native: fix improper do_install and PROVIDES (2015-12-22 23:48:09 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_java-fixes_151225_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_java-fixes_151225_0

Amy Fong (15):
  java.bbclass: java missing classes during compile
  inetlib: fix inetlib dependency during compilation
  openjdk: autools not to override B var
  jamvm.inc: jamvm recipe cleanup
  base-files: Define JAVA_HOME by default
  Missing inheritance and dependencies in some java packages
  openjdk-7: added java tools to the jdk package
  openjdk: add keytool link
  openjdk: postinst cleanup
  icedtea7-native compile failure undefined reference to `main'
  openjdk: fix CVE-2014-1876
  jamvm-git uprev to 2.0.0
  openjdk-7: add depends on attr
  icedtea7-native/openjdk-7: fails on hosts with no unzip
  openjdk hotspot build system std.h fix

 classes/java.bbclass                               |   9 +-
 recipes-core/base-files/base-files_3.0.14.bbappend |  13 ++
 recipes-core/classpath/classpath-native_0.99.bb    |   2 +-
 ...etlib-missing-dependency-for-util_classes.patch |  31 ++++
 recipes-core/classpathx/inetlib_1.1.1.bb           |   1 +
 recipes-core/icedtea/icedtea7-native.inc           |   4 +-
 .../icedtea-CVE-2014-1876-unpack.patch             |  44 ++++++
 .../openjdk-7-03b147/icedtea-jdk-unzip.patch       | 130 +++++++++++++++
 .../openjdk-7-03b147/icedtea-makefile-unzip.patch  | 167 +++++++++++++++++++
 .../icedtea-x11_extension_cleanup.patch            |  42 +++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |   7 +
 recipes-core/jamvm/jamvm.inc                       |   7 +-
 recipes-core/jamvm/jamvm_git.bb                    |   4 +-
 recipes-core/openjdk/openjdk-7-common.inc          |   4 +
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |   5 +
 recipes-core/openjdk/openjdk-common.inc            |   3 +-
 recipes-core/openjdk/openjdk-postinst.inc          |  24 ++-
 .../patches-openjdk-7/icedtea-dtrace-std_h.patch   |  40 +++++
 .../patches-openjdk-7/icedtea-jdk-unzip.patch      | 130 +++++++++++++++
 .../patches-openjdk-7/icedtea-makefile-unzip.patch | 176 +++++++++++++++++++++
 20 files changed, 825 insertions(+), 18 deletions(-)
 create mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
 create mode 100644 recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_classes.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch

-- 
1.9.1


