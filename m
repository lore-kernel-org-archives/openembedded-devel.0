Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E71771B2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA8Jw6xZ018784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:06 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:05 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:00 -0800
Message-ID: <20171108195805.136677-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/5] update to samba 4.7.0
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
X-List-Received-Date: Wed, 08 Nov 2017 19:58:05 -0000
Content-Type: text/plain

Currently supported version.  Apply the patches in order.  You
can stop after patch 3.  When you apply 4, immediately apply 5
because samba 4.6.7 will generate a library that is also generated
by libldb (it refuses to use libldb 1.2.2).

Joe Slater (5):
  libtalloc: update to version 2.1.10
  libtevent: update to version 0.99.33
  libtdb: update to version 1.3.15
  libldb: update to version 1.2.2
  samba: move to version 4.7.0

 .../samba/samba/dnsserver-4.7.0.patch              | 19 ++++++
 .../samba/samba/iconv-4.7.0.patch                  | 25 ++++++++
 .../samba/samba/smb_conf-4.7.0.patch               | 19 ++++++
 .../samba/{samba_4.6.7.bb => samba_4.7.0.bb}       | 67 +++++++++++++++++-----
 .../libldb/{libldb_1.1.29.bb => libldb_1.2.2.bb}   |  6 +-
 ...ons-for-packages.patch => options-2.1.10.patch} | 17 +++---
 .../{libtalloc_2.1.9.bb => libtalloc_2.1.10.bb}    |  7 ++-
 .../libtdb/{libtdb_1.3.14.bb => libtdb_1.3.15.bb}  |  4 +-
 ...ons-for-packages.patch => options-0.9.33.patch} | 28 ++++-----
 .../{libtevent_0.9.31.bb => libtevent_0.9.33.bb}   |  6 +-
 10 files changed, 153 insertions(+), 45 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.6.7.bb => samba_4.7.0.bb} (79%)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.29.bb => libldb_1.2.2.bb} (92%)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{talloc-Add-configure-options-for-packages.patch => options-2.1.10.patch} (95%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.9.bb => libtalloc_2.1.10.bb} (90%)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.14.bb => libtdb_1.3.15.bb} (91%)
 rename meta-networking/recipes-support/libtevent/libtevent/{tevent-Add-configure-options-for-packages.patch => options-0.9.33.patch} (90%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.31.bb => libtevent_0.9.33.bb} (87%)

-- 
2.7.4


