Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Mb8Zl-0002m8-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 09:48:49 +0200
Received: by wf-out-1314.google.com with SMTP id 25so1871053wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=E9V8iGyC0ifhsZ7SU/P+9InI8ODVGEXd6L5tBPgcUyQ=;
	b=Wgm9N2Hq2hhgY9sqG06DLsbmcQmXnLiJBIcHECBxtyeCjXW6d659BG2+Ei8YFHUE+k
	i47U5/tVqUeqdxbm0iLAal1igkts4yi6GE5UsxYBhVTaEYZwf8RNHvDXkt9cj7wUPLTB
	hzJUaH8147ImVztZUG4sP6fa9m0RwKamrK4sk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=e4ZQBwKn5KgdiExZuJyF+4KXOlfNNh7C+PS5r2FHjVnWgO6DLpmmATr6n6KR/qs5L+
	3cqGWYf8R2yffnO8rwk9KmQcE9lyuF2wmfxedp0O/irGJbfp8VuyZxpFgHhZvGhR8nbg
	6yk1B2R5mci2b7nA12OTOmEJdC34WABHHnpsc=
Received: by 10.142.238.19 with SMTP id l19mr725824wfh.343.1250062345588;
	Wed, 12 Aug 2009 00:32:25 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	20sm18959281wfi.20.2009.08.12.00.32.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Aug 2009 00:32:24 -0700 (PDT)
Message-ID: <4A826FF3.9030501@gmail.com>
Date: Wed, 12 Aug 2009 17:02:03 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: why does glibc_2.9.bb use glibc-ports-2.7?
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
X-List-Received-Date: Wed, 12 Aug 2009 07:48:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This combination of glibc-2.9 with glibc-ports-2.7 fails to build on mipsel.

I assume there is either a problem with the glibc-ports-2.9 on arm, or the
recipe was simply copied from glibc_2.7.bb without noticing that the ports
version was hardcoded.

I'm using the following patch on mipsel without problems. I don't know what
needs to be done for the other architectures, so it shouldn't be committed.

-Graham

PS: eglibc-2.9 and eglibc-2.10 both fail with a nasty error:
/home/grg/oe/tmp/work/mipsel-angstrom-linux/eglibc-2.9-r4.2/build-mipsel-angstrom-linux/libc_pic.os: In function `_mcount':
(.debug_macinfo+0x5bafe18): relocation truncated to fit: R_MIPS_HI16 against `_gp_disp'


diff --git a/recipes/glibc/glibc-2.9/_begin.patch b/recipes/glibc/glibc-2.9/_begin.patch
new file mode 100644
index 0000000..8d36a05
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/_begin.patch
@@ -0,0 +1,28 @@
+From 7c8a67320e26b8c11108bf0a3410d3aef9cf3486 Mon Sep 17 00:00:00 2001
+From: Ulrich Drepper <drepper@redhat.com>
+Date: Sat, 31 Jan 2009 00:21:15 +0000
+Subject: [PATCH] * elf/Makefile (ld.so): Adjust the sed script to insert _begin in to newer linker scripts.
+---
+diff --git a/elf/Makefile b/elf/Makefile
+index 8079fe9..e44ff1d 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -1,4 +1,4 @@
+-# Copyright (C) 1995-2007, 2008 Free Software Foundation, Inc.
++# Copyright (C) 1995-2007, 2008, 2009 Free Software Foundation, Inc.
+ # This file is part of the GNU C Library.
+ 
+ # The GNU C Library is free software; you can redistribute it and/or
+@@ -304,7 +304,7 @@ $(objpfx)ld.so: $(objpfx)librtld.os $(ld-map)
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs -Wl,--verbose 2>&1 |	\
+ 		  LC_ALL=C \
+ 		  sed -e '/^=========/,/^=========/!d;/^=========/d'	\
+-		      -e 's/\. = 0 + SIZEOF_HEADERS;/& _begin = . - SIZEOF_HEADERS;/' \
++		      -e 's/\. = .* + SIZEOF_HEADERS;/& _begin = . - SIZEOF_HEADERS;/' \
+ 		  > $@.lds
+ 	$(LINK.o) -nostdlib -nostartfiles -shared -o $@			\
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs $(z-now-$(bind-now))	\
+-- 
+1.6.3.2
+
+
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 6e323aa..c17d516 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -43,7 +43,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 #	   file://arm-ioperm.patch;patch=1;pnum=0 \
 #	   file://ldd.patch;patch=1;pnum=0 \
 SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
-	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-2.7.tar.bz2 \
+	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-${PV}.tar.bz2 \
 	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-${PV}.tar.bz2 \
            file://arm-memcpy.patch;patch=1 \
            file://arm-longlong.patch;patch=1 \
@@ -53,10 +53,6 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
            file://nptl-crosscompile.patch;patch=1 \
 	   file://glibc-check_pf.patch;patch=1;pnum=0 \
            file://ldd-unbash.patch;patch=1 \
-	   file://glibc-arm-IO-acquire-lock-fix.diff;patch=1 \
-	   file://local-args6.diff;patch=1 \
-	   file://arm-check-pf.patch;patch=1 \
-	   file://arm-lowlevellock-include-tls.patch;patch=1 \
 	   file://generic-bits_select.h \
 	   file://generic-bits_types.h \
 	   file://generic-bits_typesizes.h \
@@ -65,8 +61,15 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
            file://generate-supported.mk \
            file://march-i686.patch;patch=1;pnum=0 \
 	   file://tls_i486.patch;patch=1 \
+	   file://_begin.patch;patch=1 \
            "
 
+# glibc-ports-2.7 arm patches
+#SRC_URI_append_arm = " file://arm-check-pf.patch;patch=1 \
+#	   file://arm-lowlevellock-include-tls.patch;patch=1 \
+#	   file://local-args6.diff;patch=1 \
+#	   file://glibc-arm-IO-acquire-lock-fix.diff;patch=1 \
+#	   "
 
 # Build fails on sh3 and sh4 without additional patches
 SRC_URI_append_sh3 = " file://no-z-defs.patch;patch=1"
@@ -90,7 +93,7 @@ EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports and libidn into tree
-	mv ${WORKDIR}/glibc-ports-2.7 ${S}/ports
+	mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
 	mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
 
 	# Ports isn't really working... Fix it


