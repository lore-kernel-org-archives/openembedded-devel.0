Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LS5Xj-0002IK-8t
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 09:13:04 +0100
Received: by rv-out-0708.google.com with SMTP id f25so7496583rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 00:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=FH8NbWI93hTuV/rZEKmwvhJTSG84mtXnsqKtiHhrTpM=;
	b=SrHb/xbhgjAhsqqJUFpH4wnCIhU3hcQRAolyal556n+PWtvXeOWC0NA+l0QOpmkWrs
	Tr7dUfhMy9jSY59IU84oBh2ggRT0RjEd2tOGo5d3vx+Ka+Mg6tpQfjWCpdHhXLnGAA8p
	R1HgoFi9FfBo7Pd54rTQIghQ7Smk9YJaYCXJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=x+jRxXuthDu1zQp4EiRlVK69YlcPnqyf+oNWB6ei1rV6H3cTIC07tjTGYiX4VnlW6I
	Tywp0newSy86+A+ZQL3jxRRoloMzYOn6572KCzrQNbeEktCmLBAUbeP35s5NHfam9E9r
	IhLc4xjSnSmLxkuL5bl7ZxyvtXJD6LDZbqpaw=
MIME-Version: 1.0
Received: by 10.141.113.6 with SMTP id q6mr3249015rvm.212.1233129927036; Wed, 
	28 Jan 2009 00:05:27 -0800 (PST)
Date: Wed, 28 Jan 2009 00:05:26 -0800
Message-ID: <a7f8874a0901280005p5c21c00ay5647c21df9fce86d@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] Added sg3-utils
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
X-List-Received-Date: Wed, 28 Jan 2009 08:13:04 -0000
X-Groupsio-MsgNum: 7456
Content-Type: multipart/mixed; boundary=000e0cd22c384351670461866f0e

--000e0cd22c384351670461866f0e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From 6f470d6b859e78dff1a168fc24bcb8d3ddcef575 Mon Sep 17 00:00:00 2001
From: Henry von Tresckow <hvontres@gmail.com>
Date: Tue, 27 Jan 2009 23:44:26 -0800
Subject: [PATCH] Added sg3-utils

---
 conf/checksums.ini                      |    4 +
 packages/sg3-utils/files/Makefile.patch |  246 +++++++++++++++++++++++++++++++
 packages/sg3-utils/sg3-utils_1.24.bb    |   14 ++
 3 files changed, 264 insertions(+), 0 deletions(-)
 create mode 100644 packages/sg3-utils/files/Makefile.patch
 create mode 100644 packages/sg3-utils/sg3-utils_1.24.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index f98fa55..e3a8253 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19150,6 +19150,10 @@
sha256=4d710b17c5440518b43d3d1f7cbcb78a62c72f25e48a1b385a0ae3872ec8b40b
 md5=350180a6e4132a2b1262c7a15162c007
 sha256=4323581ddb6150677a36bcb87e3960100a7ea7c80906f0c7b7a27d1e43b055d9

