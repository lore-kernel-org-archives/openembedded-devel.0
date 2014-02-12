Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 87FB26E89C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:46:23 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 868F240083;
	Wed, 12 Feb 2014 19:10:45 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2014 20:46:07 +0100
Message-Id: <1392234367-1895-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] python-m2crypto: special setting for x86-64 architecture
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
X-List-Received-Date: Wed, 12 Feb 2014 19:46:23 -0000

After python-m2crypto was reported as failed task in bitbake world
on 2014-02-08 by Martin Jansa, I investigated python-m2crypto with
MACHINE = "qemux86-64" setting. When compiling python-m2crypto for
qemux86-64, the setup.py aborts in the swig call with:

  | swig -python -I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include/python2.7 -I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include -includeall -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
  | [...]/tmp-eglibc/sysroots/qemux86-64/usr/include/openssl/opensslconf.h:41: Error: Unable to find 'openssl/opensslconf-32.h'
  | error: command 'swig' failed with exit status 1
  | ERROR: python setup.py build_ext execution failed.
  | WARNING: exit code 1 from a shell command.

To compile for x86-64 architecture, opensslconf.h shall include
opensslconf-64.h, not opensslconf-32.h. Properly including
opensslconf-64.h can be configured through the bits/wordsize.h
header and setting the __x86_64__ directive in the swig call. To
set the directive, the SWIG_FEATURES variable for x86-64 is
set and exported in the recipe.

Compiling python-m2crypto for qemumips still fails and needs
further adjustments, but is not addressed here.

This patch follows Khem Raj's suggestion on the openembedded-devel
mailing list after submission of the first commit to this issue.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
index 9babc04..c88b935 100644
--- a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -16,4 +16,8 @@ S = "${WORKDIR}/M2Crypto-${PV}"
 
 inherit setuptools
 
+SWIG_FEATURES_x86-64 = "-D__x86_64__"
+SWIG_FEATURES ?= ""
+export SWIG_FEATURES
+
 BBCLASSEXTEND = "native"
-- 
1.8.3.2


