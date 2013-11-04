Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07D096D290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:49:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA45nhig014317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:49:43 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:49:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <joe@deserted.net>
Date: Mon, 4 Nov 2013 00:49:40 -0500
Message-ID: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 0/2]: meta-virtualization derived updates
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
X-List-Received-Date: Mon, 04 Nov 2013 05:49:43 -0000
Content-Type: text/plain

Joe,

Here are a couple of changes that I've pulled out of the various layers that
I've been testing and looking after.

One is an uprev to dnsmasq to 2.63, and the other is a recipe from meta-virtualization
that is a better fit in meta-networking.

I tweaked both the recipes slightly as part of updating them for submission to
meta-networking, and documented the tweaks in the patches themselves. 

Anyway, have a look, and let me know what additional changes you'd like made
to the recipes.

Cheers,

Bruce


Bruce Ashfield (2):
  dnsmasq: uprev to 2.6.3
  netcf: move from meta-virtualization to meta-networking

 .../recipes-support/dnsmasq/dnsmasq.inc            |  8 +++++++
 .../recipes-support/dnsmasq/dnsmasq_2.55.bb        |  6 ------
 .../recipes-support/dnsmasq/dnsmasq_2.63.bb        |  4 ++++
 meta-networking/recipes-support/netcf/netcf_git.bb | 25 ++++++++++++++++++++++
 4 files changed, 37 insertions(+), 6 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
 create mode 100644 meta-networking/recipes-support/netcf/netcf_git.bb

-- 
1.8.1.2


