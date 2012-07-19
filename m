Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl6a-0005hQ-07
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:25:00 +0200
Received: by wibhm2 with SMTP id hm2so4461916wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=2gL3jqx0M7aLlcXN9GhvsAjvQE6KEqcNTFmzJPWTn4I=;
	b=c0EF39gI4K2ryC4AcTyIEw7+KsL54jz0SUcOtw48yiAfgUgDSAzUY26qLjMMBP3vky
	0M/IDlFTV7wyLROi7oeVVevc+hiFbn0kgQbQIzhrpZ8Qy8GcER3f+lrjoONQBpdI1RL8
	ntdnT52A70x1dkCHyme8drzLEA6Tby6FadTzN98N1OOzVyT3PUULtbvjhWPuJFQW7BsE
	D4j32U2vJA/uZ2/bRHxJhafz4YqThZhUaLLOyj6tEsKVk8MEee9ODFobq0yMiaIn6n3C
	26XYxZYKEIQ1g7InIa1HIQU+65i2uk4nEN/2YSWY6Y6d86kFjnf1AM3JGBDpLBGkmLb7
	xQ3w==
Received: by 10.180.86.226 with SMTP id s2mr1885860wiz.9.1342682018612;
	Thu, 19 Jul 2012 00:13:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm3938953wib.3.2012.07.19.00.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:13:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 09:13:44 +0200
Message-Id: <cover.1342681929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-gnome][PATCH 0/4] Pending changes
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
X-List-Received-Date: Thu, 19 Jul 2012 07:25:00 -0000

The following changes since commit df741a297e1190d2dc23a133bc4a0a41118019c6:

  gsettings-desktop-schemas: add SRC_URI checksums (2012-07-18 09:23:08 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Elvis Dowson (1):
  python_numpy: Fix SRC_URI warnings.

Martin Jansa (3):
  gnome-panel3: add dconf to DEPENDS
  dconf: fix unpackaged /usr/lib/gio/modules/.debug/libdconfsettings.so
  gtk+3: fix build with automake-1.12.x

 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb      |    3 ++
 .../gnome-panel/gnome-panel3_3.0.2.bb              |    2 +-
 .../gtk+/gtk+3/fix.build.automake-1.12.x.patch     |   27 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |    6 +++-
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    9 ++++++-
 5 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch

-- 
1.7.8.6



