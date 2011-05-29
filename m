Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQoEu-0004nY-EM
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:13:40 +0200
Received: by fxm19 with SMTP id 19so2553455fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=/W9b7j6nLyuq5KsceYz554kuCWFoLLvKEM+vLYyqVds=;
	b=VRi72IcUeG1rvwg1W8E9WVxAo1IsApyfn6ZKfn377i/+YIvs8LLKCOwOKDdYAW+zfb
	GeJZ3wYYeECk30FVyvpw5+40Hi4PAkx05bnhoHRutF/M/0sSHSvnCF+zFb4J0IDOGS98
	p1jwJZfP+epgequw0wdjueAVIGOZj8JXDNuqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ko0WgIXpyFOq05Y2VlmZKwrMSXtrV5QE2M0AGjnF5jHhsYsGGj1fb/Cc0jDVT/2jwh
	N9vSt9V321tjoKosyLUTZYQzCKgL9Up1Ho1HJDqjGcv1aUC+ULTJrBjiZsO5SWHsnEv1
	vtq6d9rErScZYN+5fi+Iv6Zzx4O0Rk5VhbzXw=
Received: by 10.223.79.151 with SMTP id p23mr20266fak.78.1306706215572;
	Sun, 29 May 2011 14:56:55 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r10sm528003fah.2.2011.05.29.14.56.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:56:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:28 +0200
Message-Id: <2feb424b3f8bf7eb3134c09d0f1df7bce7694e47.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/14] devmem2: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:13:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb         |   22 +++++
 .../devmem2/devmem2/devmem2-fixups-2.patch         |   91 ++++++++++++++++++++
 2 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2.bb
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
new file mode 100644
index 0000000..b99752d
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Simple program to read/write from/to any location in memory."
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
+PR = "r7"
+
+SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
+           file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
+S = "${WORKDIR}"
+
+CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
+
+do_compile() {
+	${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install devmem2 ${D}${bindir}
+}
+
+SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
+SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
new file mode 100644
index 0000000..4517797
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
@@ -0,0 +1,91 @@
+--- devmem2.c	2004-08-05 01:55:25.000000000 +0200
++++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
+@@ -45,12 +45,16 @@
+ #define MAP_SIZE 4096UL
+ #define MAP_MASK (MAP_SIZE - 1)
+ 
++static inline void *fixup_addr(void *addr, size_t size);
++
+ int main(int argc, char **argv) {
+     int fd;
+     void *map_base, *virt_addr; 
+-	unsigned long read_result, writeval;
++	unsigned long read_result, write_val;
+ 	off_t target;
+ 	int access_type = 'w';
++	char fmt_str[128];
++	size_t data_size;
+ 	
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+@@ -79,38 +83,51 @@
+     virt_addr = map_base + (target & MAP_MASK);
+     switch(access_type) {
+ 		case 'b':
++			data_size = sizeof(unsigned char);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned char *) virt_addr);
+ 			break;
+ 		case 'h':
++			data_size = sizeof(unsigned short);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
++			data_size = sizeof(unsigned long);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned long *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+ 			exit(2);
+ 	}
+-    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
++	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*data_size);
++    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
+     fflush(stdout);
+ 
+ 	if(argc > 3) {
+-		writeval = strtoul(argv[3], 0, 0);
++		write_val = strtoul(argv[3], 0, 0);
+ 		switch(access_type) {
+ 			case 'b':
+-				*((unsigned char *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned char));
++				*((unsigned char *) virt_addr) = write_val;
+ 				read_result = *((unsigned char *) virt_addr);
+ 				break;
+ 			case 'h':
+-				*((unsigned short *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned short));
++				*((unsigned short *) virt_addr) = write_val;
+ 				read_result = *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				*((unsigned long *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
++				*((unsigned long *) virt_addr) = write_val;
+ 				read_result = *((unsigned long *) virt_addr);
+ 				break;
+ 		}
+-		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
++		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
++			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
++		printf(fmt_str, (unsigned long)target, virt_addr,
++			write_val, read_result);
+ 		fflush(stdout);
+ 	}
+ 	
+@@ -119,3 +136,12 @@
+     return 0;
+ }
+ 
++static inline void *fixup_addr(void *addr, size_t size)
++{
++#ifdef FORCE_STRICT_ALIGNMENT
++	unsigned long aligned_addr = (unsigned long)addr;
++	aligned_addr &= ~(size - 1);
++	addr = (void *)aligned_addr;
++#endif
++	return addr;
++}
-- 
1.7.5.rc3



