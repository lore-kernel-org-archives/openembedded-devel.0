Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A29B7EDF9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:28:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6B7QcPg021793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2019 00:27:01 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 11 Jul 2019 00:26:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<robert.joslyn@redrectangle.org>, <Mikko.Rapeli@bmw.de>
Date: Thu, 11 Jul 2019 15:26:50 +0800
Message-ID: <1562830010-5441-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-oe][PATCH] cryptsetup: set the default luks format to LUKS1
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
X-List-Received-Date: Thu, 11 Jul 2019 07:28:03 -0000
Content-Type: text/plain

The cryptsetup 2.1 uses LUKS2 format as the default LUKS format. This
change introduced the following issues:

* LUKS2 requires kernel userspace crypto API to be available
  (CONFIG_CRYPTO_USER_API and CONFIG_CRYPTO_USER_API_SKCIPHER). But
  linux-yocto doesn't enable these options by default. If missing these
  kernel modules, the cryptsetup will fall back to using dmcrypt-device
  for keyslot processing.

  $ cryptsetup --debug --type luks luksFormat /dev/sda3
    [snip]
    Checking if cipher aes-xts-plain64 is usable.
    Userspace crypto wrapper cannot use aes-xts-plain64 (-95).
    Using dmcrypt to access keyslot area.
    [snip]

* The grub can not decrypt a LUKS2 encrypted boot partition because it
  doesn't support LUKS2 now.
  See grub bug: https://savannah.gnu.org/bugs/?55093

Add a PACKAGCONFIG for luks format and set the default LUKS format to
LUKS1. The users can specify '--type luks2' in cryptsetup command line
if they want to use LUKS2.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
index a500b18..deaede8 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto_backend=gcrypt,,libgcrypt"
 PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
 PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
 PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
+PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
 
 RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-dm-crypt \
-- 
2.7.4


