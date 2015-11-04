Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2D58E75E2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:18 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so100129198wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=RnRl57AD4urMZ1+GHFMFXDK3e01BxIz8ik0hKQH69oo=;
	b=U/si/Xf42MsijXfTp308+WAQa3KDLSQqTzI/pXQITLr52s4ux7HNFAMhnx4PezpK/Y
	LSV5xLavO618BM8dA0FlgbKEJwXC5tGFfDvbP4QrrBUI7Rnsdgz8RjaQ2B7f3ZtGeygf
	PVMnh0hwkputZpAho8lLA7X8+yrdD+yLQJdwCpJ0gM2mvk12VWXrGhIQeYSV88iGbhj4
	Ry7StnFfkkHm8fd1KQVk27+uXox2lz2t6n1iKb91DMjeBGovivNPoYlU0nQgfeUwmgLO
	KdYSQzpMYxQOZV+PdoFARpcCzWEOcw1v9kVaIC+oOG54R+d98HdFvcsMlUQ3vlA2pSQI
	tXCA==
X-Received: by 10.194.175.164 with SMTP id cb4mr4915846wjc.72.1446680658145;
	Wed, 04 Nov 2015 15:44:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:42 +0100
Message-Id: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][v2 00/18] update + usabilty/build enhancements
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1->v2:
0008: bootstrap.bbclass -> autotools-bootstrap.bbclass as Khem suggested
0013: no copying-from-sysroot-dance - as Khem suggested (complained by me :)
0015: add bzip2 - detected in Martin's world
0016-0018: new

Note: I know samba is in very ugly condition (yes it builds but we have further
open build-deps and somebody did not understand that samba builds components for
clients connecting to servers and server itself -> packaging needs to get back
where it was) but this will be done in follow up patches (more or less promised).

The following changes since commit c63423e305c0c68e2a9aa1ae2e7509352a85c871:

  rrdtool: fix compile error (2015-11-02 15:01:10 +0100)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git:patches 

for you to fetch changes up to dfc5ef0e94c19a109bac5a1bef9e890e402612f0:

  samba: install pam libraries to base_libdir (2015-11-05 00:35:37 +0100)

----------------------------------------------------------------
Andreas Müller (18):
      xfce4-vala: unbreak by telling configure vala API version
      xfce-polkit: initial add 0.2
      packagegroup-xfce-extended: xfce-polkit
      gparted: update to 0.24.0
      gparted: add gtk-icon-cache to inherit
      gparted: add polkit support
      gnulib: move meta-networking -> meta-oe
      autotools-bootstrap.bbclass: initial add
      netcf: use autotools-bootstrap.bbclass
      gnulib: add native extend
      fontforge: use autotools-bootstrap.bbclass
      uthash: add native extend
      fontforge: avoid cloning uthash during do_compile
      xfce4-whiskermenu-plugin: update to 1.5.1
      cdrkit: initial add 1.1.11
      luajit: drop a note for build machine requirements
      samba: add cups to DEPENDS
      samba: install pam libraries to base_libdir

 meta-gnome/recipes-extended/gparted/files/gparted_polkit                                                           | 10 ++++++++++
 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy                               | 20 ++++++++++++++++++++
 meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb                                                              | 18 ------------------
 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb                                                              | 38 ++++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-support/netcf/netcf_git.bb                                                                 |  8 +-------
 meta-oe/classes/autotools-bootstrap.bbclass                                                                        | 24 ++++++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb                                                                 | 12 ++++++------
 meta-oe/recipes-devtools/luajit/luajit_2.1.bb                                                                      | 10 ++++++++++
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb                                                           | 13 +++++++------
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb                                                                 | 18 ++++++++++++++++++
 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch            | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb                            |  2 ++
 meta-oe/recipes-support/uthash/uthash_1.9.7.bb                                                                     |  2 ++
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb                                                              | 11 +++++++++++
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb                                                               |  4 ++--
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_git.bb => xfce4-whiskermenu-plugin_1.5.1.bb} | 10 +++-------
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                 |  2 ++
 17 files changed, 209 insertions(+), 46 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/gparted_polkit
 create mode 100644 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
 delete mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
 create mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
 create mode 100644 meta-oe/classes/autotools-bootstrap.bbclass
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch
 rename {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb (97%)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_git.bb => xfce4-whiskermenu-plugin_1.5.1.bb} (54%)

-- 
2.1.0


