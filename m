Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8641873CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 05:31:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t985VdmB003312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Oct 2015 22:31:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Oct 2015 22:31:38 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Oct 2015 01:31:35 -0400
Message-ID: <cover.1444282133.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2][meta-oe] remove packages: libcap-ng, swig
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
X-List-Received-Date: Thu, 08 Oct 2015 05:31:41 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

They have been moved to oe-core.

The following changes since commit f4533380c8a5c1d229f692222ee0c2ef9d187ef8:

  dracut: install modules to /usr/lib (2015-09-23 16:10:57 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/libcap-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/libcap-1

Wenzong Fan (2):
  swig: remove package
  libcap-ng: remove package

 meta-oe/recipes-devtools/swig/swig.inc             | 63 --------------------
 ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ----------------------
 ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 --------------------
 meta-oe/recipes-devtools/swig/swig_3.0.6.bb        |  8 ---
 .../libcap-ng/libcap-ng/python.patch               | 58 ------------------
 .../recipes-support/libcap-ng/libcap-ng_0.7.7.bb   | 39 ------------
 6 files changed, 301 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/swig/swig.inc
 delete mode 100644 meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 delete mode 100644 meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
 delete mode 100644 meta-oe/recipes-devtools/swig/swig_3.0.6.bb
 delete mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
 delete mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.7.bb

-- 
1.9.1


