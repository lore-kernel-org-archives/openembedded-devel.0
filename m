Return-Path: <hainsvdbosch@ziggo.nl>
X-Greylist: delayed 999 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Aug 2018 12:35:17 UTC
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net
	[212.54.42.167])
	by mail.openembedded.org (Postfix) with ESMTP id F3ED678D99
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 12:35:17 +0000 (UTC)
Received: from [212.54.42.132] (helo=smtp8.tb.mail.iss.as9143.net)
	by smtpq4.tb.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1flCYx-0001UY-D1
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2018 14:18:39 +0200
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp8.tb.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1flCYx-0000Ok-AT; Thu, 02 Aug 2018 14:18:39 +0200
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2018 14:18:25 +0200
Message-Id: <20180802121825.26225-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.17.1
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=EJqyLGRC c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=dapMudl6Dx4A:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
	a=1cI4GYfS3LhjqKuKisQA:9 a=ZPHkQOs1zdIA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH] libtalloc: refresh patch
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
X-List-Received-Date: Thu, 02 Aug 2018 12:35:18 -0000

WARNING: libtalloc-2.1.14-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch avoid-attr-unless-wanted.patch
patching file lib/replace/wscript
Hunk #1 succeeded at 837 with fuzz 2 (offset 201 lines).
Hunk #2 succeeded at 850 with fuzz 2 (offset 204 lines).

Now at patch avoid-attr-unless-wanted.patch
---
 .../libtalloc/avoid-attr-unless-wanted.patch         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
index a3ee9ccd9..db3ddce2c 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
@@ -1,20 +1,20 @@
 --- a/lib/replace/wscript	2015-11-13 16:04:04.000000000 +0100
 +++ b/lib/replace/wscript	2015-11-13 16:23:20.000000000 +0100
-@@ -636,8 +636,6 @@
+@@ -837,8 +837,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
 -    if not bld.CONFIG_SET('HAVE_GETXATTR') or bld.CONFIG_SET('XATTR_ADDITIONAL_OPTIONS'):
 -                                                 REPLACE_SOURCE += ' xattr.c'
  
-     bld.SAMBA_LIBRARY('replace',
-                       source=REPLACE_SOURCE,
-@@ -648,7 +646,7 @@
+     if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
+         REPLACE_SOURCE += ' closefrom.c'
+@@ -852,7 +850,7 @@ def build(bld):
                        # at the moment:
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
 -                      deps='crypt dl nsl socket rt attr' + extra_libs)
 +                      deps='crypt dl nsl socket rt ' + extra_libs)
  
-     bld.SAMBA_SUBSYSTEM('replace-test',
-                       source='''test/testsuite.c test/strptime.c
+     replace_test_cflags="-Wno-format-zero-length"
+     if bld.CONFIG_SET('HAVE_WNO_FORMAT_TRUNCATION'):
-- 
2.17.1


