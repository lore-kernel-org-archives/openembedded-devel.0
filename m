Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24F9160118
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 08:37:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBL8b4Pm021342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Dec 2015 00:37:04 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 00:37:03 -0800
From: <kai.kang@windriver.com>
To: <Martin.Jansa@gmail.com>
Date: Mon, 21 Dec 2015 16:24:12 +0800
Message-ID: <1450686254-23383-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/2] Move mime-construct to meta-perl
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
X-List-Received-Date: Mon, 21 Dec 2015 08:37:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Martin,

I worked based on origin/master-next. We could just drop the commit of adding layer dependency. I made a revert commit just to make it clear.

Kai Kang (2):
  mime-construct: move from meta-networking to meta-perl
  Revert "meta-networking: depends on layer meta-perl"

 meta-networking/conf/layer.conf                    |  1 -
 .../fix-mime-construct-help-return-value.patch     | 39 ----------------------
 .../mime-construct/mime-construct_1.11.bb          | 22 ------------
 .../fix-mime-construct-help-return-value.patch     | 39 ++++++++++++++++++++++
 .../mime-construct/mime-construct_1.11.bb          | 22 ++++++++++++
 5 files changed, 61 insertions(+), 62 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
 delete mode 100644 meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
 create mode 100644 meta-perl/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
 create mode 100644 meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb

-- 
2.6.1


