Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxU-00021t-T4
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:01 +0100
Received: by yenr5 with SMTP id r5so1932238yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=H6eQAYi4r7lvRpKyU3uRN2xoBJjFPn3EhNKcwjLcv9E=;
	b=hmdqbchu8LUHFDqRGl+k4wUtmVQrZJ+86gw0MW/YjpuFvAJRYQn0M17VZpZPtCxU/T
	ir91CXSScXYaPRJWNx1ir6Ul8u8m4FoRMSELKskkDgRnOlOF/6lDMrXxTgKTU8VRQESv
	TyOWwji+5jtnYqp2x9pKEVi5b551yqamGNKvM=
Received: by 10.101.2.7 with SMTP id e7mr3263715ani.33.1329500566050;
	Fri, 17 Feb 2012 09:42:46 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.42.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:42:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:28 +0000
Message-Id: <cover.1329500479.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/7] Pending patches in O.S. Systems' tree
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
X-List-Received-Date: Fri, 17 Feb 2012 17:51:01 -0000

The following changes since commit 83281ff6b918b05f0d12d11a0a031db30f7fb1a5:

  xfce4-settings: Update to latest stable version 4.8.3. (2012-02-14 15:15:54 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (7):
  Revert "systemd.bbclass: depends on systemd"
  udisks: explicitly depends on systemd
  polkit: depends on systemd
  net-snmp: sync with 5.7 maintainence branch
  net-snmp: use netlink support
  net-snmp: move static libs onto ${PN}-staticdev
  openbox: add 3.4.11.2

 meta-oe/classes/systemd.bbclass                    |    2 +-
 .../net-snmp/files/libnl-3-support.patch           |   69 +
 .../net-snmp/files/sync-with-5.7-branch.patch      |19998 ++++++++++++++++++++
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |    9 +-
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |    4 +-
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +
 .../openbox/openbox/fix-decorations.patch          |   73 +
 .../openbox/openbox/fix-dialog-buttons.patch       |   38 +
 .../openbox/openbox/sync-with-3.4-working.patch    | 2739 +++
 .../recipes-graphics/openbox/openbox_3.4.11.2.bb   |   40 +
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    4 +-
 11 files changed, 22970 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/sync-with-5.7-branch.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox/fix-decorations.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox/fix-dialog-buttons.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox/sync-with-3.4-working.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox_3.4.11.2.bb

-- 
1.7.2.5



