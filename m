Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9472E60721
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:30:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB38UPIq002711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 00:30:25 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 00:30:25 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 16:18:44 +0800
Message-ID: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Update dependencies for mime-construct
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
X-List-Received-Date: Thu, 03 Dec 2015 08:30:29 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* add recipes of dependencies of mime-construct
* update the RDPENDS
* make meta-networking depends on meta-perl

Kai Kang (4):
  libipc-signal-perl: add recipe
  libproc-waitstat-perl: add recipe
  mime-construct: update runtime dependencies
  meta-networking: depends on layer meta-perl

 meta-networking/conf/layer.conf                    |   1 +
 .../mime-construct/files/Signal.pm                 | 132 ---------------
 .../mime-construct/files/WaitStat.pm               | 178 ---------------------
 .../fix-mime-construct-help-return-value.patch     |  39 +++++
 .../mime-construct/mime-construct_1.11.bb          |  19 +--
 .../recipes-perl/libipc/libipc-signal-perl_1.00.bb |  18 +++
 .../libproc/libproc-waitstat-perl_1.00.bb          |  20 +++
 7 files changed, 84 insertions(+), 323 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/mime-construct/files/Signal.pm
 delete mode 100644 meta-networking/recipes-extended/mime-construct/files/WaitStat.pm
 create mode 100644 meta-networking/recipes-extended/mime-construct/files/fix-mime-construct-help-return-value.patch
 create mode 100644 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
 create mode 100644 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb

-- 
2.6.1


