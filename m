Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZC-0005IT-TO
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:31 +0200
Received: by bkcik5 with SMTP id ik5so2156742bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=mNc8CyN/9DYMRkFtt+eUVv8KQWGRT/vrCXrSiw2DJno=;
	b=Gm9mp1V7QZXdflVUi5jVNZPYiy6Q1QdlWIyscIzrkKBfjGCG8ePnXKcnYR1ysWIEwD
	DEDIC8k2FCtkf38T9IIoEXVzIBMC+bqNMP29BP5ZojUs9EqTDVAtjysKTX77MZXXu6I9
	QrNw0O3LwxeqaLrKI6SFSCXqHfH6Ql3oewH/2xtP/DUU96ocBkgOWLjWJkQFRnoCNBx5
	KqVyy0sBoeQGsJM9F47PBlHCXgJQ5EUd9CybDKSKsRZRetH6SDxETiMQuxH50G63dKUi
	o/gUEHvfu/ERkfbwk4uDRAW1etO8ERdvzVCX4qxEPx+nom5VZjaT8oFo9QViMXM1YJ3H
	Csiw==
Received: by 10.204.152.5 with SMTP id e5mr3920336bkw.78.1347869272462;
	Mon, 17 Sep 2012 01:07:52 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:07:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:40 +0200
Message-Id: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 0/7] pending-patches
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
X-List-Received-Date: Mon, 17 Sep 2012 08:20:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit d010c0650b8331d97e5cf5681930f73da7de2d29:

  mcnavi: fix do_configure_prepend to be reentrant (2012-09-11 19:21:30 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (7):
      gnome.bbclass: remove to use oe-core's version
      gdm: do not rely on dev-tty7.device
      gdm: do not hardcode /usr/sbin
      gdm: remove obsolete files
      networkmanager: unbreak build with latest kernel headers
      xfce4-session: Don't loose xfwm4 when closing session with multiple windows waiting for user input
      lxdm: initial add 1.22_git

 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml   |  492 --------------------
 meta-gnome/recipes-gnome/gdm/gdm/gdm               |   73 ---
 meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch  |   12 -
 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf          |   80 ----
 meta-oe/classes/gnome.bbclass                      |    4 -
 ...se-struct-ifpppstatsreq-that-was-removed-.patch |   48 ++
 .../networkmanager/networkmanager_0.9.2.0.bb       |    3 +-
 ...conf.in-blacklist-root-for-release-images.patch |   29 ++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam        |   13 +
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug  |   13 +
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 +
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   62 +++
 .../gdm/gdm/{gdm.service => gdm.service.in}        |    5 +-
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +-
 .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 +
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 +
 ...-xfwm4-when-closing-session-with-multiple.patch |  169 +++++++
 .../xfce4-session/xfce4-session_4.8.3.bb           |    4 +-
 18 files changed, 380 insertions(+), 670 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/gdm
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
 delete mode 100644 meta-oe/classes/gnome.bbclass
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm_git.bb
 rename meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/{gdm.service => gdm.service.in} (50%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch

-- 
1.7.4.4



