Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bBM-0004aY-FW
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:12 +0100
Received: by eaal10 with SMTP id l10so637175eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.100.80 as permitted sender) client-ip=10.14.100.80; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.100.80 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.100.80])
	by 10.14.100.80 with SMTP id y56mr1229693eef.68.1330012671224 (num_hops
	= 1); Thu, 23 Feb 2012 07:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ks0IAhcx3GnNrurftUL9It80ZO2LYcyRunBY/Hl4p58=;
	b=B80tUTm3ZzvdxqjSIlERWwVgk4UhJU+cAkOAOpcCRew7nHOzYZ8Fd11guNOcOjOXhT
	WZow/ZH11BFapPX8n4IrYP3vRcFp4Busodn0uHxj+AlaKOFZIDHM9CU7N+Ijb8EKbBR1
	M2fE1+EP3vMlVnQSiEgkbejrYLD14epgRECLs=
Received: by 10.14.100.80 with SMTP id y56mr970275eef.68.1330012670982;
	Thu, 23 Feb 2012 07:57:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm6752656eei.3.2012.02.23.07.57.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:57:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:57:42 +0100
Message-Id: <cover.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH 0/7] PACKAGECONFIG for polkit and foxtrotgps upgrade - added more patches for systemd and sstate
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:12 -0000

First 2 patches are the same,

Added 4 more patches for systemd_unitdir variable and 1 patch for sstate

The following changes since commit 4751336bc02d6881efff1c0c6a1b449a156eb723:

  vsftpd: add new package (2012-02-22 12:23:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (7):
  foxtrotgps: upgrade to 1.1.0
  polkit: enable and disable systemd/consolekit support explicitly
  postgresql: include Makefile.global in SSTATE_SCAN_FILES
  gateone: use systemd_unitdir variable
  networkmanager: use systemd_unitdir variable
  cloud9: use systemd_unitdir variable
  ntp: use systemd_unitdir variable

 .../recipes-connectivity/gateone/gateone_git.bb    |    6 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |    4 +-
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb    |    8 ++--
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 ++-
 .../foxtrotgps-1.0.1/remove.unused.header.patch    |   40 --------------------
 .../{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb}   |    8 +--
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   10 ++--
 meta-oe/recipes-support/postgresql/postgresql.inc  |    4 +-
 8 files changed, 25 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
 rename meta-oe/recipes-navigation/foxtrotgps/{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb} (61%)

-- 
1.7.8.4



