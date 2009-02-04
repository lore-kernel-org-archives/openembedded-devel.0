Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LUbVz-0007JW-DY
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 07:45:41 +0100
Received: by rv-out-0708.google.com with SMTP id f25so2539111rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Feb 2009 22:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=9nQ+YJ4tzGyCALu6cQtnZB8iCMtuNkQPlASsEumzTNs=;
	b=mu5WlhZEEjenT65AWoz+p23ZsFECFULw8Rrl5al8k/ZXib8/850KF+K5KNWQDwDN7W
	wVNFYdNpVGt8Prp73vNIIbyGwVU1Pqe6GJIKIWq9FNPz9sHF5Rrm+UsKFuUZKiCcmGZ2
	DpUliRq0DrBuTxdAF/xC/t7NSdV4LXevTcJ24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=VZzGA9UNdTG8Miw/WqPGwTPvvknmliBx4G4yVuTcvVW6y5iblJLTgGnGQLxKwDAzlz
	gNrz8CGxwZ6SzeHVibmUP/mZ5GimeDBVeCr/JqZfQLuXPe7y4qVwqFV+iFoJmXk/pz2+
	HvVp+Dc/XqxRf0mqzXBD2aus4ZtKvmqg+Aabk=
MIME-Version: 1.0
Received: by 10.141.172.7 with SMTP id z7mr3469133rvo.128.1233729934747; Tue, 
	03 Feb 2009 22:45:34 -0800 (PST)
Date: Tue, 3 Feb 2009 22:45:34 -0800
Message-ID: <a7f8874a0902032245v333a379dq179c5bd7369f5dde@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] sg3-utils: get 1.24 to cross compile
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
X-List-Received-Date: Wed, 04 Feb 2009 06:45:45 -0000
X-Groupsio-MsgNum: 7538
Content-Type: multipart/mixed; boundary=000e0cd147ea82671e04621222c8

--000e0cd147ea82671e04621222c8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Please review this patch and push if OK

Thanks,
Henry


From b8f628b79e30af8c1d326e9fbdd6b05d4a953fc8 Mon Sep 17 00:00:00 2001
From: Henry von Tresckow <hvontres@gmail.com>
Date: Tue, 3 Feb 2009 09:52:59 -0800
Subject: [PATCH] sg3-utils: get 1.24 to cross compile

Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
---
packages/sg3-utils/files/Makefile-r1.patch |  263 ++++++++++++++++++++++++++++
packages/sg3-utils/files/Makefile.patch    |  246 --------------------------
packages/sg3-utils/sg3-utils_1.24.bb       |   20 +--
3 files changed, 267 insertions(+), 262 deletions(-)
create mode 100644 packages/sg3-utils/files/Makefile-r1.patch
delete mode 100644 packages/sg3-utils/files/Makefile.patch

