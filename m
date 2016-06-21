Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F000260721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:39:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5L5dtvo019695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jun 2016 22:39:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 20 Jun 2016 22:39:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 01:39:50 -0400
Message-ID: <cover.1466487409.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] fix python-pygobject broken
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
X-List-Received-Date: Tue, 21 Jun 2016 05:39:57 -0000
Content-Type: text/plain

The following changes since commit 9cd117a5dc5f26133a855d1cc3bf9604ae178685:

  chrony: Versatile implementation of NTP (2016-06-16 13:28:16 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-python
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-python

Hongxu Jia (3):
  Revert "python-pygobject, python-cloudeebus, python-dbusmock:
    Blacklist because of python-pygobject is broken"
  python-pygobject: fix do_configure failed
  python-cloudeebus: fix do_compile failure

 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb             | 5 +----
 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb     | 7 ++++---
 meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb | 5 +----
 meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb  | 3 ---
 4 files changed, 6 insertions(+), 14 deletions(-)

-- 
2.8.1


