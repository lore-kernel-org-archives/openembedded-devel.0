Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E75F265D30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:25:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6P24A016477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:25:02 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 20 Apr 2014 23:25:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 14:24:48 +0800
Message-ID: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-networking][PATCH 0/4] Fix some errors and CVE issue
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
X-List-Received-Date: Mon, 21 Apr 2014 06:25:04 -0000
Content-Type: text/plain

Kai Kang (3):
  quagga: fix CVE-2013-6051
  quagga: fix QA warning
  ndisc6: allow the package can be empty

Wenzong Fan (1):
  radvd.init: fix path to radvd.conf sample

 .../recipes-daemons/radvd/files/radvd.init         |  2 +-
 .../quagga/files/quagga-fix-CVE-2013-6051.patch    | 29 ++++++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc            |  2 ++
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |  2 ++
 4 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch

-- 
1.8.4


