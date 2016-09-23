Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52E886FF76
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8N8UW3u001796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:30:32 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 23 Sep 2016 01:30:32 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 16:30:27 +0800
Message-ID: <cover.1474619229.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 0/2] squid: two fixes
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
X-List-Received-Date: Fri, 23 Sep 2016 08:30:32 -0000
Content-Type: text/plain


The following changes since commit 24e387aaf78bc0f68a46abb1fab3a76364804bd1:

  openldap: fix CVE-2015-3276 (2016-09-19 16:24:10 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/squid-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/squid-fixes

Yi Zhao (2):
  squid: specify sysconfdir and logdir
  squid: fix ptest failure

 ...squid-don-t-do-squid-conf-tests-at-build-time.patch |  6 +++---
 .../recipes-daemons/squid/files/volatiles.03_squid     |  1 +
 meta-networking/recipes-daemons/squid/squid_3.5.20.bb  | 18 ++++++++++++++++--
 3 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.7.4


