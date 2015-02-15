Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 35725606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 09:03:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57619294"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2015 16:59:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1F92g32010020
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 17:02:42 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 15 Feb 2015 17:03:29 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Feb 2015 16:58:21 +0800
Message-ID: <1423990703-31432-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 0/2] cyrus-sasl: fix bug and add systemd supported
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
X-List-Received-Date: Sun, 15 Feb 2015 09:03:30 -0000
Content-Type: text/plain

Bian Naimeng (2):
  cyrus-sasl: fix bug
  cyrus-sasl: add systemd supported for saslauthd

 .../cyrus-sasl/cyrus-sasl/saslauthd.conf           | 11 ++++++++
 .../cyrus-sasl/cyrus-sasl/saslauthd.service        | 12 ++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                | 33 ++++++++++++++++++++--
 3 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service

-- 
1.9.1


