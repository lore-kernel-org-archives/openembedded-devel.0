Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P85Sc-0005bS-Q0
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 08:14:11 +0200
Received: by pzk28 with SMTP id 28so380061pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Eiuz5qxiOnOOqBgl0ehl0x/9crEVNtVdwuvn5SVgd5Q=;
	b=Xz+9Ql+D8gO/rb20dPhAJ+3g7MsJLT4uZj6yS05FMIwSc/J8YanUF+UhDjy+MZqioE
	5pc8R7eN3ooe5PO7sU2VdAlvx2OreMOJjc6yTxCfo6JOOk2/izamZqCeBolwSWnt8bZS
	O4vGJBHsY2frg2OrJL4AD+nhQhcyaSWtv7eqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=E79l0+oj7nAHTNlaGElWdfXp99DuHawzrZQAX7dRvG0WOdvu7QuunuLMrEF/1sODPL
	XKZqglNeEv73dwmJWWA+QuyJJfWnkCVR9Pt22wji8uLx7FAFUZb9C2Iall5I+H9Yxh27
	8HtfTRVaxbOdhZ7/Q9aHNBqe0/qP4vY42KQ2c=
Received: by 10.142.211.15 with SMTP id j15mr4273570wfg.284.1287468814253;
	Mon, 18 Oct 2010 23:13:34 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	e14sm18042697wfg.20.2010.10.18.23.13.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 23:13:33 -0700 (PDT)
Message-ID: <4CBD3707.1060600@gmail.com>
Date: Tue, 19 Oct 2010 16:43:27 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xoscope_1.12.bb: Fix build failure when comedilib has already been staged.
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
X-List-Received-Date: Tue, 19 Oct 2010 06:14:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

If comedilib is already staged, xoscope tries to use it and fails to build.

mipsel-oe-linux-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I.. -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include/gtk-1.2 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include/glib-1.2 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib/glib/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -MT callbacks.o -MD -MP -MF .deps/callbacks.Tpo -c -o callbacks.o callbacks.c
callbacks.c:29:19: error: static declaration of 'window' follows non-static declaration
callbacks.h:3:19: note: previous declaration of 'window' was here
make[2]: *** [callbacks.o] Error 1
make[2]: Leaving directory `/mnt/oe/tmp/work/mipsel-oe-linux/xoscope-1.12-r1/xoscope-1.12/comedi-glade-src'

So disable comedilib support at configure time. I assume since comedi is new
to the tree this year and xoscope was added years ago, that comedi support
is not desired.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/xoscope/xoscope_1.12.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/xoscope/xoscope_1.12.bb b/recipes/xoscope/xoscope_1.12.bb
index 5ca739b..c8cc387 100644
--- a/recipes/xoscope/xoscope_1.12.bb
+++ b/recipes/xoscope/xoscope_1.12.bb
@@ -5,12 +5,15 @@ DEPENDS = "gtk+-1.2 esound"
 
 SRC_URI = "http://prdownloads.sourceforge.net/xoscope/xoscope-${PV}.tgz"
 
+PR = "r1"
+
 inherit autotools
 
 PARALLEL_MAKE = ""
 
 FILES_${PN}-dbg += "${libexecdir}/xoscope/.debug"
 
+EXTRA_OECONF = "ac_cv_lib_comedi_comedi_open=no"
 
 SRC_URI[md5sum] = "89f8019a772713a976b634305d29cfe5"
 SRC_URI[sha256sum] = "d7dec98f0d85f7ce889d0b2fcb4ed683a6384057ccea2ab531a0710969ff7ca2"
-- 
1.7.1



