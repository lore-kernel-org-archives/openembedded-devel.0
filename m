Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC766D13A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 01:34:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x241Ythv003410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Mar 2019 17:34:56 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 3 Mar 2019 17:34:55 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 3 Mar 2019 20:34:51 -0500
Message-ID: <20190304013452.38047-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v4 0/1] lvm2/libdevmapper: 2.03.01 -> 2.03.02
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
X-List-Received-Date: Mon, 04 Mar 2019 01:34:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v4:
* handle install but not packaged file lvm2-pvscan@.service

v3:
* sorry, fix confusing typo in commit message s/removed/released/

Kai Kang (1):
  lvm2/libdevmapper: 2.03.01 -> 2.03.02

 ...h-for-O_-defines-and-fcntl-signature.patch | 30 -----------------
 .../lvm2/files/0005-do-not-build-manual.patch | 13 +++++---
 ...lvm2-monitor.service-after-tmp.mount.patch | 13 +++++---
 ...per_2.03.01.bb => libdevmapper_2.03.02.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  7 ++--
 ...0001-explicitly-do-not-install-libdm.patch | 32 ++++++++++++-------
 ...g-service-shouldn-t-refer-to-lvmetad.patch | 31 ------------------
 .../lvm2/{lvm2_2.03.01.bb => lvm2_2.03.02.bb} |  5 ++-
 8 files changed, 45 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/files/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.01.bb => libdevmapper_2.03.02.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.01.bb => lvm2_2.03.02.bb} (90%)

-- 
2.20.0


