Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpfq-0001Et-RN
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:54:46 +0200
Received: by weyr6 with SMTP id r6so926309wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=czQwO5X+pSD7YJ3fm1q2B5xsVZ/pD3IxEXyWbABkaSM=;
	b=URSQZdEDN3yzJYkBwXAZ/gF0dVUQqbplN0wBVaswo0jcJdm5sKWAjNMChnct/Pi5A3
	8E4yFTO3HVciO1lHb795bNpH/i5+//+MVvz2H08HcD7CF+GTtRe1umrDNQUst00PWqMJ
	se6Va+C1teU3hchZJW1OLqc/1HO/DaaEFUpLnDyW4BfGd4okceU12fbLBQGkMT1wHNbi
	Yg5YMrKttSKT0tp0G4xie7LZooub95IvZxmJdH6g2pL/7kaj8Ji1p/PSCD1XscJUNcQO
	U7a2mji891XRnhf86FKX4zL5ZjVV1h7n+/mLjaKHpFjfmz33g9dk0uzUyhwUJOK+Je2J
	KQ/Q==
Received: by 10.180.75.209 with SMTP id e17mr7315955wiw.0.1344606177071;
	Fri, 10 Aug 2012 06:42:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm7820895wiv.11.2012.08.10.06.42.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:42:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:54 +0200
Message-Id: <cover.1344599409.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/3] PHP fix and gpsd upgrade
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
X-List-Received-Date: Fri, 10 Aug 2012 13:54:46 -0000

The following changes since commit e26fe501dd5258b99d5f1ec1167ed2a890210b78:

  libxml++: New recipe - C++ bindings for libxml (2012-08-08 09:39:43 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (2):
  gpsd: update to 3.7, drop older 3.5 and git recipe
  meta-systemd: adjust the gpsd bbappend to match the current version.

Martin Jansa (1):
  php: drop LD_LIBRARY_PATH settings

 meta-oe/recipes-devtools/php/php.inc               |    5 +-
 ...disable-html-and-man-docs-building-becaus.patch |    0
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |    0
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   30 +++++
 .../0004-SConstruct-remove-rpath.patch             |   21 ++--
 ...respect-sysroot-setting-when-prepending-L.patch |   36 ------
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   29 -----
 ...strptime-prototype-is-not-provided-unless.patch |   39 ------
 .../gpsd/{gpsd_3.5.bb => gpsd_3.7.bb}              |    8 +-
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |  127 --------------------
 .../gpsd/{gpsd_3.5.bbappend => gpsd_3.7.bbappend}  |    0
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 --
 12 files changed, 45 insertions(+), 264 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0004-SConstruct-remove-rpath.patch (78%)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.5.bb => gpsd_3.7.bb} (93%)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_git.bb
 rename meta-systemd/meta-oe/recipes-navigation/gpsd/{gpsd_3.5.bbappend => gpsd_3.7.bbappend} (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend

-- 
1.7.8.6



