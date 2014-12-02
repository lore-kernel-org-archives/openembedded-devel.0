Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFB772278
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 05:04:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44324967"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2014 13:01:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB254bmH001936
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 13:04:38 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Dec 2014 13:04:58 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 13:00:58 +0800
Message-ID: <1417496458-47021-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] [Patch V2][meta-oe]dmraid: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 05:05:06 -0000
Content-Type: text/plain

There is no update anymore since 2010, but is still supported by some
distro such as Ubuntu(trusty 14.04LTS).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../dmraid/dmraid/01_fix_broken_linking.patch      | 121 +++++++++
 .../dmraid/dmraid/02_disable_dmreg.patch           | 133 ++++++++++
 .../dmraid/03_fix_hyphen-used-as-minus-sign.patch  | 291 +++++++++++++++++++++
 .../dmraid/dmraid/04_promise-add-offsets.patch     |  13 +
 .../dmraid/dmraid/05_exit_code.patch               |  22 ++
 .../dmraid/dmraid/06_support_virtio_devices.patch  |  13 +
 .../dmraid/dmraid/07_isw-probe-hpa.patch           | 144 ++++++++++
 .../dmraid/08_activate_multiple_raid_sets.patch    |  12 +
 .../dmraid/dmraid/09_pdc_raid10_failure..patch     |  14 +
 .../dmraid/10_ddf1_lsi_persistent_name.patch       |  20 ++
 .../dmraid/11_fix_isw_sectors_calculation.patch    |  14 +
 .../dmraid/dmraid/12_jmicron_namefix.patch         |  20 ++
 .../dmraid/dmraid/13_fix_testing.patch             |  23 ++
 .../dmraid/14_pdc_dump_extended_metadata.patch     | 147 +++++++++++
 .../15_drop_p_for_partition_conditional.patch      |  31 +++
 .../dmraid/dmraid/16_change-uuid.patch             |  76 ++++++
 .../dmraid/17_convert-dmraid45-to-dmraid.patch     | 273 +++++++++++++++++++
 .../dmraid/18_ignore-too-small-devices.patch       |  39 +++
 .../dmraid/19_compile-dmraid-in-subdir-tools.patch |  20 ++
 .../20_specifies-install-dir-by-DESTDIR.patch      | 123 +++++++++
 .../recipes-extended/dmraid/dmraid_1.0.0.rc16.bb   |  55 ++++
 21 files changed, 1604 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/03_fix_hyphen-used-as-minus-sign.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/04_promise-add-offsets.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/05_exit_code.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/06_support_virtio_devices.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/07_isw-probe-hpa.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/08_activate_multiple_raid_sets.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/09_pdc_raid10_failure..patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/10_ddf1_lsi_persistent_name.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/11_fix_isw_sectors_calculation.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/12_jmicron_namefix.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/13_fix_testing.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/14_pdc_dump_extended_metadata.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/15_drop_p_for_partition_conditional.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/16_change-uuid.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/17_convert-dmraid45-to-dmraid.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/18_ignore-too-small-devices.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/19_compile-dmraid-in-subdir-tools.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid/20_specifies-install-dir-by-DESTDIR.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb

