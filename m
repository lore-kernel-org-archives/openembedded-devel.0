Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OU6v7-0008FY-Np
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 01:42:23 +0200
Received: by pwi10 with SMTP id 10so534907pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 16:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=jIul4o4wX/XikU7TBCb6DFvYa76q84puQ8Hdst63fo0=;
	b=KpifcyMZpIm1AIXfhbxnX/9oCq5pZ5X8yPdhVllo83ouO9iHL2LhgGzgqlI+dHphJJ
	PUzrh8l7Uj9DrLH6ujcj89cjGfWGML+e/lOcDO+cWcjMtihfhvbBT+US48Es2dGKVe+T
	mfom/7YBqqU3Dhch5uo8YE02hDjIt+MSRu2jE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=dC8AYXcrGcXvmjv1Pv0DCinMF954KDBaZNxfmSEseOmyccsfVfdPciyImWf2UuJUq1
	Hi9XE/aZ2HnwwJamie38DjQWCAFgD2RY6TUoCnizZrsivzS2q5RB6hRcuoaT5eSTjY3+
	Srgs0OJPKqyYc6oWe+6FKbn9gU2Ie6epP5pcU=
Received: by 10.114.189.13 with SMTP id m13mr10382836waf.130.1277941056293;
	Wed, 30 Jun 2010 16:37:36 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	j18sm71515523wan.13.2010.06.30.16.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jun 2010 16:37:35 -0700 (PDT)
Message-ID: <4C2BD53A.40507@gmail.com>
Date: Thu, 01 Jul 2010 09:07:30 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xserver-kdrive_1.5.3.bb: add openssl to DEPENDS.
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
X-List-Received-Date: Wed, 30 Jun 2010 23:42:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The build fails without openssl.

| mipsel-oe-linux-libtool: compile:  ccache mipsel-oe-linux-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I../include -isystem/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include -DHAVE_DIX_CONFIG_H -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -DDBUS_API_SUBJECT_TO_CHANGE -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/freetype2 -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/pixman-1 -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/hal -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/dbus-1.0 -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/lib/dbus-1.0/include -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/home/grg/oe2/tmp/sysroots/x86_64-linux/usr/include -I../include -I../include -I../Xext -I../composite -I../damageext -I../xfixes -I../Xi -I../mi -I../miext/shadow -I../miext/damage -I../render -I../randr -I../fb -I/home/
grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/xextproto-70 -isystem/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT glyph.lo -MD -MP -MF .deps/glyph.Tpo -c glyph.c  -fPIC -DPIC -o .libs/glyph.o
| glyph.c:30:25: error: openssl/sha.h: No such file or directory
| glyph.c: In function 'HashGlyph':
| glyph.c:205: error: 'SHA_CTX' undeclared (first use in this function)
| glyph.c:205: error: (Each undeclared identifier is reported only once
| glyph.c:205: error: for each function it appears in.)
| glyph.c:205: error: expected ';' before 'ctx'
| glyph.c:208: warning: implicit declaration of function 'SHA1_Init'
| glyph.c:208: warning: nested extern declaration of 'SHA1_Init'
| glyph.c:208: error: 'ctx' undeclared (first use in this function)
| glyph.c:212: warning: implicit declaration of function 'SHA1_Update'
| glyph.c:212: warning: nested extern declaration of 'SHA1_Update'
| glyph.c:220: warning: implicit declaration of function 'SHA1_Final'
| glyph.c:220: warning: nested extern declaration of 'SHA1_Final'
| make[1]: *** [glyph.lo] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/xorg-xserver/xserver-kdrive_1.5.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
index 7250a61..7fbdff2 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
@@ -1,6 +1,6 @@
 require xserver-kdrive-common.inc
 
-DEPENDS += "hal libxkbfile libxcalibrate pixman"
+DEPENDS += "hal libxkbfile libxcalibrate pixman openssl"
 RDEPENDS_${PN} += "hal"
 
 DEFAULT_PREFERENCE = "-99" 
-- 
1.7.1



