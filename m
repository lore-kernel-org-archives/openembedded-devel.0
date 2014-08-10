Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id CFEF970A7E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:39 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so9237528pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bt+CMEZlFpaVMyY3fea/NrkQ0FF8VloLy9Q+S+NLPOo=;
	b=VHZNZ5rFMxcctdumcX/A0kSJTGQY74U2KP7AVJc7P7OGZwuZGxrcTa7M7z7dt72+Te
	R4i0AP5UcOvWr3ElHSJgt21/KHJcyR+39G1hb6WdVlLjN4ItbyYcysccmbGWMA08Zn6x
	rrJ+A3jjCgGyLi4vGzZA370hQkqqy576BPEPs7A2PpbZ/GFm/CE+cenf377yif+Tv9Ts
	U2+Sx5Ys6ptWZSWBvwbSvjJ62tNZQA0NyrHyoNzvkB+jWxV/qDdT0a/D7V2xSn8O3fyG
	+25zjhl15Dz+ofdyf4AGPGEx2NlXCRPnE5o+AIqY5c+RAUl+b6wuiDaU9OeHFpw2RLfl
	u3NQ==
X-Received: by 10.68.164.164 with SMTP id yr4mr32805743pbb.57.1407632620978;
	Sat, 09 Aug 2014 18:03:40 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:10 -0700
Message-Id: <cover.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 0/5] Various dnsmasq fixes/improvements
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
X-List-Received-Date: Sun, 10 Aug 2014 01:03:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit a9636f77ac00bafd1429dc52bdf2f8f2446866f9:

  wireshark: update configuration and epoch (2014-08-06 19:51:59 -0400)

are available in the git repository at:

  git@github.com:kergoth/meta-openembedded dnsmasq-fixes

for you to fetch changes up to ce63b6d184231a0a1797b91e2ad530bcdc4c7fee:

  dnsmasq: add packageconfigs for idn, conntrack, lua (2014-08-07 14:42:08 -0700)

----------------------------------------------------------------
Christopher Larson (5):
  dnsmasq: add missing inherit pkgconfig
  dnsmasq: obey CFLAGS & LDFLAGS
  dnsmasq: fix parallel make issue
  dnsmasq: look for lua.pc, not lua5.1.pc
  dnsmasq: add packageconfigs for idn, conntrack, lua

 meta-networking/recipes-support/dnsmasq/dnsmasq.inc   | 18 ++++++++++++++----
 .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 15 +++++++++++++++
 .../dnsmasq/dnsmasq/parallel-make.patch               | 19 +++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.68.bb           |  5 +++++
 4 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch

-- 
1.8.3.4