+[ftp://ftp.debian.org/debian/pool/main/s/sg3-utils/sg3-utils_1.24.orig.tar.gz]
+md5=9e1b8811b013d8f97d8ea2e0942cebad
+sha256=0a06dae84a8f7f464c0c29c78a8f73f24a62894a2d3fc10b5f74a993f7b5abfe
+
 [ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz]
 md5=103c9828f24820df86e55e7862e28974
 sha256=7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959
diff --git a/packages/sg3-utils/files/Makefile.patch
b/packages/sg3-utils/files/Makefile.patch
new file mode 100644
index 0000000..cc5babf
--- /dev/null
+++ b/packages/sg3-utils/files/Makefile.patch
@@ -0,0 +1,246 @@
+Index: sg3-utils-1.24/Makefile
+===================================================================
+--- sg3-utils-1.24.orig/Makefile	2009-01-27 16:29:26.000000000 -0800
++++ sg3-utils-1.24/Makefile	2009-01-27 22:31:04.000000000 -0800
+@@ -1,6 +1,6 @@
+ SHELL = /bin/sh
+
+-PREFIX=/usr/local
++PREFIX=/usr
+ LIBDIR=$(DESTDIR)/$(PREFIX)/lib
+ INSTDIR=$(DESTDIR)/$(PREFIX)/bin
+ MANDIR=$(DESTDIR)/$(PREFIX)/share/man
+@@ -8,6 +8,8 @@
+
+ CC = gcc
+ LD = gcc
++LIBTOOL = libtool
++LT_EXTRA = --tag=CC
+
+ EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
+   	sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
+@@ -64,164 +66,164 @@
+ 	$(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
+
+ sg_lib.lo: sg_lib.o
+-	libtool --mode=compile $(CC) -c sg_lib.c
++	$(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
+
+ sg_cmds_basic.lo: sg_cmds_basic.o
+-	libtool --mode=compile $(CC) -c sg_cmds_basic.c
++	$(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
+
+ sg_cmds_extra.lo: sg_cmds_extra.o
+-	libtool --mode=compile $(CC) -c sg_cmds_extra.c
++	$(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
+
+ sg_pt_linux.lo: sg_pt_linux.o
+-	libtool --mode=compile $(CC) -c sg_pt_linux.c
++	$(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
+
+ libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo sg_pt_linux.lo
+-	libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la sg_lib.lo
sg_cmds_basic.lo \
+ 	sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
+ 	-version-info $(LIB_VINFO)
+
+ # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
+-#	libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
++#	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
sg_lib.lo sg_cmds_basic.lo \
+ #	sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
+
+ sg_inq: sg_inq.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sginfo: sginfo.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_start: sg_start.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_readcap: sg_readcap.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sgp_dd.o: sgp_dd.c
+ 	$(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
+ 	-c -o sgp_dd.o $<
+
+ sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
+
+ sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_map: sg_map.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_turs: sg_turs.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read: sg_read.o sg_io_linux.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_reset: sg_reset.o
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_modes: sg_modes.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_logs: sg_logs.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_senddiag: sg_senddiag.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_opcodes: sg_opcodes.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_persist: sg_persist.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_write_long: sg_write_long.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read_long: sg_read_long.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_requests: sg_requests.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_ses: sg_ses.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_verify: sg_verify.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_emc_trespass: sg_emc_trespass.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_luns: sg_luns.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_sync: sg_sync.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_prevent: sg_prevent.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_get_config: sg_get_config.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_wr_mode: sg_wr_mode.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rtpg: sg_rtpg.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_reassign: sg_reassign.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_format: sg_format.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rmsn: sg_rmsn.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_ident: sg_ident.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_map26: sg_map26.o
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_rdac: sg_rdac.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_sat_identify: sg_sat_identify.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_read_buffer: sg_read_buffer.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_write_buffer: sg_write_buffer.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+ sg_raw: sg_raw.o libsgutils.la
+-	libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
++	$(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
+
+
+ install: $(EXECS)
+ 	install -d $(INSTDIR)
+ 	install -d $(LIBDIR)
+-	libtool --mode=install install -c libsgutils.la $(LIBDIR)/libsgutils.la
+-	libtool --finish $(LIBDIR)
++	$(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
$(LIBDIR)/libsgutils.la
++	$(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
+ 	for name in $^; \
+-	 do libtool --mode=install install -m 755 \
++	 do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
+ 		$$name $(INSTDIR); \
+ 	done
+ 	install -d $(MANDIR)/$(MAN_PREF)
+@@ -235,7 +237,7 @@
+ 	done
+
+ uninstall:
+-	libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
++	$(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
+ 	dists="$(EXECS)"; \
+ 	for name in $$dists; do \
+ 	 rm -f $(INSTDIR)/$$name; \
diff --git a/packages/sg3-utils/sg3-utils_1.24.bb
b/packages/sg3-utils/sg3-utils_1.24.bb
new file mode 100644
index 0000000..d5f9071
--- /dev/null
+++ b/packages/sg3-utils/sg3-utils_1.24.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Utilities for working with generic SCSI devices"
+SECTION = "console/admin"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://packages.qa.debian.org/s/sg3-utils.html"
+AUTHOR = "Eric Schwartz (Skif) <emschwar@debian.org>"
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/s/sg3-utils/sg3-utils_${PV}.orig.tar.gz \
+	file://Makefile.patch;patch=1"
+
+S = "${WORKDIR}/sg3-utils-${PV}"
+
+inherit autotools
+
-- 
1.5.4.3






-- 
Henry von Tresckow (hvontres)
Laurence J. Peter  - "It's better to have loved and lost than to have
to do forty pounds of laundry a week."

--000e0cd22c384351670461866f0e
Content-Type: text/x-diff; charset=US-ASCII; name="0001-Added-sg3-utils.patch"
Content-Disposition: attachment; filename="0001-Added-sg3-utils.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fqhpo4pw0

RnJvbSA2ZjQ3MGQ2Yjg1OWU3OGRmZjFhMTY4ZmMyNGJjYjhkM2RkY2VmNTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZW5yeSB2b24gVHJlc2Nrb3cgPGh2b250cmVzQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCAyNyBKYW4gMjAwOSAyMzo0NDoyNiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IEFkZGVkIHNnMy11dGlscwoKLS0tCiBjb25mL2NoZWNrc3Vtcy5pbmkgICAgICAgICAgICAgICAg
ICAgICAgfCAgICA0ICsKIHBhY2thZ2VzL3NnMy11dGlscy9maWxlcy9NYWtlZmlsZS5wYXRjaCB8
ICAyNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZXMvc2czLXV0aWxz
L3NnMy11dGlsc18xLjI0LmJiICAgIHwgICAxNCArKwogMyBmaWxlcyBjaGFuZ2VkLCAyNjQgaW5z
ZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlcy9z
ZzMtdXRpbHMvZmlsZXMvTWFrZWZpbGUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
cy9zZzMtdXRpbHMvc2czLXV0aWxzXzEuMjQuYmIKCmRpZmYgLS1naXQgYS9jb25mL2NoZWNrc3Vt
cy5pbmkgYi9jb25mL2NoZWNrc3Vtcy5pbmkKaW5kZXggZjk4ZmE1NS4uZTNhODI1MyAxMDA2NDQK
LS0tIGEvY29uZi9jaGVja3N1bXMuaW5pCisrKyBiL2NvbmYvY2hlY2tzdW1zLmluaQpAQCAtMTkx
NTAsNiArMTkxNTAsMTAgQEAgc2hhMjU2PTRkNzEwYjE3YzU0NDA1MThiNDNkM2QxZjdjYmNiNzhh
NjJjNzJmMjVlNDhhMWIzODVhMGFlMzg3MmVjOGI0MGIKIG1kNT0zNTAxODBhNmU0MTMyYTJiMTI2
MmM3YTE1MTYyYzAwNwogc2hhMjU2PTQzMjM1ODFkZGI2MTUwNjc3YTM2YmNiODdlMzk2MDEwMGE3
ZWE3YzgwOTA2ZjBjN2I3YTI3ZDFlNDNiMDU1ZDkKIAorW2Z0cDovL2Z0cC5kZWJpYW4ub3JnL2Rl
Ymlhbi9wb29sL21haW4vcy9zZzMtdXRpbHMvc2czLXV0aWxzXzEuMjQub3JpZy50YXIuZ3pdCitt
ZDU9OWUxYjg4MTFiMDEzZDhmOTdkOGVhMmUwOTQyY2ViYWQKK3NoYTI1Nj0wYTA2ZGFlODRhOGY3
ZjQ2NGMwYzI5Yzc4YThmNzNmMjRhNjI4OTRhMmQzZmMxMGI1Zjc0YTk5M2Y3YjVhYmZlCisKIFtm
dHA6Ly9zb3VyY2VzLnJlZGhhdC5jb20vcHViL2RvY2Jvb2stdG9vbHMvbmV3LXRyaWFscy9TT1VS
Q0VTL3NnbWwtY29tbW9uLTAuNi4zLnRnel0KIG1kNT0xMDNjOTgyOGYyNDgyMGRmODZlNTVlNzg2
MmUyODk3NAogc2hhMjU2PTdkYzQxOGMxZDM2MTEyM2ZmYzVlNDVkNjFmMWI5NzI1Nzk0MGE4ZWIz
NWQwYmZiYmM0OTMzODFjYzViMWY5NTkKZGlmZiAtLWdpdCBhL3BhY2thZ2VzL3NnMy11dGlscy9m
aWxlcy9NYWtlZmlsZS5wYXRjaCBiL3BhY2thZ2VzL3NnMy11dGlscy9maWxlcy9NYWtlZmlsZS5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5jYzViYWJmCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZXMvc2czLXV0aWxzL2ZpbGVzL01ha2VmaWxlLnBhdGNoCkBAIC0w
LDAgKzEsMjQ2IEBACitJbmRleDogc2czLXV0aWxzLTEuMjQvTWFrZWZpbGUKKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Ky0tLSBzZzMtdXRpbHMtMS4yNC5vcmlnL01ha2VmaWxlCTIwMDktMDEtMjcgMTY6Mjk6MjYuMDAw
MDAwMDAwIC0wODAwCisrKysgc2czLXV0aWxzLTEuMjQvTWFrZWZpbGUJMjAwOS0wMS0yNyAyMjoz
MTowNC4wMDAwMDAwMDAgLTA4MDAKK0BAIC0xLDYgKzEsNiBAQAorIFNIRUxMID0gL2Jpbi9zaAor
IAorLVBSRUZJWD0vdXNyL2xvY2FsCisrUFJFRklYPS91c3IKKyBMSUJESVI9JChERVNURElSKS8k
KFBSRUZJWCkvbGliCisgSU5TVERJUj0kKERFU1RESVIpLyQoUFJFRklYKS9iaW4KKyBNQU5ESVI9
JChERVNURElSKS8kKFBSRUZJWCkvc2hhcmUvbWFuCitAQCAtOCw2ICs4LDggQEAKKyAKKyBDQyA9
IGdjYworIExEID0gZ2NjCisrTElCVE9PTCA9IGxpYnRvb2wKKytMVF9FWFRSQSA9IC0tdGFnPUND
CisgCisgRVhFQ1MgPSBzZ19kZCBzZ3BfZGQgc2dtX2RkIHNnX3JlYWQgc2dfbWFwIHNnX3NjYW4g
c2dfcmJ1ZiBcCisgICAJc2dpbmZvIHNnX3JlYWRjYXAgc2dfdHVycyBzZ19pbnEgc2dfdGVzdF9y
d2J1ZiBcCitAQCAtNjQsMTY0ICs2NiwxNjQgQEAKKyAJJChDQykgJChJTkNMVURFUykgJChDRkxB
R1MpICQoU19DRkxBR1MpIC1jIC1vICRAICQ8CisgCisgc2dfbGliLmxvOiBzZ19saWIubworLQls
aWJ0b29sIC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX2xpYi5jCisrCSQoTElCVE9PTCkgJChM
VF9FWFRSQSkgLS1tb2RlPWNvbXBpbGUgJChDQykgLWMgc2dfbGliLmMKKyAKKyBzZ19jbWRzX2Jh
c2ljLmxvOiBzZ19jbWRzX2Jhc2ljLm8KKy0JbGlidG9vbCAtLW1vZGU9Y29tcGlsZSAkKENDKSAt
YyBzZ19jbWRzX2Jhc2ljLmMKKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9Y29tcGls
ZSAkKENDKSAtYyBzZ19jbWRzX2Jhc2ljLmMKKyAKKyBzZ19jbWRzX2V4dHJhLmxvOiBzZ19jbWRz
X2V4dHJhLm8KKy0JbGlidG9vbCAtLW1vZGU9Y29tcGlsZSAkKENDKSAtYyBzZ19jbWRzX2V4dHJh
LmMKKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9Y29tcGlsZSAkKENDKSAtYyBzZ19j
bWRzX2V4dHJhLmMKKyAKKyBzZ19wdF9saW51eC5sbzogc2dfcHRfbGludXgubworLQlsaWJ0b29s
IC0tbW9kZT1jb21waWxlICQoQ0MpIC1jIHNnX3B0X2xpbnV4LmMKKysJJChMSUJUT09MKSAkKExU
X0VYVFJBKSAtLW1vZGU9Y29tcGlsZSAkKENDKSAtYyBzZ19wdF9saW51eC5jCisgCisgbGlic2d1
dGlscy5sYTogc2dfbGliLmxvIHNnX2NtZHNfYmFzaWMubG8gc2dfY21kc19leHRyYS5sbyBzZ19w
dF9saW51eC5sbworLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vIGxpYnNndXRpbHMubGEg
c2dfbGliLmxvIHNnX2NtZHNfYmFzaWMubG8gXAorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0t
bW9kZT1saW5rICQoTEQpIC1vIGxpYnNndXRpbHMubGEgc2dfbGliLmxvIHNnX2NtZHNfYmFzaWMu
bG8gXAorIAlzZ19jbWRzX2V4dHJhLmxvIHNnX3B0X2xpbnV4LmxvIC1ycGF0aCAkKExJQkRJUikg
XAorIAktdmVyc2lvbi1pbmZvICQoTElCX1ZJTkZPKQorIAorICMgbGlic2d1dGlscy5sYTogc2df
bGliLmxvIHNnX2NtZHNfYmFzaWMubG8gc2dfY21kc19leHRyYS5sbworLSMJbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyBsaWJzZ3V0aWxzLmxhIHNnX2xpYi5sbyBzZ19jbWRzX2Jhc2ljLmxv
IFwKKysjCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gbGlic2d1
dGlscy5sYSBzZ19saWIubG8gc2dfY21kc19iYXNpYy5sbyBcCisgIwlzZ19jbWRzX2V4dHJhLmxv
IC1ycGF0aCAkKExJQkRJUikgLXJlbGVhc2UgJChSRUxFQVNFKQorIAorIHNnX2lucTogc2dfaW5x
Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4gCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8g
JEAgJChMREZMQUdTKSAkXiAKKyAKKyBzZ19kZDogc2dfZGQubyBzZ19pb19saW51eC5vIGxpYnNn
dXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICRe
CisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZM
QUdTKSAkXgorIAorIHNnX3NjYW46IHNnX3NjYW4ubyBzZ19pb19saW51eC5vIGxpYnNndXRpbHMu
bGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReIAorKwkk
KExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykg
JF4gCisgCisgc2dpbmZvOiBzZ2luZm8ubyBzZ19pb19saW51eC5vIGxpYnNndXRpbHMubGEKKy0J
bGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9P
TCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAor
IHNnX3N0YXJ0OiBzZ19zdGFydC5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGlu
ayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReIAorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0t
bW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4gCisgCisgc2dfcmJ1Zjogc2dfcmJ1
Zi5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfcmVhZGNhcDogc2dfcmVhZGNh
cC5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExE
RkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8g
JEAgJChMREZMQUdTKSAkXgorIAorIHNncF9kZC5vOiBzZ3BfZGQuYworIAkkKENDKSAkKElOQ0xV
REVTKSAkKENGTEFHUykgJChTX0NGTEFHUykgJChDRkxBR1NfUFRIUkVBRFMpIFwKKyAJLWMgLW8g
c2dwX2RkLm8gJDwKKyAKKyBzZ3BfZGQ6IHNncF9kZC5vIHNnX2lvX2xpbnV4Lm8gbGlic2d1dGls
cy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4gLWxw
dGhyZWFkCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAg
JChMREZMQUdTKSAkXiAtbHB0aHJlYWQKKyAKKyBzZ21fZGQ6IHNnbV9kZC5vIHNnX2lvX2xpbnV4
Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERG
TEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAk
QCAkKExERkxBR1MpICReCisgCisgc2dfbWFwOiBzZ19tYXAubyBzZ19pb19saW51eC5vIGxpYnNn
dXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICRe
CisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZM
QUdTKSAkXgorIAorIHNnX3R1cnM6IHNnX3R1cnMubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRf
RVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ190ZXN0
X3J3YnVmOiBzZ190ZXN0X3J3YnVmLm8gc2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxhCistCWxp
YnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wp
ICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBz
Z19yZWFkOiBzZ19yZWFkLm8gc2dfaW9fbGludXgubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRf
RVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19yZXNl
dDogc2dfcmVzZXQubworLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReCisgCisgc2dfbW9kZXM6IHNnX21vZGVzLm8gbGlic2d1dGlscy5sYQorLQls
aWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09M
KSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisg
c2dfbG9nczogc2dfbG9ncy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAk
KExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3NlbmRkaWFnOiBzZ19zZW5k
ZGlhZy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAk
KExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkg
LW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX29wY29kZXM6IHNnX29wY29kZXMubyBsaWJzZ3V0
aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgor
KwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4KKyAKKyBzZ19wZXJzaXN0OiBzZ19wZXJzaXN0Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0
b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAk
KExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2df
d3JpdGVfbG9uZzogc2dfd3JpdGVfbG9uZy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRS
QSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3JlYWRfbG9u
Zzogc2dfcmVhZF9sb25nLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfcmVxdWVzdHM6IHNnX3JlcXVl
c3RzLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQo
TERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAt
byAkQCAkKExERkxBR1MpICReCisgCisgc2dfc2VzOiBzZ19zZXMubyBsaWJzZ3V0aWxzLmxhCist
CWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRP
T0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAK
KyBzZ192ZXJpZnk6IHNnX3ZlcmlmeS5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX2VtY190cmVzcGFz
czogc2dfZW1jX3RyZXNwYXNzLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5r
ICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1v
ZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfbHVuczogc2dfbHVucy5v
IGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxB
R1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAg
JChMREZMQUdTKSAkXgorIAorIHNnX3N5bmM6IHNnX3N5bmMubyBsaWJzZ3V0aWxzLmxhCistCWxp
YnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wp
ICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBz
Z19wcmV2ZW50OiBzZ19wcmV2ZW50Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1s
aW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAt
LW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfZ2V0X2NvbmZpZzog
c2dfZ2V0X2NvbmZpZy5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExE
KSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxp
bmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3dyX21vZGU6IHNnX3dyX21vZGUu
byBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZM
QUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRA
ICQoTERGTEFHUykgJF4KKyAKKyBzZ19ydHBnOiBzZ19ydHBnLm8gbGlic2d1dGlscy5sYQorLQls
aWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09M
KSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisg
c2dfcmVhc3NpZ246IHNnX3JlYXNzaWduLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9k
ZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJB
KSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfZm9ybWF0OiBz
Z19mb3JtYXQubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8g
JEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQo
TEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19ybXNuOiBzZ19ybXNuLm8gbGlic2d1dGls
cy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJ
JChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1Mp
ICReCisgCisgc2dfaWRlbnQ6IHNnX2lkZW50Lm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0t
bW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VY
VFJBKSAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfbWFwMjY6
IHNnX21hcDI2Lm8KKy0JbGlidG9vbCAtLW1vZGU9bGluayAkKExEKSAtbyAkQCAkKExERkxBR1Mp
ICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChM
REZMQUdTKSAkXgorIAorIHNnX3JkYWM6IHNnX3JkYWMubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRv
b2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQo
TFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ192
cGQ6IHNnX3ZwZC5vIHNnX3ZwZF92ZW5kb3IubyBsaWJzZ3V0aWxzLmxhCistCWxpYnRvb2wgLS1t
b2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorKwkkKExJQlRPT0wpICQoTFRfRVhU
UkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFHUykgJF4KKyAKKyBzZ19zYXRfaWRl
bnRpZnk6IHNnX3NhdF9pZGVudGlmeS5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9
bGluayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkg
LS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3JlYWRfYnVmZmVy
OiBzZ19yZWFkX2J1ZmZlci5vIGxpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLW1vZGU9bGluayAk
KExEKSAtbyAkQCAkKExERkxBR1MpICReCisrCSQoTElCVE9PTCkgJChMVF9FWFRSQSkgLS1tb2Rl
PWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgorIAorIHNnX3dyaXRlX2J1ZmZlcjogc2df
d3JpdGVfYnVmZmVyLm8gbGlic2d1dGlscy5sYQorLQlsaWJ0b29sIC0tbW9kZT1saW5rICQoTEQp
IC1vICRAICQoTERGTEFHUykgJF4KKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9bGlu
ayAkKExEKSAtbyAkQCAkKExERkxBR1MpICReCisgCisgc2dfcmF3OiBzZ19yYXcubyBsaWJzZ3V0
aWxzLmxhCistCWxpYnRvb2wgLS1tb2RlPWxpbmsgJChMRCkgLW8gJEAgJChMREZMQUdTKSAkXgor
KwkkKExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT1saW5rICQoTEQpIC1vICRAICQoTERGTEFH
UykgJF4KKyAKKyAKKyBpbnN0YWxsOiAkKEVYRUNTKQorIAlpbnN0YWxsIC1kICQoSU5TVERJUikK
KyAJaW5zdGFsbCAtZCAkKExJQkRJUikKKy0JbGlidG9vbCAtLW1vZGU9aW5zdGFsbCBpbnN0YWxs
IC1jIGxpYnNndXRpbHMubGEgJChMSUJESVIpL2xpYnNndXRpbHMubGEKKy0JbGlidG9vbCAtLWZp
bmlzaCAkKExJQkRJUikKKysJJChMSUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9aW5zdGFsbCBp
bnN0YWxsIC1jIGxpYnNndXRpbHMubGEgJChMSUJESVIpL2xpYnNndXRpbHMubGEKKysJJChMSUJU
T09MKSAkKExUX0VYVFJBKSAtLWZpbmlzaCAkKExJQkRJUikKKyAJZm9yIG5hbWUgaW4gJF47IFwK
Ky0JIGRvIGxpYnRvb2wgLS1tb2RlPWluc3RhbGwgaW5zdGFsbCAtbSA3NTUgXAorKwkgZG8gJChM
SUJUT09MKSAkKExUX0VYVFJBKSAtLW1vZGU9aW5zdGFsbCBpbnN0YWxsIC1tIDc1NSBcCisgCQkk
JG5hbWUgJChJTlNURElSKTsgXAorIAlkb25lCisgCWluc3RhbGwgLWQgJChNQU5ESVIpLyQoTUFO
X1BSRUYpCitAQCAtMjM1LDcgKzIzNyw3IEBACisgCWRvbmUKKyAKKyB1bmluc3RhbGw6CistCWxp
YnRvb2wgLS1tb2RlPXVuaW5zdGFsbCBybSAtZiAkKExJQkRJUikvbGlic2d1dGlscy5sYQorKwkk
KExJQlRPT0wpICQoTFRfRVhUUkEpIC0tbW9kZT11bmluc3RhbGwgcm0gLWYgJChMSUJESVIpL2xp
YnNndXRpbHMubGEKKyAJZGlzdHM9IiQoRVhFQ1MpIjsgXAorIAlmb3IgbmFtZSBpbiAkJGRpc3Rz
OyBkbyBcCisgCSBybSAtZiAkKElOU1RESVIpLyQkbmFtZTsgXApkaWZmIC0tZ2l0IGEvcGFja2Fn
ZXMvc2czLXV0aWxzL3NnMy11dGlsc18xLjI0LmJiIGIvcGFja2FnZXMvc2czLXV0aWxzL3NnMy11
dGlsc18xLjI0LmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmQ1ZjkwNzEK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlcy9zZzMtdXRpbHMvc2czLXV0aWxzXzEuMjQuYmIK
QEAgLTAsMCArMSwxNCBAQAorREVTQ1JJUFRJT04gPSAiVXRpbGl0aWVzIGZvciB3b3JraW5nIHdp
dGggZ2VuZXJpYyBTQ1NJIGRldmljZXMiCitTRUNUSU9OID0gImNvbnNvbGUvYWRtaW4iCitMSUNF
TlNFID0gIkdQTHYyIgorSE9NRVBBR0UgPSAiaHR0cDovL3BhY2thZ2VzLnFhLmRlYmlhbi5vcmcv
cy9zZzMtdXRpbHMuaHRtbCIKK0FVVEhPUiA9ICJFcmljIFNjaHdhcnR6IChTa2lmKSA8ZW1zY2h3
YXJAZGViaWFuLm9yZz4iCitQUiA9ICJyMCIKKworU1JDX1VSSSA9ICIke0RFQklBTl9NSVJST1J9
L21haW4vcy9zZzMtdXRpbHMvc2czLXV0aWxzXyR7UFZ9Lm9yaWcudGFyLmd6IFwKKwlmaWxlOi8v
TWFrZWZpbGUucGF0Y2g7cGF0Y2g9MSIKKworUyA9ICIke1dPUktESVJ9L3NnMy11dGlscy0ke1BW
fSIKKworaW5oZXJpdCBhdXRvdG9vbHMKKwotLSAKMS41LjQuMwoK

--000e0cd22c384351670461866f0e--
