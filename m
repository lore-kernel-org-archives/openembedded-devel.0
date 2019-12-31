Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 205297CED7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:21:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Dec 2019 23:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,378,1571727600"; d="scan'208";a="213554978"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by orsmga008.jf.intel.com with ESMTP; 30 Dec 2019 23:21:42 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2019 15:19:46 +0800
Message-Id: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH v3 0/2] Add openjdk-12 recipe
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
X-List-Received-Date: Tue, 31 Dec 2019 07:21:43 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

This patch series contain new openjdk-12 recipe and
addtitonal 2 test cases to test openjdk-12. See each
patch for detail commit message.

Mohamad Noor Alim Hussin (2):
  openjdk-12: Add new recipe
  openjdk-12: Add test cases for openjdk-12

 lib/oeqa/files/hello.java                     |   5 +
 lib/oeqa/runtime/cases/java.py                |  15 ++
 lib/oeqa/runtime/cases/javac.py               |  27 +++-
 recipes-core/openjdk/openjdk-12-common.inc    | 151 ++++++++++++++++++
 recipes-core/openjdk/openjdk-12-cross.inc     | 145 +++++++++++++++++
 recipes-core/openjdk/openjdk-12-native.inc    |  86 ++++++++++
 .../openjdk/openjdk-12-native_2+10.bb         |   2 +
 .../openjdk-12-release-2+10-aarch32.inc       |  15 ++
 .../openjdk-12-release-2+10-aarch64.inc       |  12 ++
 .../openjdk-12-release-2+10-common.inc        |  35 ++++
 .../openjdk/openjdk-12-release-2+10.inc       |  11 ++
 recipes-core/openjdk/openjdk-12_2+10.bb       |  57 +++++++
 recipes-core/openjdk/openjre-12_2+10.bb       |  54 +++++++
 .../0001-fix-stringop-truncate-gcc8.patch     |  11 ++
 .../0002-fix-stringop-truncate-gcc8.patch     |  38 +++++
 .../filter-aclocal-copy-too.patch             |  10 ++
 .../openjdk/patches-openjdk-12/jvm.cfg        |  41 +++++
 ...njdk12-find-compiler-fix-env-respect.patch |  11 ++
 ...move-shell-variables-from-autoheader.patch |  28 ++++
 .../images/openjdk-12-test-image.bb           |   3 +
 .../images/openjre-12-test-image.bb           |   3 +
 21 files changed, 756 insertions(+), 4 deletions(-)
 create mode 100644 lib/oeqa/files/hello.java
 create mode 100644 recipes-core/openjdk/openjdk-12-common.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-cross.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-native.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-native_2+10.bb
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-common.inc
 create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10.inc
 create mode 100644 recipes-core/openjdk/openjdk-12_2+10.bb
 create mode 100644 recipes-core/openjdk/openjre-12_2+10.bb
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/jvm.cfg
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
 create mode 100644 recipes-images/images/openjdk-12-test-image.bb
 create mode 100644 recipes-images/images/openjre-12-test-image.bb

-- 
2.19.1


