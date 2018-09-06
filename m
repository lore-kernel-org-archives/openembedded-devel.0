Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9D97602D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:26:05 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id p84-v6so21289555oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=6jYWJvj2dx4x4ue2nj5ey67NUGJHw9Ui88/BNtPd8LI=;
	b=eJV6A7p3aLmttFeHPqgcLVvCZqLzf4GzoDyjN48orA1fk+zY7s/KeKmoYJ8KAdPuaF
	G6WTFB7P49ly2S8Vsgg5cIm6YirB0rW8Vcwkb8JE7FeWT2ggkt63j/SeDBgoiqoQyShU
	9e2KgCgYshXTjGq8ibLvclQonXxZyC/rSNT9VFS2Io56N3T7DjWlOa1sz7OlgH1g+pg1
	RjIHQmsUcGGZYAxdgM1vmX3S1mpSDilMpn3M79ByTGfLBUiiZ8gPW4qqNqZgdpwm2Zem
	odRX2kS3rOIYA15EvPSuaiVkFVPnmGjImLXwK3PQzsKQ3CvE2kPhez+ZIu+Mz8ily0pM
	z6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=6jYWJvj2dx4x4ue2nj5ey67NUGJHw9Ui88/BNtPd8LI=;
	b=NghEgpeGcpZQZ+HoMcpjQXRj0D5XwZ4Ete1uYcVPEDsMzwbvu6GAgfVZbxScU4xPs4
	NAiGMdPmRDjab4QnVYyU73X+46agNrIKqd30yri0oXrwgYZJaAPW9h349jtwM597AY6h
	Wqjm30JQOANvS3vc66o0oyA8u+kXMmjW8YhfDeaJvJiRcRvbToeCila8AzvslI4kGT8e
	hvrvSvJTX9rgL9e+jcxuU3u58LhoRcASxDe01arH8tqOVitFyYqt66Wd/xKCXLZiNH3a
	vyj+oCrhM/k7gY7RU0NHD3SyQF9uicRHsp5qqLdUuBrJyxpdkisabFc01gSkbgpujp6w
	3cIQ==
X-Gm-Message-State: APzg51BHuN3X1549JNjfMr/F6gpBNsUCeS1G/n8fToNk6shSXGDZ6JZJ
	d86rwhA7uZD/wIsQaffTeUy8p4wd
X-Google-Smtp-Source: ANB0VdbU3vmlWOpPteVdAJxRYdusw/eEZqEKdmIvp6WLwWG+zQzNDsvceoJNDQd9iSm8TtOkJ7Qk+w==
X-Received: by 2002:aca:190d:: with SMTP id
	l13-v6mr3500929oii.216.1536247566800; 
	Thu, 06 Sep 2018 08:26:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s ([2601:202:4180:c33:a9a3:ce31:52a9:bd5c])
	by smtp.gmail.com with ESMTPSA id
	d5-v6sm2868033oia.57.2018.09.06.08.26.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 08:26:06 -0700 (PDT)
Message-ID: <5b91470e.1c69fb81.7c4ca.db46@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Thu, 06 Sep 2018 08:26:04 -0700
Date: Thu, 06 Sep 2018 08:26:04 -0700
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: Sumo merge request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 15:26:06 -0000

The following changes since commit b0950aeff5b630256bb5e25ca15f4d59c115e7c1:

  python-lockfile: Fix build error as following: (2018-06-14 20:27:46 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded be79b8b

for you to fetch changes up to be79b8b111a968efdbe5e1482d0c246d0b24763e:

  fuse: CVE-2018-10906 (2018-08-26 11:03:11 -0700)

----------------------------------------------------------------
Armin Kuster (2):
      wireshark: update to 2.4.7
      wireshark: update to 2.4.8

Denys Dmytriyenko (1):
      devmem2: ensure word is 32-bit, add support for 64-bit long

Jagadeesh Krishnanjanappa (1):
      fuse: CVE-2018-10906

Oleksandr Kravchuk (1):
      libsodium: update to 1.0.16

changqing.li@windriver.com (1):
      php: upgrade 7.2.4 -> 7.2.7     Included:

leimaohui (2):
      python-pytest: Fix conflict error as following:
      libnih: Fix do_package error when enable mutilib.

 .../fuse/files/CVE-2018-10906-1.patch              | 52 ++++++++++++++++
 .../fuse/files/CVE-2018-10906-2.patch              | 48 +++++++++++++++
 .../recipes-support/fuse/fuse_2.9.7.bb             |  2 +
 .../{wireshark_2.4.6.bb => wireshark_2.4.8.bb}     |  4 +-
 .../recipes-crypto/libsodium/libsodium_1.0.11.bb   | 12 ----
 .../recipes-crypto/libsodium/libsodium_1.0.16.bb   | 13 ++++
 ...cinclude-use-pkgconfig-for-libxml2-config.patch |  2 +-
 .../php/php/acinclude-xml2-config.patch            |  2 +-
 meta-oe/recipes-devtools/php/php/iconv.patch       |  2 +-
 .../php/php/imap-fix-autofoo.patch                 |  2 +-
 .../recipes-devtools/php/php/pear-makefile.patch   |  2 +-
 .../php/php/php5-pear-makefile.patch               |  2 +-
 .../recipes-devtools/php/php/php_exec_native.patch |  2 +-
 .../php/{php_7.2.4.bb => php_7.2.7.bb}             |  5 +-
 meta-oe/recipes-support/devmem2/devmem2.bb         |  4 +-
 ...sure-word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++++++++++
 meta-oe/recipes-support/libnih/libnih_1.0.3.bb     | 10 ++++
 .../recipes-devtools/python/python-pytest.inc      | 10 ++++
 .../recipes-devtools/python/python-pytest_3.4.2.bb |  1 +
 .../python/python3-pytest_3.4.2.bb                 |  2 +
 20 files changed, 222 insertions(+), 25 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.4.6.bb => wireshark_2.4.8.bb} (95%)
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
 rename meta-oe/recipes-devtools/php/{php_7.2.4.bb => php_7.2.7.bb} (80%)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch

