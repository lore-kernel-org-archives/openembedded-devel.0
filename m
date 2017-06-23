Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 05B1B77FED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:24:01 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Fri, 23 Jun 2017 21:24:01 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 21:23:18 +0100
Message-ID: <20170623202324.69194-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver fixes from master
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
X-List-Received-Date: Fri, 23 Jun 2017 20:24:02 -0000
Content-Type: text/plain

The following changes have been cherry-picked from master and are
available in the git repository at:

https://github.com/amery/meta-openembedded for-morty

for you to fetch

Alejandro Mery (4):
  gitver: fix try/except syntax for python3 support
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

Denys Dmytriyenko (1):
  devmem2: use different filename to avoid checksum conflicts

Nicolas Ferre (1):
  devmem2: Change source URL to regain access to it

 meta-oe/classes/gitver.bbclass             | 51 ++++++++++++++++++------------
 meta-oe/recipes-support/devmem2/devmem2.bb | 12 ++++---
 2 files changed, 38 insertions(+), 25 deletions(-)

-- 
2.13.0


