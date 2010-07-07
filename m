Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OWKdv-0007jE-IW
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 04:45:50 +0200
Received: by pxi12 with SMTP id 12so3250553pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=lfImmDLyL9nmpbdkFWvNWneQ25ETh2iHtXalp5YOxzM=;
	b=BFpcAYC0mBxNeOy2gdEpBRyFff8fCHIGzkaJuhTVZWi1cDoWuojb7cKUp1czs/pRD/
	anuXs/gwpo0o5uD7uCcgc6XZ3UIWaR9y7yuRGFC1hZ6oTWMLCmb8m8eI3n81/II52cwQ
	eLfQoWYK/1YwZks1SPJK+lMu14riAx6EDiaQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=riequXzcvTve26a40PRDvtSTED94RHb4Z+ca59unSGeqWmyzFGAznWlmecNNv+TC+s
	mD/VNMkPQGTDW7MSTXpD76IRghHxBI9j5QL5crEhgbd2gy5Y1aJKYiRpF29w1VdC8K2X
	7XyCdxAKrXa6rGV+raaMBNjIjczb/Srm0DM6o=
Received: by 10.114.124.14 with SMTP id w14mr6475804wac.68.1278470455882;
	Tue, 06 Jul 2010 19:40:55 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	d39sm92178160wam.4.2010.07.06.19.40.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 19:40:54 -0700 (PDT)
Message-ID: <4C33E931.3050103@gmail.com>
Date: Wed, 07 Jul 2010 12:10:49 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] imlib2_svn.bb: Don't use host /usr/X11R6/include and /usr/X11R6/lib.
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
X-List-Received-Date: Wed, 07 Jul 2010 02:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fixes the following problem, where host asm cannot build for target.

ccache mipsel-angstrom-linux-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I../.. -I../lib -I../../src/lib -DPACKAGE_DATA_DIR=\"/usr/share/imlib2\" -I/home/grg/oe2/tmp/sysroots/mipsel-angstrom-linux/usr/include/freetype2 -I/home/grg/oe2/tmp/sysroots/mipsel-angstrom-linux/usr/include -I/usr/X11R6/include   -isystem/home/grg/oe2/tmp/sysroots/mipsel-angstrom-linux/usr/include -std=gnu99  -isystem/home/grg/oe2/tmp/sysroots/mipsel-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -MT imlib2_view.o -MD -MP -MF .deps/imlib2_view.Tpo -c -o imlib2_view.o imlib2_view.c
imlib2_view.c: In function 'main':
imlib2_view.c:296: error: can't find a register in class 'COP3_REGS' while reloading 'asm'
imlib2_view.c:296: error: 'asm' operand has impossible constraints

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/efl1/imlib2_svn.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/efl1/imlib2_svn.bb b/recipes/efl1/imlib2_svn.bb
index 1db9e60..c0616be 100644
--- a/recipes/efl1/imlib2_svn.bb
+++ b/recipes/efl1/imlib2_svn.bb
@@ -4,12 +4,14 @@ LICENSE = "BSD"
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
 PV = "1.4.2.001+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
-EXTRA_OECONF = "--with-x"
+EXTRA_OECONF = "--with-x \
+		--x-includes=${STAGING_INCDIR} \
+		--x-libraries=${STAGING_LIBDIR} "
 
 # TODO: Use more fine granular version
 #OE_LT_RPATH_ALLOW=":${libdir}/imlib2/loaders:${libdir}/imlib2/filters:"
-- 
1.7.1