diff --git a/packages/sg3-utils/files/Makefile-r1.patch
b/packages/sg3-utils/files/Makefile-r1.patch
new file mode 100644
index 0000000..9e39789
--- /dev/null
+++ b/packages/sg3-utils/files/Makefile-r1.patch
@@ -0,0 +1,263 @@
+Index: sg3-utils-1.24/Makefile
+===================================================================
+--- sg3-utils-1.24.orig/Makefile 2007-05-07 11:59:19.000000000 -0700
++++ sg3-utils-1.24/Makefile 2009-02-02 16:37:35.000000000 -0800
+@@ -1,13 +1,15 @@
+ SHELL = /bin/sh
+
+-PREFIX=/usr/local
++PREFIX=/usr
+ LIBDIR=$(DESTDIR)/$(PREFIX)/lib
+ INSTDIR=$(DESTDIR)/$(PREFIX)/bin
+ MANDIR=$(DESTDIR)/$(PREFIX)/share/man
+ INCLUDEDIR=$(DESTDIR)/$(PREFIX)/include
+
+-CC = gcc
+-LD = gcc
++CC ?= gcc
++LD ?= gcc
++LIBTOOL ?= libtool
++LT_EXTRA = --tag=CC
+
+ EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
+   sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
+@@ -37,12 +39,12 @@
+ S_CFLAGS = $(OS_FLAGS) $(LARGE_FILE_FLAGS)
+
+ # CFLAGS = -O2 -Wall -W
+-CFLAGS = -g -O2 -Wall -W
++CFLAGS ?= -g -O2 -Wall -W
+ # CFLAGS = -g -O2 -Wall -W -pedantic -std=c99
+
+ CFLAGS_PTHREADS = -D_REENTRANT
+
+-LDFLAGS =
++LDFLAGS ?=
+ # LDFLAGS = -v -lm
+
+ LIB_VINFO = 1:0:0
+@@ -64,164 +66,164 @@
+ $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
+
+ sg_lib.lo: sg_lib.o
+- libtool --mode=compile $(CC) -c sg_lib.c
++ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
+
+ sg_cmds_basic.lo: sg_cmds_basic.o
+- libtool --mode=compile $(CC) -c sg_cmds_basic.c
++ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
+
+ sg_cmds_extra.lo: sg_cmds_extra.o
+- libtool --mode=compile $(CC) -c sg_cmds_extra.c
++ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
+
+ sg_pt_linux.lo: sg_pt_linux.o
+- libtool --mode=compile $(CC) -c sg_pt_linux.c
++ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
+
+ libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo sg_pt_linux.lo
+- libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la sg_lib.lo
sg_cmds_basic.lo \
+ sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
+ -version-info $(LIB_VINFO)
+
+ # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
+-# libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
++# $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
sg_lib.lo sg_cmds_basic.lo \
+ # sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
+
+ sg_inq: sg_inq.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sginfo: sginfo.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_start: sg_start.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_readcap: sg_readcap.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sgp_dd.o: sgp_dd.c
+ $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
+ -c -o sgp_dd.o $<
+
+ sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
+
+ sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_map: sg_map.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_turs: sg_turs.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read: sg_read.o sg_io_linux.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_reset: sg_reset.o
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_modes: sg_modes.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_logs: sg_logs.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_senddiag: sg_senddiag.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_opcodes: sg_opcodes.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_persist: sg_persist.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_write_long: sg_write_long.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read_long: sg_read_long.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_requests: sg_requests.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_ses: sg_ses.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_verify: sg_verify.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_emc_trespass: sg_emc_trespass.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_luns: sg_luns.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_sync: sg_sync.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_prevent: sg_prevent.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_get_config: sg_get_config.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_wr_mode: sg_wr_mode.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rtpg: sg_rtpg.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_reassign: sg_reassign.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_format: sg_format.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rmsn: sg_rmsn.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_ident: sg_ident.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_map26: sg_map26.o
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rdac: sg_rdac.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_sat_identify: sg_sat_identify.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read_buffer: sg_read_buffer.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_write_buffer: sg_write_buffer.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_raw: sg_raw.o libsgutils.la
+- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+
+ install: $(EXECS)
+ install -d $(INSTDIR)
+ install -d $(LIBDIR)
+- libtool --mode=install install -c libsgutils.la $(LIBDIR)/libsgutils.la
+- libtool --finish $(LIBDIR)
++ $(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
$(LIBDIR)/libsgutils.la
++ $(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
+ for name in $^; \
+- do libtool --mode=install install -m 755 \
++ do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
+ $$name $(INSTDIR); \
+ done
+ install -d $(MANDIR)/$(MAN_PREF)
+@@ -235,7 +237,7 @@
+ done
+
+ uninstall:
+- libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
++ $(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
+ dists="$(EXECS)"; \
+ for name in $$dists; do \
+ rm -f $(INSTDIR)/$$name; \
diff --git a/packages/sg3-utils/files/Makefile.patch
b/packages/sg3-utils/files/Makefile.patch
deleted file mode 100644
index cc5babf..0000000
--- a/packages/sg3-utils/files/Makefile.patch
+++ /dev/null
@@ -1,246 +0,0 @@
-Index: sg3-utils-1.24/Makefile
-===================================================================
---- sg3-utils-1.24.orig/Makefile 2009-01-27 16:29:26.000000000 -0800
-+++ sg3-utils-1.24/Makefile 2009-01-27 22:31:04.000000000 -0800
-@@ -1,6 +1,6 @@
- SHELL = /bin/sh
-
--PREFIX=/usr/local
-+PREFIX=/usr
- LIBDIR=$(DESTDIR)/$(PREFIX)/lib
- INSTDIR=$(DESTDIR)/$(PREFIX)/bin
- MANDIR=$(DESTDIR)/$(PREFIX)/share/man
-@@ -8,6 +8,8 @@
-
- CC = gcc
- LD = gcc
-+LIBTOOL = libtool
-+LT_EXTRA = --tag=CC
-
- EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
-   sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
-@@ -64,164 +66,164 @@
- $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
-
- sg_lib.lo: sg_lib.o
-- libtool --mode=compile $(CC) -c sg_lib.c
-+ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
-
- sg_cmds_basic.lo: sg_cmds_basic.o
-- libtool --mode=compile $(CC) -c sg_cmds_basic.c
-+ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
-
- sg_cmds_extra.lo: sg_cmds_extra.o
-- libtool --mode=compile $(CC) -c sg_cmds_extra.c
-+ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
-
- sg_pt_linux.lo: sg_pt_linux.o
-- libtool --mode=compile $(CC) -c sg_pt_linux.c
-+ $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
-
- libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo sg_pt_linux.lo
-- libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la sg_lib.lo
sg_cmds_basic.lo \
- sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
- -version-info $(LIB_VINFO)
-
- # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
--# libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
-+# $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
sg_lib.lo sg_cmds_basic.lo \
- # sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
-
- sg_inq: sg_inq.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sginfo: sginfo.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_start: sg_start.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_readcap: sg_readcap.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sgp_dd.o: sgp_dd.c
- $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
- -c -o sgp_dd.o $<
-
- sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
-
- sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_map: sg_map.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_turs: sg_turs.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_read: sg_read.o sg_io_linux.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_reset: sg_reset.o
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_modes: sg_modes.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_logs: sg_logs.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_senddiag: sg_senddiag.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_opcodes: sg_opcodes.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_persist: sg_persist.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_write_long: sg_write_long.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_read_long: sg_read_long.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_requests: sg_requests.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_ses: sg_ses.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_verify: sg_verify.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_emc_trespass: sg_emc_trespass.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_luns: sg_luns.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_sync: sg_sync.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_prevent: sg_prevent.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_get_config: sg_get_config.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_wr_mode: sg_wr_mode.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_rtpg: sg_rtpg.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_reassign: sg_reassign.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_format: sg_format.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_rmsn: sg_rmsn.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_ident: sg_ident.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_map26: sg_map26.o
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_rdac: sg_rdac.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_sat_identify: sg_sat_identify.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_read_buffer: sg_read_buffer.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_write_buffer: sg_write_buffer.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
- sg_raw: sg_raw.o libsgutils.la
-- libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
-+ $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
-
-
- install: $(EXECS)
- install -d $(INSTDIR)
- install -d $(LIBDIR)
-- libtool --mode=install install -c libsgutils.la $(LIBDIR)/libsgutils.la
-- libtool --finish $(LIBDIR)
-+ $(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
$(LIBDIR)/libsgutils.la
-+ $(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
- for name in $^; \
-- do libtool --mode=install install -m 755 \
-+ do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
- $$name $(INSTDIR); \
- done
- install -d $(MANDIR)/$(MAN_PREF)
-@@ -235,7 +237,7 @@
- done
-
- uninstall:
-- libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
-+ $(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
- dists="$(EXECS)"; \
- for name in $$dists; do \
- rm -f $(INSTDIR)/$$name; \
diff --git a/packages/sg3-utils/sg3-utils_1.24.bb
b/packages/sg3-utils/sg3-utils_1.24.bb
index 71fc34c..30bdf31 100644
--- a/packages/sg3-utils/sg3-utils_1.24.bb
+++ b/packages/sg3-utils/sg3-utils_1.24.bb
@@ -1,29 +1,17 @@
DESCRIPTION = "Utilities for working with generic SCSI devices"
-<<<<<<< HEAD:packages/sg3-utils/sg3-utils_1.24.bb
-=======
AUTHOR = "Eric Schwartz (Skif) <emschwar@debian.org>"
HOMEPAGE = "http://packages.qa.debian.org/s/sg3-utils.html"
->>>>>>> c92bef17d2a35e06ec6edc2439918c88a7b4808b:packages/sg3-utils/sg3-utils_1.24.bb
SECTION = "console/admin"
LICENSE = "GPLv2"
-<<<<<<< HEAD:packages/sg3-utils/sg3-utils_1.24.bb
-HOMEPAGE = "http://packages.qa.debian.org/s/sg3-utils.html"
AUTHOR = "Eric Schwartz (Skif) <emschwar@debian.org>"
-=======
->>>>>>> c92bef17d2a35e06ec6edc2439918c88a7b4808b:packages/sg3-utils/sg3-utils_1.24.bb
-PR = "r0"
+PR = "r1"

SRC_URI = "${DEBIAN_MIRROR}/main/s/sg3-utils/sg3-utils_${PV}.orig.tar.gz \
-<<<<<<< HEAD:packages/sg3-utils/sg3-utils_1.24.bb
- file://Makefile.patch;patch=1"
-=======
-           file://Makefile.patch;patch=1"
->>>>>>> c92bef17d2a35e06ec6edc2439918c88a7b4808b:packages/sg3-utils/sg3-utils_1.24.bb
+ file://Makefile-r1.patch;patch=1"

S = "${WORKDIR}/sg3-utils-${PV}"

inherit autotools
-<<<<<<< HEAD:packages/sg3-utils/sg3-utils_1.24.bb

-=======
->>>>>>> c92bef17d2a35e06ec6edc2439918c88a7b4808b:packages/sg3-utils/sg3-utils_1.24.bb
+EXTRA_OEMAKE='"LIBTOOL=${STAGING_BINDIR_NATIVE}/${HOST_SYS}-libtool"'
+LDFLAGS =" -L${STAGING_LIBDIR_NATIVE} -rpath-link
${STAGING_LIBDIR_NATIVE} -rpath ${STAGING_LIBDIR_NATIVE} -O1"
--
1.5.4.3



--
Henry von Tresckow (hvontres)
Samuel Goldwyn  - "I had a monumental idea this morning, but I didn't like it."

--000e0cd147ea82671e04621222c8
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-sg3-utils-get-1.24-to-cross-compile.patch"
Content-Disposition: attachment; 
	filename="0001-sg3-utils-get-1.24-to-cross-compile.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fqrmud9t0

RnJvbSBiOGY2MjhiNzllMzBhZjhjMWQzMjZlOWZiZGQ2YjA1ZDRhOTUzZmM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZW5yeSB2b24gVHJlc2Nrb3cgPGh2b250cmVzQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCAzIEZlYiAyMDA5IDA5OjUyOjU5IC0wODAwClN1YmplY3Q6IFtQQVRDSF0g
c2czLXV0aWxzOiBnZXQgMS4yNCB0byBjcm9zcyBjb21waWxlCgpTaWduZWQtb2ZmLWJ5OiBIZW5y
eSB2b24gVHJlc2Nrb3cgPGh2b250cmVzQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlcy9zZzMtdXRp
bHMvZmlsZXMvTWFrZWZpbGUtcjEucGF0Y2ggfCAgMjYzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIHBhY2thZ2VzL3NnMy11dGlscy9maWxlcy9NYWtlZmlsZS5wYXRjaCAgICB8ICAyNDYg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2VzL3NnMy11dGlscy9zZzMtdXRpbHNf
MS4yNC5iYiAgICAgICB8ICAgMjAgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDI2NyBpbnNlcnRpb25z
KCspLCAyNjIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZXMvc2czLXV0
aWxzL2ZpbGVzL01ha2VmaWxlLXIxLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZXMv
c2czLXV0aWxzL2ZpbGVzL01ha2VmaWxlLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZXMvc2cz
LXV0aWxzL2ZpbGVzL01ha2VmaWxlLXIxLnBhdGNoIGIvcGFja2FnZXMvc2czLXV0aWxzL2ZpbGVz
L01ha2VmaWxlLXIxLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjll
Mzk3ODkKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlcy9zZzMtdXRpbHMvZmlsZXMvTWFrZWZp
bGUtcjEucGF0Y2gKQEAgLTAsMCArMSwyNjMgQEAKK0luZGV4OiBzZzMtdXRpbHMtMS4yNC9NYWtl
ZmlsZQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQorLS0tIHNnMy11dGlscy0xLjI0Lm9yaWcvTWFrZWZpbGUJMjAwNy0w
NS0wNyAxMTo1OToxOS4wMDAwMDAwMDAgLTA3MDAKKysrKyBzZzMtdXRpbHMtMS4yNC9NYWtlZmls
ZQkyMDA5LTAyLTAyIDE2OjM3OjM1LjAwMDAwMDAwMCAtMDgwMAorQEAgLTEsMTMgKzEsMTUgQEAK
KyBTSEVMTCA9IC9iaW4vc2gKKyAKKy1QUkVGSVg9L3Vzci9sb2NhbAorK1BSRUZJWD0vdXNyCisg
TElCRElSPSQoREVTVERJUikvJChQUkVGSVgpL2xpYgorIElOU1RESVI9JChERVNURElSKS8kKFBS
RUZJWCkvYmluCisgTUFORElSPSQoREVTVERJUikvJChQUkVGSVgpL3NoYXJlL21hbgorIElOQ0xV
REVESVI9JChERVNURElSKS8kKFBSRUZJWCkvaW5jbHVkZQorIAorLUNDID0gZ2NjCistTEQgPSBn
Y2MKKytDQyA/PSBnY2MKKytMRCA/PSBnY2MKKytMSUJUT09MID89IGxpYnRvb2wKKytMVF9FWFRS
QSA9IC0tdGFnPUNDCisgCisgRVhFQ1MgPSBzZ19kZCBzZ3BfZGQgc2dtX2RkIHNnX3JlYWQgc2df
bWFwIHNnX3NjYW4gc2dfcmJ1ZiBcCisgICAJc2dpbmZvIHNnX3JlYWRjYXAgc2dfdHVycyBzZ19p
bnEgc2dfdGVzdF9yd2J1ZiBcCitAQCAtMzcsMTIgKzM5LDEyIEBACisgU19DRkxBR1MgPSAkKE9T
X0ZMQUdTKSAkKExBUkdFX0ZJTEVfRkxBR1MpCisgCisgIyBDRkxBR1MgPSAtTzIgLVdhbGwgLVcK
Ky1DRkxBR1MgPSAtZyAtTzIgLVdhbGwgLVcKKytDRkxBR1MgPz0gLWcgLU8yIC1XYWxsIC1XCisg
IyBDRkxBR1MgPSAtZyAtTzIgLVdhbGwgLVcgLXBlZGFudGljIC1zdGQ9Yzk5CisgCisgQ0ZMQUdT
X1BUSFJFQURTID0gLURfUkVFTlRSQU5UCisgCistTERGTEFHUyA9IAorK0xERkxBR1MgPz0gCisg
IyBMREZMQUdTID0gLXYgLWxtCisgCisgTElCX1ZJTkZPID0gMTowOjAKK0BAIC02NCwxNjQgKzY2
LDE2NCBAQAorIAkkKENDKSAkKElOQ0xVREVTKSAkKENGTEFHUykgJChTX0NGTEFHUykgLWMgLW8g
JEAgJDwKKyAKKyBzZ19saWIubG86IHNnX2xpYi5vCistCWxpYnRvb2wgLS1tb2RlPWNvbXBpbGUg
JChDQykgLWMgc2dfbGliLmMKKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9Y29tcGls
ZSAkKENDKSAtYyBzZ19saWIuYworIAorIHNnX2NtZHNfYmFzaWMubG86IHNnX2NtZHNfYmFzaWMu
bworLQlsaWJ0b29sIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNfYmFzaWMuYworKwkk
KExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNfYmFz
aWMuYworIAorIHNnX2NtZHNfZXh0cmEubG86IHNnX2NtZHNfZXh0cmEubworLQlsaWJ0b29sIC0t
bW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNfZXh0cmEuYworKwkkKExJQlRPT0wpICQoTFRf
RVhUUkEpIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNfZXh0cmEuYworIAorIHNnX3B0
X2xpbnV4LmxvOiBzZ19wdF9saW51eC5vCistCWxpYnRvb2wgLS1tb2RlPWNvbXBpbGUgJChDQykg
LWMgc2dfcHRfbGludXguYworKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1jb21waWxl
ICQoQ0MpIC1jIHNnX3B0X2xpbnV4LmMKKyAKKyBsaWJzZ3V0aWxzLmxhOiBzZ19saWIubG8gc2df
Y21kc19iYXNpYy5sbyBzZ19jbWRzX2V4dHJhLmxvIHNnX3B0X2xpbnV4LmxvCistCWxpYnRvb2wg
LS1tb2RlPWxpbmsgJChMRCkgLW8gbGlic2d1dGlscy5sYSBzZ19saWIubG8gc2dfY21kc19iYXNp
Yy5sbyBcCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gbGli
c2d1dGlscy5sYSBzZ19saWIubG8gc2dfY21kc19iYXNpYy5sbyBcCisgCXNnX2NtZHNfZXh0cmEu
bG8gc2dfcHRfbGludXgubG8gLXJwYXRoICQoTElCRElSKSBcCisgCS12ZXJzaW9uLWluZm8gJChM
SUJfVklORk8pCisgCisgIyBsaWJzZ3V0aWxzLmxhOiBzZ19saWIubG8gc2dfY21kc19iYXNpYy5s
byBzZ19jbWRzX2V4dHJhLmxvCistIwlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vIGxpYnNn
dXRpbHMubGEgc2dfbGliLmxvIHNnX2NtZHNfYmFzaWMubG8gXAorKyMJJChMSUJUT09MKSAkKExU
X0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyBsaWJzZ3V0aWxzLmxhIHNnX2xpYi5sbyBzZ19j
bWRzX2Jhc2ljLmxvIFwKKyAjCXNnX2NtZHNfZXh0cmEubG8gLXJwYXRoICQoTElCRElSKSAtcmVs
ZWFzZSAkKFJFTEVBU0UpCisgCisgc2dfaW5xOiBzZ19pbnEubyBsaWJzZ3V0aWxzLmxhCistCWxp
YnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAKKysJJChMSUJUT09M
KSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReIAorIAor
IHNnX2RkOiBzZ19kZC5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0t
bW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VY
VFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfc2Nhbjog
c2dfc2Nhbi5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4gCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAKKyAKKyBzZ2luZm86IHNnaW5m
by5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfc3RhcnQ6IHNnX3N0YXJ0Lm8g
bGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4gCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAg
JChMREZMQUdTKSAkXiAKKyAKKyBzZ19yYnVmOiBzZ19yYnVmLm8gc2dfaW9fbGludXgubyBsaWJz
Z3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KKyAKKyBzZ19yZWFkY2FwOiBzZ19yZWFkY2FwLm8gbGlic2d1dGlscy5sYQorLQls
aWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09M
KSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisg
c2dwX2RkLm86IHNncF9kZC5jCisgCSQoQ0MpICQoSU5DTFVERVMpICQoQ0ZMQUdTKSAkKFNfQ0ZM
QUdTKSAkKENGTEFHU19QVEhSRUFEUykgXAorIAktYyAtbyBzZ3BfZGQubyAkPAorIAorIHNncF9k
ZDogc2dwX2RkLm8gc2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAtbHB0aHJlYWQKKysJJChMSUJUT09MKSAk
KExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReIC1scHRocmVh
ZAorIAorIHNnbV9kZDogc2dtX2RkLm8gc2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxhCistCWxp
YnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wp
ICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBz
Z19tYXA6IHNnX21hcC5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0t
bW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VY
VFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfdHVyczog
c2dfdHVycy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChM
RCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3Rlc3RfcndidWY6IHNnX3Rlc3RfcndidWYu
byBzZ19pb19saW51eC5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExE
KSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxp
bmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3JlYWQ6IHNnX3JlYWQubyBzZ19p
b19saW51eC5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChM
RCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3Jlc2V0OiBzZ19yZXNldC5vCistCWxpYnRv
b2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQo
TFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19t
b2Rlczogc2dfbW9kZXMubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChM
RCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19sb2dzOiBzZ19sb2dzLm8gbGli
c2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykg
JF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExE
RkxBR1MpICReCisgCisgc2dfc2VuZGRpYWc6IHNnX3NlbmRkaWFnLm8gbGlic2d1dGlscy5sYQor
LQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJU
T09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisg
Cisgc2dfb3Bjb2Rlczogc2dfb3Bjb2Rlcy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRS
QSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3BlcnNpc3Q6
IHNnX3BlcnNpc3QubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ193cml0ZV9sb25nOiBzZ193cml0ZV9s
b25nLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQo
TERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAt
byAkQCAkKExERkxBR1MpICReCisgCisgc2dfcmVhZF9sb25nOiBzZ19yZWFkX2xvbmcubyBsaWJz
Z3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KKyAKKyBzZ19yZXF1ZXN0czogc2dfcmVxdWVzdHMubyBsaWJzZ3V0aWxzLmxhCist
CWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRP
T0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAK
KyBzZ19zZXM6IHNnX3Nlcy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAk
KExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3ZlcmlmeTogc2dfdmVyaWZ5
Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCisgCisgc2dfZW1jX3RyZXNwYXNzOiBzZ19lbWNfdHJlc3Bhc3MubyBs
aWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdT
KSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQo
TERGTEFHUykgJF4KKyAKKyBzZ19sdW5zOiBzZ19sdW5zLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0
b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAk
KExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2df
c3luYzogc2dfc3luYy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExE
KSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxp
bmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3ByZXZlbnQ6IHNnX3ByZXZlbnQu
byBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZM
QUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRA
ICQoTERGTEFHUykgJF4KKyAKKyBzZ19nZXRfY29uZmlnOiBzZ19nZXRfY29uZmlnLm8gbGlic2d1
dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4K
KysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxB
R1MpICReCisgCisgc2dfd3JfbW9kZTogc2dfd3JfbW9kZS5vIGxpYnNndXRpbHMubGEKKy0JbGli
dG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkg
JChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNn
X3J0cGc6IHNnX3J0cGcubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChM
RCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19yZWFzc2lnbjogc2dfcmVhc3Np
Z24ubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChM
REZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1v
ICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19mb3JtYXQ6IHNnX2Zvcm1hdC5vIGxpYnNndXRpbHMu
bGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQo
TElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgorIAorIHNnX3Jtc246IHNnX3Jtc24ubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEp
IC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19pZGVudDogc2df
aWRlbnQubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAg
JChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQp
IC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19tYXAyNjogc2dfbWFwMjYubworLQlsaWJ0b29s
IC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExU
X0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfcmRh
Yzogc2dfcmRhYy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAt
byAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsg
JChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3ZwZDogc2dfdnBkLm8gc2dfdnBkX3Zl
bmRvci5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3NhdF9pZGVudGlmeTogc2dfc2F0X2lkZW50aWZ5
Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCisgCisgc2dfcmVhZF9idWZmZXI6IHNnX3JlYWRfYnVmZmVyLm8gbGli
c2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykg
JF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExE
RkxBR1MpICReCisgCisgc2dfd3JpdGVfYnVmZmVyOiBzZ193cml0ZV9idWZmZXIubyBsaWJzZ3V0
aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgor
KwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4KKyAKKyBzZ19yYXc6IHNnX3Jhdy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRS
QSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIAorIGluc3RhbGw6
ICQoRVhFQ1MpCisgCWluc3RhbGwgLWQgJChJTlNURElSKQorIAlpbnN0YWxsIC1kICQoTElCRElS
KQorLQlsaWJ0b29sIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLWMgbGlic2d1dGlscy5sYSAkKExJ
QkRJUikvbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tZmluaXNoICQoTElCRElSKQorKwkkKExJ
QlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLWMgbGlic2d1dGlscy5s
YSAkKExJQkRJUikvbGlic2d1dGlscy5sYQorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tZmlu
aXNoICQoTElCRElSKQorIAlmb3IgbmFtZSBpbiAkXjsgXAorLQkgZG8gbGlidG9vbCAtLW1vZGU9
aW5zdGFsbCBpbnN0YWxsIC1tIDc1NSBcCisrCSBkbyAkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0t
bW9kZT1pbnN0YWxsIGluc3RhbGwgLW0gNzU1IFwKKyAJCSQkbmFtZSAkKElOU1RESVIpOyBcCisg
CWRvbmUKKyAJaW5zdGFsbCAtZCAkKE1BTkRJUikvJChNQU5fUFJFRikKK0BAIC0yMzUsNyArMjM3
LDcgQEAKKyAJZG9uZQorIAorIHVuaW5zdGFsbDoKKy0JbGlidG9vbCAtLW1vZGU9dW5pbnN0YWxs
IHJtIC1mICQoTElCRElSKS9saWJzZ3V0aWxzLmxhCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkg
LS1tb2RlPXVuaW5zdGFsbCBybSAtZiAkKExJQkRJUikvbGlic2d1dGlscy5sYQorIAlkaXN0cz0i
JChFWEVDUykiOyBcCisgCWZvciBuYW1lIGluICQkZGlzdHM7IGRvIFwKKyAJIHJtIC1mICQoSU5T
VERJUikvJCRuYW1lOyBcCmRpZmYgLS1naXQgYS9wYWNrYWdlcy9zZzMtdXRpbHMvZmlsZXMvTWFr
ZWZpbGUucGF0Y2ggYi9wYWNrYWdlcy9zZzMtdXRpbHMvZmlsZXMvTWFrZWZpbGUucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGNjNWJhYmYuLjAwMDAwMDAKLS0tIGEvcGFja2Fn
ZXMvc2czLXV0aWxzL2ZpbGVzL01ha2VmaWxlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjQ2
ICswLDAgQEAKLUluZGV4OiBzZzMtdXRpbHMtMS4yNC9NYWtlZmlsZQotPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0t
IHNnMy11dGlscy0xLjI0Lm9yaWcvTWFrZWZpbGUJMjAwOS0wMS0yNyAxNjoyOToyNi4wMDAwMDAw
MDAgLTA4MDAKLSsrKyBzZzMtdXRpbHMtMS4yNC9NYWtlZmlsZQkyMDA5LTAxLTI3IDIyOjMxOjA0
LjAwMDAwMDAwMCAtMDgwMAotQEAgLTEsNiArMSw2IEBACi0gU0hFTEwgPSAvYmluL3NoCi0gCi0t
UFJFRklYPS91c3IvbG9jYWwKLStQUkVGSVg9L3VzcgotIExJQkRJUj0kKERFU1RESVIpLyQoUFJF
RklYKS9saWIKLSBJTlNURElSPSQoREVTVERJUikvJChQUkVGSVgpL2JpbgotIE1BTkRJUj0kKERF
U1RESVIpLyQoUFJFRklYKS9zaGFyZS9tYW4KLUBAIC04LDYgKzgsOCBAQAotIAotIENDID0gZ2Nj
Ci0gTEQgPSBnY2MKLStMSUJUT09MID0gbGlidG9vbAotK0xUX0VYVFJBID0gLS10YWc9Q0MKLSAK
LSBFWEVDUyA9IHNnX2RkIHNncF9kZCBzZ21fZGQgc2dfcmVhZCBzZ19tYXAgc2dfc2NhbiBzZ19y
YnVmIFwKLSAgIAlzZ2luZm8gc2dfcmVhZGNhcCBzZ190dXJzIHNnX2lucSBzZ190ZXN0X3J3YnVm
IFwKLUBAIC02NCwxNjQgKzY2LDE2NCBAQAotIAkkKENDKSAkKElOQ0xVREVTKSAkKENGTEFHUykg
JChTX0NGTEFHUykgLWMgLW8gJEAgJDwKLSAKLSBzZ19saWIubG86IHNnX2xpYi5vCi0tCWxpYnRv
b2wgLS1tb2RlPWNvbXBpbGUgJChDQykgLWMgc2dfbGliLmMKLSsJJChMSUJUT09MKSAkKExUX0VY
VFJBKSAtLW1vZGU9Y29tcGlsZSAkKENDKSAtYyBzZ19saWIuYwotIAotIHNnX2NtZHNfYmFzaWMu
bG86IHNnX2NtZHNfYmFzaWMubwotLQlsaWJ0b29sIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNn
X2NtZHNfYmFzaWMuYwotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1jb21waWxlICQo
Q0MpIC1jIHNnX2NtZHNfYmFzaWMuYwotIAotIHNnX2NtZHNfZXh0cmEubG86IHNnX2NtZHNfZXh0
cmEubwotLQlsaWJ0b29sIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNfZXh0cmEuYwot
KwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2NtZHNf
ZXh0cmEuYwotIAotIHNnX3B0X2xpbnV4LmxvOiBzZ19wdF9saW51eC5vCi0tCWxpYnRvb2wgLS1t
b2RlPWNvbXBpbGUgJChDQykgLWMgc2dfcHRfbGludXguYwotKwkkKExJQlRPT0wpICQoTFRfRVhU
UkEpIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX3B0X2xpbnV4LmMKLSAKLSBsaWJzZ3V0aWxz
LmxhOiBzZ19saWIubG8gc2dfY21kc19iYXNpYy5sbyBzZ19jbWRzX2V4dHJhLmxvIHNnX3B0X2xp
bnV4LmxvCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gbGlic2d1dGlscy5sYSBzZ19s
aWIubG8gc2dfY21kc19iYXNpYy5sbyBcCi0rCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gbGlic2d1dGlscy5sYSBzZ19saWIubG8gc2dfY21kc19iYXNpYy5sbyBc
Ci0gCXNnX2NtZHNfZXh0cmEubG8gc2dfcHRfbGludXgubG8gLXJwYXRoICQoTElCRElSKSBcCi0g
CS12ZXJzaW9uLWluZm8gJChMSUJfVklORk8pCi0gCi0gIyBsaWJzZ3V0aWxzLmxhOiBzZ19saWIu
bG8gc2dfY21kc19iYXNpYy5sbyBzZ19jbWRzX2V4dHJhLmxvCi0tIwlsaWJ0b29sIC0tbW9kZT1s
aW5rICQoTEQpIC1vIGxpYnNndXRpbHMubGEgc2dfbGliLmxvIHNnX2NtZHNfYmFzaWMubG8gXAot
KyMJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyBsaWJzZ3V0aWxz
LmxhIHNnX2xpYi5sbyBzZ19jbWRzX2Jhc2ljLmxvIFwKLSAjCXNnX2NtZHNfZXh0cmEubG8gLXJw
YXRoICQoTElCRElSKSAtcmVsZWFzZSAkKFJFTEVBU0UpCi0gCi0gc2dfaW5xOiBzZ19pbnEubyBs
aWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdT
KSAkXiAKLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReIAotIAotIHNnX2RkOiBzZ19kZC5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGls
cy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJ
JChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1Mp
ICReCi0gCi0gc2dfc2Nhbjogc2dfc2Nhbi5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQot
LQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4gCi0rCSQoTElC
VE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAK
LSAKLSBzZ2luZm86IHNnaW5mby5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQotLQlsaWJ0
b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAk
KExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2df
c3RhcnQ6IHNnX3N0YXJ0Lm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4gCi0rCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAKLSAKLSBzZ19yYnVmOiBzZ19yYnVmLm8g
c2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19yZWFkY2FwOiBzZ19yZWFkY2FwLm8g
bGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReCi0gCi0gc2dwX2RkLm86IHNncF9kZC5jCi0gCSQoQ0MpICQoSU5DTFVERVMp
ICQoQ0ZMQUdTKSAkKFNfQ0ZMQUdTKSAkKENGTEFHU19QVEhSRUFEUykgXAotIAktYyAtbyBzZ3Bf
ZGQubyAkPAotIAotIHNncF9kZDogc2dwX2RkLm8gc2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxh
Ci0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXiAtbHB0aHJl
YWQKLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExE
RkxBR1MpICReIC1scHRocmVhZAotIAotIHNnbV9kZDogc2dtX2RkLm8gc2dfaW9fbGludXgubyBs
aWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdT
KSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQo
TERGTEFHUykgJF4KLSAKLSBzZ19tYXA6IHNnX21hcC5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGls
cy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJ
JChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1Mp
ICReCi0gCi0gc2dfdHVyczogc2dfdHVycy5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChMVF9FWFRS
QSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3Rlc3Rfcndi
dWY6IHNnX3Rlc3RfcndidWYubyBzZ19pb19saW51eC5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9v
bCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChM
VF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3Jl
YWQ6IHNnX3JlYWQubyBzZ19pb19saW51eC5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChMVF9FWFRS
QSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3Jlc2V0OiBz
Z19yZXNldC5vCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KLSAKLSBzZ19tb2Rlczogc2dfbW9kZXMubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRv
b2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQo
TFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19s
b2dzOiBzZ19sb2dzLm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQp
IC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGlu
ayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfc2VuZGRpYWc6IHNnX3NlbmRkaWFn
Lm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCi0gCi0gc2dfb3Bjb2Rlczogc2dfb3Bjb2Rlcy5vIGxpYnNndXRpbHMu
bGEKLS0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQo
TElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgotIAotIHNnX3BlcnNpc3Q6IHNnX3BlcnNpc3QubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRf
RVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ193cml0
ZV9sb25nOiBzZ193cml0ZV9sb25nLm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAt
LW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfcmVhZF9sb25nOiBz
Z19yZWFkX2xvbmcubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19yZXF1ZXN0czogc2dfcmVxdWVzdHMu
byBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZM
QUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRA
ICQoTERGTEFHUykgJF4KLSAKLSBzZ19zZXM6IHNnX3Nlcy5vIGxpYnNndXRpbHMubGEKLS0JbGli
dG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkg
JChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNn
X3ZlcmlmeTogc2dfdmVyaWZ5Lm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfZW1jX3RyZXNwYXNzOiBz
Z19lbWNfdHJlc3Bhc3MubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChM
RCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19sdW5zOiBzZ19sdW5zLm8gbGli
c2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykg
JF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExE
RkxBR1MpICReCi0gCi0gc2dfc3luYzogc2dfc3luYy5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9v
bCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChM
VF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3By
ZXZlbnQ6IHNnX3ByZXZlbnQubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsg
JChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9k
ZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19nZXRfY29uZmlnOiBzZ19n
ZXRfY29uZmlnLm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1v
ICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAk
KExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfd3JfbW9kZTogc2dfd3JfbW9kZS5vIGxp
YnNndXRpbHMubGEKLS0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1Mp
ICReCi0rCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChM
REZMQUdTKSAkXgotIAotIHNnX3J0cGc6IHNnX3J0cGcubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRv
b2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQo
TFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19y
ZWFzc2lnbjogc2dfcmVhc3NpZ24ubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxp
bmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0t
bW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19mb3JtYXQ6IHNnX2Zv
cm1hdC5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3Jtc246IHNnX3Jtc24ubyBsaWJzZ3V0aWxzLmxh
Ci0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJ
QlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4K
LSAKLSBzZ19pZGVudDogc2dfaWRlbnQubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEp
IC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19tYXAyNjogc2df
bWFwMjYubwotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4K
LSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxB
R1MpICReCi0gCi0gc2dfcmRhYzogc2dfcmRhYy5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9vbCAt
LW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChMVF9F
WFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3ZwZDog
c2dfdnBkLm8gc2dfdnBkX3ZlbmRvci5vIGxpYnNndXRpbHMubGEKLS0JbGlidG9vbCAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQoTElCVE9PTCkgJChMVF9FWFRSQSkg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgotIAotIHNnX3NhdF9pZGVudGlm
eTogc2dfc2F0X2lkZW50aWZ5Lm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfcmVhZF9idWZmZXI6IHNn
X3JlYWRfYnVmZmVyLm8gbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQp
IC1vICRAICQoTERGTEFHUykgJF4KLSsJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGlu
ayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0gCi0gc2dfd3JpdGVfYnVmZmVyOiBzZ193cml0
ZV9idWZmZXIubyBsaWJzZ3V0aWxzLmxhCi0tCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8g
JEAgJChMREZMQUdTKSAkXgotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4KLSAKLSBzZ19yYXc6IHNnX3Jhdy5vIGxpYnNndXRpbHMu
bGEKLS0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCi0rCSQo
TElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAk
XgotIAotIAotIGluc3RhbGw6ICQoRVhFQ1MpCi0gCWluc3RhbGwgLWQgJChJTlNURElSKQotIAlp
bnN0YWxsIC1kICQoTElCRElSKQotLQlsaWJ0b29sIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLWMg
bGlic2d1dGlscy5sYSAkKExJQkRJUikvbGlic2d1dGlscy5sYQotLQlsaWJ0b29sIC0tZmluaXNo
ICQoTElCRElSKQotKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1pbnN0YWxsIGluc3Rh
bGwgLWMgbGlic2d1dGlscy5sYSAkKExJQkRJUikvbGlic2d1dGlscy5sYQotKwkkKExJQlRPT0wp
ICQoTFRfRVhUUkEpIC0tZmluaXNoICQoTElCRElSKQotIAlmb3IgbmFtZSBpbiAkXjsgXAotLQkg
ZG8gbGlidG9vbCAtLW1vZGU9aW5zdGFsbCBpbnN0YWxsIC1tIDc1NSBcCi0rCSBkbyAkKExJQlRP
T0wpICQoTFRfRVhUUkEpIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLW0gNzU1IFwKLSAJCSQkbmFt
ZSAkKElOU1RESVIpOyBcCi0gCWRvbmUKLSAJaW5zdGFsbCAtZCAkKE1BTkRJUikvJChNQU5fUFJF
RikKLUBAIC0yMzUsNyArMjM3LDcgQEAKLSAJZG9uZQotIAotIHVuaW5zdGFsbDoKLS0JbGlidG9v
bCAtLW1vZGU9dW5pbnN0YWxsIHJtIC1mICQoTElCRElSKS9saWJzZ3V0aWxzLmxhCi0rCSQoTElC
VE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPXVuaW5zdGFsbCBybSAtZiAkKExJQkRJUikvbGlic2d1
dGlscy5sYQotIAlkaXN0cz0iJChFWEVDUykiOyBcCi0gCWZvciBuYW1lIGluICQkZGlzdHM7IGRv
IFwKLSAJIHJtIC1mICQoSU5TVERJUikvJCRuYW1lOyBcCmRpZmYgLS1naXQgYS9wYWNrYWdlcy9z
ZzMtdXRpbHMvc2czLXV0aWxzXzEuMjQuYmIgYi9wYWNrYWdlcy9zZzMtdXRpbHMvc2czLXV0aWxz
XzEuMjQuYmIKaW5kZXggNzFmYzM0Yy4uMzBiZGYzMSAxMDA2NDQKLS0tIGEvcGFja2FnZXMvc2cz
LXV0aWxzL3NnMy11dGlsc18xLjI0LmJiCisrKyBiL3BhY2thZ2VzL3NnMy11dGlscy9zZzMtdXRp
bHNfMS4yNC5iYgpAQCAtMSwyOSArMSwxNyBAQAogREVTQ1JJUFRJT04gPSAiVXRpbGl0aWVzIGZv
ciB3b3JraW5nIHdpdGggZ2VuZXJpYyBTQ1NJIGRldmljZXMiCi08PDw8PDw8IEhFQUQ6cGFja2Fn
ZXMvc2czLXV0aWxzL3NnMy11dGlsc18xLjI0LmJiCi09PT09PT09CiBBVVRIT1IgPSAiRXJpYyBT
Y2h3YXJ0eiAoU2tpZikgPGVtc2Nod2FyQGRlYmlhbi5vcmc+IgogSE9NRVBBR0UgPSAiaHR0cDov
L3BhY2thZ2VzLnFhLmRlYmlhbi5vcmcvcy9zZzMtdXRpbHMuaHRtbCIKLT4+Pj4+Pj4gYzkyYmVm
MTdkMmEzNWUwNmVjNmVkYzI0Mzk5MThjODhhN2I0ODA4YjpwYWNrYWdlcy9zZzMtdXRpbHMvc2cz
LXV0aWxzXzEuMjQuYmIKIFNFQ1RJT04gPSAiY29uc29sZS9hZG1pbiIKIExJQ0VOU0UgPSAiR1BM
djIiCi08PDw8PDw8IEhFQUQ6cGFja2FnZXMvc2czLXV0aWxzL3NnMy11dGlsc18xLjI0LmJiCi1I
T01FUEFHRSA9ICJodHRwOi8vcGFja2FnZXMucWEuZGViaWFuLm9yZy9zL3NnMy11dGlscy5odG1s
IgogQVVUSE9SID0gIkVyaWMgU2Nod2FydHogKFNraWYpIDxlbXNjaHdhckBkZWJpYW4ub3JnPiIK
LT09PT09PT0KLT4+Pj4+Pj4gYzkyYmVmMTdkMmEzNWUwNmVjNmVkYzI0Mzk5MThjODhhN2I0ODA4
YjpwYWNrYWdlcy9zZzMtdXRpbHMvc2czLXV0aWxzXzEuMjQuYmIKLVBSID0gInIwIgorUFIgPSAi
cjEiCiAKIFNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL3Mvc2czLXV0aWxzL3NnMy11
dGlsc18ke1BWfS5vcmlnLnRhci5neiBcCi08PDw8PDw8IEhFQUQ6cGFja2FnZXMvc2czLXV0aWxz
L3NnMy11dGlsc18xLjI0LmJiCi0JZmlsZTovL01ha2VmaWxlLnBhdGNoO3BhdGNoPTEiCi09PT09
PT09Ci0gICAgICAgICAgIGZpbGU6Ly9NYWtlZmlsZS5wYXRjaDtwYXRjaD0xIgotPj4+Pj4+PiBj
OTJiZWYxN2QyYTM1ZTA2ZWM2ZWRjMjQzOTkxOGM4OGE3YjQ4MDhiOnBhY2thZ2VzL3NnMy11dGls
cy9zZzMtdXRpbHNfMS4yNC5iYgorCWZpbGU6Ly9NYWtlZmlsZS1yMS5wYXRjaDtwYXRjaD0xIgog
CiBTID0gIiR7V09SS0RJUn0vc2czLXV0aWxzLSR7UFZ9IgogCiBpbmhlcml0IGF1dG90b29scwot
PDw8PDw8PCBIRUFEOnBhY2thZ2VzL3NnMy11dGlscy9zZzMtdXRpbHNfMS4yNC5iYgogCi09PT09
PT09Ci0+Pj4+Pj4+IGM5MmJlZjE3ZDJhMzVlMDZlYzZlZGMyNDM5OTE4Yzg4YTdiNDgwOGI6cGFj
a2FnZXMvc2czLXV0aWxzL3NnMy11dGlsc18xLjI0LmJiCitFWFRSQV9PRU1BS0U9JyJMSUJUT09M
PSR7U1RBR0lOR19CSU5ESVJfTkFUSVZFfS8ke0hPU1RfU1lTfS1saWJ0b29sIicKK0xERkxBR1Mg
PSIgLUwke1NUQUdJTkdfTElCRElSX05BVElWRX0gLXJwYXRoLWxpbmsgJHtTVEFHSU5HX0xJQkRJ
Ul9OQVRJVkV9IC1ycGF0aCAke1NUQUdJTkdfTElCRElSX05BVElWRX0gLU8xIgotLSAKMS41LjQu
MwoK

--000e0cd147ea82671e04621222c8--
