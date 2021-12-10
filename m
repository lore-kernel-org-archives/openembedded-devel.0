Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386DDC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:33:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.10626.1639157585104678544
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BAHX4Hg025091
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:33:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BAHX4vH024878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:33:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Dec 2021 09:33:04 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 10 Dec 2021 09:33:03 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH 0/1] io-compress-lzma-perl: add recipe for version
 2.096 
Date: Fri, 10 Dec 2021 12:33:02 -0500
Message-ID: <20211210173303.20066-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 17:33:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94278

add recipe for io-compress-lzma-perl and all its dependecies.

Testing for both glibc and musl:
# Initialize the Build Environment
source oe-init-build-env

# add to local.conf
# make sure all the packages build
IMAGE_INSTALL:append = " io-compress-lzma-perl \
compress-raw-lzma-perl io-compress-perl compress-raw-bzip2-perl \
compress-raw-zlib-perl perl-ptest"
DISTRO_FEATURES:append = " ptest"
# for musl build
TCLIBC = "musl"

# build and run image
bitbake core-image-base
runqemu nographic

# test
cd /usr/lib/perl/ptest/cpan/Archive-Tar/t
mkdir x && cd x
tar xf ../src/long/foo.tgz
tar caf ../src/long/foo.txz *
# to confirm it's a XZ archive
file ../src/long/foo.txz
cd ..
perl 02_methods.t 1> /tmp/test.out 2>&1

# Verify no "Fail" in /tmp/test.out.

Sakib Sajal (1):
  io-compress-lzma-perl: add recipe for version 2.096

 .../libio/compress-raw-bzip2-perl_2.096.bb    | 32 +++++++++++++++++++
 .../libio/compress-raw-lzma-perl_2.096.bb     | 32 +++++++++++++++++++
 .../libio/compress-raw-zlib-perl_2.096.bb     | 31 ++++++++++++++++++
 .../libio/io-compress-lzma-perl_2.096.bb      | 24 ++++++++++++++
 .../libio/io-compress-perl_2.096.bb           | 24 ++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb

-- 
2.33.0


