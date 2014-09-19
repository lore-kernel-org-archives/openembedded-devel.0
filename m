Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A73EC71485
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:10:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8J3A41P023169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 20:10:04 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 20:10:04 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Sep 2014 23:10:01 -0400
Message-ID: <cover.1411095911.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] imagemagick: do not install magick-baseconfig.h repeatedly
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
X-List-Received-Date: Fri, 19 Sep 2014 03:10:11 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Both targets install-data-local & install-includeHEADERS will install
header file magick-baseconfig.h to the same location, and they might
be run in the same time while enabling parallel build:

* target dependencies:
  + install-data-am: ... install-data-local ... install-includeHEADERS

* make install error:
  /usr/bin/install: cannot create regular file \
  `.../usr/include/ImageMagick-6/magick/magick-baseconfig.h': \
  File exists \
  make[3]: *** [install-magickincarchHEADERS] Error 1

* reproduce the error:
  $ /usr/bin/install test /tmp & /usr/bin/install test /tmp
  [1] 4052
  /usr/bin/install: cannot create regular file `/tmp/test': File exists
  [1]+  Exit 1                  /usr/bin/install test /tmp

Just disable the one from install-data-local to remove this race issue.

The following changes since commit 28e26a9b0ad37d0c92ba42b2727215eef1edf5a2:

  tcpslice: add recipe under tcpdump (2014-09-09 10:32:51 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/imagemagick
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/imagemagick

Wenzong Fan (1):
  imagemagick: do not install magick-baseconfig.h repeatedly

 ...ot-install-magick-baseconfig.h-repeatedly.patch |   49 ++++++++++++++++++++
 .../imagemagick/imagemagick_6.8.8.bb               |    1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch

-- 
1.7.9.5


