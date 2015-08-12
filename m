Return-Path: <prvs=659569f5e=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 634C0767B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:04:43 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqUEAIZfy1WsEApK/2dsb2JhbABdg29pBr9fhX2CFQEBAQEBAYELhHUBLSiBFg6IOMAiAZAmASuCTo4OHoQVBZUThQSQZpEThCVvAYFHgQQBAQE
X-IPAS-Result: AqUEAIZfy1WsEApK/2dsb2JhbABdg29pBr9fhX2CFQEBAQEBAYELhHUBLSiBFg6IOMAiAZAmASuCTo4OHoQVBZUThQSQZpEThCVvAYFHgQQBAQE
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 17:03:52 +0200
Message-ID: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH 0/5] Add OpenJDK7 based on IcedTea 2.6.1 (OpenJDK 7u85b01)
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
X-List-Received-Date: Wed, 12 Aug 2015 15:04:45 -0000
Content-Type: text/plain

This patch series adds support for IcedTea 2.6.1 (OpenJDK 7u85b01).
I've tested the build for multiple targets. Furthermore I tested the
build on a real ARM Cortex A9 SoC with HardFP.

All test were done with the current master branches of poky & meta-oe.

Currently the old 2.5.4 release is not removed. This should be done when
this version was tested by someone else and in use for some time.

I'm very happy about every test result and feedback!

Richard Leitner (5):
  openjdk-7-common: explicitely disable PCSC and SCTP
  openjdk-7: move "--disable-pulse-java" from common to 75b13 only
  openjdk-7-common: fix FILES_openjdk-7-jre_append
  openjdk-7-common.inc: bump PR to 6
  openjdk-7: Add IcedTea 2.6.1 OpenJDK 7u85b01

 .../openjdk/openjdk-7-85b01/build-hacks.patch      |  56 +++++
 .../openjdk-7-85b01/fix_hotspot_crosscompile.patch |  46 +++++
 .../openjdk-7-85b01/icedtea-crosscompile-fix.patch | 229 +++++++++++++++++++++
 ...a-jdk-build-nio-gensor-genuc-gensc-static.patch |  29 +++
 .../icedtea-jdk-nio-use-host-cc.patch              |  11 +
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 ++
 .../icedtea-xawt-crosscompile-fix.patch            |  82 ++++++++
 .../openjdk-7-85b01/icedtea-zero-hotspotfix.patch  |  36 ++++
 recipes-core/openjdk/openjdk-7-85b01/jvm.cfg       |  43 ++++
 recipes-core/openjdk/openjdk-7-common.inc          |  24 ++-
 recipes-core/openjdk/openjdk-7-release-75b13.inc   |   2 +
 recipes-core/openjdk/openjdk-7-release-85b01.inc   |  77 +++++++
 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb      |  35 ++++
 13 files changed, 674 insertions(+), 9 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-85b01/jvm.cfg
 create mode 100644 recipes-core/openjdk/openjdk-7-release-85b01.inc
 create mode 100644 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb

-- 
2.1.4


