Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id EC6EC609C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 58EC8401CE9;
	Thu, 14 Aug 2014 17:32:09 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Aug 2014 17:31:41 +0200
Message-Id: <1408030303-742-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 0/2] collectd: series of build fixes
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
X-List-Received-Date: Thu, 14 Aug 2014 15:32:18 -0000

This is a series of fixes for collectd that unblock merge of rabbitmq.

The first patch of the series works around the API deprecation on
rabbitmq-c side. Most probabl collectd supports at most rabbitmq-c in
version 0.4.*. It is advisable to update to 0.5.* if no functional
problems are uncovered.

The second patch resolves issues with protobuf-c that is only
available in meta-virtualization.



