Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbC-00020s-Vk
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:02 +0100
Received: by faaa20 with SMTP id a20so369504faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PRYDCmC+2T/jtA3Aetk8OPBWJAhWkTH/gTsiREnb8aw=;
	b=bVBUX0Db4eZxGr1209rPwsTcJg0/gwVoDxXXUJeM0sFgLSyIFH555Yz93HfOlVAcaR
	Cg1fsM0ffPX9T/1p83+Ea8H7Iz8kCcEbDBJPtP2oVkURAd8NT2chPL9E4LszymDhavA5
	gqJ6eCmleLc+AYQR37AgUQZtRAbE1RLsX62b4=
Received: by 10.180.106.105 with SMTP id gt9mr10199577wib.39.1323794766575;
	Tue, 13 Dec 2011 08:46:06 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.04 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:05 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:37 +0400
Message-Id: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [meta-opie 0/6] Fix SDK generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 16:53:03 -0000

The following changes since commit ad8e8dc745831e2f8523757d790294906500b0ad:

  Fix LIC_FILES_CHKSUM for change to common LGPL-2.0 license file (2011-12-09 12:18:49 +0000)

are available in the git repository at:
  https://github.com/lumag/meta-opie master

Dmitry Eremin-Solenikov (6):
      uicmoc: do also provide nativesdk variant
      qmake: do also provide nativesdk variant
      task-opie, task-opie-16mb: make whole recipe a machine-only
      opie-button-settings: make whole recipe a machine-only
      libopie2: make libopie2-dev package installable
      opie: fix SDK generation

 recipes-opie/libopie/libopie2.inc                  |    6 ++-
 recipes-opie/meta/meta-toolchain-opie.bb           |   30 ++++++++++++++++---
 .../opie-button-settings/opie-button-settings.inc  |    2 +-
 recipes-opie/tasks/task-opie-16mb.bb               |    5 +--
 .../tasks/task-opie-toolchain-host-nativesdk.bb    |    8 +++++
 recipes-opie/tasks/task-opie-toolchain-target.bb   |   16 ++++++++++
 recipes-opie/tasks/task-opie.bb                    |    9 +----
 .../{qmake-native_1.07a.bb => qmake_1.07a.bb}      |    8 ++---
 .../64bit-cleanup.patch                            |    0
 .../fix-makefile.patch                             |    0
 .../gcc3_4.patch                                   |    0
 .../gcc4.patch                                     |    0
 .../gcc4_1.patch                                   |    0
 .../kernel-asm-page.patch                          |    0
 .../{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb}  |   11 +++++--
 15 files changed, 69 insertions(+), 26 deletions(-)
 create mode 100644 recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
 create mode 100644 recipes-opie/tasks/task-opie-toolchain-target.bb
 rename recipes-qt/qmake/{qmake-native_1.07a.bb => qmake_1.07a.bb} (92%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/64bit-cleanup.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/fix-makefile.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc3_4.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4_1.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/kernel-asm-page.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb} (81%)



