Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2C265CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 06:01:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5L61XiZ021299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 23:01:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 20 Jun 2016 23:01:32 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 02:01:30 -0400
Message-ID: <cover.1466488576.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] krb5: add systemd support
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
X-List-Received-Date: Tue, 21 Jun 2016 06:01:36 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* replace base_contains with bb.utils.contains
* replace ${systemd_unitdir}/system with ${systemd_system_unitdir}

The changes tested on master branch.

The following changes since commit 9cd117a5dc5f26133a855d1cc3bf9604ae178685:

  chrony: Versatile implementation of NTP (2016-06-16 13:28:16 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/krb5-systemd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/krb5-systemd

Wenzong Fan (1):
  krb5: add systemd support

 .../krb5/krb5/krb5-admin-server.service            | 14 +++++++++++
 .../krb5/krb5/krb5-kdc.service                     | 13 ++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   | 29 +++++++++++++++-------
 3 files changed, 47 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service

-- 
2.8.1


