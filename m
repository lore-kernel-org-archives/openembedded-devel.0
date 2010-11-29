Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMw0F-0007OD-O0
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 06:10:16 +0100
Received: by pvd12 with SMTP id 12so668443pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 21:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=yZiutAj6A53V3uRes0u88E4vtgOCBDmEn3jIXWLXZKM=;
	b=rfqAMuhIyiAqZrJ//AVA3CDEs8ky5CPcKUvA409cRSXQ3sYByMYWdFWZ44+axfEgKF
	nKnihuTsK7eEUjKQXJh98TZwncLBHyJUTWfmdKWg9aLk0W3CR8nqdk6/U476ajiVbzVk
	DYkOG8ydTitvN+9yLcbrneZ0CxEAvYPytrvG4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=v5JWDfzNCoTvK+9y8WF5giQUzxXbP7lD1nSqnnwAEasSalQj/5aIFAJ4p+oZP0Y+GN
	oBpNzzWIumxngXknuBu1qurT5Axb7uoWYHY1/OzMTUv9PfaTWUxZCx7WRKNb3knkp5XG
	3o4dQvThVQD3q5+nQ9r0wsVqW6Jf/57UlFC28=
Received: by 10.143.162.11 with SMTP id p11mr792683wfo.149.1291007334899;
	Sun, 28 Nov 2010 21:08:54 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w14sm6961556wfd.6.2010.11.28.21.08.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 21:08:54 -0800 (PST)
Message-ID: <4CF3355D.8080906@gmail.com>
Date: Mon, 29 Nov 2010 15:38:45 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] orbit2_2.14.17.bb: Fix build when DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Mon, 29 Nov 2010 05:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mipsel-oe-linux-uclibc-libtool: link: mipsel-oe-linux-uclibc-gcc -march=mips32 -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Werror-implicit-function-declaration -Wl,-rpath-link -Wl,/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib -Wl,-O1 -o .libs/test-linc test-linc.o -pthread  -L/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib ../src/.libs/liblinc.a /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libgobject-2.0.so /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libgthread-2.0.so -lpthread /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libglib-2.0.so /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libintl.so /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libiconv.so -lc -pthread
../src/.libs/liblinc.a(linc-protocols.o): In function `link_set_tmpdir':
linc-protocols.c:(.text+0x844): warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
../src/.libs/liblinc.a(linc-protocols.o): In function `link_protocol_get_sockinfo_ipv4':
linc-protocols.c:(.text+0xeb8): warning: gethostbyaddr is obsolescent, use getaddrinfo() instead.
test-linc.o: In function `main':
test-linc.c:(.text+0x10e4): warning: gethostbyname is obsolescent, use getnameinfo() instead.
../src/.libs/liblinc.a(linc-protocols.o): In function `link_protocol_get_sockinfo_ipv6':
linc-protocols.c:(.text+0xd94): undefined reference to `in6addr_any'
collect2: ld returned 1 exit status
make[3]: *** [test-linc] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gnome/orbit2-2.14.17/disable-ipv6.patch |   12 ++++++++++++
 recipes/gnome/orbit2_2.14.17.bb                 |    3 +++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gnome/orbit2-2.14.17/disable-ipv6.patch

diff --git a/recipes/gnome/orbit2-2.14.17/disable-ipv6.patch b/recipes/gnome/orbit2-2.14.17/disable-ipv6.patch
new file mode 100644
index 0000000..dfe0bc6
--- /dev/null
+++ b/recipes/gnome/orbit2-2.14.17/disable-ipv6.patch
@@ -0,0 +1,12 @@
+--- ORBit2-2.14.17/linc2/src/linc-protocols.c.orig	2010-11-29 15:21:32.000000000 +1030
++++ ORBit2-2.14.17/linc2/src/linc-protocols.c	2010-11-29 15:22:59.000000000 +1030
+@@ -937,6 +937,9 @@
+ 	static const struct in6_addr in6addr_any = { { { 0 } } };
+ #  endif
+ #endif
++#ifdef DISABLE_IPV6
++	const struct in6_addr in6addr_any = { { { 0 } } };
++#endif
+ 
+ static gboolean
+ link_protocol_get_sockinfo_ipv6 (const LinkProtocolInfo  *proto,
diff --git a/recipes/gnome/orbit2_2.14.17.bb b/recipes/gnome/orbit2_2.14.17.bb
index 47f6327..f893997 100644
--- a/recipes/gnome/orbit2_2.14.17.bb
+++ b/recipes/gnome/orbit2_2.14.17.bb
@@ -1,5 +1,8 @@
 require orbit2.inc
 
+SRC_URI += "file://disable-ipv6.patch"
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '-DDISABLE_IPV6', d)}"
+EXTRA_OEMAKE_append = " 'CFLAGS=${CFLAGS} ${noipv6}'"
 
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
-- 
1.7.1



