Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 483656FEC3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 22:22:20 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so6368322wgg.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X06cQI5TYU7XopilWJ0LYciSOXVLlAHfnRfTiXbMzs0=;
	b=MfNcffO1GWOyI3766NSrqUNB60ZNw/asx9eukdd8SJddSvVs7prkS5gsA/44sHrcGT
	cDJY1CXQg3LFvzy+Br+ATeGxNGuuNwXYjPgizA8SvVR5LAkeOTPd45NeKb2pwh1u/f6H
	cb7Blju4ZE9WOpX/y/aFcx/k2uIL08pCg6M+jWp1bQaATYIgr1yC4OL3348gleyPW/vC
	W8F2t6oB4cjt8REE4kjI4Ubpiwuc4PvbF8Pyu3pSp3JZF6TxIzTaV9DC/m13L/odsl+m
	GQ5SAGOU5/YKdyLkA5STt86PY6HktffsKduPJmGhT5+fSD/CoJqENLpqTz9W3qUJWkgy
	h+DQ==
X-Received: by 10.194.77.2 with SMTP id o2mr32097320wjw.68.1402957340473;
	Mon, 16 Jun 2014 15:22:20 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host103-90-dynamic.45-79-r.retail.telecomitalia.it. [79.45.90.103])
	by mx.google.com with ESMTPSA id
	v45sm36829464eeg.29.2014.06.16.15.22.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jun 2014 15:22:19 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 00:22:10 +0200
Message-Id: <cover.1402956940.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH 0/3] zaurus kernel config fixes
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
X-List-Received-Date: Mon, 16 Jun 2014 22:22:22 -0000

In order to reduce the kernel size we disable some unused
filesystems and the respective xattr, posix acl.

The second patch removes the mem=64M hardcoding for collie.

The third one updates collie's CFI driver to the last version.

Andrea Adami (3):
  linux-yocto_3.14: zaurus: remove unused filesystems to reduce kernel
    size
  zaurus collie: remove hardcoded mem=64M
  linux-yocto: refresh collie-LH28F640BF patch

 conf/machine/include/zaurus.inc                    |  2 +-
 .../linux/linux-yocto-3.10/collie/collie.cfg       |  2 +-
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 82 ++++++----------------
 .../linux/linux-yocto-3.14/akita/defconfig         | 20 +-----
 .../linux/linux-yocto-3.14/c7x0/defconfig          | 20 +-----
 .../collie/collie-LH28F640BF.patch                 | 82 ++++++----------------
 .../linux/linux-yocto-3.14/collie/defconfig        | 22 ++----
 .../linux/linux-yocto-3.14/poodle/defconfig        | 20 +-----
 .../linux/linux-yocto-3.14/spitz/defconfig         | 20 +-----
 .../linux/linux-yocto-3.14/tosa/defconfig          | 20 +-----
 .../collie/defconfig                               |  2 +-
 11 files changed, 64 insertions(+), 228 deletions(-)

-- 
1.9.1


