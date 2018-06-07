Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3387852F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:21:36 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w57DLar7023906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w57DLaAL011969;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F2D1D95183E;
	Thu,  7 Jun 2018 15:21:35 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 15:21:05 +0200
Message-Id: <20180607132109.23396-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Marko Peter <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 0/3] Add OpenSSL 1.1 support
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
X-List-Received-Date: Thu, 07 Jun 2018 13:21:36 -0000

Add OpenSSL 1.1 support:
 - thrift, net-snmp: apply supporting patch
 - syslog-ng: update component to version 3.15.1

 .../net-snmp/fix-openssl-build-errors.patch        | 171 +++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   1 +
 ...07-enable-build-with-OpenSSL-1.1.0-series.patch |  28 ++++
 ...-Compile-error-in-TSSLSocket.cpp-with-new.patch |  26 ++++
 ...-C++-library-build-fails-if-OpenSSL-does-.patch |  45 ++++++
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    |   3 +
 ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch |  29 ----
 ...c-add-option-enable-thread-tls-to-manage-.patch |  16 +-
 .../recipes-support/syslog-ng/files/syslog-ng.conf |   2 +-
 .../syslog-ng.service-the-syslog-ng-service.patch  |  38 +++--
 .../recipes-support/syslog-ng/syslog-ng_3.15.1.bb  |  10 ++
 .../recipes-support/syslog-ng/syslog-ng_3.8.1.bb   |  11 --
 12 files changed, 319 insertions(+), 61 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>

-- 
2.11.0


