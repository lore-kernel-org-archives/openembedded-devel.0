Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 415BE60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6krV2027071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:46:53 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:46:52 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:41 +0800
Message-ID: <cover.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/8] fix QA issue for multilib
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
X-List-Received-Date: Fri, 21 Aug 2015 06:46:56 -0000
Content-Type: text/plain


The following changes since commit 55713b8c15cec00c01b4924ee60f13753c7d5354:

  inetutils: 1.9.2 -> 1.9.4 (2015-08-19 20:43:30 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/fix-qa-issue
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/fix-qa-issue

Yi Zhao (8):
  tomoyo-tools: pass correct libdir to make
  libssh: upgrade 0.6.4 -> 0.7.1
  wbxml2: set correct LIB_SUFFIX for multilib
  libftdi: set correct LIB_SUFFIX for multilib
  openwsman: pass correct libdir to cmake
  qt-creator: pass correct IDE_LIBRARY_BASENAME
  libqofono: fix the hardcoded libdir
  libconnman-qt: fix the hardcoded libdir

 .../recipes-extended/openwsman/openwsman_2.6.0.bb  |    2 +-
 meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc |    1 +
 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb      |    1 +
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb  |    2 ++
 meta-oe/recipes-support/libftdi/libftdi_1.1.bb     |    2 ++
 .../libssh/{libssh_git.bb => libssh_0.7.1.bb}      |    7 +++----
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb  |    2 ++
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |    3 ++-
 8 files changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_git.bb => libssh_0.7.1.bb} (79%)

-- 
1.7.9.5


