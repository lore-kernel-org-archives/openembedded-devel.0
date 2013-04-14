Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URVqS-0008Rd-2K
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 00:56:26 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so1973587eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=zj8+HY/doc/t1v3dX+9LpycBC3QDTD+YOdAe7ZctTag=;
	b=J5ZTQsOtkJNDlpHwXwZkXAJs2Ps2nLwDIkzkMP+G1PS1DCnQiMZUc8UIl03ED7OimL
	cBKR5iQdvpYKXOuTJMo5m7aSWs9PrMtrGgHOkPMBa82wiPhMsgmnt7OBg5QoKRmZXZsP
	cmo47y/EJXl/vueneTGgIzQk9694rohFw8dimnyGdtSmDTz6/d3Z0h7OHbSShLtcJmT/
	yGl53vB0o5qlveWAlupsdlM57lIVAoRi2PZpL4kW7QSFbmwbwh5TpHIPrhvY/UtW0yYQ
	VOJ8FGguaAgnXTPRyKJEOpT3RozJkVW91M7m84JfIucynfI56rjKCJKbxIL+P1bXyIg4
	pnIQ==
X-Received: by 10.15.27.195 with SMTP id p43mr55257196eeu.8.1365979136158;
	Sun, 14 Apr 2013 15:38:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm23803632eeb.1.2013.04.14.15.38.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 15:38:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 00:38:59 +0200
Message-Id: <1365979139-17061-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] libetpan: add liblockfile dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 22:56:32 -0000

* claws-mail failed with
  | configure:20783: checking whether libetpan-config hints compiles and links fine
  | configure:20797: arm-oe-linux-gnueabi-gcc  -march=armv5te  -marm -mthumb-interwork   --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -o conftest -O2 -pipe -g -feliminate-unused-debug-types -Wno-unused-function -Wno-pointer-sign -Wall -pthread -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/enchant -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/glib-2.0 -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/glib-2.0/include     -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  -lm  -L/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib -letpan -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lgnutls -llockfile -lsasl2 >&5
  | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.7.2/ld: cannot find -llockfile
  | collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index 7049938..5deb26f 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "libetpan is a library for communicating with mail and news server
 It supports the protocols SMTP, POP3, IMAP and NNTP."
 HOMEPAGE = "http://www.etpan.org"
 SECTION = "libs"
-DEPENDS = "gnutls"
+DEPENDS = "gnutls liblockfile"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
            file://libetpan-autoreconf.patch \
            file://libetpan-ldflags.patch"
-- 
1.8.1.5



