Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0838873E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9Gwlt010657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:16:58 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:16:58 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:47 +0800
Message-ID: <cover.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/9] Fixes for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 09:16:59 -0000
Content-Type: text/plain


The following changes since commit a8b76a264155f4b9f6ba1bebe3ac87640a6f35ed:

  cpufrequtils: Create proper symlinks to versioned library (2015-06-08 14:15:25 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/multilib-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/multilib-fixes

Yi Zhao (9):
  meta-oe: fix the install dir for udev rules and files
  pm-qa: fix PN -> BPN for multilib
  sip: fix PN -> BPN for multilib
  engine-pkcs11: fix libdir for multilib
  system-setup-keyboard: fix PN -> BPN for multilib
  vboxguestdrivers: fix kernel modules install dir for multilib
  openjpeg: pass correct libdir to cmake
  xdotool: pass correct libdir to make
  tesseract-lang.inc: set ${S} to fix the QA warning

 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |    6 +++---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb        |    6 +++---
 meta-oe/recipes-extended/sip/sip_4.16.4.bb         |    2 +-
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    2 +-
 .../recipes-graphics/openjpeg/openjpeg_2.1.0.bb    |    3 ++-
 .../recipes-graphics/tesseract/tesseract-lang.inc  |    4 +++-
 .../xdotool/xdotool_1.20100416.2809.bb             |    2 +-
 .../engine-pkcs11/engine-pkcs11_0.1.8.bb           |    4 ++--
 .../system-setup-keyboard_0.8.8.bb                 |    2 +-
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |    7 ++++++-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    4 ++--
 .../usb-modeswitch/usb-modeswitch_2.2.0.bb         |    2 +-
 .../vboxguestdrivers/vboxguestdrivers_4.3.22.bb    |    2 +-
 13 files changed, 27 insertions(+), 19 deletions(-)

-- 
1.7.9.5


