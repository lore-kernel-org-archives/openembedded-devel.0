Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNEle-0003pV-FH
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 02:12:27 +0100
Received: by pxi17 with SMTP id 17so835564pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 17:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=HnvWNhU1xD6HdZhjaVZiNp2p09WBvwjoLGXCLLV/E4I=;
	b=lnRt0yS0NuDvUgvXR8QT8riGzJ9XKT0QO+0zXLIzkJKtx62fXQ2UEX08DhDBXfCi0V
	M9B1CahIVcgPYth79tRZjbRY96bjcteYgDE8BeB+J8C67pNIIOQga0hmDMpp1BNZuL4k
	0wQ4jgBNFJGMDRKTZM1tDqrcwv04O5vv8uyuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=xLpYRzXMQ+R/F/4JvCIMVdCICOnD7fiGaa8AIRmimypFRe3vjM/5hD57xrZdN575hX
	teAwz4Z0Xgmq0h0zOAHroGFLS1mMvPzEJUrMImokd7DWbh4DL35UXf98xSnjBxPfqzVo
	ma+Ggblc513hAK2qvIJhrQuF3Fxxewno3/3wY=
Received: by 10.142.104.19 with SMTP id b19mr414720wfc.360.1291079465353;
	Mon, 29 Nov 2010 17:11:05 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x35sm8219035wfd.1.2010.11.29.17.11.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 17:11:04 -0800 (PST)
Message-ID: <4CF44F23.7050702@gmail.com>
Date: Tue, 30 Nov 2010 11:40:59 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sqlite3.inc: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 30 Nov 2010 01:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The --disable-largefile configure parameter does nothing.

/bin/sh ./mipsel-oe-linux-uclibc-libtool --mode=compile --tag=CC mipsel-oe-linux-uclibc-gcc -march=mips32  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -DSQLITE_OS_UNIX=1 -I. -I./src -D_HAVE_SQLITE_CONFIG_H -DNDEBUG   -DSQLITE_THREADSAFE=1 -DSQLITE_THREAD_OVERRIDE_LOCK=-1 -DSQLITE_OMIT_LOAD_EXTENSION=1   -DSQLITE_TEMP_STORE=1 -c sqlite3.c
mipsel-oe-linux-uclibc-libtool: compile:  mipsel-oe-linux-uclibc-gcc -march=mips32 -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -DSQLITE_OS_UNIX=1 -I. -I./src -D_HAVE_SQLITE_CONFIG_H -DNDEBUG -DSQLITE_THREADSAFE=1 -DSQLITE_THREAD_OVERRIDE_LOCK=-1 -DSQLITE_OMIT_LOAD_EXTENSION=1 -DSQLITE_TEMP_STORE=1 -c sqlite3.c  -fPIC -DPIC -o .libs/sqlite3.o
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdint.h:26:0,
                 from sqlite3.c:304:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from sqlite3.c:6522:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!
In file included from sqlite3.c:6522:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:83:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from sqlite3.c:6522:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:719:12: error: expected declaration specifiers or '...' before 'fpos_t'
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:721:12: error: expected ';', ',' or ')' before '*' token
make: *** [sqlite3.lo] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/sqlite/sqlite3.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/sqlite/sqlite3.inc b/recipes/sqlite/sqlite3.inc
index 18cdf71..1d828fb 100644
--- a/recipes/sqlite/sqlite3.inc
+++ b/recipes/sqlite/sqlite3.inc
@@ -15,8 +15,11 @@ inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
 
+nolargefile = "${@base_contains('DISTRO_FEATURES', 'largefile', '', '-DSQLITE_DISABLE_LFS', d)}"
 EXTRA_OECONF = "--disable-tcl --enable-shared \
-		--enable-threadsafe"
+		--enable-threadsafe \
+		CFLAGS='${CFLAGS} ${nolargefile}' \
+		"
 export config_BUILD_CC = "${BUILD_CC}"
 export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
 export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
-- 
1.7.1



