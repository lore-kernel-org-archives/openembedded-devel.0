Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 80CAF605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 05:40:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97776086"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 13:44:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q5cYYc030049
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 13:38:34 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 13:40:12 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 13:30:48 +0800
Message-ID: <1435296650-24595-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 0/2] uim: add new recipe and dependence
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
X-List-Received-Date: Fri, 26 Jun 2015 05:40:17 -0000
Content-Type: text/plain

UIM(Universal Input Method) is a multilingual user input method library,
which is provided by lots of linux distro, such as Debian, Ubuntu, Fedora.

Bian Naimeng (2):
  anthy: add new recipe
  uim: add new recipe

 meta-oe/recipes-support/anthy/anthy/2ch_t.patch    | 5062 ++++++++++++++++++++
 .../anthy/anthy/native-helpers.patch               |   50 +
 .../anthy/anthy/not_build_elc.patch                |   16 +
 .../anthy/anthy/target-helpers.patch               |  111 +
 meta-oe/recipes-support/anthy/anthy_9100h.bb       |   42 +
 .../uim/uim/0001-fix-bug-about-stdlib.patch        |   40 +
 .../uim/uim/0001-fix-bug-for-cross-compile.patch   |   28 +
 .../uim/uim/uim-module-manager.patch               |   11 +
 meta-oe/recipes-support/uim/uim_1.3.1.bb           |  128 +
 9 files changed, 5488 insertions(+)
 create mode 100644 meta-oe/recipes-support/anthy/anthy/2ch_t.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/native-helpers.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy/target-helpers.patch
 create mode 100644 meta-oe/recipes-support/anthy/anthy_9100h.bb
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/uim/uim/uim-module-manager.patch
 create mode 100644 meta-oe/recipes-support/uim/uim_1.3.1.bb

-- 
1.9.1


