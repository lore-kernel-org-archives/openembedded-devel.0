Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD7D60088
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 01:24:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t611OlUo028350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 18:24:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 30 Jun 2015 18:24:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Jul 2015 09:24:26 +0800
Message-ID: <1435713866-2884-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] php: fix a building failure on aarch64
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
X-List-Received-Date: Wed, 01 Jul 2015 01:24:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

When -O0 of gcc is used to compile the macro ZEND_SIGNED_MULTIPLY_LONG
in Zend/zend_multiply.h, the compiling will fail with the below error:
  : Assembler messages:
  :3113: Error: operand 2 should be an integer register -- `mul x1,[x29,200],[x29,192]'
  :3114: Error: operand 2 should be an integer register -- `smulh x0,[x29,200],[x29,192]'

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.5.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.26.bb b/meta-oe/recipes-devtools/php/php_5.5.26.bb
index 8b64b2b..85fdccb 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.26.bb
@@ -101,6 +101,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
+CFLAGS_append_aarch64 = " -O2"
 
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
-- 
1.9.1


