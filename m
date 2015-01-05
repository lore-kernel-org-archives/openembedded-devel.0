Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E44A872011
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 07:20:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55536687"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 15:17:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t057K0CJ023942
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 15:20:00 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 5 Jan 2015 15:20:32 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jan 2015 15:19:51 +0800
Message-ID: <1420442394-39127-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][PATCH 0/3] add dlm and it's dependencies
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
X-List-Received-Date: Mon, 05 Jan 2015 07:20:40 -0000
Content-Type: text/plain

From: leimh <leimaohui@cn.fujitsu.com>

Add dlm control daemon and tool because the kernel dlm requires a user daemon to control membership.
corosync : the dependency of dlm
libqb: the dependency of corosync

leimh (3):
  libqb: add new recipe
  corosync_2.3.4: add new recipe
  dlm: add a new recipe

 .../recipes-extended/corosync/corosync_2.3.4.bb    | 59 ++++++++++++++++++++++
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          | 47 +++++++++++++++++
 meta-oe/recipes-extended/libqb/libqb_0.17.1.bb     | 26 ++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
 create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
 create mode 100644 meta-oe/recipes-extended/libqb/libqb_0.17.1.bb

-- 
1.8.4.2


