Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMvT2-0006be-3q
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 05:35:57 +0100
Received: by pxi17 with SMTP id 17so666806pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 20:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=diP/hYrDressXSGOiHcGvjZW6KFfwCXNq3p8rexMVME=;
	b=Yd95sDCjyQUsot8o6kADLV523Qg15pvlmYbcSjA8hQgenEh9kyIns/PzzYpTokq6vo
	WWIvH/uS/Q+t9lThrF0H0oP6e18LY8VbL1hHJX/nG/ONVhR0YtIwXB1DQUewVeALTVrN
	04+VigSiXKUqgFwuK5iSZYz4C1sFgQse0uTNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=h8HMAQNa7XOiOq6hBrGfXq5zrd7YxIlvma9beHjyQmqc9bc/UfKNz0yIoNfGD2+7Nv
	iwVl2fQ91JY7YOikickGWYchfWmdJdLZKfh8/PxdlHTOEMXIM3k9icbSXm2aCUbAe+ZG
	1UPCnd0Q/gF/efk0KSEE8eTOw0/OJLSoEmKhQ=
Received: by 10.142.155.2 with SMTP id c2mr4861187wfe.51.1291005272831;
	Sun, 28 Nov 2010 20:34:32 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	x18sm6932972wfa.23.2010.11.28.20.34.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 20:34:31 -0800 (PST)
Message-ID: <4CF32D52.1000901@gmail.com>
Date: Mon, 29 Nov 2010 15:04:26 +1030
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
Subject: [PATCH] glib-2.0_2.24.1.bb: Fix build when DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Mon, 29 Nov 2010 04:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


mipsel-oe-linux-uclibc-libtool: link: mipsel-oe-linux-uclibc-gcc -march=mips32 -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -Wl,-rpath-link -Wl,/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib -Wl,-O1 -o .libs/gio-querymodules gio-querymodules.o  -L/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib ../glib/.libs/libglib-2.0.so ../gobject/.libs/libgobject-2.0.so ../gmodule/.libs/libgmodule-2.0.so ./.libs/libgio-2.0.so /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/glib-2.0-2.24.1-r2/glib-2.24.1/gobject/.libs/libgobject-2.0.so /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/glib-2.0-2.24.1-r2/glib-2.24.1/gthread/.libs/libgthread-2.0.so -lpthread /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/glib-2.0-2.24.1-r2/glib-2.24.1/gmodule/.libs/libgmodule-2.0.so -ldl /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/glib-2.0-2.24.1-r2/glib-2.24.1/glib/.libs/libglib-2.0.so /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libz.so /mnt/
oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libintl.so /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/libiconv.so -lc
../glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
collect2: ld returned 1 exit status
make[4]: *** [gio-querymodules] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch    |   26 ++++++++++++++++++++
 recipes/glib-2.0/glib-2.0_2.24.1.bb                |    4 +++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch

diff --git a/recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch b/recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch
new file mode 100644
index 0000000..9e7951b
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.24.1/disable-ipv6.patch
@@ -0,0 +1,26 @@
+--- glib-2.24.1/gio/ginetaddress.c.orig	2010-11-29 14:54:17.000000000 +1030
++++ glib-2.24.1/gio/ginetaddress.c	2010-11-29 14:55:03.000000000 +1030
+@@ -485,7 +485,11 @@
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
++#ifdef DISABLE_IPV6
++    return NULL;
++#else
+     return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++#endif
+ }
+ 
+ /**
+@@ -512,7 +516,11 @@
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
++#ifdef DISABLE_IPV6
++    return NULL;
++#else
+     return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++#endif
+ }
+ 
+ 
diff --git a/recipes/glib-2.0/glib-2.0_2.24.1.bb b/recipes/glib-2.0/glib-2.0_2.24.1.bb
index 401212d..b150a3f 100644
--- a/recipes/glib-2.0/glib-2.0_2.24.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.24.1.bb
@@ -21,8 +21,12 @@ SRC_URI = "\
   file://gio.patch \
   file://60_wait-longer-for-threads-to-die.patch \
   file://glib-mkenums-interpreter.patch \
+  file://disable-ipv6.patch \
 "
 
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '-DDISABLE_IPV6', d)}"
+EXTRA_OEMAKE_append = "'CFLAGS=${CFLAGS} ${noipv6}'"
+
 SRC_URI[archive.md5sum] = "6a7db81c9a2cffe6a34dadb57d7ba2d2"
 SRC_URI[archive.sha256sum] = "014c3da960bf17117371075c16495f05f36501db990851ceea658f15d2ea6d04"
 
-- 
1.7.1



