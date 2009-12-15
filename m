Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKTjs-00069W-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 10:30:44 +0100
Received: by iwn32 with SMTP id 32so2539370iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject:date
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=TwRE3lYom7ImrWqJTfj/Sa2bUKi6WMke0wB4rbLf6Y4=;
	b=naFMRy40AeVWNFlSp9nATz0u9hdFX05x2RLj8qKZDsMw+dxmXST4n6259PeFBKupz3
	TbKX7uI1PhjmUiVIEY76YEpF3XTW21V9qnUhp6odtoV/eiSelIifB6HGJocxaftgE52C
	LNoDiHhFQQ3RW4O0NmdSpBfMsB2MCWY8sresU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:date:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=cQnCTZMXB1E1I/md0+1mKN047O4uU4mGYdLerimGXrTh1ZEVrIoGWFGlfudzuHod9G
	nK0uuqGHOqZmT63Qh1evY7DIO8wlNExVmN3Dt3UVFteTELQNUjs91/dSyebMjVg3hbOo
	axn3OwWleg3vrofiOpHEG6Am77uC2tXz/sde8=
Received: by 10.231.167.204 with SMTP id r12mr1161984iby.31.1260869334196;
	Tue, 15 Dec 2009 01:28:54 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.68.164])
	by mx.google.com with ESMTPS id 20sm4118274iwn.9.2009.12.15.01.28.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 01:28:53 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2009 17:28:43 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4y295q0mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Compile eglibc for x86 failed.
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
X-List-Received-Date: Tue, 15 Dec 2009 09:30:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to use eglibc as system library for my x86 box, so I modified  
the conf/distro/minimal-eglibc.conf (see below for my changes). But  
compiling eglibc failed with the message "undefined reference to  
`__i686.get_pc_thunk.bx", The following is the raw error information. Who  
can give me some hint.

ccache i586-oe-linux-gcc -march=i586   -nostdlib -nostartfiles -shared  \
                   -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=both  
-Wl,-z,defs -Wl,--verbose 2>&1 |  \
                   LC_ALL=C \
                   sed -e '/^=========/,/^=========/!d;/^=========/d'    \
                       -e 's/\. = 0 + SIZEOF_HEADERS;/& _begin = . -  
SIZEOF_HEADERS;/' \
                   >  
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/ld.so.lds
ccache i586-oe-linux-gcc -march=i586   -nostdlib -nostartfiles -shared -o  
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/ld.so                        
\
                   -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=both  
-Wl,-z,defs       \
                   /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/librtld.os  
-Wl,--version-script=/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/ld.map                 
\                   -Wl,-soname=ld-linux.so.2 -T  
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/ld.so.lds
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/librtld.os:  
In function `_dl_tlsdesc_dynamic':
(.text+0x141f5): undefined reference to `__i686.get_pc_thunk.bx'
collect2: ld returned 1 exit status
make[2]: ***  
[/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/ld.so]  
Error 1
make[2]: Leaving directory  
`/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/eglibc-2_9/libc/elf'
make[1]: *** [elf/subdir_lib] Error 2
make[1]: Leaving directory  
`/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/eglibc-2_9/libc'
make: *** [all] Error 2
FATAL: oe_runmake failed


--- minimal-eglibc.conf	2009-12-15 13:44:17.000000000 +0800
+++ minimal-uclibc.conf	2009-12-10 15:00:31.000000000 +0800
@@ -13,17 +13,26 @@
  #
  # Header
  #
-DISTRO_NAME = "minimal-eglibc"
+DISTRO_NAME = "minimal-uclibc"

  #
  # Target OS & FPU system
  #
-TARGET_OS = "linux"
-#TARGET_FPU_arm = "soft"
-#TARGET_FPU_armeb = "soft"
-PREFERRED_PROVIDER_virtual/libc = "eglibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "eglibc"
+TARGET_OS = "linux-uclibc"
+TARGET_FPU_arm = "soft"
+TARGET_FPU_armeb = "soft"
+PREFERRED_PROVIDER_virtual/libc = "uclibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
  PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
-PREFERRED_PROVIDER_virtual/libiconv = "eglibc"
-PREFERRED_PROVIDER_virtual/libintl = "eglibc"
+PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
+PREFERRED_PROVIDER_virtual/libintl = "proxy-libintl"
+
+USE_NLS ?= "no"
+USE_NLS_glib-2.0 = "yes"
+USE_NLS_glib-2.0-native = "yes"
+USE_NLS_gcc-cross = "no"
+
+PREFERRED_VERSION_uclibc = "0.9.30"
+PREFERRED_VERSION_uclibc-initial = "0.9.30"
+



-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


