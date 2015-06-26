Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 44372601E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:23:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97782664"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 16:27:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q8Lfjx009221
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:21:42 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 16:23:20 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 16:23:22 +0800
Message-ID: <1435307010-34957-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH 0/8] add openlmi and it's depends
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
X-List-Received-Date: Fri, 26 Jun 2015 08:23:24 -0000
Content-Type: text/plain

OpenLMI  = Open Linux Management Infrastructure.
OpenLMI is open-source project aiming to improve management of Linux systems using WBEM standards.

Lei Maohui (8):
  openlmi: add new recipe openlmi
  cim-schema-exper: add new recipe for openlmi
  cmpi-bindings: add new recipe for openlmi
  konkretcmpi:add new recipe for openlmi
  sblim-sfcb: add new recipe for openlmi
  sblim-sfcCommon: add new recipe
  sblim-cmpi-devel: add new recipe
  cim-schema_2.40.0.bb: delete

 .../cim-schema/cim-schema-exper_2.39.0.bb          | 26 +++++++
 .../cim-schema/cim-schema-final_2.40.0.bb          | 31 +++++++++
 .../cim-schema/cim-schema/files/LICENSE            | 34 +++++++++
 .../cim-schema/cim-schema_2.40.0.bb                | 31 ---------
 .../cmpi-bindings/0001-Fix-error.patch             | 26 +++++++
 .../cmpi-bindings/0001-Modify-cmakelist.patch      | 41 +++++++++++
 .../cmpi-bindings-0.4.17-no-ruby-perl.patch        | 44 ++++++++++++
 .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       | 22 ++++++
 .../cmpi-bindings-0.9.5-python-lib-dir.patch       | 17 +++++
 .../cmpi-bindings/cmpi-bindings_git.bb             | 31 +++++++++
 ...-0.9.2-fix-returning-instance-from-method.patch | 38 ++++++++++
 .../konkretcmpi/konkretcmpi_0.9.2.bb               | 33 +++++++++
 .../openlmi/openlmi-networking_0.3.1.bb            | 29 ++++++++
 .../openlmi/openlmi-providers/0001-fix-error.patch | 26 +++++++
 .../openlmi/openlmi-providers_0.6.0.bb             | 54 +++++++++++++++
 .../openlmi/openlmi-storage_0.8.1.bb               | 31 +++++++++
 .../openlmi/openlmi-tools_0.10.5.bb                | 23 +++++++
 .../sblim-cmpi-devel-2.0.3-docdir.patch            | 17 +++++
 .../sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb     | 18 +++++
 .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       | 23 +++++++
 .../recipes-extended/sblim-sfcb/files/sfcb.service | 11 +++
 .../sblim-sfcb-1.3.15-fix-provider-debugging.patch | 12 ++++
 .../sblim-sfcb-1.3.16-maxMsgLen.patch              | 14 ++++
 .../sblim-sfcb-1.3.16-multilib-man-cfg.patch       | 41 +++++++++++
 ...blim-sfcb-1.3.9-sfcbrepos-schema-location.patch | 42 ++++++++++++
 .../sblim-sfcb-1.4.5-service.patch                 | 27 ++++++++
 .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch | 26 +++++++
 .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 | 80 ++++++++++++++++++++++
 28 files changed, 817 insertions(+), 31 deletions(-)
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
 delete mode 100644 meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
 create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel/sblim-cmpi-devel-2.0.3-docdir.patch
 create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb

-- 
1.8.4.2


