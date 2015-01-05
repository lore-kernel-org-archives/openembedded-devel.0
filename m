Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF57601F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:39:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55526309"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 10:36:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t052dPAM026513
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 10:39:25 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 5 Jan 2015 10:39:57 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jan 2015 10:39:19 +0800
Message-ID: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-networking][PATCH 0/2] add new recipes for GeoIP
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
X-List-Received-Date: Mon, 05 Jan 2015 02:40:03 -0000
Content-Type: text/plain

From: leimh <leimaohui@cn.fujitsu.com>

geoip: allow you to look up information about a given IP address.
geoipupdate: can download and update the GeoLite Legacy databases.

leimh (2):
  GeoIP: add recipe
  geoipupdate: add new recipe

 .../recipes-support/geoip/geoip_1.6.0.bb           | 58 ++++++++++++++++++++++
 .../geoip/geoipupdate-2.1.0/GeoIP.conf             | 11 ++++
 .../geoip/geoipupdate-2.1.0/geoipupdate.cron       |  5 ++
 .../recipes-support/geoip/geoipupdate_2.1.0.bb     | 30 +++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-support/geoip/geoip_1.6.0.bb
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/GeoIP.conf
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1.0/geoipupdate.cron
 create mode 100644 meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb

-- 
1.8.4.2


