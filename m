Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7D86B6F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 03:27:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB23R5Hr017881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Dec 2015 19:27:05 -0800
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 1 Dec 2015 19:27:04 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 11:27:00 +0800
Message-ID: <cover.1449026404.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/1 V2] fltk: upgrade from 1.1.10 to 1.3.3
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
X-List-Received-Date: Wed, 02 Dec 2015 03:27:06 -0000
Content-Type: text/plain

Changes from V1:
* fix qa issue for rpaths on qemuppc
* cleanup the host buildpaths from fltk-config

The following changes since commit 62bfd1f93f8873611e818c7cc8c13a761d629502:

  wireshark: update to version 2.0.0 (2015-11-30 14:39:59 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/fltkv2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/fltkv2

Yi Zhao (1):
  fltk: upgrade from version 1.1.10 to 1.3.3

 .../fltk/fltk-1.1.10/disable_test.patch            |   13 -----
 .../recipes-support/fltk/fltk-1.1.10/dso-fix.patch |   13 -----
 .../fltk/fltk-1.1.10/libpng15.patch                |   61 --------------------
 .../recipes-support/fltk/fltk/disable_test.patch   |   11 ++++
 .../fltk/fltk/fix-boolean-issue-with-jpeg9.patch   |   40 +++++++++++++
 .../fltk-no-freetype-config.patch                  |   14 +++--
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   41 -------------
 meta-oe/recipes-support/fltk/fltk_1.3.3.bb         |   49 ++++++++++++++++
 8 files changed, 108 insertions(+), 134 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/disable_test.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
 rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/fltk-no-freetype-config.patch (57%)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk_1.1.10.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk_1.3.3.bb

-- 
1.7.9.5


