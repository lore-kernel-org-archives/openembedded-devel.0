Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 940EF6006A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6L3bG003702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 23:21:03 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:21:02 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Wed, 30 May 2018 14:20:52 +0800
Message-ID: <1527661260-29811-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 0/8] add UPSTREAM_CHECK_URI for recipes (Part 2)
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
X-List-Received-Date: Wed, 30 May 2018 06:21:04 -0000
Content-Type: text/plain

Some recipes can not get upstream version with bitbake foo -c checkpkg. Add UPSTREAM_CHECK_URI for these recipes.

Yi Zhao (8):
  corosync: add UPSTREAM_CHECK_REGEX
  libdnet: add UPSTREAM_CHECK_GITTAGREGEX
  netcf: add UPSTREAM_CHECK_GITTAGREGEX
  strongswan: add UPSTREAM_CHECK_REGEX
  c-ares: add UPSTREAM_CHECK_GITTAGREGEX
  cyrus-sasl: add UPSTREAM_CHECK_REGEX
  drbd-utils: add UPSTREAM_CHECK_URI
  snort: add UPSTREAM_CHECK_URI

 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb    | 2 ++
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb     | 3 +++
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 ++
 meta-networking/recipes-extended/corosync/corosync_2.4.3.bb     | 2 ++
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb         | 2 ++
 meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb        | 2 ++
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 ++
 meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb  | 2 ++
 8 files changed, 17 insertions(+)

-- 
2.7.4


