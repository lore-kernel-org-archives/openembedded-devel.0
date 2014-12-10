Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 021BC72368
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:00:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44802214"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 17:57:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA94Ng1021029
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 17:04:24 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 17:04:48 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 17:01:27 +0800
Message-ID: <1418202088-36649-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/1] Move drbd from meta-oe to meta-networking
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
X-List-Received-Date: Wed, 10 Dec 2014 10:00:31 -0000
Content-Type: text/plain

As discussed at yocto@yoctoproject.org. 
https://lists.yoctoproject.org/pipermail/yocto/2014-December/022542.html

We should move drbd from meta-oe to meta-networking.
And add the RDEPEND for this recipe.

Bian Naimeng (1):
  Move drbd from meta-oe to meta-networking.

 .../recipes-support/drbd/drbd/drbd.service         | 12 +++++
 meta-networking/recipes-support/drbd/drbd_8.4.4.bb | 58 ++++++++++++++++++++++
 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb        | 57 ---------------------
 meta-oe/recipes-extended/drbd/files/drbd.service   | 12 -----
 4 files changed, 70 insertions(+), 69 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd/drbd.service
 create mode 100644 meta-networking/recipes-support/drbd/drbd_8.4.4.bb
 delete mode 100644 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
 delete mode 100644 meta-oe/recipes-extended/drbd/files/drbd.service

-- 
1.9.1


