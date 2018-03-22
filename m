Return-Path: <hainsvdbosch@ziggo.nl>
X-Greylist: delayed 965 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Mar 2018 20:20:05 UTC
Received: from smtpq3.mnd.mail.iss.as9143.net (smtpq3.mnd.mail.iss.as9143.net
	[212.54.34.166])
	by mail.openembedded.org (Postfix) with ESMTP id D9B286FF80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 20:20:05 +0000 (UTC)
Received: from [212.54.34.114] (helo=smtp6.mnd.mail.iss.as9143.net)
	by smtpq3.mnd.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1ez6RN-0007iE-Nr
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2018 21:04:01 +0100
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp6.mnd.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1ez6RN-0000OV-LK; Thu, 22 Mar 2018 21:04:01 +0100
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 21:03:47 +0100
Message-Id: <20180322200347.23084-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.15.1
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=HPnt6Llv c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=v2DPQv5-lfwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
	a=omOdbC7AAAAA:8 a=By98YYcCc15E0FvcvKcA:9 a=ZPHkQOs1zdIA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
	a=baC4JDFNLZpnPwus_NF9:22 none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH] smbnetfs: refresh patch
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
X-List-Received-Date: Thu, 22 Mar 2018 20:20:06 -0000

WARNING: smbnetfs-git-r0 do_patch:
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
Applying patch Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
patching file configure.ac
Hunk #1 succeeded at 119 with fuzz 2 (offset -6 lines).
patching file src/Makefile.am
Hunk #1 succeeded at 17 (offset 1 line).

Now at patch Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
---
 ...ng-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
index 371ab8982..6d60c9d22 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
@@ -11,12 +11,12 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ce21aef..ecd7119 100644
+index 4c03409..8d22e71 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
-     )]
- )
+@@ -119,6 +119,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUseCCache, [], [
+ LIBS="$LIBS $SMBCLIENT_LIBS"
+ CFLAGS="$CFLAGS $SMBCLIENT_CFLAGS"
  
 +dnl *****************************************************************
 +dnl *** Check libsmbclient by pkgconfig to get cflags and ldflags ***
@@ -27,10 +27,10 @@ index ce21aef..ecd7119 100644
  dnl *** Final step ***
  dnl ******************
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 41519d8..9fc97e9 100644
+index ccaa8c3..6598317 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -16,3 +16,6 @@ smbnetfs_SOURCES = \
+@@ -17,3 +17,6 @@ smbnetfs_SOURCES = \
  	event.c			event.h			\
  	reconfigure.c		reconfigure.h		\
  	main.c
-- 
2.15.1


