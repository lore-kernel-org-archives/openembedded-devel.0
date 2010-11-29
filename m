Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMuNK-0005AI-VN
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 04:25:59 +0100
Received: by pxi17 with SMTP id 17so661316pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 19:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=voeNglcH2nTFtH1hYerzLnAfwbaI0g7XzEt06y05UkA=;
	b=dUMcNBX6KdRMAO/0wikuEgzvU0JHa2QSDLqJrVyDDQ9FCOmAHTzqcpCHhsgfHcaBwR
	h3C0SlscM21qDLu9HwQ0jzOnWeZBSOZ3qi6cgUpYprcKBedki2uk/E32cZbLf6z/iJv0
	Ti4KhuKlLjcttP7AqyRDSDCOj2GYxWw1/9DkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Qz4oP+JOlbOiOX2GVTxncBvmk9R1wNqtIH6nBz3AdeaDJI6UUpHZqvp0nQ9lGNk8H3
	RviGicI7jRj4M/DSFD0j1EifiUA3A7uMBcFR1zlfI13eMu+vWX3Em1KgIE/tNU7kU0dj
	CC8nhcD5KRW84KRB5Mi7iVVANUWFMBKmvHOVU=
Received: by 10.142.173.3 with SMTP id v3mr4563038wfe.400.1291001074115;
	Sun, 28 Nov 2010 19:24:34 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w22sm6860796wfd.19.2010.11.28.19.24.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 19:24:33 -0800 (PST)
Message-ID: <4CF31CE9.6010505@gmail.com>
Date: Mon, 29 Nov 2010 13:54:25 +1030
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
Subject: [PATCH] gettext_0.18.bb: Fix build when uclibc lacks large file support.
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
X-List-Received-Date: Mon, 29 Nov 2010 03:25:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


mipsel-oe-linux-uclibc-libtool: compile:  mipsel-oe-linux-uclibc-gcc -march=mips32 -std=gnu99 -DHAVE_CONFIG_H -DEXEEXT=\"\" -DEXEEXT=\"\" -DEXEEXT=\"\" -I. -I.. -I../intl -I../intl -I.. -I.. -DDEPENDS_ON_LIBICONV=1 -DDEPENDS_ON_LIBINTL=1 -DLIBXML_STATIC -I../intl -I./libcroco -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -c libxml/DOCBparser.c  -fPIC -DPIC -o libxml/.libs/libxml_rpl_la-DOCBparser.o
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:28:0,
                 from ./stdio.h:35,
                 from libxml/libxml.h:36,
                 from libxml/DOCBparser.c:14:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from ./stdio.h:35,
                 from libxml/libxml.h:36,
                 from libxml/DOCBparser.c:14:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!
In file included from ./stdio.h:35:0,
                 from libxml/libxml.h:36,
                 from libxml/DOCBparser.c:14:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:83:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from ./stdio.h:35:0,
                 from libxml/libxml.h:36,
                 from libxml/DOCBparser.c:14:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:719:12: error: expected declaration specifiers or '...' before 'fpos_t'
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:721:12: error: expected ';', ',' or ')' before '*' token
make[4]: *** [libxml/libxml_rpl_la-DOCBparser.lo] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gettext/gettext_0.18.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index 5ad6459..d27fad8 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
@@ -19,6 +19,9 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 
 SRC_URI_append_libc-uclibc = " file://gettext-error_print_progname.patch"
 
+nolargefile = "${@base_contains('DISTRO_FEATURES', 'largefile', '', '-DNO_LARGEFILE_SOURCE', d)}"
+EXTRA_OEMAKE_append_libc-uclibc = "'CFLAGS=${CFLAGS} ${nolargefile}'"
+
 PARALLEL_MAKE = ""
 
 inherit autotools
-- 
1.7.1



