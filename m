Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3746A6C0BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:37:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9bUR8023906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:37:30 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:37:18 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:37:13 +0800
Message-ID: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/4] *** Upgrade 4 recipes ***
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
X-List-Received-Date: Tue, 27 Nov 2018 09:37:30 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

*** BLURB HERE ***

Changqing Li (4):
  netcat-openbsd: upgrade to 1.195
  dnsmasq: upgrade to 2.80
  c-ares: upgrade to 1.15
  autofs: upgrade to 5.1.5

 .../0001-Do-not-hardcode-path-for-pkg.m4.patch     | 19 +++--
 .../0002-Replace-__S_IEXEC-with-S_IEXEC.patch      | 36 ++++++---
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   | 89 ----------------------
 .../autofs/autofs/pkgconfig-libnsl.patch           | 35 +++++----
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch | 24 ++++--
 .../autofs/{autofs_5.1.4.bb => autofs_5.1.5.bb}    |  7 +-
 .../c-ares/{c-ares_1.14.0.bb => c-ares_1.15.0.bb}  |  4 +-
 .../recipes-support/dnsmasq/dnsmasq_2.79.bb        |  8 --
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb        |  8 ++
 ...at-openbsd_1.190.bb => netcat-openbsd_1.195.bb} | 12 +--
 10 files changed, 96 insertions(+), 146 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.4.bb => autofs_5.1.5.bb} (92%)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.14.0.bb => c-ares_1.15.0.bb} (88%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.190.bb => netcat-openbsd_1.195.bb} (65%)

-- 
2.7.4


