Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B91616012C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 09:09:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAR99L1s006507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 01:09:21 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 27 Nov 2015 01:09:21 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Nov 2015 17:09:17 +0800
Message-ID: <cover.1448615050.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/1] fltk: upgrade 1.1.10 to 1.3.3
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
X-List-Received-Date: Fri, 27 Nov 2015 09:09:23 -0000
Content-Type: text/plain


The following changes since commit ea319464b673cbf9a416b582dc4766faeb998430:

  vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:50:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/fltk-upgrade
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/fltk-upgrade

Yi Zhao (1):
  fltk: upgrade from version 1.1.10 to 1.3.3

 .../fltk/fltk-1.1.10/disable_test.patch            |   13 -----
 .../fltk/fltk-1.1.10/libpng15.patch                |   61 --------------------
 .../recipes-support/fltk/fltk/disable_test.patch   |   11 ++++
 .../fltk/{fltk-1.1.10 => fltk}/dso-fix.patch       |    0
 .../fltk/fltk/fix-boolean-issue-with-jpeg9.patch   |   38 ++++++++++++
 .../fltk-no-freetype-config.patch                  |   14 +++--
 .../fltk/{fltk_1.1.10.bb => fltk_1.3.3.bb}         |   22 ++++---
 7 files changed, 71 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/disable_test.patch
 rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/dso-fix.patch (100%)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
 rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/fltk-no-freetype-config.patch (57%)
 rename meta-oe/recipes-support/fltk/{fltk_1.1.10.bb => fltk_1.3.3.bb} (51%)

-- 
1.7.9.5


