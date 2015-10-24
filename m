Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7823575A38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:42 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so146596587pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=O7CouXthE6nOsUmu49K07saYv8wxOYeyOUL9NM4ZSNc=;
	b=O4/EcqJJAYUFZoPKVHVukDU3WgUBMgSQxR9wmyBdbpI5Yj0kseflUT5nPpWgvBsapz
	jArFY7PAHKHcSpT9RHpn8tFJO7AZJZOstj7Np+hTNWHIdgyQHp3uqpqYTdfQv6MSESZD
	kHCP2xGt3pqsmFjONoG1memFFqVpzuGPUz7DJEWR41epZGoC4AyBHomyAEctfUdjRNrU
	SHxPGpMz8YV4U9ffuihxpOUjhYjNpnds1chydC6rQu8uxk7icL6EgBHQjv158zCWpjvJ
	XRoCcEGOaoneVTRiFCkCPltdMuaNt8w38I7rSyu2T36IWqxUJmBGEo+ULhixyaAqJPBL
	IgVw==
X-Received: by 10.66.120.136 with SMTP id lc8mr12174939pab.19.1445709462558;
	Sat, 24 Oct 2015 10:57:42 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	nj1sm25250431pbc.2.2015.10.24.10.57.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:40 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 76589FC66D7; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:18 -0700
Message-Id: <cover.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Fido-next
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these update for Fido

The following changes since commit 763de0599bd61eae1c122782b03e12b66319a2f1:

  ruby: explicitly disable dtrace support (2015-10-14 21:17:27 +0200)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/fido-next
  https://github.com/akuster/meta-openembedded/tree/akuster/fido-next

Li xin (1):
  ntp: upgrade 4.2.8p2 -> 4.2.8p3

Martin Jansa (1):
  nautilus3: Fix build with B != S

Roy Li (3):
  mariadb: Security Advisory -CVE-2015-2305
  ipsec-tools: Security Advisory - CVE-2015-4047
  ntp: uprev to 4.2.8p2

Tim Orling (1):
  vlc: fix for libtool error

Tudor Florea (1):
  fuse: fix for CVE-2015-3202 Privilege Escalation

 ...fix_exec_environment_for_mount_and_umount.patch |  63 ++++++++
 .../recipes-support/fuse/fuse_2.9.3.bb             |   1 +
 .../recipes-gnome/nautilus/nautilus3_3.2.1.bb      |   2 +-
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   2 +-
 .../ipsec-tools/fix-CVE-2015-4047.patch            |  36 +++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
 .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  | 168 ---------------------
 .../ntp/{ntp_4.2.8.bb => ntp_4.2.8p3.bb}           |   7 +-
 meta-oe/recipes-support/mysql/mariadb.inc          |   1 +
 .../mysql/mariadb/fix-CVE-2015-2305.patch          |  43 ++++++
 10 files changed, 150 insertions(+), 174 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
 delete mode 100644 meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8.bb => ntp_4.2.8p3.bb} (95%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch

-- 
1.9.1


