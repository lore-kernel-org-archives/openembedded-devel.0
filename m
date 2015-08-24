Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 92BDA6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:07:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99953292"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2015 18:10:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7OA6tQ5007290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 18:06:55 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Aug 2015 18:07:00 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 18:07:15 +0800
Message-ID: <1440410841-15017-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v6 0/6] add openlmi and it's depends
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
X-List-Received-Date: Mon, 24 Aug 2015 10:07:03 -0000
Content-Type: text/plain

OpenLMI  = Open Linux Management Infrastructure.
OpenLMI is open-source project aiming to improve management of Linux systems using WBEM standards.

Lei Maohui (6):
  cmpi-bindings: add new recipe
  konkretcmpi: add new recipe for openlmi
  sblim-sfcb: add new recipe for openlmi
  cim-schema-exper: add new recipe for openlmi
  sblim-sfcb: add new recipe for openlmi
  openlmi: add openlmi

 .../cim-schema/cim-schema-exper_2.39.0.bb          | 28 ++++++++
 ...schema_2.40.0.bb => cim-schema-final_2.40.0.bb} |  2 +
 .../cim-schema/cim-schema/files/LICENSE            | 34 +++++++++
 .../cmpi-bindings/0001-Fix-error.patch             | 26 +++++++
 .../cmpi-bindings/0001-Modify-cmakelist.patch      | 41 +++++++++++
 .../0001-fix-the-build-error-when-python-3.0.patch | 31 ++++++++
 .../cmpi-bindings-0.4.17-no-ruby-perl.patch        | 47 ++++++++++++
 .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       | 22 ++++++
 .../cmpi-bindings-0.9.5-python-lib-dir.patch       | 17 +++++
 .../cmpi-bindings/cmpi-bindings_git.bb             | 37 ++++++++++
 .../konkretcmpi/konkretcmpi-native_0.9.2.bb        | 28 ++++++++
 ...txt-fix-lib64-can-not-be-shiped-in-64bit-.patch | 31 ++++++++
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 36 ++++++++++
 ...-0.9.2-fix-returning-instance-from-method.patch | 38 ++++++++++
 .../konkretcmpi/konkretcmpi_0.9.2.bb               | 34 +++++++++
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 31 ++++++++
 .../openlmi/openlmi-networking_0.3.1.bb            | 30 ++++++++
 .../openlmi/openlmi-providers/0001-fix-error.patch | 26 +++++++
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 31 ++++++++
 .../openlmi/openlmi-providers_0.6.0.bb             | 54 ++++++++++++++
 .../openlmi/openlmi-storage_0.8.1.bb               | 32 +++++++++
 .../openlmi/openlmi-tools_0.10.5.bb                | 23 ++++++
 .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       | 25 +++++++
 .../recipes-extended/sblim-sfcb/files/sfcb.service | 11 +++
 .../sblim-sfcb-1.3.15-fix-provider-debugging.patch | 12 ++++
 .../sblim-sfcb-1.3.16-maxMsgLen.patch              | 14 ++++
 .../sblim-sfcb-1.3.16-multilib-man-cfg.patch       | 41 +++++++++++
 ...blim-sfcb-1.3.9-sfcbrepos-schema-location.patch | 42 +++++++++++
 .../sblim-sfcb-1.4.5-service.patch                 | 27 +++++++
 .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch | 26 +++++++
 .../sblim-sfcb-1.4.9-fix-ftbfs.patch               | 12 ++++
 .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 | 83 ++++++++++++++++++++++
 32 files changed, 972 insertions(+)
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
 rename meta-networking/recipes-support/cim-schema/{cim-schema_2.40.0.bb => cim-schema-final_2.40.0.bb} (96%)
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.9-fix-ftbfs.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb

-- 
1.8.4.2