diff --git a/meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.patch b/meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.patch
new file mode 100644
index 0000000..b43ecac
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/01_fix_broken_linking.patch
@@ -0,0 +1,121 @@
+Author: Luke Yelavich <themuso@ubuntu.com>
+Description: Fix library symbolic link creation and library linking.
+--- 1.0.0.rc16.orig/configure
++++ 1.0.0.rc16/configure
+@@ -693,6 +693,7 @@ DEBUG_MALLOC
+ DMRAID_TEST
+ DMRAID_VERSION
+ DMRAID_LIB_VERSION
++DMRAID_LIB_MAJOR_VERSION
+ DIETLIBC
+ GROUP
+ JOBS
+@@ -5767,8 +5768,10 @@ fi
+ 
+ if test "-f lib/version.h"; then
+   DMRAID_LIB_VERSION="`sed --quiet 's/^.*\(DMRAID_LIB_VERSION\)[^_].*"\(.*\)"/\2/p' lib/version.h`"
++  DMRAID_LIB_MAJOR_VERSION="`grep DMRAID_LIB_MAJOR_VERSION lib/version.h | tr '\t' ' ' | cut -f 3 -d ' '`"
+ else
+   DMRAID_LIB_VERSION="Unknown"
++  DMRAID_LIB_MAJOR_VERSION="Unknown"
+ fi
+ 
+ 
+--- 1.0.0.rc16.orig/configure.in
++++ 1.0.0.rc16/configure.in
+@@ -178,7 +178,7 @@ if test x$DEBUG_MALLOC = xyes; then
+ fi
+ 
+ dnl Mess with default exec_prefix
+-if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
++if [ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ];
+  then  exec_prefix="";
+ fi;
+ 
+@@ -220,8 +220,10 @@ fi
+ 
+ if test "-f lib/version.h"; then
+   DMRAID_LIB_VERSION="`sed --quiet 's/^.*\(DMRAID_LIB_VERSION\)[[^_]].*"\(.*\)"/\2/p' lib/version.h`"
++  DMRAID_LIB_MAJOR_VERSION="`grep DMRAID_LIB_MAJOR_VERSION lib/version.h | tr '\t' ' ' | cut -f 3 -d ' '`"
+ else
+   DMRAID_LIB_VERSION="Unknown"
++  DMRAID_LIB_MAJOR_VERSION="Unknown"
+ fi
+ 
+ AC_SUBST(CC)
+@@ -232,6 +234,7 @@ AC_SUBST(DEBUG_MALLOC)
+ AC_SUBST(DMRAID_TEST)
+ AC_SUBST(DMRAID_VERSION)
+ AC_SUBST(DMRAID_LIB_VERSION)
++AC_SUBST(DMRAID_LIB_MAJOR_VERSION)
+ AC_SUBST(DIETLIBC)
+ AC_SUBST(GROUP)
+ AC_SUBST(JOBS)
+--- 1.0.0.rc16.orig/lib/Makefile.in
++++ 1.0.0.rc16/lib/Makefile.in
+@@ -65,6 +65,11 @@ ifeq ("@KLIBC@", "no")
+ 		LIB_EVENTS_SHARED=$(top_srcdir)/lib/$(LIB_EVENTS_NAME).so
+ 		TARGETS += $(LIB_SHARED) $(LIB_EVENTS_SHARED)
+ 		INSTALL_TARGETS += $(LIB_SHARED) $(LIB_EVENTS_SHARED)
++		ifeq ("@DIETLIBC@", "yes")
++			LIBDMRAIDLIBS += -ldevmapper_dietc
++		else
++			LIBDMRAIDLIBS += -ldevmapper
++		endif
+ 	endif
+ endif
+ 
+@@ -82,10 +87,11 @@ install_dmraid_libs: $(INSTALL_TARGETS)
+ 	for f in $(INSTALL_TARGETS); \
+ 	do \
+ 		n=$$(basename $${f}) ; \
+-		if [[ "$$n" =~ '.so$$' ]]; then \
++		if echo "$$n" | grep -q '.so$$'; then \
+ 			$(INSTALL) -m 555 $(STRIP) \
+ 				$$f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
+-			$(LN_S) -f $${n}.@DMRAID_LIB_VERSION@ $(libdir)/$${n}; \
++			mkdir -p $(prefix)/lib; \
++			cd $(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VERSION@ $${n}; \
+ 		else \
+ 			$(INSTALL) -m 555 $(STRIP) $$f $(libdir)/$${n}; \
+ 		fi \
+--- 1.0.0.rc16.orig/make.tmpl.in
++++ 1.0.0.rc16/make.tmpl.in
+@@ -44,6 +44,7 @@ endif
+ OWNER = @OWNER@
+ GROUP = @GROUP@
+ DMRAID_LIB_VERSION = @DMRAID_LIB_VERSION@
++DMRAID_LIB_MAJOR_VERSION = @DMRAID_LIB_MAJOR_VERSION@
+ 
+ # The number of jobs to run, if blank, defaults to the make standard
+ ifndef MAKEFLAGS
+@@ -136,7 +137,7 @@ $(TARGETS): $(OBJECTS)
+ 
+ %.so: $(OBJECTS)
+ 	$(CC) -shared -Wl,-soname,$(notdir $@).$(DMRAID_LIB_VERSION) \
+-	-Wl,--version-script,.export.sym $(OBJECTS) -o $@ -ldevmapper-event
++	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@ -ldevmapper-event
+ 
+ $(LIB_STATIC): $(OBJECTS)
+ 	$(RM) $@
+--- 1.0.0.rc16.orig/tools/Makefile.in
++++ 1.0.0.rc16/tools/Makefile.in
+@@ -34,12 +34,16 @@ ifeq ("@KLIBC@", "yes")
+ 	DMRAIDLIBS += -ldevmapper_klibc
+ else
+ 	ifeq ("@DIETLIBC@", "yes")
+-		DMRAIDLIBS += -ldevmapper_dietc
++		ifeq ("@LIB_SO@", "no")
++			DMRAIDLIBS += -ldevmapper_dietc
++		endif
+ 		ifeq ("@STATIC_LINK@", "no")
+ 			DMEVENTTOOLLIBS = -ldevmapper-event_dietc
+ 		endif
+ 	else
+-		DMRAIDLIBS += -ldevmapper
++		ifeq ("@LIB_SO@", "no")
++			DMRAIDLIBS += -ldevmapper
++		endif
+ 		ifeq ("@STATIC_LINK@", "no")
+ 			DMEVENTTOOLLIBS = -ldevmapper-event
+ 		endif
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.patch b/meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.patch
new file mode 100644
index 0000000..69ac90f
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/02_disable_dmreg.patch
@@ -0,0 +1,133 @@
+Disabled all dmreg stuff
+--- 1.0.0.rc16.orig/lib/Makefile.in
++++ 1.0.0.rc16/lib/Makefile.in
+@@ -45,10 +45,6 @@ SOURCES=\
+ 	format/ddf/ddf1_dump.c \
+ 	format/partition/dos.c
+ 
+-ifeq ("@STATIC_LINK@", "no")
+-	SOURCES += register/dmreg.c
+-endif
+-
+ OBJECTS=$(SOURCES:%.c=%.o)
+ 
+ LIB_STATIC=$(top_srcdir)/lib/libdmraid.a
+@@ -63,8 +59,8 @@ ifeq ("@KLIBC@", "no")
+ 	ifeq ("@STATIC_LINK@", "no")
+ 		LIB_SHARED=$(top_srcdir)/lib/libdmraid.so
+ 		LIB_EVENTS_SHARED=$(top_srcdir)/lib/$(LIB_EVENTS_NAME).so
+-		TARGETS += $(LIB_SHARED) $(LIB_EVENTS_SHARED)
+-		INSTALL_TARGETS += $(LIB_SHARED) $(LIB_EVENTS_SHARED)
++		TARGETS += $(LIB_SHARED)
++		INSTALL_TARGETS += $(LIB_SHARED)
+ 		ifeq ("@DIETLIBC@", "yes")
+ 			LIBDMRAIDLIBS += -ldevmapper_dietc
+ 		else
+--- 1.0.0.rc16.orig/make.tmpl.in
++++ 1.0.0.rc16/make.tmpl.in
+@@ -137,7 +137,7 @@ $(TARGETS): $(OBJECTS)
+ 
+ %.so: $(OBJECTS)
+ 	$(CC) -shared -Wl,-soname,$(notdir $@).$(DMRAID_LIB_VERSION) \
+-	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@ -ldevmapper-event
++	-Wl,--version-script,.export.sym $(OBJECTS) $(LIBDMRAIDLIBS) -o $@
+ 
+ $(LIB_STATIC): $(OBJECTS)
+ 	$(RM) $@
+--- 1.0.0.rc16.orig/tools/Makefile.in
++++ 1.0.0.rc16/tools/Makefile.in
+@@ -22,12 +22,6 @@ TARGETS=\
+ 
+ include $(top_srcdir)/make.tmpl
+ 
+-ifeq ("@KLIBC@", "no")
+-	ifeq ("@STATIC_LINK@", "no")
+-		TARGETS += dmevent_tool
+-	endif
+-endif
+-
+ DMRAIDLIBS=-ldmraid
+ 
+ ifeq ("@KLIBC@", "yes")
+@@ -37,16 +31,10 @@ else
+ 		ifeq ("@LIB_SO@", "no")
+ 			DMRAIDLIBS += -ldevmapper_dietc
+ 		endif
+-		ifeq ("@STATIC_LINK@", "no")
+-			DMEVENTTOOLLIBS = -ldevmapper-event_dietc
+-		endif
+ 	else
+ 		ifeq ("@LIB_SO@", "no")
+ 			DMRAIDLIBS += -ldevmapper
+ 		endif
+-		ifeq ("@STATIC_LINK@", "no")
+-			DMEVENTTOOLLIBS = -ldevmapper-event
+-		endif
+ 	endif
+ 
+ 	ifeq ("@LIBSELINUX@", "yes")
+--- 1.0.0.rc16.orig/lib/.export.sym
++++ 1.0.0.rc16/lib/.export.sym
+@@ -52,8 +52,6 @@ Base {

+ 		dso_end_rebuild;

+ 		hot_spare_add;

+ 		dso_get_members;

+-		dm_register_device;

+-		dm_unregister_device;
+ 		dm_all_monitored;
+ 	local:

+ 		*;

+--- 1.0.0.rc16.orig/lib/activate/activate.c
++++ 1.0.0.rc16/lib/activate/activate.c
+@@ -849,18 +849,12 @@ enum dm_what { DM_ACTIVATE, DM_REGISTER 
+ static int
+ dm_register_for_event(char *dev_name, char *lib_name)
+ {
+-#ifdef	DMRAID_AUTOREGISTER
+-	dm_register_device(dev_name, lib_name);
+-#endif
+ 	return 1;
+ }
+ 
+ static int
+ dm_unregister_for_event(char *dev_name, char *lib_name)
+ {
+-#ifdef	DMRAID_AUTOREGISTER
+-	dm_unregister_device(dev_name, lib_name);
+-#endif
+ 	return 1;
+ }
+ 
+@@ -874,6 +868,8 @@ do_device(struct lib_context *lc, struct
+ 	if (OPT_TEST(lc))
+ 		return 1;
+ 
++	return 1;
++
+         struct dmraid_format *fmt = get_format(rs);
+ 
+         if (fmt->name != NULL) {
+--- 1.0.0.rc16.orig/lib/metadata/reconfig.c
++++ 1.0.0.rc16/lib/metadata/reconfig.c
+@@ -242,20 +242,16 @@ add_dev_to_raid(struct lib_context *lc, 
+ 		 * metadata on disks to OK state.
+ 		 */
+ 		/* Create lib-events library name */
+-		if (fmt->name) {
++		/*if (fmt->name) {
+ 			strncpy(lib_name, "libdmraid-events-", LIB_NAME_LENGTH);
+ 			strncat(lib_name, fmt->name,
+ 				LIB_NAME_LENGTH-strlen(fmt->name)-3);
+ 			strncat(lib_name, ".so", 3);
+ 		} else
+ 			goto err;
+-
+-		/* Check registration */
+-		if (!dm_monitored_events(&pending, sub_rs->name, lib_name)) {
+-			/* If NOT registered update metadata to OK state. */
++*/
+ 			if (check_rd->fmt->metadata_handler)
+ 				check_rd->fmt->metadata_handler(lc, UPDATE_REBUILD_STATE, NULL, (void *) rs);
+-		}
+ 	}
+ #endif
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/03_fix_hyphen-used-as-minus-sign.patch b/meta-oe/recipes-extended/dmraid/dmraid/03_fix_hyphen-used-as-minus-sign.patch
new file mode 100644
index 0000000..8c8c0de
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/03_fix_hyphen-used-as-minus-sign.patch
@@ -0,0 +1,291 @@
+Author: Giuseppe Iuculano <giuseppe@iuculano.it>
+Description: Fix hyphen-used-as-minus-sign
+--- 1.0.0.rc16.orig/man/dmraid.8
++++ 1.0.0.rc16/man/dmraid.8
+@@ -4,20 +4,20 @@ dmraid \- discover, configure and activa
+ .SH SYNOPSIS
+ .B dmraid
+  {-a|--activate} {y|n|yes|no} 
+- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
+- [-f|--format FORMAT[,FORMAT...]]
++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
++ [\-f|--format FORMAT[,FORMAT...]]
+  [{-P|--partchar} CHAR]
+- [-p|--no_partitions]
+- [-Z|--rm_partitions]
++ [\-p|--no_partitions]
++ [\-Z|--rm_partitions]
+  [--separator SEPARATOR]
+- [-t|--test]
++ [\-t|--test]
+  [RAID-set...]
+ 
+ .B dmraid
+  {-b|--block_devices}
+- [-c|--display_columns][FIELD[,FIELD...]]...
+- [-d|--debug]... [-v|--verbose]...
+- [--separator SEPARATOR]
++ [\-c|--display_columns][FIELD[,FIELD...]]...
++ [\-d|--debug]... [\-v|--verbose]...
++ [\--separator SEPARATOR]
+  [device-path...]
+ 
+ .B dmraid
+@@ -25,60 +25,60 @@ dmraid \- discover, configure and activa
+ 
+ .B dmraid
+  {-l|--list_formats}
+- [-d|--debug]... [-v|--verbose]...
++ [\-d|--debug]... [\-v|--verbose]...
+ 
+ .B dmraid
+  {-n|--native_log}
+- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
+- [-f|--format FORMAT[,FORMAT...]]
+- [--separator SEPARATOR]
++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
++ [\-f|--format FORMAT[,FORMAT...]]
++ [\--separator SEPARATOR]
+  [device-path...]
+ 
+ .B dmraid
+- {-R| --rebuild}
++ {-R| \--rebuild}
+  RAID-set
+  [device-path]
+ 
+ .B dmraid
+- {-x| --remove}
++ {-x| \--remove}
+  [RAID-set]
+ 
+ .B dmraid
+- -f FORMAT-handler
+-{-C| --create} set 
+- --type raidlevel
+- [--size=setsize --strip stridesize] 
+- --disk "device-path, device-path [, device-path ...]"
++ \-f FORMAT-handler
++{-C| \--create} set 
++ \--type raidlevel
++ [\--size=setsize \--strip stridesize] 
++ \--disk "device-path, device-path [, device-path ...]"
+ 
+ .B dmraid
+-[ -f|--format FORMAT-handler]
+--S|--spare [RAID-set]
+--M|--media  "device-path"
++[ \-f|--format FORMAT-handler]
++\-S|--spare [RAID-set]
++\-M|--media  "device-path"
+ 
+ .B dmraid
+  {-r|--raid_devices}
+- [-c|--display_columns][FIELD[,FIELD...]]...
+- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
+- [-D|--dump_metadata]
+- [-f|--format FORMAT[,FORMAT...]]
+- [--separator SEPARATOR]
++ [\-c|--display_columns][FIELD[,FIELD...]]...
++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
++ [\-D|--dump_metadata]
++ [\-f|--format FORMAT[,FORMAT...]]
++ [\--separator SEPARATOR]
+  [device-path...]
+ 
+ .B dmraid
+  {-r|--raid_devices}
+- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
+- [-E|--erase_metadata]
+- [-f|--format FORMAT[,FORMAT...]]
+- [--separator SEPARATOR]
++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
++ [\-E|--erase_metadata]
++ [\-f|--format FORMAT[,FORMAT...]]
++ [\--separator SEPARATOR]
+  [device-path...]
+ 
+ .B dmraid
+  {-s|--sets}...[a|i|active|inactive]
+- [-c|--display_columns][FIELD[,FIELD...]]...
+- [-d|--debug]... [-v|--verbose]... [-i|--ignorelocking]
+- [-f|--format FORMAT[,FORMAT...]]
+- [-g|--display_group]
+- [--separator SEPARATOR]
++ [\-c|--display_columns][FIELD[,FIELD...]]...
++ [\-d|--debug]... [\-v|--verbose]... [\-i|--ignorelocking]
++ [\-f|--format FORMAT[,FORMAT...]]
++ [\-g|--display_group]
++ [\--separator SEPARATOR]
+  [RAID-set...]
+ 
+ .B dmraid
+@@ -117,7 +117,7 @@ will make dmraid tell the kernel to remo
+ underlying the set, ie if sda is part of the set, remove sda1, sda2, etc.
+ This prevents applications from directly accessiong the disks bypassing dmraid.
+ RAID set names given on command line don't need to be fully specified
+-(eg, "dmraid -ay sil" would activate all discovered Silicon Image Medley
++(eg, "dmraid \-ay sil" would activate all discovered Silicon Image Medley
+ RAID sets).
+ 
+ .TP
+@@ -134,7 +134,7 @@ See description of
+ below for FIELD identifiers.
+ 
+ .TP
+-.I [-d|--debug]...
++.I [\-d|--debug]...
+ Enable debugging output. Opion can be given multiple times
+ increasing the debug output level.
+ 
+@@ -214,18 +214,18 @@ is added to the system.
+     During system reboot, enter OROM and mark the new drive as the rebuild drive.  
+     After booting to the OS, use the dmraid command to rebuild.
+ 
+-    Example: dmraid -R raid_set 
++    Example: dmraid \-R raid_set 
+ 
+ 2. Using dmraid to identify a new drive
+     Boot to the OS and use the dmraid command with the new drive as
+ the second parameter.
+ 
+-    Example: dmraid -R raid_set /dev/sdc
++    Example: dmraid \-R raid_set /dev/sdc
+ 
+ 3. Using hot spare drive
+-    Mark a drive as hot spare using the "dmraid -f isw -S" command. Then use the dmraid command to start the rebuild.
++    Mark a drive as hot spare using the "dmraid \-f isw \-S" command. Then use the dmraid command to start the rebuild.
+ 
+-    Example: dmraid -R raid_set
++    Example: dmraid \-R raid_set
+ 
+ .TP
+ .I {-x|--remove} [RAID-set]
+@@ -235,11 +235,11 @@ Delete one or all existing software RAID
+ .I -f FORMAT-handler {-C|--create} --type raidlevel [--size=setsize --strip stripsize] --disk "device-path, device-path [,device-path]"
+ Delete one or all existing Configure a software RAID device  and store the configuration data in a group of hard drive devices consisting of this array. This command requires the following options:
+ 
+--f FORMAT-handler
++\-f FORMAT-handler
+ .br
+-	metadata format (see "dmraid -l")
++	metadata format (see "dmraid \-l")
+ .br		
+---type digit[digit...]
++\--type digit[digit...]
+ .br
+ 	specify the raid level of the software RAID set. 
+ .br
+@@ -251,7 +251,7 @@ Delete one or all existing Configure a s
+ .br
+ 		01: raid01 (isw raid10)
+ .br
+---size: [digits[k|K|m|M|g|G][b|B]]
++\--size: [digits[k|K|m|M|g|G][b|B]]
+ .br
+ 	specify the size of the RAID set.The number is an integer followed by [kKmMgG] and/or [bB].
+ .br
+@@ -267,11 +267,11 @@ Delete one or all existing Configure a s
+ .br
+ If this option is missing, it's set to the default value pre-configured by the vendor. Note that different vendors may apply different constraints on the granularity of the size or the minimal value.
+ .br
+---strip: [digits[k|K|m|M|g|G][b|B]]
++\--strip: [digits[k|K|m|M|g|G][b|B]]
+ .br
+ 	specify the strip size of a RAID1, RAID5, and RAID10 RAID set (as above)
+ .br
+---disk: device-path[{,| }device-path...]
++\--disk: device-path[{,| }device-path...]
+ .br
+ 	specify the array of the hard drives, e.g. /dev/sda.
+ 
+@@ -349,7 +349,7 @@ Use SEPARATOR as a delimiter for all opt
+ .TP
+ .I -s... [a|i] [RAID-set...]
+ Display properties of RAID sets. Multiple RAID set names can be given
+-on the command line which don't need to be fully specified (eg, "dmraid -s hpt"
++on the command line which don't need to be fully specified (eg, "dmraid \-s hpt"
+ would display all discovered Highpoint RAID sets). Enter
+ .B -s
+ twice to display RAID subsets too.
+@@ -377,7 +377,7 @@ Enable verbose runtime information outpu
+ increasing the verbosity level.
+ 
+ .SH EXAMPLES
+-"dmraid -l" lists all supported metadata formats with their names along with
++"dmraid \-l" lists all supported metadata formats with their names along with
+ some descriptive information, eg:
+ .br
+ hpt37x : (+) Highpoint HPT37X
+@@ -400,16 +400,16 @@ dos    : (+) DOS partitions on SW RAIDs
+ .br
+ (0): Discover, (+): Discover+Activate
+ 
+-"dmraid -ay" activates all software RAID sets discovered.
++"dmraid \-ay" activates all software RAID sets discovered.
+ 
+-"dmraid -an" deactivates all active software RAID sets which are not open
++"dmraid \-an" deactivates all active software RAID sets which are not open
+ (eg, mounted filesystem on them).
+ 
+-"dmraid -ay -f pdc" (pdc looked up from "dmraid -l") activates all
++"dmraid \-ay \-f pdc" (pdc looked up from "dmraid \-l") activates all
+ software RAID sets with Promise format discovered and ignores all other
+ supported formats.
+ 
+-"dmraid -r" discovers all software RAID devices supported on your system, eg:
++"dmraid \-r" discovers all software RAID devices supported on your system, eg:
+ .br
+ /dev/dm-46: hpt45x, "hpt45x_chidjhaiaa-0", striped, ok, 320172928 sectors, data@ 0
+ .br
+@@ -420,7 +420,7 @@ supported formats.
+ /dev/dm-58: hpt45x, "hpt45x_chidjhaiaa-1", striped, ok, 320172928 sectors, data@ 0
+ 
+ 
+-"dmraid -s -s hpt45x_chidjhaiaa" displays properties of
++"dmraid \-s \-s hpt45x_chidjhaiaa" displays properties of
+ set "hpt45x_chidjhaiaa", eg:
+ .br
+ *** Superset
+@@ -478,7 +478,7 @@ dev    : 2
+ spare  : 0
+ .br
+ 
+-"dmraid -s -ccs hpt45" displays properties in column format of all sets
++"dmraid \-s \-ccs hpt45" displays properties in column format of all sets
+ and subsets with hpt45* format, eg:
+ .br
+ hpt45x_chidjhaiaa,640345856,128,raid10,ok,4,0
+@@ -487,7 +487,7 @@ hpt45x_chidjhaiaa-a,640345856,128,stripe
+ .br
+ hpt45x_chidjhaiaa-b,640345856,128,stripe,ok,2,0
+ 
+-"dmraid -r --sep : -cpath:size" display paths and sizes in sectors for
++"dmraid \-r \--sep : \-cpath:size" display paths and sizes in sectors for
+ RAID devices in column format using ':' as a delimiter, eg:
+ .br
+ /dev/dm-8:320173055
+@@ -518,18 +518,18 @@ RAID devices in column format using ':' 
+ .br
+ /dev/dm-66:390624896
+ 
+-"dmraid -f isw -C Raid0 --type 0 --strip 8k --size 20g --disk "/dev/sdb /dev/sdc"" creates an ISW volume with
++"dmraid \-f isw \-C Raid0 \--type 0 \--strip 8k \--size 20g \--disk "/dev/sdb /dev/sdc"" creates an ISW volume with
+ a name of "Raid0", 20Gig bytes in total, and 8kilo bytes strip size on two disks.
+ 
+-"dmraid -f isw -C Test0 --type 0 --disk "/dev/sdd /dev/sde"" creates an ISW volume with the default size and strip size.
++"dmraid \-f isw \-C Test0 \--type 0 \--disk "/dev/sdd /dev/sde"" creates an ISW volume with the default size and strip size.
+ 
+-"dmraid -f isw -C Test10 --type 01 --strip 128B --disk "/dev/sda /dev/sdb /dev/sdc /dev/sdd" creates a stacked
++"dmraid \-f isw \-C Test10 \--type 01 \--strip 128B \--disk "/dev/sda /dev/sdb /dev/sdc /dev/sdd" creates a stacked
+ RAID device, RAID10 (isw format), with a name of "Test10", 128 blocks (512bytes) strip size , and the default volume size on
+ 4 disks.
+ 
+-"dmraid -f isw -S -M /dev/sde" marks the device /dev/sde as a hot spare for rebuild
++"dmraid \-f isw \-S \-M /dev/sde" marks the device /dev/sde as a hot spare for rebuild
+ 
+-"dmraid -R isw_djaggchdde_RAID1 /dev/sde" starts rebuild of the RAID volume on device /dev/sde
++"dmraid \-R isw_djaggchdde_RAID1 /dev/sde" starts rebuild of the RAID volume on device /dev/sde
+ 
+ .SH DIAGNOSTICS
+ dmraid returns an exit code of 0 for success or 1 for error.
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/04_promise-add-offsets.patch b/meta-oe/recipes-extended/dmraid/dmraid/04_promise-add-offsets.patch
new file mode 100644
index 0000000..1f07da5
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/04_promise-add-offsets.patch
@@ -0,0 +1,13 @@
+Author: Luke Yelavich <themuso@ubuntu.com>
+Description: Add extra offsets where promise metadata can be found.
+--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.h
++++ 1.0.0.rc16/lib/format/ataraid/pdc.h
+@@ -13,7 +13,7 @@
+ 
+ #include <stdint.h>
+ 
+-#define PDC_CONFIGOFFSETS	63,255,256,16,399,591,675,735,974,991
++#define PDC_CONFIGOFFSETS	63,255,256,16,399,591,675,735,974,991,911,951
+ #define	PDC_DATAOFFSET 0
+ 
+ /*
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/05_exit_code.patch b/meta-oe/recipes-extended/dmraid/dmraid/05_exit_code.patch
new file mode 100644
index 0000000..5c0b036
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/05_exit_code.patch
@@ -0,0 +1,22 @@
+Author: Giuseppe Iuculano <giuseppe@iuculano.it>
+Description: Fix exit-code for "No RAID disks" and "no block devices found" errors (LP: #300825)
+--- 1.0.0.rc16.orig/lib/metadata/metadata.c
++++ 1.0.0.rc16/lib/metadata/metadata.c
+@@ -2096,7 +2096,7 @@ get_metadata(struct lib_context *lc, enu
+ 
+ 	if (!count_devices(lc, DEVICE)) {
+ 		log_print(lc, "no block devices found");
+-		return 1;
++		return 0;
+ 	}
+ 
+ 	if (!(M_RAID & p->metadata))
+@@ -2118,7 +2118,7 @@ get_metadata(struct lib_context *lc, enu
+ 	if (!OPT_HOT_SPARE_SET(lc) && !OPT_CREATE(lc)
+ 	    && !count_devices(lc, RAID)) {
+ 		format_error(lc, "disks", argv);
+-		return 1;
++		return 0;
+ 	}
+ 
+ 	if (M_SET & p->metadata) {
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/06_support_virtio_devices.patch b/meta-oe/recipes-extended/dmraid/dmraid/06_support_virtio_devices.patch
new file mode 100644
index 0000000..2863219
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/06_support_virtio_devices.patch
@@ -0,0 +1,13 @@
+Author: Luke Yelavich <themuso@ubuntu.com>
+Description: Support for checking virtio devices for dmraid metadata.
+--- 1.0.0.rc16.orig/lib/device/scan.c
++++ 1.0.0.rc16/lib/device/scan.c
+@@ -174,7 +174,7 @@ interested(struct lib_context *lc, char 
+ 	 * Whole IDE and SCSI disks only.
+ 	 */
+ 	return (!isdigit(name[strlen(name) - 1]) &&
+-		(*(name + 1) == 'd' && (*name == 'h' || *name == 's')))
++		(*(name + 1) == 'd' && (*name == 'h' || *name == 's' || *name == 'v')))
+ #ifdef	DMRAID_TEST
+ 		/*
+ 		 * Include dm devices for testing.
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/07_isw-probe-hpa.patch b/meta-oe/recipes-extended/dmraid/dmraid/07_isw-probe-hpa.patch
new file mode 100644
index 0000000..289604f
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/07_isw-probe-hpa.patch
@@ -0,0 +1,144 @@
+Probe isw disks with [some] HPA awareness, thanks to Robert Collins <robert@ubuntu.com>. (LP: #372170)
+--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
++++ 1.0.0.rc16/lib/format/ataraid/isw.c
+@@ -353,6 +353,7 @@ raiddev(struct isw *isw, unsigned i)
+ enum convert { FULL, FIRST, LAST };
+ #if	BYTE_ORDER == LITTLE_ENDIAN
+ #  define	to_cpu(x, y)
++#  define       CVT16(x)
+ #else
+ /*
+  * We can differ from the read_raid_dev template here,
+@@ -547,15 +548,16 @@ disk_ok(struct lib_context *lc, struct d
+ }
+ 
+ static void *
+-isw_read_metadata(struct lib_context *lc, struct dev_info *di,
+-		  size_t * sz, uint64_t * offset, union read_info *info)
++isw_try_sboffset(struct lib_context *lc, struct dev_info *di,
++		 size_t * sz, uint64_t * offset, union read_info *info,
++		 uint64_t const isw_sboffset)
+ {
+ 	size_t size = ISW_DISK_BLOCK_SIZE;
+-	uint64_t isw_sboffset = ISW_CONFIGOFFSET(di);
+ 	struct isw *isw;
++	uint64_t temp_isw_sboffset = isw_sboffset;
+ 
+ 	if (!(isw = alloc_private_and_read(lc, handler, size,
+-					   di->path, isw_sboffset)))
++					   di->path, temp_isw_sboffset)))
+ 		goto out;
+ 
+ 	/*
+@@ -565,9 +567,15 @@ isw_read_metadata(struct lib_context *lc
+ 	to_cpu(isw, FIRST);
+ 
+ 	/* Check Signature and read optional extended metadata. */
+-	if (!is_isw(lc, di, isw) ||
+-	    !isw_read_extended(lc, di, &isw, &isw_sboffset, &size))
++	if (!is_isw(lc, di, isw)) {
++		log_dbg(lc, "not isw at %ld", isw_sboffset);
+ 		goto bad;
++	}
++	if (!isw_read_extended(lc, di, &isw, &temp_isw_sboffset, &size)) {
++		log_err(lc, "isw metadata, but extended read failed at %ld",
++			isw_sboffset);
++		goto bad;
++	}
+ 
+ 	/*
+ 	 * Now that we made sure, that we've got all the
+@@ -578,6 +586,8 @@ isw_read_metadata(struct lib_context *lc
+ 	if (disk_ok(lc, di, isw)) {
+ 		*sz = size;
+ 		*offset = info->u64 = isw_sboffset;
++		log_dbg(lc, "isw metadata found at %ld from probe at %ld\n",
++			*offset, isw_sboffset);
+ 		goto out;
+ 	}
+ 
+@@ -589,6 +599,54 @@ out:
+ 	return (void *) isw;
+ }
+ 
++/* HPA on a disk shifts everything down. This is a 'works-enough' approach to
++ * handling that. There is a better long term approach requiring kernel
++ * patches - see the lkml patches for alt_size.
++ */
++static void *
++isw_try_hpa(struct lib_context *lc, struct dev_info *di,
++	   size_t * sz, uint64_t * offset, union read_info *info)
++{
++	struct isw10 *isw10;
++	void *result = NULL;
++	uint64_t actual_offset;
++	if (!(isw10 = alloc_private_and_read(lc, handler, ISW_DISK_BLOCK_SIZE,
++		di->path, ISW_10_CONFIGOFFSET(di))))
++		goto out;
++	if (strncmp((const char *)isw10->sig, ISW10_SIGNATURE, ISW10_SIGNATURE_SIZE))
++		goto out_free;
++	log_dbg(lc, "Found isw 10 gafr signature.");
++	CVT16(isw10->offset);
++	actual_offset = isw10->offset + 2;
++	log_dbg(lc, "isw 10 sector offset calculated at %hd.", actual_offset);
++	if (actual_offset > di->sectors)
++		goto out_free;
++	result = isw_try_sboffset(lc, di, sz, offset, info,
++		ISW_SECTOR_TO_OFFSET(di->sectors - actual_offset));
++      out_free:
++	dbg_free(isw10);
++      out:
++	return result;
++}
++
++
++static void *
++isw_read_metadata(struct lib_context *lc, struct dev_info *di,
++		  size_t * sz, uint64_t * offset, union read_info *info)
++{
++	void *result;
++	if ((result = isw_try_sboffset(
++		lc, di, sz, offset, info, ISW_CONFIGOFFSET(di))))
++		return result;
++	if ((result = isw_try_hpa(lc, di, sz, offset, info)))
++		return result;
++        log_dbg(lc, "isw trying hard coded -2115 offset.");
++	if ((result = isw_try_sboffset(
++		lc, di, sz, offset, info, (di->sectors - 2115)*512)))
++		return result;
++	return NULL;
++}
++
+ static int setup_rd(struct lib_context *lc, struct raid_dev *rd,
+ 		    struct dev_info *di, void *meta, union read_info *info);
+ static struct raid_dev *
+--- 1.0.0.rc16.orig/lib/format/ataraid/isw.h
++++ 1.0.0.rc16/lib/format/ataraid/isw.h
+@@ -36,8 +36,11 @@
+ 
+ /* Intel metadata offset in bytes */
+ #define	ISW_CONFIGSECTOR(di)	((di)->sectors - 2)
+-#define	ISW_CONFIGOFFSET(di)	(ISW_CONFIGSECTOR(di) << 9)
++#define ISW_SECTOR_TO_OFFSET(sector) ((sector) << 9)
++#define	ISW_CONFIGOFFSET(di)	(ISW_SECTOR_TO_OFFSET(ISW_CONFIGSECTOR(di)))
+ #define	ISW_DATAOFFSET		0	/* Data offset in sectors */
++#define ISW_10_CONFIGSECTOR(di) ((di)->sectors - 1)
++#define ISW_10_CONFIGOFFSET(di) (ISW_SECTOR_TO_OFFSET(ISW_10_CONFIGSECTOR(di)))
+ 
+ #define MPB_SIGNATURE	     "Intel Raid ISM Cfg Sig. "
+ #define MPB_SIGNATURE_SIZE	(sizeof(MPB_SIGNATURE) - 1)
+@@ -222,6 +225,14 @@ struct isw {
+ 	// here comes isw_dev[num_raid_devs]
+ } __attribute__ ((packed));
+ 
++#define ISW10_SIGNATURE "$GAFR\x10"
++#define ISW10_SIGNATURE_SIZE (sizeof(ISW10_SIGNATURE) - 1)
++struct isw10 {
++	int8_t sig[ISW10_SIGNATURE_SIZE];
++	uint32_t offset; /* offset to real data, in sectors back */
++} __attribute__ ((packed));
++
++
+ #endif
+ 
+ int register_isw(struct lib_context *lc);
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/08_activate_multiple_raid_sets.patch b/meta-oe/recipes-extended/dmraid/dmraid/08_activate_multiple_raid_sets.patch
new file mode 100644
index 0000000..807ceac
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/08_activate_multiple_raid_sets.patch
@@ -0,0 +1,12 @@
+Continue onto all raid sets instead of returning after processing the first. (LP: #401713)
+--- 1.0.0.rc16.orig/lib/metadata/metadata.c
++++ 1.0.0.rc16/lib/metadata/metadata.c
+@@ -839,7 +839,7 @@ _discover_partitions(struct lib_context 
+ 		 */
+ 		if (T_GROUP(rs)) {
+ 			_discover_partitions(lc, &rs->sets);
+-			return;
++			continue;
+ 		}
+ 
+ 		/*
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/09_pdc_raid10_failure..patch b/meta-oe/recipes-extended/dmraid/dmraid/09_pdc_raid10_failure..patch
new file mode 100644
index 0000000..62b2f36
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/09_pdc_raid10_failure..patch
@@ -0,0 +1,14 @@
+fix pdc metadata format handler to report the proper number of devices in a subset
+--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.c
++++ 1.0.0.rc16/lib/format/ataraid/pdc.c
+@@ -490,7 +490,9 @@ devices(struct raid_dev *rd, void *conte
+ 	if (context && pdc->raid.type != PDC_T_SPAN)
+ 		*((uint64_t *) context) += rd->sectors;
+ 
+-	return pdc->raid.total_disks;
++	return is_raid10(pdc) ? 
++		pdc->raid.total_disks / 2 :
++		pdc->raid.total_disks;
+ }
+ 
+ static int
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/10_ddf1_lsi_persistent_name.patch b/meta-oe/recipes-extended/dmraid/dmraid/10_ddf1_lsi_persistent_name.patch
new file mode 100644
index 0000000..6e085e7
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/10_ddf1_lsi_persistent_name.patch
@@ -0,0 +1,20 @@
+Using a dummy string for the timestamp in the LSI metadata
+--- 1.0.0.rc16.orig/lib/format/ddf/ddf1.c
++++ 1.0.0.rc16/lib/format/ddf/ddf1.c
+@@ -696,6 +696,16 @@ name(struct lib_context *lc, struct ddf1
+ 			sprintf(b, "%02x%02x%02x%02x",
+ 				vd->guid[i], vd->guid[i + 1],
+ 				vd->guid[i + 2], vd->guid[i + 3]);
++
++		/*
++		 * Because the LSI bios changes the timestamp in the
++		 * metadata on every boot, we have to neutralize it
++		 * in order to allow for persistent names.
++		 *
++		 * Using a dummy string "47114711" for that.
++		 */
++		if (!strncmp((char *) vd->guid, "LSI", 3))
++			strncpy(buf + prefix + 32, "47114711", 8);
+ 	}
+ 
+ out:
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/11_fix_isw_sectors_calculation.patch b/meta-oe/recipes-extended/dmraid/dmraid/11_fix_isw_sectors_calculation.patch
new file mode 100644
index 0000000..8087904
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/11_fix_isw_sectors_calculation.patch
@@ -0,0 +1,14 @@
+Fix isw raid0 incorrect  sectors calculation, thanks to Valentin Pavlyuchenko
+--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
++++ 1.0.0.rc16/lib/format/ataraid/isw.c
+@@ -776,7 +776,9 @@ _create_rd(struct lib_context *lc,
+ 	r->di = rd->di;
+ 	r->fmt = rd->fmt;
+ 	r->offset = dev->vol.map[0].pba_of_lba0;
+-	if ((r->sectors = dev->vol.map[0].blocks_per_member - RAID_DS_JOURNAL))
++	//fix bugs on ICH10R
++	//if ((r->sectors = dev->vol.map[0].blocks_per_member - RAID_DS_JOURNAL))
++	if ((r->sectors = dev->vol.map[0].blocks_per_member))
+ 		goto out;
+ 
+ 	log_zero_sectors(lc, rd->di->path, handler);
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/12_jmicron_namefix.patch b/meta-oe/recipes-extended/dmraid/dmraid/12_jmicron_namefix.patch
new file mode 100644
index 0000000..a0ed1eb
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/12_jmicron_namefix.patch
@@ -0,0 +1,20 @@
+From: Phillip Susi <psusi@cfl.rr.com>
+Author: Danny Wood <danwood76@gmail.com>
+Subject: Fix jmicron names again
+Bug-Ubuntu: http://launchpad.net/bugs/576289
+Last-Update: 2011-03-08
+Description: Uninitialized variable prevented code from working
+ as intended.
+Index: 1.0.0.rc16/lib/format/ataraid/jm.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/ataraid/jm.c
++++ 1.0.0.rc16/lib/format/ataraid/jm.c
+@@ -25,7 +25,7 @@
+ static char *
+ name(struct lib_context *lc, struct raid_dev *rd, unsigned int subset)
+ {
+-	size_t i, len;
++	size_t i = JM_NAME_LEN - 1, len;
+ 	struct jm *jm = META(rd, jm);
+ 	char *ret, *name = (char *) jm->name;
+ 	char buf[JM_NAME_LEN + 1] = { '\0' };
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/13_fix_testing.patch b/meta-oe/recipes-extended/dmraid/dmraid/13_fix_testing.patch
new file mode 100644
index 0000000..a82d935
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/13_fix_testing.patch
@@ -0,0 +1,23 @@
+From: Phillip Susi <psusi@cfl.rr.com>
+Last-Update: 2011-03-08
+Forwarded: yes
+Description: Testing with dm devices was failing on Ubuntu because
+ /dev/dm-X is the actual device node, but the code wanted it to be
+ a symlink.  Fixed dm_test_device() to test that the file ( or node
+ it points to ) is a block device, which seems a much more
+ appropriate test.
+
+Index: 1.0.0.rc16/lib/device/scan.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/device/scan.c
++++ 1.0.0.rc16/lib/device/scan.c
+@@ -86,8 +86,8 @@
+ {
+ 	struct stat s;
+ 
+-	return !lstat(path, &s) &&
+-		S_ISLNK(s.st_mode) &&
++	return !stat(path, &s) &&
++		S_ISBLK(s.st_mode) &&
+ 		!strncmp(get_basename(lc, path), "dm-", 3);
+ }
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/14_pdc_dump_extended_metadata.patch b/meta-oe/recipes-extended/dmraid/dmraid/14_pdc_dump_extended_metadata.patch
new file mode 100644
index 0000000..a821195
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/14_pdc_dump_extended_metadata.patch
@@ -0,0 +1,147 @@
+From: Phillip Susi <psusi@cfl.rr.com>
+Last-Update: 2011-03-08
+Forwarded: Yes
+Description: PDC supports up to 4 sets of metadata to describe
+ different arrays. Only the first set was being dumped with
+ dmraid -rD or -n.  This patch corrects that.  Also fixes the
+ .offset file, which was always reporting 0.
+
+Index: 1.0.0.rc16/lib/format/ataraid/pdc.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/ataraid/pdc.c
++++ 1.0.0.rc16/lib/format/ataraid/pdc.c
+@@ -172,7 +172,6 @@
+ 	unsigned *s = end_sectors;
+ 	uint64_t sector;
+ 
+-	*size = sizeof(*ret);
+ 	pdc_sectors_max = di->sectors - div_up(*size, 512);
+ 
+ 	if (!(ret = alloc_private(lc, handler,
+@@ -219,7 +218,9 @@
+ 		dbg_free(ret);
+ 		ret = NULL;
+ 	}
+-
++	*size = sizeof(*ret) * ma;
++	*offset = di->sectors - info->u32;
++	*offset <<= 9;
+ 	return ret;
+ }
+ 
+@@ -544,60 +545,64 @@
+ static void
+ _pdc_log(struct lib_context *lc, struct dev_info *di, struct pdc *pdc)
+ {
+-	unsigned i;
++	unsigned i, ma = count_meta_areas(pdc);
+ 	struct pdc_disk *disk;
+ 
+-	log_print(lc, "%s (%s):", di->path, handler);
+-	DP("promise_id: \"%s\"", pdc, pdc->promise_id);
+-	P("unknown_0: 0x%x %u",
+-	  pdc, pdc->unknown_0, pdc->unknown_0, pdc->unknown_0);
+-	DP("magic_0: 0x%x", pdc, pdc->magic_0);
+-	P("unknown_1: 0x%x %u",
+-	  pdc, pdc->unknown_1, pdc->unknown_1, pdc->unknown_1);
+-	DP("magic_1: 0x%x", pdc, pdc->magic_1);
+-	P("unknown_2: 0x%x %u",
+-	  pdc, pdc->unknown_2, pdc->unknown_2, pdc->unknown_2);
+-	DP("raid.flags: 0x%x", pdc, pdc->raid.flags);
+-	P("raid.unknown_0: 0x%x %d",
+-	  pdc, pdc->raid.unknown_0, pdc->raid.unknown_0, pdc->raid.unknown_0);
+-	DP("raid.disk_number: %u", pdc, pdc->raid.disk_number);
+-	DP("raid.channel: %u", pdc, pdc->raid.channel);
+-	DP("raid.device: %u", pdc, pdc->raid.device);
+-	DP("raid.magic_0: 0x%x", pdc, pdc->raid.magic_0);
+-	P("raid.unknown_1: 0x%x %u",
+-	  pdc, pdc->raid.unknown_1, pdc->raid.unknown_1, pdc->raid.unknown_1);
+-	P("raid.start: 0x%x %u",
+-	  pdc, pdc->raid.start, pdc->raid.start, pdc->raid.start);
+-	DP("raid.disk_secs: %u", pdc, pdc->raid.disk_secs);
+-	P("raid.unknown_3: 0x%x %u",
+-	  pdc, pdc->raid.unknown_3, pdc->raid.unknown_3, pdc->raid.unknown_3);
+-	P("raid.unknown_4: 0x%x %u",
+-	  pdc, pdc->raid.unknown_4, pdc->raid.unknown_4, pdc->raid.unknown_4);
+-	DP("raid.status: 0x%x", pdc, pdc->raid.status);
+-	DP("raid.type: 0x%x", pdc, pdc->raid.type);
+-	DP("raid.total_disks: %u", pdc, pdc->raid.total_disks);
+-	DP("raid.raid0_shift: %u", pdc, pdc->raid.raid0_shift);
+-	DP("raid.raid0_disks: %u", pdc, pdc->raid.raid0_disks);
+-	DP("raid.array_number: %u", pdc, pdc->raid.array_number);
+-	DP("raid.total_secs: %u", pdc, pdc->raid.total_secs);
+-	DP("raid.cylinders: %u", pdc, pdc->raid.cylinders);
+-	DP("raid.heads: %u", pdc, pdc->raid.heads);
+-	DP("raid.sectors: %u", pdc, pdc->raid.sectors);
+-	DP("raid.magic_1: 0x%x", pdc, pdc->raid.magic_1);
+-	P("raid.unknown_5: 0x%x %u",
+-	  pdc, pdc->raid.unknown_5, pdc->raid.unknown_5, pdc->raid.unknown_5);
+-
+-	for (disk = pdc->raid.disk, i = 0;
+-	     i < pdc->raid.total_disks; disk++, i++) {
+-		P2("raid.disk[%d].unknown_0: 0x%x", pdc, i, disk->unknown_0);
+-		P2("raid.disk[%d].channel: %u", pdc, i, disk->channel);
+-		P2("raid.disk[%d].device: %u", pdc, i, disk->device);
+-		P2("raid.disk[%d].magic_0: 0x%x", pdc, i, disk->magic_0);
+-		P2("raid.disk[%d].disk_number: %u", pdc, i, disk->disk_number);
+-	}
++	while (ma) {
++		log_print(lc, "%s (%s):", di->path, handler);
++		DP("promise_id: \"%s\"", pdc, pdc->promise_id);
++		P("unknown_0: 0x%x %u",
++		  pdc, pdc->unknown_0, pdc->unknown_0, pdc->unknown_0);
++		DP("magic_0: 0x%x", pdc, pdc->magic_0);
++		P("unknown_1: 0x%x %u",
++		  pdc, pdc->unknown_1, pdc->unknown_1, pdc->unknown_1);
++		DP("magic_1: 0x%x", pdc, pdc->magic_1);
++		P("unknown_2: 0x%x %u",
++		  pdc, pdc->unknown_2, pdc->unknown_2, pdc->unknown_2);
++		DP("raid.flags: 0x%x", pdc, pdc->raid.flags);
++		P("raid.unknown_0: 0x%x %d",
++		  pdc, pdc->raid.unknown_0, pdc->raid.unknown_0, pdc->raid.unknown_0);
++		DP("raid.disk_number: %u", pdc, pdc->raid.disk_number);
++		DP("raid.channel: %u", pdc, pdc->raid.channel);
++		DP("raid.device: %u", pdc, pdc->raid.device);
++		DP("raid.magic_0: 0x%x", pdc, pdc->raid.magic_0);
++		P("raid.unknown_1: 0x%x %u",
++		  pdc, pdc->raid.unknown_1, pdc->raid.unknown_1, pdc->raid.unknown_1);
++		P("raid.start: 0x%x %u",
++		  pdc, pdc->raid.start, pdc->raid.start, pdc->raid.start);
++		DP("raid.disk_secs: %u", pdc, pdc->raid.disk_secs);
++		P("raid.unknown_3: 0x%x %u",
++		  pdc, pdc->raid.unknown_3, pdc->raid.unknown_3, pdc->raid.unknown_3);
++		P("raid.unknown_4: 0x%x %u",
++		  pdc, pdc->raid.unknown_4, pdc->raid.unknown_4, pdc->raid.unknown_4);
++		DP("raid.status: 0x%x", pdc, pdc->raid.status);
++		DP("raid.type: 0x%x", pdc, pdc->raid.type);
++		DP("raid.total_disks: %u", pdc, pdc->raid.total_disks);
++		DP("raid.raid0_shift: %u", pdc, pdc->raid.raid0_shift);
++		DP("raid.raid0_disks: %u", pdc, pdc->raid.raid0_disks);
++		DP("raid.array_number: %u", pdc, pdc->raid.array_number);
++		DP("raid.total_secs: %u", pdc, pdc->raid.total_secs);
++		DP("raid.cylinders: %u", pdc, pdc->raid.cylinders);
++		DP("raid.heads: %u", pdc, pdc->raid.heads);
++		DP("raid.sectors: %u", pdc, pdc->raid.sectors);
++		DP("raid.magic_1: 0x%x", pdc, pdc->raid.magic_1);
++		P("raid.unknown_5: 0x%x %u",
++		  pdc, pdc->raid.unknown_5, pdc->raid.unknown_5, pdc->raid.unknown_5);
++
++		for (disk = pdc->raid.disk, i = 0;
++		     i < pdc->raid.total_disks; disk++, i++) {
++			P2("raid.disk[%d].unknown_0: 0x%x", pdc, i, disk->unknown_0);
++			P2("raid.disk[%d].channel: %u", pdc, i, disk->channel);
++			P2("raid.disk[%d].device: %u", pdc, i, disk->device);
++			P2("raid.disk[%d].magic_0: 0x%x", pdc, i, disk->magic_0);
++			P2("raid.disk[%d].disk_number: %u", pdc, i, disk->disk_number);
++		}
+ 
+-	P("checksum: 0x%x %s", pdc, pdc->checksum, pdc->checksum,
+-	  checksum(pdc) ? "Ok" : "BAD");
++		P("checksum: 0x%x %s", pdc, pdc->checksum, pdc->checksum,
++		  checksum(pdc) ? "Ok" : "BAD");
++		ma--;
++		pdc++;
++	}
+ }
+ 
+ static void
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/15_drop_p_for_partition_conditional.patch b/meta-oe/recipes-extended/dmraid/dmraid/15_drop_p_for_partition_conditional.patch
new file mode 100644
index 0000000..72e6237
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/15_drop_p_for_partition_conditional.patch
@@ -0,0 +1,31 @@
+From: Phillip Susi <psusi@cfl.rr.com>
+Last-Update: 2011-03-08
+Description: dmraid was changed at one point to insert a 'p' between
+ the base device name and the partition number.  For some time
+ debian and ubuntu reversed this change.  This patch modifies the
+ behavior to add the 'p' iff the last character of the base name is
+ a digit.  This makes dmraid comply with the behavior used by
+ kpartx and "by linux since the dawn of time".
+Forwarded: Yes
+
+Index: 1.0.0.rc16/lib/format/partition/dos.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/partition/dos.c
++++ 1.0.0.rc16/lib/format/partition/dos.c
+@@ -31,8 +31,14 @@
+ {
+ 	const char *base = get_basename(lc, rd->di->path);
+ 
+-	return type ? snprintf(str, len, "%s%s%u", base, OPT_STR_PARTCHAR(lc),
+-			       partition) : snprintf(str, len, "%s", base);
++	if (type)
++	{
++		if (isdigit(base[strlen(base) - 1]))
++			return snprintf(str, len, "%s%s%u", base,
++					OPT_STR_PARTCHAR(lc), partition);
++		else return snprintf(str, len, "%s%u", base, partition);
++	}
++	else return snprintf(str, len, "%s", base);
+ }
+ 
+ static char *
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/16_change-uuid.patch b/meta-oe/recipes-extended/dmraid/dmraid/16_change-uuid.patch
new file mode 100644
index 0000000..a1cd69f
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/16_change-uuid.patch
@@ -0,0 +1,76 @@
+From: Phillip Susi <psusi@ubuntu.com>
+Subject: Change uuid for partitions and internal devices
+Description: Change the uuid for internal devices ( like
+ each half of a raid10 ) so that the rest of the system
+ can recognize that the internal device should not be
+ probed for partitions or filesystems or mounted.  Also
+ change partition's uuid to have the same "partNN-"
+ prefix that kpartx gives them.
+
+Index: 1.0.0.rc16/lib/activate/devmapper.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/activate/devmapper.c
++++ 1.0.0.rc16/lib/activate/devmapper.c
+@@ -171,8 +171,18 @@ dmraid_uuid(struct lib_context *lc, stru
+ 	/* Clear garbage data from uuid string */
+ 	memset(uuid, 0, uuid_len);
+ 
+-	/* Create UUID string from subsystem prefix and RAID set name. */
+-	r = snprintf(uuid, uuid_len, "DMRAID-%s", name) < uuid_len;
++	/* Create UUID string from subsystem prefix and RAID set name.  *
++	 * Prefix partitions with "partNN-" and add an 'I' for internal *
++	 * for stacked devices ( each half of a raid10 )                */
++
++	if (rs->type & t_partition) {
++		char *part;
++		for (part = name + strlen(name) - 1; isdigit(*part); part--);
++		part++;
++		r = snprintf(uuid, uuid_len, "part%s-DMRAID-%S", part, name) < uuid_len;
++	} else if (rs->flags & f_subset)
++		r = snprintf(uuid, uuid_len, "DMRAIDI-%s", name) < uuid_len;
++	else r = snprintf(uuid, uuid_len, "DMRAID-%s", name) < uuid_len;
+ 	return r < 0 ? 0 : (r < uuid_len);
+ }
+ 
+Index: 1.0.0.rc16/include/dmraid/metadata.h
+===================================================================
+--- 1.0.0.rc16.orig/include/dmraid/metadata.h
++++ 1.0.0.rc16/include/dmraid/metadata.h
+@@ -177,6 +177,7 @@ enum flags {
+ 	f_maximize = 0x01,	/* If set, maximize set capacity,
+ 				   if not set, limit to smallest device. */
+ 	f_partitions = 0x02,	/* Set has partitions. */
++	f_subset = 0x04,	/* Set is an internal subset ( half of raid10 ) */
+ };
+ 
+ #define	F_MAXIMIZE(rs)		((rs)->flags & f_maximize)
+Index: 1.0.0.rc16/lib/format/ataraid/isw.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/ataraid/isw.c
++++ 1.0.0.rc16/lib/format/ataraid/isw.c
+@@ -877,7 +877,8 @@ group_rd(struct lib_context *lc,
+ 				free_raid_dev(lc, &rd);
+ 				return NULL;
+ 			}
+-
++			if (is_raid10(dev))
++				rs->flags |= f_subset;
+ 			rs->status = s_ok;
+ 
+ 			/* Save and set to enable dev_sort(). */
+Index: 1.0.0.rc16/lib/format/format.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/format.c
++++ 1.0.0.rc16/lib/format/format.c
+@@ -649,9 +649,10 @@ join_superset(struct lib_context *lc,
+ 	if ((n = f_name(lc, rd, 0))) {
+ 		if ((ret = find_or_alloc_raid_set(lc, n, FIND_TOP, NO_RD,
+ 						  LC_RS(lc), f_create, rd)) &&
+-		    !find_set(lc, &ret->sets, rs->name, FIND_TOP))
++		    !find_set(lc, &ret->sets, rs->name, FIND_TOP)) {
+ 			list_add_sorted(lc, &ret->sets, &rs->list, f_set_sort);
+-
++			rs->flags |= f_subset;
++		}
+ 		dbg_free(n);
+ 	}
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/17_convert-dmraid45-to-dmraid.patch b/meta-oe/recipes-extended/dmraid/dmraid/17_convert-dmraid45-to-dmraid.patch
new file mode 100644
index 0000000..285db15
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/17_convert-dmraid45-to-dmraid.patch
@@ -0,0 +1,273 @@
+From: Stefan Bader <stefan.bader@canonical.com>
+Date: Mon, 13 Jan 2014 14:39:29 +0100
+Subject: Convert dmraid to use dm-raid module for RAID4 and RAID5
+
+The dmraid library used the dm-raid45 target for RAID4 and RAID5 sets.
+This module however was never upstream and is suffering constant issues
+when the Linux kernel changes.
+Upstream introduced the dm-raid/raid module/target in 2.6.38. This can be
+used to create device-mapper targets which use the MD RAID disciplines
+(though not showing up in /proc/mdstat).
+
+Most of the table constructor arguments can be mapped, only the member
+devices may not have an offset.
+
+From the old code it seems that RAID5 would always be build by set
+elements which will not have an offset. So potentially only RAID4
+could cause issues. That could be worked around if needed by creating
+additional linear mappings.
+
+NOTE: The event code is only compile tested. But we seem to have never
+shipped the dmraid event tool which is needed to use this feature. And
+we are about to remove support for ISW from dmraid (in favour of mdadm)
+anyway.
+
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+
+Index: 1.0.0.rc16/lib/activate/activate.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/activate/activate.c	2014-01-14 15:41:29.872372693 +0100
++++ 1.0.0.rc16/lib/activate/activate.c	2014-01-14 15:41:59.692518476 +0100
+@@ -118,6 +118,17 @@ _dm_path_offset(struct lib_context *lc,
+ 		     valid ? path : lc->path.error, offset);
+ }
+ 
++/* Push metadata and data device path onto a table */
++static int
++_dm_meta_data_path(struct lib_context *lc, char **table, int valid,
++		   const char *meta, const char *path)
++
++{
++	return p_fmt(lc, table, " %s %s",
++		     meta ? meta : "-",
++		     valid ? path : lc->path.error);
++}
++
+ /*
+  * Create dm table for linear mapping.
+  */
+@@ -537,9 +548,10 @@ err:
+ /* Push begin of line onto a RAID5 table. */
+ /* FIXME: persistent dirty log. */
+ static int
+-_dm_raid45_bol(struct lib_context *lc, char **table, struct raid_set *rs,
++_dm_raid_bol(struct lib_context *lc, char **table, struct raid_set *rs,
+ 	       uint64_t sectors, unsigned int members)
+ {
++	int rc;
+ 	int need_sync = rs_need_sync(rs);
+ 	struct handler_info rebuild_drive;
+ 
+@@ -548,13 +560,31 @@ _dm_raid45_bol(struct lib_context *lc, c
+ 	if (need_sync && !get_rebuild_drive(lc, rs, &rebuild_drive))
+ 		return 0;
+ 
+-	return p_fmt(lc, table, "0 %U %s core 2 %u %s %s 1 %u %u %d",
+-		     sectors, get_dm_type(lc, rs->type),
+-		     calc_region_size(lc,
+-				      total_sectors(lc, rs) /
+-				      _dm_raid_devs(lc, rs, 0)),
+-		     (need_sync) ? "sync" : "nosync", get_type(lc, rs->type),
+-		     rs->stride, members, rebuild_drive.data.i32);
++	if (rebuild_drive.data.i32 < 0) {
++		rc = p_fmt(lc, table,
++		           "0 %U %s %s 4 %u %s region_size %u %u",
++			   sectors,
++			   get_dm_type(lc, rs->type),
++			   get_type(lc, rs->type),
++			   rs->stride,
++			   (need_sync) ? "sync" : "nosync",
++			   calc_region_size(lc, total_sectors(lc, rs) /
++					    _dm_raid_devs(lc, rs, 0)),
++			   members);
++	} else {
++		rc = p_fmt(lc, table,
++			   "0 %U %s %s 6 %u %s rebuild %d region_size %u %u",
++			   sectors,
++			   get_dm_type(lc, rs->type),
++			   get_type(lc, rs->type),
++			   rs->stride,
++			   (need_sync) ? "sync" : "nosync",
++			   rebuild_drive.data.i32,
++			   calc_region_size(lc, total_sectors(lc, rs) /
++					    _dm_raid_devs(lc, rs, 0)),
++			   members);
++	}
++	return rc;
+ }
+ 
+ /* Create "error target" name based on raid set name. */
+@@ -669,7 +699,7 @@ err:
+ }
+ 
+ static int
+-dm_raid45(struct lib_context *lc, char **table, struct raid_set *rs)
++dm_raid(struct lib_context *lc, char **table, struct raid_set *rs)
+ {
+ 	int ret;
+ 	uint64_t sectors = 0;
+@@ -749,7 +779,7 @@ dm_raid45(struct lib_context *lc, char *
+ 	 */
+ 	sectors *= members - 1;
+ 
+-	if (!_dm_raid45_bol(lc, table, rs, sectors, members))
++	if (!_dm_raid_bol(lc, table, rs, sectors, members))
+ 		goto err;
+ 
+ 	/* Stacked RAID sets (for RAID50 etc.) */
+@@ -759,7 +789,8 @@ dm_raid45(struct lib_context *lc, char *
+ 		if (!(path = mkdm_path(lc, r->name)))
+ 			goto err;
+ 
+-		ret = _dm_path_offset(lc, table, valid_rs(r), path, 0);
++		log_dbg(lc, "%s: raid set device %s", __func__, path);
++		ret = _dm_meta_data_path(lc, table, valid_rs(r), NULL, path);
+ 		dbg_free(path);
+ 
+ 		if (!ret)
+@@ -768,8 +799,11 @@ dm_raid45(struct lib_context *lc, char *
+ 
+ 	/* Lowest level RAID devices. */
+ 	list_for_each_entry(rd, &rs->devs, devs) {
+-		if (!_dm_path_offset(lc, table, valid_rd(rd), 
+-				     rd->di->path, rd->offset))
++		if (rd->offset)
++			goto err;
++		log_dbg(lc, "%s: low level dev %s", __func__, rd->di->path);
++		if (!_dm_meta_data_path(lc, table, valid_rd(rd), NULL,
++					rd->di->path))
+ 			goto err;
+ 	}
+ 
+@@ -802,11 +836,11 @@ static struct type_handler {
+ 	{ t_linear, dm_linear },
+ 	{ t_raid0, dm_raid0 },
+ 	{ t_raid1, dm_raid1 },
+-	{ t_raid4, dm_raid45 },
+-	{ t_raid5_ls, dm_raid45 },
+-	{ t_raid5_rs, dm_raid45 },
+-	{ t_raid5_la, dm_raid45 },
+-	{ t_raid5_ra, dm_raid45 },
++	{ t_raid4, dm_raid },
++	{ t_raid5_ls, dm_raid },
++	{ t_raid5_rs, dm_raid },
++	{ t_raid5_la, dm_raid },
++	{ t_raid5_ra, dm_raid },
+ 	/* RAID types below not supported (yet) */
+ 	{ t_raid6, dm_unsup },
+ };
+Index: 1.0.0.rc16.orig/lib/metadata/metadata.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/metadata/metadata.c	2014-01-14 15:41:29.908372863 +0100
++++ 1.0.0.rc16/lib/metadata/metadata.c	2014-01-14 15:41:59.692518476 +0100
+@@ -31,11 +31,11 @@ static const struct {
+ 	{ t_linear, "linear", "linear"},
+ 	{ t_raid0, "stripe", "striped"},
+ 	{ t_raid1, "mirror", "mirror"},
+-	{ t_raid4, "raid4", "raid45"},
+-	{ t_raid5_ls, "raid5_ls", "raid45"},
+-	{ t_raid5_rs, "raid5_rs", "raid45"},
+-	{ t_raid5_la, "raid5_la", "raid45"},
+-	{ t_raid5_ra, "raid5_ra", "raid45"},
++	{ t_raid4, "raid4", "raid"},
++	{ t_raid5_ls, "raid5_ls", "raid"},
++	{ t_raid5_rs, "raid5_rs", "raid"},
++	{ t_raid5_la, "raid5_la", "raid"},
++	{ t_raid5_ra, "raid5_ra", "raid"},
+ 	{ t_raid6, "raid6", NULL},
+ };
+ 
+Index: 1.0.0.rc16/lib/events/libdmraid-events-isw.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/events/libdmraid-events-isw.c	2014-01-14 10:20:23.598184676 +0100
++++ 1.0.0.rc16/lib/events/libdmraid-events-isw.c	2014-01-14 15:41:59.696518490 +0100
+@@ -502,7 +502,7 @@ static int _get_num_devs_from_status(cha
+ 	int ret;
+ 
+ 	for (ret = 0; *status; status++) {
+-		if (*status == 'A' || *status == 'D')
++		if (*status == 'A' || *status == 'a' || *status == 'D')
+ 			ret++;
+ 	}
+ 
+@@ -1258,8 +1258,8 @@ err:
+ 	return D_IGNORE;
+ }
+ 
+-/* Get the raid45 device(s) that caused the trigger. */
+-static enum disk_state_type _process_raid45_event(struct dm_task *dmt,
++/* Get the raid device(s) that caused the trigger. */
++static enum disk_state_type _process_raid_event(struct dm_task *dmt,
+ 						  char *params)
+ {
+ 	int argc, i, num_devs, dead, ret = D_INSYNC;
+@@ -1272,32 +1272,34 @@ static enum disk_state_type _process_rai
+ 		return D_IGNORE;
+ 
+ 	/*
+-	 * dm core parms (NOT provided in @params):  	0 976783872 raid45 
+-	 *
+-	 * raid45 device parms:     	3 253:4 253:5 253:6
+-	 * raid45 device status:	1 AAA
++	 * raid device status:	<type> 3 AAA <synced/total> <action> <rmm>
+ 	 */
+ 
++	/* Skip over the raid type */
++	if(!dm_split_words(params, 1, 0, &p))
++		goto err;
++	p += strlen(p) + 1;
++
+ 	/* Number of devices. */
+ 	num_devs = _get_num_devs(params, &p);
+ 	if (!num_devs)
+ 		goto err;
+ 
+-	/* Devices names + "1" + "AA". */
+-	argc = num_devs + 2;
++	/* AAA + <completeness> <action> <resync mismatches> */
++	argc = 4;
+ 	args = dm_malloc(argc * sizeof(*args));
+ 	if (!args ||
+ 	    dm_split_words(p, argc, 0, args) != argc)
+ 		goto err;
+ 
+-	dev_status_str = args[num_devs + 1];
++	dev_status_str = args[0];
+ 
+ 	/* Consistency check on num_devs and status chars. */
+ 	i = _get_num_devs_from_status(dev_status_str);
+ 	if (i != num_devs)
+ 		goto err;
+ 
+-	/* Check for bad raid45 devices. */
++	/* Check for bad raid devices. */
+ 	for (i = 0, p = dev_status_str; i < rs->num_devs; i++) {
+ 		/* Skip past any non active/dead identifiers. */
+ 		dead = *(p++) == 'D';
+@@ -1324,7 +1326,7 @@ static enum disk_state_type _process_rai
+ 	return ret;
+ 
+ err:
+-	_event_cleanup_and_log(args, "raid45");
++	_event_cleanup_and_log(args, "raid");
+ 	return D_IGNORE;
+ }
+ 
+@@ -1341,7 +1343,7 @@ static void _process_event(char *target_
+ 	} *proc,  process[] = {
+ 		{ "striped", _process_stripe_event, 0 },
+ 		{ "mirror",  _process_mirror_event, 1 },
+-		{ "raid45",  _process_raid45_event, 1 },
++		{ "raid",    _process_raid_event, 1 },
+ 	};
+ #ifdef	_LIBDMRAID_DSO_TESTING
+ 	struct dso_raid_set *rs;
+@@ -1352,7 +1354,7 @@ static void _process_event(char *target_
+ 	 * stripe (raid 0),
+ 	 * mirror (raid 1)
+ 	 * or
+-	 * raid45 (raid 4/5).
++	 * raid   (raid 4/5).
+ 	 */
+ 	for (proc = process; proc < ARRAY_END(process); proc++) {
+ 		if (!strcmp(target_type, proc->target_type))
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/18_ignore-too-small-devices.patch b/meta-oe/recipes-extended/dmraid/dmraid/18_ignore-too-small-devices.patch
new file mode 100644
index 0000000..ab500bb
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/18_ignore-too-small-devices.patch
@@ -0,0 +1,39 @@
+From: Stefan Bader <stefan.bader@canonical.com>
+Date: Tue, 14 Jan 2014 15:26:50 +0100
+Subject: Avoid meaningless error messages while probing for meta-data
+
+This happens as device-mapper volumes are checked and kpartx creates
+a 2 sector mapping if a device contains an extended partition.
+Offsetting from the last sector backwards some probes overflow and
+end up trying to seek to a very large offset (which fails and emits
+a visible error message during device scanning).
+This message is useless as such a small device would be pointless as
+a RAID set anyway.
+To fix this without larger changes, pragmatically ignore devices smaller
+than 8 sectors (4K).
+
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+
+Index: 1.0.0.rc16/lib/format/format.c
+===================================================================
+--- 1.0.0.rc16.orig/lib/format/format.c	2014-01-14 15:50:17.554952405 +0100
++++ 1.0.0.rc16/lib/format/format.c	2014-01-14 15:50:35.319039242 +0100
+@@ -533,6 +533,18 @@ read_raid_dev(struct lib_context *lc,
+ 	union read_info info;
+ 
+ 	/*
++	 * Kpartx will create a mapping for extended partitions which only
++	 * covers 2 sectors. That leads to error messages when looking for
++	 * meta-data as moving back from the last sector results in huge
++	 * offsets. Quick hack here to ignore any device smaller than 4K.
++	 */
++	if (di->sectors < 8) {
++		log_dbg(lc, "%s: Ignore device smaller than 4K (%s)",
++			handler, di->path);
++		return NULL;
++	}
++
++	/*
+ 	 * In case the metadata format handler provides a special
+ 	 * metadata read function, use that. If not, allocate and
+ 	 * read size from offset.
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/19_compile-dmraid-in-subdir-tools.patch b/meta-oe/recipes-extended/dmraid/dmraid/19_compile-dmraid-in-subdir-tools.patch
new file mode 100644
index 0000000..8318248
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/19_compile-dmraid-in-subdir-tools.patch
@@ -0,0 +1,20 @@
+Compile dmraid in subdir tools to avoid error as follows
+
+  | tools/dmraid.c:12:27: fatal error: dmraid/dmraid.h: No such file or directory
+  |  #include <dmraid/dmraid.h>
+  |                            ^
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp 1.0.0.rc16.orig/Makefile.in 1.0.0.rc16/Makefile.in
+--- 1.0.0.rc16.orig/Makefile.in	2009-09-16 16:55:23.000000000 +0800
++++ 1.0.0.rc16/Makefile.in	2014-11-26 16:39:54.087815059 +0800
+@@ -10,8 +10,6 @@ VPATH = @srcdir@
+ 
+ SUBDIRS = include lib man tools
+ 
+-TARGETS = tools/dmraid
+-
+ include make.tmpl
+ 
+ tools: lib
diff --git a/meta-oe/recipes-extended/dmraid/dmraid/20_specifies-install-dir-by-DESTDIR.patch b/meta-oe/recipes-extended/dmraid/dmraid/20_specifies-install-dir-by-DESTDIR.patch
new file mode 100644
index 0000000..63f46ef
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid/20_specifies-install-dir-by-DESTDIR.patch
@@ -0,0 +1,123 @@
+Install all target into ${D} specified by DESTDIR.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp 1.0.0.rc16.org/include/Makefile.in 1.0.0.rc16/include/Makefile.in
+--- 1.0.0.rc16.org/include/Makefile.in	2009-09-16 16:55:23.000000000 +0800
++++ 1.0.0.rc16/include/Makefile.in	2014-11-27 15:05:06.108660939 +0800
+@@ -16,15 +16,15 @@ include $(top_srcdir)/make.tmpl
+ .PHONY: install_dmraid_headers remove_dmraid_headers
+ 
+ install_dmraid_headers: $(HEADERS)
+-	@echo "Installing $(HEADERS) in $(includedir)/dmraid"
+-	mkdir -p $(includedir)/dmraid
+-	$(INSTALL) $(STRIP) $(HEADERS) $(includedir)/dmraid
++	@echo "Installing $(HEADERS) in $(DESTDIR)/$(includedir)/dmraid"
++	mkdir -p $(DESTDIR)$(includedir)/dmraid
++	$(INSTALL) $(STRIP) $(HEADERS) $(DESTDIR)/$(includedir)/dmraid
+ 
+ install: install_dmraid_headers
+ 
+ remove_dmraid_headers:
+-	@echo "Removing $(HEADERS) from $(includedir)/dmraid"
+-	rm -f $(includedir)/dmraid
++	@echo "Removing $(HEADERS) from $(DESTDIR)/$(includedir)/dmraid"
++	rm -f $(DESTDIR)/$(includedir)/dmraid
+ 
+ remove:        remove_dmraid_headers
+ 
+diff -Nurp 1.0.0.rc16.org/lib/Makefile.in 1.0.0.rc16/lib/Makefile.in
+--- 1.0.0.rc16.org/lib/Makefile.in	2014-11-27 14:49:17.212698021 +0800
++++ 1.0.0.rc16/lib/Makefile.in	2014-11-27 15:07:33.008655199 +0800
+@@ -78,30 +78,30 @@ $(LIB_EVENTS_SHARED):
+ .PHONY: install_dmraid_libs remove_dmraid_libs
+ 
+ install_dmraid_libs: $(INSTALL_TARGETS)
+-	@echo "Installing $(INSTALL_TARGETS) in $(libdir)"; \
+-	mkdir -p $(libdir); \
++	@echo "Installing $(INSTALL_TARGETS) in $(DESTDIR)/$(libdir)"; \
++	mkdir -p $(DESTDIR)/$(libdir); \
+ 	for f in $(INSTALL_TARGETS); \
+ 	do \
+ 		n=$$(basename $${f}) ; \
+ 		if echo "$$n" | grep -q '.so$$'; then \
+ 			$(INSTALL) -m 555 $(STRIP) \
+-				$$f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
+-			mkdir -p $(prefix)/lib; \
+-			cd $(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VERSION@ $${n}; \
++				$$f $(DESTDIR)/$(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
++			mkdir -p $(DESTDIR)/$(prefix)/lib; \
++			cd $(DESTDIR)/$(prefix)/lib/ && $(LN_S) -f /lib/$${n}.@DMRAID_LIB_VERSION@ $${n}; \
+ 		else \
+-			$(INSTALL) -m 555 $(STRIP) $$f $(libdir)/$${n}; \
++			$(INSTALL) -m 555 $(STRIP) $$f $(DESTDIR)/$(libdir)/$${n}; \
+ 		fi \
+ 	done
+ 
+ install: install_dmraid_libs
+ 
+ remove_dmraid_libs:
+-	@echo "Removing $(INSTALL_TARGETS) from $(libdir)"; \
++	@echo "Removing $(INSTALL_TARGETS) from $(DESTDIR)/$(libdir)"; \
+ 	for f in $(INSTALL_TARGETS); \
+ 	do \
+ 		n=$$(basename $${f}) ; \
+-		rm -f $(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
+-		rm -f $(libdir)/$${n}; \
++		rm -f $(DESTDIR)/$(libdir)/$${n}.@DMRAID_LIB_VERSION@; \
++		rm -f $(DESTDIR)/$(libdir)/$${n}; \
+ 	done
+ 
+ remove:	remove_dmraid_libs
+diff -Nurp 1.0.0.rc16.org/make.tmpl.in 1.0.0.rc16/make.tmpl.in
+--- 1.0.0.rc16.org/make.tmpl.in	2014-11-27 14:49:17.212698021 +0800
++++ 1.0.0.rc16/make.tmpl.in	2014-11-27 15:02:34.940666847 +0800
+@@ -21,8 +21,8 @@ LD_DEPS += @LD_DEPS@
+ SOFLAG += @SOFLAG@
+ 
+ # Setup directory variables
+-prefix = $(DESTDIR)@prefix@
+-exec_prefix = $(DESTDIR)@exec_prefix@
++prefix = @prefix@
++exec_prefix = @exec_prefix@
+ bindir = @bindir@
+ ifeq ("@KLIBC@", "no")
+   libdir = @libdir@
+diff -Nurp 1.0.0.rc16.org/man/Makefile.in 1.0.0.rc16/man/Makefile.in
+--- 1.0.0.rc16.org/man/Makefile.in	2009-09-16 16:55:23.000000000 +0800
++++ 1.0.0.rc16/man/Makefile.in	2014-11-27 15:08:35.924652740 +0800
+@@ -9,7 +9,7 @@ top_srcdir = @top_srcdir@
+ VPATH = @srcdir@
+ 
+ MAN8=dmraid.8 dmevent_tool.8
+-MAN8DIR=${mandir}/man8
++MAN8DIR=$(DESTDIR)/${mandir}/man8
+ 
+ include $(top_srcdir)/make.tmpl
+ 
+diff -Nurp 1.0.0.rc16.org/tools/Makefile.in 1.0.0.rc16/tools/Makefile.in
+--- 1.0.0.rc16.org/tools/Makefile.in	2014-11-27 14:49:17.212698021 +0800
++++ 1.0.0.rc16/tools/Makefile.in	2014-11-27 15:10:11.408649009 +0800
+@@ -71,17 +71,17 @@ dmevent_tool: $(top_srcdir)/lib/libdmrai
+ 	      -L$(DESTDIR)$(libdir) $(DMRAIDLIBS) $(DMEVENTTOOLLIBS) $(DMRAIDLIBS) $(LIBS) 
+ 
+ install_dmraid_tools: $(TARGETS)
+-	@echo "Installing $(TARGETS) in $(sbindir)"; \
+-	mkdir -p $(sbindir); \
+-	$(INSTALL) $(STRIP) $(TARGETS) $(sbindir)
++	@echo "Installing $(TARGETS) in $(DESTDIR)/$(sbindir)"; \
++	mkdir -p $(DESTDIR)/$(sbindir); \
++	$(INSTALL) $(STRIP) $(TARGETS) $(DESTDIR)/$(sbindir)
+ 
+ install: install_dmraid_tools
+ 
+ remove_dmraid_tools:
+-	@echo "Removing $(TARGETS) from $(sbindir)"; \
++	@echo "Removing $(TARGETS) from $(DESTDIR)/$(sbindir)"; \
+ 	for f in $(TARGETS); \
+ 	do \
+-		rm -f $(sbindir)/$$f; \
++		rm -f $(DESTDIR)/$(sbindir)/$$f; \
+ 	done
+ 
+ remove:	remove_dmraid_tools
diff --git a/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb b/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
new file mode 100644
index 0000000..7b6fbb0
--- /dev/null
+++ b/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
@@ -0,0 +1,55 @@
+SUMMARY = "dmraid (Device-mapper RAID tool and library)"
+DESCRIPTION = "DMRAID supports RAID device discovery, RAID set activation, \
+creation, removal, rebuild and display of properties for ATARAID/DDF1 \
+metadata on Linux >= 2.4 using device-mapper."
+HOMEPAGE = "http://people.redhat.com/heinzm/sw/dmraid"
+SECTION = "System Environment/Base"
+
+inherit autotools-brokensep
+
+SRC_URI = "http://people.redhat.com/heinzm/sw/dmraid/src/old/${BPN}-${PV}.tar.bz2 \
+           file://01_fix_broken_linking.patch \
+           file://02_disable_dmreg.patch \
+           file://03_fix_hyphen-used-as-minus-sign.patch \
+           file://04_promise-add-offsets.patch \
+           file://05_exit_code.patch \
+           file://06_support_virtio_devices.patch \
+           file://07_isw-probe-hpa.patch \
+           file://08_activate_multiple_raid_sets.patch \
+           file://09_pdc_raid10_failure..patch \
+           file://10_ddf1_lsi_persistent_name.patch \
+           file://11_fix_isw_sectors_calculation.patch \
+           file://12_jmicron_namefix.patch \
+           file://13_fix_testing.patch \
+           file://14_pdc_dump_extended_metadata.patch \
+           file://15_drop_p_for_partition_conditional.patch \
+           file://16_change-uuid.patch \
+           file://17_convert-dmraid45-to-dmraid.patch \
+           file://18_ignore-too-small-devices.patch \
+           file://19_compile-dmraid-in-subdir-tools.patch \
+           file://20_specifies-install-dir-by-DESTDIR.patch \
+          "
+
+SRC_URI[md5sum] = "32832c1dfd7e72cd4355490322fca68a"
+SRC_URI[sha256sum] = "f849c44d041f8891c61419ddf906e6e34b44948939ae9e550be662ffc2492255"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15b3012575eeffacc3cec27a6d3cb31f"
+
+DEPENDS = "lvm2"
+
+S = "${WORKDIR}/${BPN}/${PV}"
+
+EXTRA_OECONF += " --disable-static_link --enable-led --enable-intel_led --enable-debug  "
+
+do_configure() {
+    oe_runconf
+}
+
+do_compile() {
+    oe_runmake DESTDIR=${D}
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
-- 
1.9.1


