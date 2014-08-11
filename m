Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B44F601A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:12:59 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so4475037wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O9QWUcq1V5hLrVjVqWDMWvmhZPMqFUoW2478cT9M4GY=;
	b=sEWIepVc9jRXBoPawCHH3MpkN1rQSJF5IhyA1NeEHJwImgE6lyZ1ljH1qVNsfIT8Z6
	IkFErXHqR7s8UdxeTgkmqZaPckW5c22SSbxw3G9o9chW8ZLNI5zDDiaZFpyAk/JP48MQ
	xaEbAJm7VUid9aTv6maIhrY1yVfAGpmJWfkmWRDwhE+Cf9MN6CmJfJnKErCq9vN+Zp9q
	4dicF6A+J1YkNuZuRDNCu5aA6rXK/CasYtHXyp0vhBlBcwjbNcejxGd9DQD7J/rB9kym
	sfty8HGUfd/Y3utps4U00xbSgQT+GT6p5eDdtq9pY/XOomPzcEB3mHHIiVLK5hQni/d8
	wIaQ==
X-Received: by 10.180.97.129 with SMTP id ea1mr26857093wib.29.1407773580600;
	Mon, 11 Aug 2014 09:13:00 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.12.58
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:12:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:21 -0700
Message-Id: <cover.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 0/5] Various dnsmasq fixes/improvements
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
X-List-Received-Date: Mon, 11 Aug 2014 16:13:03 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is rebased on current master. The parallel make fix's commit message is
adjusted to match what it does, and the lua patch is fixed.. It seems
something inadvertantly trimmed trailing whitespace out of the patch, oops.

The following changes since commit 4d4ab8fd320b58323033c12cf705e7b3ce10d659:

  integrate fcgi-2.4.0 and add OML license file (2014-08-10 17:23:22 +0100)

are available in the git repository at:

  https://github.com/kergoth/meta-openembedded dnsmasq-fixes

for you to fetch changes up to 2e84f59401a5ce57ba17841ff4ddb01cffeb1145:

  dnsmasq: add packageconfigs for idn, conntrack, lua (2014-08-11 09:07:14 -0700)

----------------------------------------------------------------
Christopher Larson (5):
      dnsmasq: add missing inherit pkgconfig
      dnsmasq: obey CFLAGS & LDFLAGS
      dnsmasq: move parallel make patch to .bb, add upstream-status
      dnsmasq: look for lua.pc, not lua5.1.pc
      dnsmasq: add packageconfigs for idn, conntrack, lua

 meta-networking/recipes-support/dnsmasq/dnsmasq.inc   | 19 ++++++++++++++-----
 .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 16 ++++++++++++++++
 .../dnsmasq/{files => dnsmasq}/parallel-make.patch    |  1 +
 .../recipes-support/dnsmasq/dnsmasq_2.68.bb           |  5 +++++
 4 files changed, 36 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
 rename meta-networking/recipes-support/dnsmasq/{files => dnsmasq}/parallel-make.patch (96%)

-- 
1.8.3.4


