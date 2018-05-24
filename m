Return-Path: <hainsvdbosch@ziggo.nl>
X-Greylist: delayed 1473 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 May 2018 12:40:10 UTC
Received: from smtpq3.mnd.mail.iss.as9143.net (smtpq3.mnd.mail.iss.as9143.net
	[212.54.34.166])
	by mail.openembedded.org (Postfix) with ESMTP id E1D7A6FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 12:40:10 +0000 (UTC)
Received: from [212.54.34.114] (helo=smtp6.mnd.mail.iss.as9143.net)
	by smtpq3.mnd.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1fLp9e-0007FF-AW
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2018 14:15:38 +0200
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp6.mnd.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1fLp9e-0000WW-84; Thu, 24 May 2018 14:15:38 +0200
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:15:23 +0200
Message-Id: <20180524121523.6956-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.17.0
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=HPnt6Llv c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=VUJBJC2UJ8kA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
	a=l2TacDBqCxP8-rTlfSMA:9 a=ZPHkQOs1zdIA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH] libtevent: refresh patch
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
X-List-Received-Date: Thu, 24 May 2018 12:40:11 -0000

WARNING: libtevent-0.9.36-r0 do_patch:
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
Hunk #1 succeeded at 793 with fuzz 2 (offset 175 lines).
Hunk #2 succeeded at 806 with fuzz 2 (offset 178 lines).

Now at patch avoid-attr-unless-wanted.patch

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
---
 .../libtevent/avoid-attr-unless-wanted.patch   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
index 2fc55239c..35890335a 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
@@ -1,20 +1,22 @@
---- a/lib/replace/wscript	2015-11-18 15:40:19.000000000 +0100
-+++ b/lib/replace/wscript	2015-11-18 15:48:09.000000000 +0100
-@@ -618,8 +618,6 @@
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index 079761d..07e0104 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -793,8 +793,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
 -    if not bld.CONFIG_SET('HAVE_GETXATTR') or bld.CONFIG_SET('XATTR_ADDITIONAL_OPTIONS'):
 -                                                 REPLACE_SOURCE += ' xattr.c'
  
-     bld.SAMBA_LIBRARY('replace',
-                       source=REPLACE_SOURCE,
-@@ -630,7 +628,7 @@
+     if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
+         REPLACE_SOURCE += ' closefrom.c'
+@@ -808,7 +806,7 @@ def build(bld):
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
2.17.0


