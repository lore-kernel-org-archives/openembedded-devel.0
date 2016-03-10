Return-Path: <gthomas@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id A8AD265CB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:41:12 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A2B0C68A022; Thu, 10 Mar 2016 04:41:12 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id DDDF968A019;
	Thu, 10 Mar 2016 04:41:06 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 904666740C5B; Thu, 10 Mar 2016 05:41:06 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 05:40:57 +0100
Message-Id: <1457584859-16862-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.5.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH v2 0/2] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 04:41:15 -0000

mpv is a new media player, based on a fork of Mplayer and mplayer2.
libass is updated to the latest version (necessary for fully functioning mpv)

Gary Thomas (2):
  libass: Update to latest version
  mpv: Media Player

 meta-oe/recipes-multimedia/libass/libass.inc       |  7 +--
 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb |  5 --
 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb |  4 ++
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb   | 65 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb

-- 
2.5.0


