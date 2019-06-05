Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD2A7D5A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x55343gH005561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:54 +0800
Message-ID: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/7] upgrade 7 packages
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>


Changqing Li (7):
  phoronix-test-suite: upgrade from 8.6.0 -> 8.8.1
  python-pygobject: upgrade 3.28.3 -> 3.32.1
  rrdtool: upgrade 1.7.1 -> 1.7.2
  php: upgrade 7.3.4 -> 7.3.6
  xf86-video-ati: upgrade 18.0.1 -> 19.0.1
  pavucontrol: upgrade 3.0 -> 4.0
  multipath-tools: upgrade 0.8.0 -> 0.8.1

 ...suite_8.6.0.bb => phoronix-test-suite_8.8.1.bb} |  4 +-
 .../php/{php_7.3.4.bb => php_7.3.6.bb}             |  4 +-
 ...object_3.28.3.bb => python-pygobject_3.32.1.bb} | 14 ++--
 ...-etc-rrdcached-default-lsb.in-to-tarball-.patch | 45 -----------
 ...d-etc-files-via-EXTRA_DIST-fixes-956-some.patch | 93 ----------------------
 ...-rule-to-make-target-etc-rrdcached.socket.patch | 51 ------------
 .../rrdtool/{rrdtool_1.7.1.bb => rrdtool_1.7.2.bb} |  9 +--
 ...ideo-ati_18.0.1.bb => xf86-video-ati_19.0.1.bb} |  4 +-
 .../0001-build-sys-Use-C-11-for-building.patch     | 27 -------
 .../{pavucontrol_3.0.bb => pavucontrol_4.0.bb}     | 10 +--
 ...ools-modify-Makefile.inc-for-cross-compil.patch | 28 ++++---
 ...ath-tools_0.8.0.bb => multipath-tools_0.8.1.bb} |  2 +-
 12 files changed, 38 insertions(+), 253 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.6.0.bb => phoronix-test-suite_8.8.1.bb} (90%)
 rename meta-oe/recipes-devtools/php/{php_7.3.4.bb => php_7.3.6.bb} (88%)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.28.3.bb => python-pygobject_3.32.1.bb} (64%)
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.1.bb => rrdtool_1.7.2.bb} (91%)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_18.0.1.bb => xf86-video-ati_19.0.1.bb} (80%)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-build-sys-Use-C-11-for-building.patch
 rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_3.0.bb => pavucontrol_4.0.bb} (52%)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.0.bb => multipath-tools_0.8.1.bb} (98%)

-- 
2.7.4


