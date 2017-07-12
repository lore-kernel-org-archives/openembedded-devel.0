Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A8CE077972
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:59:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21174155"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jul 2017 12:59:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9723F46B5241
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:59:02 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 12 Jul 2017 12:59:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jul 2017 12:58:37 +0800
Message-ID: <1499835521-973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 9723F46B5241.A636E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH v4 0/4] Add ptest for qtdeclarative, qtxmlpatterns and qtquick1
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
X-List-Received-Date: Wed, 12 Jul 2017 04:59:08 -0000
Content-Type: text/plain

1) Add 'qt5-ptest.inc' for qt5 ptest
2) Add ptest for qtxmlpatterns by using provided testsuite.
3) Add ptest for qtdeclarative by using provided testsuite.
4) Add ptest for qtquick1 by using provided testsuite. 

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qt5-ptest.inc           | 62 ++++++++++++++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative/run-ptest |  5 +++
 recipes-qt/qt5/qtdeclarative_git.bb    |  1 +
 recipes-qt/qt5/qtquick1/run-ptest      |  6 ++++
 recipes-qt/qt5/qtquick1_git.bb         |  1 +
 recipes-qt/qt5/qtxmlpatterns/run-ptest |  6 ++++
 recipes-qt/qt5/qtxmlpatterns_git.bb    |  2 ++
 7 files changed, 83 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-ptest.inc
 create mode 100644 recipes-qt/qt5/qtdeclarative/run-ptest
 create mode 100644 recipes-qt/qt5/qtquick1/run-ptest
 create mode 100644 recipes-qt/qt5/qtxmlpatterns/run-ptest

-- 
2.7.4




