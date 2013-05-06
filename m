Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UZQ6v-0008Kp-TX
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 20:26:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r46I85mF009030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 May 2013 11:08:06 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 11:08:04 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 May 2013 14:06:48 -0400
Message-ID: <1367863609-18196-1-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 0/1] Quagga: sync zebra routing table with the
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 18:26:29 -0000
Content-Type: text/plain

When interface goes down, and there are some static routes that are
made with ip route, they are going to be deleted from kernel fib.
That's what kernel does by default. But they are not going to be
deleted from zebra's fib. They will be declared inactive.

This issue was originally discussed in [1] and a patch was proposed.

[1] http://www.gossamer-threads.com/lists/quagga/dev/22609

Aws Ismail (1):
  Quagga: sync zebra routing table with the kernel one

 ...c-zebra-routing-table-with-the-kernel-one.patch |   48 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc            |    3 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch



