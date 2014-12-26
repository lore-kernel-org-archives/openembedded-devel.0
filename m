Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E56B47264F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 06:24:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="48748494"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Dec 2014 14:20:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBQ6NaiC019714
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 14:23:36 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Dec 2014 14:24:09 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 14:23:24 +0800
Message-ID: <1419575006-51771-1-git-send-email-leimaohui@cn.fujitsu.com>
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
X-List-Received-Date: Fri, 26 Dec 2014 06:24:12 -0000
Content-Type: text/plain

GeoIP: allow you to look up information about a given IP address.
geoipupdate: can download and update the GeoLite Legacy databases.

leimh (2):
  GeoIP: add recipe
  geoipupdate: add new recipe

 meta-networking/recipes-support/GeoIP/GeoIP.inc    | 10 ++++
 .../recipes-support/GeoIP/GeoIP_1.6.0.bb           | 54 ++++++++++++++++++++++
 .../GeoIP/geoipupdate-2.1.0/GeoIP.conf             | 11 +++++
 .../GeoIP/geoipupdate-2.1.0/geoipupdate.cron       |  5 ++
 .../recipes-support/GeoIP/geoipupdate_2.1.0.bb     | 26 +++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP.inc
 create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
 create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate-2.1.0/GeoIP.conf
 create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate-2.1.0/geoipupdate.cron
 create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate_2.1.0.bb

-- 
1.9.1


