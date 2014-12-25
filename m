Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90F9D72656
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Dec 2014 22:29:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 25 Dec 2014 14:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="504114329"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.219])
	by orsmga003.jf.intel.com with ESMTP; 25 Dec 2014 14:24:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Dec 2014 22:29:02 +0000
Message-Id: <cover.1419546494.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-networking][PATCH 0/1] ntp upgrade (including security fixes)
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
X-List-Received-Date: Thu, 25 Dec 2014 22:29:10 -0000

The following change since commit edcf03b5fb576dbeae3784471aec8c2b7a9a04a8:

  eggdbus: port from openembedded. (2014-12-17 13:11:57 +0100)

is available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/ntp-upgrade
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ntp-upgrade

Paul Eggleton (1):
  ntp: upgrade to 4.2.8

 .../recipes-support/ntp/files/CVE-2013-5211.patch  | 112 --------------
 .../recipes-support/ntp/files/openssl-check.patch  |  59 --------
 .../recipes-support/ntp/files/tickadj.c.patch      |  32 ----
 .../ntp/{files => ntp}/ntp-4.2.4_p6-nano.patch     |   0
 .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  | 168 +++++++++++++++++++++
 .../recipes-support/ntp/{files => ntp}/ntp.conf    |   0
 .../recipes-support/ntp/{files => ntp}/ntpd        |   0
 .../recipes-support/ntp/{files => ntp}/ntpdate     |   0
 .../ntp/{files => ntp}/ntpdate.default             |   0
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   6 -
 .../recipes-support/ntp/{ntp.inc => ntp_4.2.8.bb}  |  41 ++---
 11 files changed, 191 insertions(+), 227 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
 delete mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/files/tickadj.c.patch
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntp-4.2.4_p6-nano.patch (100%)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntp.conf (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpd (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpdate (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpdate.default (100%)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
 rename meta-networking/recipes-support/ntp/{ntp.inc => ntp_4.2.8.bb} (81%)

-- 
1.9.3


