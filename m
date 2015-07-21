Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id ED16E734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:46 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so114975985pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E4RA4K0zKDkIcUr2CDtmfLwlYBCuUU5kS2+FRnkd8CE=;
	b=tj3sNdjGHr8mU6nU2Lenvqg+8ZScxA6ADGdPvgsIQQWyCXm1c7ts1W4QC6+x+MQXGz
	UKMtlEehy+0FXuzdXYT2qaoPNYsGiaB3FYhuhj0AeOxzPIg9m8NYrPzMBJaxh/NQri9w
	pe2W39v5pNpDavmqrRXbh5lSNhZzwzE3BekidqLV1s+Jwb1Fy3a83dfA6qTVXm4wQzDF
	od7S/OOlpqzdrZhGhuaheSI7xDq7TnuPuIg63VMb+vWhZg8PyuJs/BTlRxeQJlha2JK0
	FXnQwg4EY9EDwIcAnJJEr6Es4PpeOlhAxI5wbCzVyQ3VyIPEkmq56S5AFeqKZkyXRfNc
	r2wg==
X-Received: by 10.66.102.103 with SMTP id fn7mr69229648pab.85.1437454606620;
	Mon, 20 Jul 2015 21:56:46 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r9sm24760091pdp.5.2015.07.20.21.56.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 21:56:45 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 6B8FCFC0E51; Mon, 20 Jul 2015 21:56:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 20 Jul 2015 21:56:35 -0700
Message-Id: <cover.1437454485.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] meta-oe Dizzy-next
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
X-List-Received-Date: Tue, 21 Jul 2015 04:56:48 -0000

please consider these patches for meta-openembedded dizzy-next

The following changes since commit 5b6f39ce325d490fc382d5d59c5b8b9d5fa38b38:

  gsoap: fold .inc and -native into one recipe (2015-04-29 19:24:09 +0200)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/dizzy-next
  https://github.com/akuster/meta-openembedded/tree/akuster/dizz-next

Hugo Vasconcelos Saldanha (1):
  libssh2: fix CVE-2015-1782

Roy Li (2):
  mariadb: Security Advisory -CVE-2015-2305
  ipsec-tools: Security Advisory - CVE-2015-4047

Stefan Agner (1):
  ptpd: disable libpcap detection via pcap-config

Tudor Florea (1):
  fuse: fix for CVE-2015-3202 Privilege Escalation

 ...fix_exec_environment_for_mount_and_umount.patch |  63 +++++++++++
 .../recipes-support/fuse/fuse_2.9.3.bb             |   1 +
 .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb         |   4 +-
 .../ipsec-tools/fix-CVE-2015-4047.patch            |  36 +++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
 .../libssh2/libssh2-1.4.3/CVE-2015-1782.patch      | 115 +++++++++++++++++++++
 meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb   |   4 +-
 .../mysql/mariadb/fix-CVE-2015-2305.patch          |  43 ++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |   1 +
 9 files changed, 265 insertions(+), 3 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch

-- 
1.9.1


