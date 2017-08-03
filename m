Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A18162134
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Aug 2017 13:05:30 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Thu, 3 Aug 2017 14:05:30 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Thu, 3 Aug 2017 14:05:15 +0100
Message-ID: <20170803130518.6351-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][pyro][PATCH 0/3] backport gitver.bbclass improvements
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
X-List-Received-Date: Thu, 03 Aug 2017 13:05:31 -0000
Content-Type: text/plain

Please consider the following changes cherry-picked from master allowing
the usage of gitver.bbclass combined with EXTERNALSRC

For your convenience they are available in the git repository at:

  https://github.com/amery/meta-openembedded for-pyro

Thank you

Alejandro Mery (3):
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

 meta-oe/classes/gitver.bbclass | 47 +++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

-- 
2.13.0


