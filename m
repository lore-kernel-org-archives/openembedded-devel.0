Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S13hG-0003ey-QP
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 23:33:02 +0100
Received: by eekd41 with SMTP id d41so1346543eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.202.197 as permitted sender) client-ip=10.14.202.197; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.202.197 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.202.197])
	by 10.14.202.197 with SMTP id d45mr2437678eeo.128.1330122279898
	(num_hops = 1); Fri, 24 Feb 2012 14:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WUpLK6yRy5UEJI/xoo1Xrg2qF/znGVVWZRv/qDPym/w=;
	b=aQxYPCq7lOLMNdlbmVYzTjuO1NnyoLsN8rJGAiNw++nUWyblZJJVLE55oksAgfVHkr
	YKg83SwI+z4IVNCRXGW0blE+sRKi57v8wZ1/UCb2rxCNysmxBUWfr/AuXrEooti/8szC
	cGOKaLe6CdGkh7ArLffk52Bc/87JtN4IJkVP0=
Received: by 10.14.202.197 with SMTP id d45mr1820335eeo.128.1330122279775;
	Fri, 24 Feb 2012 14:24:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm23207720eeb.8.2012.02.24.14.24.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 14:24:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 23:24:30 +0100
Message-Id: <cover.1330122206.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH 0/5] Small fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 22:33:02 -0000

The following changes since commit 2eaec194016ba357bb02db8859b2b3737d759865:

  meta-multimedia: initial add (2012-02-24 13:53:17 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  mpfr: drop from meta-oe, 3.1.0 is in oe-core
  task-x11-illume: use allarch
  task-cli-tools: move ltrace to RRECOMMENDS as it's probably not
    available for shr4 and sh3 and use allarch
  task-x11: use allarch
  meta-oe: add mplayer-common to SIGGEN_EXCLUDERECIPES_ABISAFE

 meta-efl/recipes-efl/tasks/task-x11-illume.bb      |    2 +-
 meta-oe/conf/layer.conf                            |    6 +-
 meta-oe/recipes-core/tasks/task-cli-tools.bb       |   14 +-
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    2 +-
 .../mpfr/mpfr-3.0.0/long-long-thumb.patch          |   11 -
 meta-oe/recipes-support/mpfr/mpfr-3.0.0/p4.patch   | 1752 --------------------
 meta-oe/recipes-support/mpfr/mpfr_3.0.0.bb         |   30 -
 7 files changed, 13 insertions(+), 1804 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mpfr/mpfr-3.0.0/long-long-thumb.patch
 delete mode 100644 meta-oe/recipes-support/mpfr/mpfr-3.0.0/p4.patch
 delete mode 100644 meta-oe/recipes-support/mpfr/mpfr_3.0.0.bb

-- 
1.7.8.4



