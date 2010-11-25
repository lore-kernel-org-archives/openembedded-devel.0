Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLXyO-0006pG-J6
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:18:39 +0100
Received: (qmail 17348 invoked by uid 503); 25 Nov 2010 09:21:45 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 09:21:45 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 11:17:21 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 11:17:19 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 10:14:19 +0100
Message-Id: <1290676461-13283-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290676461-13283-2-git-send-email-eric@eukrea.com>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2999115878566571339
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] busybox: remove 1.17.1
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
X-List-Received-Date: Thu, 25 Nov 2010 09:18:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

as it's no more default for Angstrom-2010

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox-1.17.1/B921600.patch       |   13 -
 .../busybox-1.17.1/busybox-1.17.1-grep.patch       |   39 -
 .../busybox-1.17.1/busybox-1.17.1-make.patch       |   32 -
 .../busybox-1.17.1/busybox-1.17.1-mdev.patch       |   49 --
 .../busybox-1.17.1/busybox-1.17.1-mktemp.patch     |   12 -
 .../busybox-1.17.1/busybox-1.17.1-sed.patch        |  117 ---
 .../busybox-1.17.1/busybox-1.17.1-shell.patch      |  105 ---
 recipes/busybox/busybox-1.17.1/defconfig           |  873 --------------------
 recipes/busybox/busybox-1.17.1/fdisk_nios2.patch   |   13 -
 .../busybox/busybox-1.17.1/get_header_tar.patch    |   11 -
 .../busybox-1.17.1/udhcpc-fix-nfsroot.patch        |   47 --
 recipes/busybox/busybox-1.17.1/udhcpscript.patch   |   13 -
 recipes/busybox/busybox_1.17.1.bb                  |   16 -
 13 files changed, 0 insertions(+), 1340 deletions(-)
 delete mode 100644 recipes/busybox/busybox-1.17.1/B921600.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/defconfig
 delete mode 100644 recipes/busybox/busybox-1.17.1/fdisk_nios2.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/get_header_tar.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch
 delete mode 100644 recipes/busybox/busybox-1.17.1/udhcpscript.patch
 delete mode 100644 recipes/busybox/busybox_1.17.1.bb

diff --git a/recipes/busybox/busybox-1.17.1/B921600.patch b/recipes/busybox/busybox-1.17.1/B921600.patch
deleted file mode 100644
index 61cc32b..0000000
--- a/recipes/busybox/busybox-1.17.1/B921600.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/speed_table.c
---- busybox-1.7.2/libbb/speed_table.c	2007-09-03 13:48:41.000000000 +0200
-+++ busybox-1.7.2-921600/libbb/speed_table.c	2008-10-09 16:23:26.269592899 +0200
-@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =
- #ifdef B460800
- 	{B460800, 460800/256 + 0x8000U},
- #endif
-+#ifdef B921600
-+	{B921600, 921600/256 + 0x8000U},
-+#endif
- };
- 
- enum { NUM_SPEEDS = ARRAY_SIZE(speeds) };
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
deleted file mode 100644
index f8fc25d..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-diff -urpN busybox-1.17.1/findutils/grep.c busybox-1.17.1-grep/findutils/grep.c
---- busybox-1.17.1/findutils/grep.c	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-grep/findutils/grep.c	2010-08-23 02:37:08.000000000 +0200
-@@ -461,15 +461,19 @@ static int grep_file(FILE *file)
- 						if (found)
- 							print_line(gl->pattern, strlen(gl->pattern), linenum, ':');
- 					} else while (1) {
-+						unsigned start = gl->matched_range.rm_so;
- 						unsigned end = gl->matched_range.rm_eo;
-+						unsigned len = end - start;
- 						char old = line[end];
- 						line[end] = '\0';
--						print_line(line + gl->matched_range.rm_so,
--								end - gl->matched_range.rm_so,
--								linenum, ':');
-+						/* Empty match is not printed: try "echo test | grep -o ''" */
-+						if (len != 0)
-+							print_line(line + start, len, linenum, ':');
- 						if (old == '\0')
- 							break;
- 						line[end] = old;
-+						if (len == 0)
-+							end++;
- #if !ENABLE_EXTRA_COMPAT
- 						if (regexec(&gl->compiled_regex, line + end,
- 								1, &gl->matched_range, REG_NOTBOL) != 0)
-diff -urpN busybox-1.17.1/testsuite/grep.tests busybox-1.17.1-grep/testsuite/grep.tests
---- busybox-1.17.1/testsuite/grep.tests	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-grep/testsuite/grep.tests	2010-08-23 02:37:08.000000000 +0200
-@@ -98,5 +98,9 @@ testing "grep -o does not loop forever" 
- 	'grep -o "[^/]*$"' \
- 	"test\n" \
- 	"" "/var/test\n"
-+testing "grep -o does not loop forever on zero-length match" \
-+	'grep -o "" | head -n1' \
-+	"" \
-+	"" "test\n"
- 
- exit $FAILCOUNT
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
deleted file mode 100644
index 6177696..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -urpN busybox-1.17.1/Makefile busybox-1.17.1-make/Makefile
---- busybox-1.17.1/Makefile	2010-07-25 00:13:44.000000000 +0200
-+++ busybox-1.17.1-make/Makefile	2010-08-22 09:30:33.000000000 +0200
-@@ -433,7 +433,12 @@ ifeq ($(config-targets),1)
- -include $(srctree)/arch/$(ARCH)/Makefile
- export KBUILD_DEFCONFIG
- 
--config %config: scripts_basic outputmakefile gen_build_files FORCE
-+config: scripts_basic outputmakefile gen_build_files FORCE
-+	$(Q)mkdir -p include
-+	$(Q)$(MAKE) $(build)=scripts/kconfig $@
-+	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
-+
-+%config: scripts_basic outputmakefile gen_build_files FORCE
- 	$(Q)mkdir -p include
- 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
- 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
-@@ -1285,9 +1290,13 @@ endif
- 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
- 
- # Modules
--/ %/: prepare scripts FORCE
-+%/: prepare scripts FORCE
- 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
- 	$(build)=$(build-dir)
-+/: prepare scripts FORCE
-+	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
-+	$(build)=$(build-dir)
-+
- %.ko: prepare scripts FORCE
- 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
- 	$(build)=$(build-dir) $(@:.ko=.o)
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
deleted file mode 100644
index 71c7abd..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-diff -urpN busybox-1.17.1/testsuite/mdev.tests busybox-1.17.1-mdev/testsuite/mdev.tests
---- busybox-1.17.1/testsuite/mdev.tests	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-mdev/testsuite/mdev.tests	2010-08-23 02:38:21.000000000 +0200
-@@ -38,6 +38,16 @@ brw-rw---- 1 0 0 8,0 sda
- SKIP=
- 
- # continuing to use directory structure from prev test
-+optional STATIC FEATURE_MDEV_CONF FEATURE_LS_TIMESTAMPS FEATURE_LS_USERNAME
-+testing "mdev deletes /block/sda" \
-+	"env - PATH=$PATH ACTION=remove DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
-+	ls -ln mdev.testdir/dev | $FILTER_LS" \
-+"\
-+" \
-+	"" ""
-+SKIP=
-+
-+# continuing to use directory structure from prev test
- rm -rf mdev.testdir/dev/*
- echo ".* 1:1 666" >mdev.testdir/etc/mdev.conf
- echo "sda 2:2 444" >>mdev.testdir/etc/mdev.conf
-diff -urpN busybox-1.17.1/util-linux/mdev.c busybox-1.17.1-mdev/util-linux/mdev.c
---- busybox-1.17.1/util-linux/mdev.c	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-mdev/util-linux/mdev.c	2010-08-23 02:38:21.000000000 +0200
-@@ -132,6 +132,7 @@ static void make_device(char *path, int 
- 			major = -1;
- 		}
- 	}
-+	/* else: for delete, -1 still deletes the node, but < -1 suppresses that */
- 
- 	/* Determine device name, type, major and minor */
- 	device_name = (char*) bb_basename(path);
-@@ -279,7 +280,7 @@ static void make_device(char *path, int 
- 				if (aliaslink == '!' && s == a+1) {
- 					val = st;
- 					/* "!": suppress node creation/deletion */
--					major = -1;
-+					major = -2;
- 				}
- 				else if (aliaslink == '>' || aliaslink == '=') {
- 					val = st;
-@@ -379,7 +380,7 @@ static void make_device(char *path, int 
- 				free(command);
- 			}
- 
--			if (delete && major >= 0) {
-+			if (delete && major >= -1) {
- 				if (ENABLE_FEATURE_MDEV_RENAME && alias) {
- 					if (aliaslink == '>')
- 						unlink(device_name);
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
deleted file mode 100644
index 557e337..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.17.1/debianutils/mktemp.c busybox-1.17.1-mktemp/debianutils/mktemp.c
---- busybox-1.17.1/debianutils/mktemp.c	2010-07-25 00:12:56.000000000 +0200
-+++ busybox-1.17.1-mktemp/debianutils/mktemp.c	2010-07-27 08:21:26.000000000 +0200
-@@ -50,7 +50,7 @@ int mktemp_main(int argc UNUSED_PARAM, c
- 	opts = getopt32(argv, "dqtp:", &path);
- 
- 	chp = argv[optind] ? argv[optind] : xstrdup("tmp.XXXXXX");
--	if (chp[0] != '/' || (opts & 8))
-+	if (!strchr(chp, '/') || (opts & 8))
- 		chp = concat_path_file(path, chp);
- 
- 	if (opts & 1) { /* -d */
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
deleted file mode 100644
index f65aebe..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
---- busybox-1.17.1/editors/sed.c	2010-07-06 04:25:53.000000000 +0200
-+++ busybox-1.17.1-sed/editors/sed.c	2010-08-17 02:05:27.000000000 +0200
-@@ -61,6 +61,10 @@
- #include "libbb.h"
- #include "xregex.h"
- 
-+enum {
-+	OPT_in_place = 1 << 0,
-+};
-+
- /* Each sed command turns into one of these structures. */
- typedef struct sed_cmd_s {
- 	/* Ordered by alignment requirements: currently 36 bytes on x86 */
-@@ -938,8 +942,11 @@ static void process_files(void)
- 
- 		if (matched) {
- 			/* once matched, "n,xxx" range is dead, disabling it */
--			if (sed_cmd->beg_line > 0)
-+			if (sed_cmd->beg_line > 0
-+			 && !(option_mask32 & OPT_in_place) /* but not for -i */
-+			) {
- 				sed_cmd->beg_line = -2;
-+			}
- 			sed_cmd->in_match = !(
- 				/* has the ending line come, or is this a single address command? */
- 				(sed_cmd->end_line ?
-@@ -985,6 +992,8 @@ static void process_files(void)
- 		}
- 
- 		/* actual sedding */
-+		//bb_error_msg("pattern_space:'%s' next_line:'%s' cmd:%c",
-+		//pattern_space, next_line, sed_cmd->cmd);
- 		switch (sed_cmd->cmd) {
- 
- 		/* Print line number */
-@@ -1111,10 +1120,16 @@ static void process_files(void)
- 		{
- 			int len;
- 			/* If no next line, jump to end of script and exit. */
-+			/* http://www.gnu.org/software/sed/manual/sed.html:
-+			 * "Most versions of sed exit without printing anything
-+			 * when the N command is issued on the last line of
-+			 * a file. GNU sed prints pattern space before exiting
-+			 * unless of course the -n command switch has been
-+			 * specified. This choice is by design."
-+			 */
- 			if (next_line == NULL) {
--				free(next_line);
--				next_line = NULL;
--				goto discard_line;
-+				//goto discard_line;
-+				goto discard_commands; /* GNU behavior */
- 			}
- 			/* Append next_line, read new next_line. */
- 			len = strlen(pattern_space);
-@@ -1270,9 +1285,6 @@ static void add_cmd_block(char *cmdstr)
- int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int sed_main(int argc UNUSED_PARAM, char **argv)
- {
--	enum {
--		OPT_in_place = 1 << 0,
--	};
- 	unsigned opt;
- 	llist_t *opt_e, *opt_f;
- 	int status = EXIT_SUCCESS;
-@@ -1292,6 +1304,7 @@ int sed_main(int argc UNUSED_PARAM, char
- 	opt_e = opt_f = NULL;
- 	opt_complementary = "e::f::" /* can occur multiple times */
- 	                    "nn"; /* count -n */
-+	/* -i must be first, to match OPT_in_place definition */
- 	opt = getopt32(argv, "irne:f:", &opt_e, &opt_f,
- 			    &G.be_quiet); /* counter for -n */
- 	//argc -= optind;
-diff -urpN busybox-1.17.1/testsuite/sed.tests busybox-1.17.1-sed/testsuite/sed.tests
---- busybox-1.17.1/testsuite/sed.tests	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-sed/testsuite/sed.tests	2010-08-17 02:05:27.000000000 +0200
-@@ -80,10 +80,18 @@ test x"$SKIP_KNOWN_BUGS" = x"" && {
- # Query: how does this interact with no newline at EOF?
- testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'" \
- 	"a\nb\nb\nc\n" "" "a\nb\nc\n"
--# N does _not_ flush pattern space, therefore c is still in there @ script end.
--testing "sed N (doesn't flush pattern space when terminating)" "sed -e 'N;p'" \
--	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
- }
-+# non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ script end
-+# GNU sed: N flushes pattern space, therefore c is printed too @ script end
-+testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
-+	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
-+
-+testing "sed N test2" "sed ':a;N;s/\n/ /;ta'" \
-+	"a b c\n" "" "a\nb\nc\n"
-+
-+testing "sed N test3" "sed 'N;s/\n/ /'" \
-+	"a b\nc\n" "" "a\nb\nc\n"
-+
- testing "sed address match newline" 'sed "/b/N;/b\\nc/i woo"' \
- 	"a\nwoo\nb\nc\nd\n" "" "a\nb\nc\nd\n"
- 
-@@ -270,11 +278,16 @@ testing "sed a cmd ended by double backs
- 	| two \\
- '
- 
--# fisrt three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
-+# first three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
- testing "sed with N skipping lines past ranges on next cmds" \
- 	"sed -n '1{N;N;d};1p;2,3p;3p;4p'" \
- 	"4\n4\n" "" "1\n2\n3\n4\n"
- 
-+testing "sed -i with address modifies all files, not only first" \
-+	"cp input input2; sed -i -e '1s/foo/bar/' input input2 && cat input input2; rm input2" \
-+	"bar\nbar\n" "foo\n" ""
-+
-+
- # testing "description" "arguments" "result" "infile" "stdin"
- 
- exit $FAILCOUNT
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
deleted file mode 100644
index 5279b12..0000000
--- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-diff -urpN busybox-1.17.1/shell/ash.c busybox-1.17.1-shell/shell/ash.c
---- busybox-1.17.1/shell/ash.c	2010-07-25 00:12:43.000000000 +0200
-+++ busybox-1.17.1-shell/shell/ash.c	2010-07-25 13:09:32.000000000 +0200
-@@ -4515,6 +4515,7 @@ clear_traps(void)
- 			INT_ON;
- 		}
- 	}
-+	may_have_traps = 0;
- }
- 
- /* Lives far away from here, needed for forkchild */
-diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.right busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right
---- busybox-1.17.1/shell/ash_test/ash-signals/signal7.right	1970-01-01 01:00:00.000000000 +0100
-+++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right	2010-07-25 13:09:32.000000000 +0200
-@@ -0,0 +1 @@
-+Bug detected: 0
-diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests
---- busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests	1970-01-01 01:00:00.000000000 +0100
-+++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests	2010-07-25 13:09:32.000000000 +0200
-@@ -0,0 +1,18 @@
-+bug() {
-+	trap : exit
-+	# Bug was causing sh to be run in subshell,
-+	# as if this line is replaced with (sh -c ...; exit $?) &
-+	# here:
-+	sh -c 'echo REAL_CHILD=$$' &
-+	echo PARENTS_IDEA_OF_CHILD=$!
-+	wait  # make sure bkgd shell completes
-+}
-+
-+bug | {
-+while read varval; do
-+	eval $varval
-+done
-+test x"$REAL_CHILD" != x"" \
-+&& test x"$REAL_CHILD" = x"$PARENTS_IDEA_OF_CHILD"
-+echo "Bug detected: $?"
-+}
-diff -urpN busybox-1.17.1/shell/hush.c busybox-1.17.1-shell/shell/hush.c
---- busybox-1.17.1/shell/hush.c	2010-07-25 00:12:43.000000000 +0200
-+++ busybox-1.17.1-shell/shell/hush.c	2010-07-25 13:09:32.000000000 +0200
-@@ -3901,8 +3901,6 @@ static void insert_bg_job(struct pipe *p
- 
- 	if (G_interactive_fd)
- 		printf("[%d] %d %s\n", job->jobid, job->cmds[0].pid, job->cmdtext);
--	/* Last command's pid goes to $! */
--	G.last_bg_pid = job->cmds[job->num_cmds - 1].pid;
- 	G.last_jobid = job->jobid;
- }
- 
-@@ -4825,6 +4823,8 @@ static int run_list(struct pipe *pi)
- 				if (G.run_list_level == 1)
- 					insert_bg_job(pi);
- #endif
-+				/* Last command's pid goes to $! */
-+				G.last_bg_pid = pi->cmds[pi->num_cmds - 1].pid;
- 				G.last_exitcode = rcode = EXIT_SUCCESS;
- 				debug_printf_exec(": cmd&: exitcode EXIT_SUCCESS\n");
- 			} else {
-diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.right busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.right
---- busybox-1.17.1/shell/hush_test/hush-trap/signal7.right	1970-01-01 01:00:00.000000000 +0100
-+++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.right	2010-07-25 13:09:32.000000000 +0200
-@@ -0,0 +1 @@
-+Bug detected: 0
-diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests
---- busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests	1970-01-01 01:00:00.000000000 +0100
-+++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests	2010-07-25 13:09:32.000000000 +0200
-@@ -0,0 +1,18 @@
-+bug() {
-+	trap : exit
-+	# Bug was causing sh to be run in subshell,
-+	# as if this line is replaced with (sh -c ...; exit $?) &
-+	# here:
-+	sh -c 'echo REAL_CHILD=$$' &
-+	echo PARENTS_IDEA_OF_CHILD=$!
-+	wait  # make sure bkgd shell completes
-+}
-+
-+bug | {
-+while read varval; do
-+	eval $varval
-+done
-+test x"$REAL_CHILD" != x"" \
-+&& test x"$REAL_CHILD" = x"$PARENTS_IDEA_OF_CHILD"
-+echo "Bug detected: $?"
-+}
-diff -urpN busybox-1.17.1/shell/shell_common.c busybox-1.17.1-shell/shell/shell_common.c
---- busybox-1.17.1/shell/shell_common.c	2010-07-06 04:25:54.000000000 +0200
-+++ busybox-1.17.1-shell/shell/shell_common.c	2010-07-27 08:41:43.000000000 +0200
-@@ -428,9 +428,14 @@ shell_builtin_ulimit(char **argv)
- 						val <<= l->factor_shift;
- 					}
- //bb_error_msg("opt %c val_str:'%s' val:%lld", opt_char, val_str, (long long)val);
-+					/* from man bash: "If neither -H nor -S
-+					 * is specified, both the soft and hard
-+					 * limits are set. */
-+					if (!opts)
-+						opts = OPT_hard + OPT_soft;
- 					if (opts & OPT_hard)
- 						limit.rlim_max = val;
--					if ((opts & OPT_soft) || opts == 0)
-+					if (opts & OPT_soft)
- 						limit.rlim_cur = val;
- //bb_error_msg("setrlimit(%d, %lld, %lld)", l->cmd, (long long)limit.rlim_cur, (long long)limit.rlim_max);
- 					if (setrlimit(l->cmd, &limit) < 0) {
diff --git a/recipes/busybox/busybox-1.17.1/defconfig b/recipes/busybox/busybox-1.17.1/defconfig
deleted file mode 100644
index 5a6870c..0000000
--- a/recipes/busybox/busybox-1.17.1/defconfig
+++ /dev/null
@@ -1,873 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Busybox version: 1.13.2
-# Sun Feb  8 17:22:39 2009
-#
-CONFIG_HAVE_DOT_CONFIG=y
-
-#
-# Busybox Settings
-#
-
-#
-# General Configuration
-#
-# CONFIG_DESKTOP is not set
-# CONFIG_EXTRA_COMPAT is not set
-CONFIG_FEATURE_ASSUME_UNICODE=y
-CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
-# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
-CONFIG_SHOW_USAGE=y
-CONFIG_FEATURE_VERBOSE_USAGE=y
-CONFIG_FEATURE_COMPRESS_USAGE=y
-# CONFIG_FEATURE_INSTALLER is not set
-CONFIG_LOCALE_SUPPORT=y
-CONFIG_GETOPT_LONG=y
-CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
-CONFIG_FEATURE_PIDFILE=y
-CONFIG_FEATURE_SUID=y
-CONFIG_FEATURE_SUID_CONFIG=y
-CONFIG_FEATURE_SUID_CONFIG_QUIET=y
-# CONFIG_SELINUX is not set
-# CONFIG_FEATURE_PREFER_APPLETS is not set
-CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
-CONFIG_FEATURE_SYSLOG=y
-CONFIG_FEATURE_HAVE_RPC=y
-
-#
-# Build Options
-#
-# CONFIG_STATIC is not set
-# CONFIG_PIE is not set
-# CONFIG_NOMMU is not set
-# CONFIG_BUILD_LIBBUSYBOX is not set
-# CONFIG_FEATURE_INDIVIDUAL is not set
-# CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
-CONFIG_CROSS_COMPILER_PREFIX=""
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-# CONFIG_DEBUG_PESSIMIZE is not set
-# CONFIG_WERROR is not set
-CONFIG_NO_DEBUG_LIB=y
-# CONFIG_DMALLOC is not set
-# CONFIG_EFENCE is not set
-# CONFIG_INCLUDE_SUSv2 is not set
-
-#
-# Installation Options
-#
-# CONFIG_INSTALL_NO_USR is not set
-CONFIG_INSTALL_APPLET_SYMLINKS=y
-# CONFIG_INSTALL_APPLET_HARDLINKS is not set
-# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
-# CONFIG_INSTALL_APPLET_DONT is not set
-# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
-# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
-# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
-CONFIG_PREFIX="./_install"
-
-#
-# Busybox Library Tuning
-#
-CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=2
-CONFIG_FEATURE_FAST_TOP=y
-# CONFIG_FEATURE_ETC_NETWORKS is not set
-CONFIG_FEATURE_EDITING=y
-CONFIG_FEATURE_EDITING_MAX_LEN=1024
-# CONFIG_FEATURE_EDITING_VI is not set
-CONFIG_FEATURE_EDITING_HISTORY=64
-CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-CONFIG_FEATURE_TAB_COMPLETION=y
-CONFIG_FEATURE_USERNAME_COMPLETION=y
-CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
-CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
-CONFIG_FEATURE_COPYBUF_KB=4
-CONFIG_MONOTONIC_SYSCALL=y
-CONFIG_IOCTL_HEX2STR_ERROR=y
-CONFIG_FEATURE_HWIB=y
-
-#
-# Applets
-#
-
-#
-# Archival Utilities
-#
-# CONFIG_FEATURE_SEAMLESS_LZMA is not set
-CONFIG_FEATURE_SEAMLESS_BZ2=y
-CONFIG_FEATURE_SEAMLESS_GZ=y
-CONFIG_FEATURE_SEAMLESS_Z=y
-CONFIG_AR=y
-# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
-CONFIG_BUNZIP2=y
-# CONFIG_BZIP2 is not set
-CONFIG_CPIO=y
-# CONFIG_FEATURE_CPIO_O is not set
-# CONFIG_DPKG is not set
-# CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
-CONFIG_GUNZIP=y
-CONFIG_GZIP=y
-# CONFIG_RPM2CPIO is not set
-# CONFIG_RPM is not set
-CONFIG_TAR=y
-CONFIG_FEATURE_TAR_CREATE=y
-CONFIG_FEATURE_TAR_AUTODETECT=y
-CONFIG_FEATURE_TAR_FROM=y
-CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
-# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
-CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
-CONFIG_FEATURE_TAR_LONG_OPTIONS=y
-CONFIG_FEATURE_TAR_UNAME_GNAME=y
-# CONFIG_UNCOMPRESS is not set
-# CONFIG_UNLZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
-CONFIG_UNZIP=y
-
-#
-# Coreutils
-#
-CONFIG_BASENAME=y
-# CONFIG_CAL is not set
-CONFIG_CAT=y
-# CONFIG_CATV is not set
-CONFIG_CHGRP=y
-CONFIG_CHMOD=y
-CONFIG_CHOWN=y
-CONFIG_CHROOT=y
-# CONFIG_CKSUM is not set
-# CONFIG_COMM is not set
-CONFIG_CP=y
-CONFIG_CUT=y
-CONFIG_DATE=y
-CONFIG_FEATURE_DATE_ISOFMT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_IBS_OBS is not set
-CONFIG_DF=y
-CONFIG_FEATURE_DF_FANCY=y
-CONFIG_DIRNAME=y
-# CONFIG_DOS2UNIX is not set
-# CONFIG_UNIX2DOS is not set
-CONFIG_DU=y
-CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
-CONFIG_ECHO=y
-CONFIG_FEATURE_FANCY_ECHO=y
-CONFIG_ENV=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
-# CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
-CONFIG_EXPR=y
-# CONFIG_EXPR_MATH_SUPPORT_64 is not set
-CONFIG_FALSE=y
-# CONFIG_FOLD is not set
-CONFIG_HEAD=y
-CONFIG_FEATURE_FANCY_HEAD=y
-# CONFIG_HOSTID is not set
-CONFIG_ID=y
-# CONFIG_INSTALL is not set
-# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
-# CONFIG_LENGTH is not set
-CONFIG_LN=y
-CONFIG_LOGNAME=y
-CONFIG_LS=y
-CONFIG_FEATURE_LS_FILETYPES=y
-CONFIG_FEATURE_LS_FOLLOWLINKS=y
-CONFIG_FEATURE_LS_RECURSIVE=y
-CONFIG_FEATURE_LS_SORTFILES=y
-CONFIG_FEATURE_LS_TIMESTAMPS=y
-CONFIG_FEATURE_LS_USERNAME=y
-CONFIG_FEATURE_LS_COLOR=y
-# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
-CONFIG_MD5SUM=y
-CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
-CONFIG_MKFIFO=y
-CONFIG_MKNOD=y
-CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
-CONFIG_NICE=y
-CONFIG_NOHUP=y
-CONFIG_OD=y
-# CONFIG_PRINTENV is not set
-CONFIG_PRINTF=y
-CONFIG_PWD=y
-CONFIG_READLINK=y
-CONFIG_FEATURE_READLINK_FOLLOW=y
-CONFIG_REALPATH=y
-CONFIG_RM=y
-CONFIG_RMDIR=y
-CONFIG_FEATURE_RMDIR_LONG_OPTIONS=y
-CONFIG_SEQ=y
-# CONFIG_SHA1SUM is not set
-CONFIG_SLEEP=y
-CONFIG_FEATURE_FANCY_SLEEP=y
-CONFIG_FEATURE_FLOAT_SLEEP=y
-CONFIG_SORT=y
-CONFIG_FEATURE_SORT_BIG=y
-# CONFIG_SPLIT is not set
-# CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
-CONFIG_STTY=y
-# CONFIG_SUM is not set
-CONFIG_SYNC=y
-# CONFIG_TAC is not set
-CONFIG_TAIL=y
-CONFIG_FEATURE_FANCY_TAIL=y
-CONFIG_TEE=y
-CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
-CONFIG_TEST=y
-# CONFIG_FEATURE_TEST_64 is not set
-CONFIG_TOUCH=y
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-# CONFIG_FEATURE_TR_EQUIV is not set
-CONFIG_TRUE=y
-CONFIG_TTY=y
-CONFIG_UNAME=y
-# CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
-CONFIG_UNIQ=y
-CONFIG_USLEEP=y
-# CONFIG_UUDECODE is not set
-# CONFIG_UUENCODE is not set
-CONFIG_WC=y
-# CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
-CONFIG_WHOAMI=y
-CONFIG_YES=y
-
-#
-# Common options for cp and mv
-#
-# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
-
-#
-# Common options for ls, more and telnet
-#
-CONFIG_FEATURE_AUTOWIDTH=y
-
-#
-# Common options for df, du, ls
-#
-CONFIG_FEATURE_HUMAN_READABLE=y
-
-#
-# Common options for md5sum, sha1sum
-#
-CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
-
-#
-# Console Utilities
-#
-CONFIG_CHVT=y
-CONFIG_CLEAR=y
-CONFIG_DEALLOCVT=y
-CONFIG_DUMPKMAP=y
-# CONFIG_KBD_MODE is not set
-CONFIG_LOADFONT=y
-CONFIG_LOADKMAP=y
-CONFIG_OPENVT=y
-CONFIG_RESET=y
-# CONFIG_RESIZE is not set
-# CONFIG_FEATURE_RESIZE_PRINT is not set
-CONFIG_SETCONSOLE=y
-# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
-CONFIG_SETFONT=y
-CONFIG_FEATURE_SETFONT_TEXTUAL_MAP=y
-CONFIG_DEFAULT_SETFONT_DIR=""
-# CONFIG_SETKEYCODES is not set
-# CONFIG_SETLOGCONS is not set
-CONFIG_SHOWKEY=y
-
-#
-# Debian Utilities
-#
-CONFIG_MKTEMP=y
-# CONFIG_PIPE_PROGRESS is not set
-CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
-CONFIG_FEATURE_RUN_PARTS_FANCY=y
-CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
-CONFIG_WHICH=y
-
-#
-# Editors
-#
-CONFIG_AWK=y
-CONFIG_FEATURE_AWK_LIBM=y
-CONFIG_CMP=y
-CONFIG_DIFF=y
-CONFIG_FEATURE_DIFF_BINARY=y
-CONFIG_FEATURE_DIFF_DIR=y
-CONFIG_FEATURE_DIFF_MINIMAL=y
-# CONFIG_ED is not set
-CONFIG_PATCH=y
-CONFIG_SED=y
-CONFIG_VI=y
-CONFIG_FEATURE_VI_MAX_LEN=1024
-CONFIG_FEATURE_VI_8BIT=y
-CONFIG_FEATURE_VI_COLON=y
-CONFIG_FEATURE_VI_YANKMARK=y
-CONFIG_FEATURE_VI_SEARCH=y
-CONFIG_FEATURE_VI_USE_SIGNALS=y
-CONFIG_FEATURE_VI_DOT_CMD=y
-# CONFIG_FEATURE_VI_READONLY is not set
-# CONFIG_FEATURE_VI_SETOPTS is not set
-CONFIG_FEATURE_VI_SET=y
-CONFIG_FEATURE_VI_WIN_RESIZE=y
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
-CONFIG_FEATURE_ALLOW_EXEC=y
-
-#
-# Finding Utilities
-#
-CONFIG_FIND=y
-CONFIG_FEATURE_FIND_PRINT0=y
-CONFIG_FEATURE_FIND_MTIME=y
-CONFIG_FEATURE_FIND_MMIN=y
-CONFIG_FEATURE_FIND_PERM=y
-CONFIG_FEATURE_FIND_TYPE=y
-CONFIG_FEATURE_FIND_XDEV=y
-CONFIG_FEATURE_FIND_MAXDEPTH=y
-CONFIG_FEATURE_FIND_NEWER=y
-CONFIG_FEATURE_FIND_INUM=y
-CONFIG_FEATURE_FIND_EXEC=y
-CONFIG_FEATURE_FIND_USER=y
-CONFIG_FEATURE_FIND_GROUP=y
-CONFIG_FEATURE_FIND_NOT=y
-CONFIG_FEATURE_FIND_DEPTH=y
-CONFIG_FEATURE_FIND_PAREN=y
-CONFIG_FEATURE_FIND_SIZE=y
-CONFIG_FEATURE_FIND_PRUNE=y
-CONFIG_FEATURE_FIND_DELETE=y
-CONFIG_FEATURE_FIND_PATH=y
-CONFIG_FEATURE_FIND_REGEX=y
-# CONFIG_FEATURE_FIND_CONTEXT is not set
-CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
-CONFIG_FEATURE_GREP_CONTEXT=y
-CONFIG_XARGS=y
-# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
-CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
-CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
-CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
-
-#
-# Init Utilities
-#
-CONFIG_INIT=y
-CONFIG_FEATURE_USE_INITTAB=y
-CONFIG_FEATURE_KILL_REMOVED=y
-CONFIG_FEATURE_KILL_DELAY=0
-# CONFIG_FEATURE_INIT_SCTTY is not set
-# CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_FEATURE_INITRD=y
-CONFIG_HALT=y
-# CONFIG_MESG is not set
-
-#
-# Login/Password Management Utilities
-#
-CONFIG_FEATURE_SHADOWPASSWDS=y
-# CONFIG_USE_BB_PWD_GRP is not set
-# CONFIG_USE_BB_SHADOW is not set
-CONFIG_USE_BB_CRYPT=y
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDUSER_TO_GROUP=y
-CONFIG_DELGROUP=y
-CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
-CONFIG_FEATURE_CHECK_NAMES=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_DELUSER=y
-CONFIG_GETTY=y
-CONFIG_FEATURE_UTMP=y
-CONFIG_FEATURE_WTMP=y
-CONFIG_LOGIN=y
-# CONFIG_PAM is not set
-CONFIG_LOGIN_SCRIPTS=y
-CONFIG_FEATURE_NOLOGIN=y
-CONFIG_FEATURE_SECURETTY=y
-CONFIG_PASSWD=y
-CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-CONFIG_CRYPTPW=y
-CONFIG_CHPASSWD=y
-CONFIG_SU=y
-CONFIG_FEATURE_SU_SYSLOG=y
-CONFIG_FEATURE_SU_CHECKS_SHELLS=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
-
-#
-# Linux Ext2 FS Progs
-#
-CONFIG_CHATTR=y
-CONFIG_FSCK=y
-# CONFIG_LSATTR is not set
-
-#
-# Linux Module Utilities
-#
-CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
-CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
-# CONFIG_MODPROBE_SMALL is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
-CONFIG_INSMOD=y
-CONFIG_RMMOD=y
-CONFIG_LSMOD=y
-CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
-CONFIG_MODPROBE=y
-CONFIG_FEATURE_MODPROBE_BLACKLIST=y
-# CONFIG_DEPMOD is not set
-
-#
-# Options common to multiple modutils
-#
-# CONFIG_FEATURE_2_4_MODULES is not set
-# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
-# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
-# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
-CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
-CONFIG_FEATURE_MODUTILS_ALIAS=y
-CONFIG_FEATURE_MODUTILS_SYMBOLS=y
-
-#
-# Linux System Utilities
-#
-CONFIG_BLKID=y
-CONFIG_DMESG=y
-CONFIG_FEATURE_DMESG_PRETTY=y
-CONFIG_FBSET=y
-CONFIG_FEATURE_FBSET_FANCY=y
-CONFIG_FEATURE_FBSET_READMODE=y
-# CONFIG_FDFLUSH is not set
-# CONFIG_FDFORMAT is not set
-CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
-CONFIG_FEATURE_FDISK_WRITABLE=y
-# CONFIG_FEATURE_AIX_LABEL is not set
-# CONFIG_FEATURE_SGI_LABEL is not set
-# CONFIG_FEATURE_SUN_LABEL is not set
-CONFIG_FEATURE_OSF_LABEL=y
-CONFIG_FEATURE_FDISK_ADVANCED=y
-# CONFIG_FINDFS is not set
-CONFIG_FREERAMDISK=y
-CONFIG_FSCK_MINIX=y
-CONFIG_MKFS_MINIX=y
-
-#
-# Minix filesystem support
-#
-CONFIG_FEATURE_MINIX2=y
-CONFIG_GETOPT=y
-CONFIG_HEXDUMP=y
-# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
-# CONFIG_HD is not set
-CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
-CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
-# CONFIG_IPCRM is not set
-# CONFIG_IPCS is not set
-CONFIG_LOSETUP=y
-CONFIG_MDEV=y
-CONFIG_FEATURE_MDEV_CONF=y
-CONFIG_FEATURE_MDEV_RENAME=y
-CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
-CONFIG_FEATURE_MDEV_EXEC=y
-CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
-CONFIG_MKSWAP=y
-# CONFIG_FEATURE_MKSWAP_V0 is not set
-CONFIG_MORE=y
-CONFIG_FEATURE_USE_TERMIOS=y
-CONFIG_VOLUMEID=y
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-CONFIG_FEATURE_MOUNT_VERBOSE=y
-CONFIG_FEATURE_MOUNT_HELPERS=y
-CONFIG_FEATURE_MOUNT_LABEL=y
-CONFIG_FEATURE_MOUNT_NFS=y
-CONFIG_FEATURE_MOUNT_CIFS=y
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
-CONFIG_PIVOT_ROOT=y
-CONFIG_RDATE=y
-CONFIG_RDEV=y
-CONFIG_READPROFILE=y
-CONFIG_RTCWAKE=y
-# CONFIG_SCRIPT is not set
-# CONFIG_SETARCH is not set
-CONFIG_SWAPONOFF=y
-# CONFIG_FEATURE_SWAPON_PRI is not set
-CONFIG_SWITCH_ROOT=y
-CONFIG_UMOUNT=y
-CONFIG_FEATURE_UMOUNT_ALL=y
-
-#
-# Common options for mount/umount
-#
-CONFIG_FEATURE_MOUNT_LOOP=y
-# CONFIG_FEATURE_MTAB_SUPPORT is not set
-
-#
-# Miscellaneous Utilities
-#
-# CONFIG_ADJTIMEX is not set
-# CONFIG_BBCONFIG is not set
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-# CONFIG_CHRT is not set
-# CONFIG_CROND is not set
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-# CONFIG_CRONTAB is not set
-CONFIG_DC=y
-CONFIG_FEATURE_DC_LIBM=y
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
-# CONFIG_FEATURE_EJECT_SCSI is not set
-CONFIG_FBSPLASH=y
-# CONFIG_INOTIFYD is not set
-CONFIG_LAST=y
-CONFIG_FEATURE_LAST_SMALL=y
-# CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_MARKS is not set
-# CONFIG_FEATURE_LESS_REGEXP is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_HDPARM is not set
-# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
-CONFIG_MAKEDEVS=y
-# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
-CONFIG_FEATURE_MAKEDEVS_TABLE=y
-# CONFIG_MAN is not set
-CONFIG_MICROCOM=y
-# CONFIG_MOUNTPOINT is not set
-# CONFIG_MT is not set
-# CONFIG_RAIDAUTORUN is not set
-CONFIG_READAHEAD=y
-# CONFIG_RUNLEVEL is not set
-# CONFIG_RX is not set
-# CONFIG_SETSID is not set
-CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
-CONFIG_TIME=y
-# CONFIG_TTYSIZE is not set
-# CONFIG_WATCHDOG is not set
-
-#
-# Networking Utilities
-#
-CONFIG_FEATURE_IPV6=y
-CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
-# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
-# CONFIG_ARPING is not set
-# CONFIG_BRCTL is not set
-# CONFIG_FEATURE_BRCTL_FANCY is not set
-# CONFIG_FEATURE_BRCTL_SHOW is not set
-# CONFIG_DNSD is not set
-# CONFIG_ETHER_WAKE is not set
-# CONFIG_FAKEIDENTD is not set
-# CONFIG_FTPGET is not set
-# CONFIG_FTPPUT is not set
-# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
-CONFIG_HOSTNAME=y
-CONFIG_HTTPD=y
-CONFIG_FEATURE_HTTPD_RANGES=y
-CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
-CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP=y
-CONFIG_FEATURE_HTTPD_SETUID=y
-CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
-CONFIG_FEATURE_HTTPD_AUTH_MD5=y
-CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES=y
-CONFIG_FEATURE_HTTPD_CGI=y
-CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
-CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
-CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
-CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
-CONFIG_FEATURE_HTTPD_PROXY=y
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
-# CONFIG_FEATURE_IFCONFIG_SLIP is not set
-# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-CONFIG_FEATURE_IFCONFIG_HW=y
-CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
-# CONFIG_IFENSLAVE is not set
-CONFIG_IFUPDOWN=y
-CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
-# CONFIG_FEATURE_IFUPDOWN_IP is not set
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
-CONFIG_FEATURE_IFUPDOWN_IPV4=y
-CONFIG_FEATURE_IFUPDOWN_IPV6=y
-CONFIG_FEATURE_IFUPDOWN_MAPPING=y
-# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
-# CONFIG_FEATURE_INETD_RPC is not set
-CONFIG_IP=y
-CONFIG_FEATURE_IP_ADDRESS=y
-CONFIG_FEATURE_IP_LINK=y
-CONFIG_FEATURE_IP_ROUTE=y
-CONFIG_FEATURE_IP_TUNNEL=y
-# CONFIG_FEATURE_IP_RULE is not set
-# CONFIG_FEATURE_IP_SHORT_FORMS is not set
-# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-# CONFIG_IPADDR is not set
-# CONFIG_IPLINK is not set
-# CONFIG_IPROUTE is not set
-# CONFIG_IPTUNNEL is not set
-# CONFIG_IPRULE is not set
-# CONFIG_IPCALC is not set
-# CONFIG_FEATURE_IPCALC_FANCY is not set
-# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-# CONFIG_NAMEIF is not set
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-CONFIG_NC=y
-CONFIG_NC_SERVER=y
-CONFIG_NC_EXTRA=y
-CONFIG_NETSTAT=y
-CONFIG_FEATURE_NETSTAT_WIDE=y
-CONFIG_FEATURE_NETSTAT_PRG=y
-CONFIG_NSLOOKUP=y
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
-# CONFIG_PSCAN is not set
-CONFIG_ROUTE=y
-# CONFIG_SLATTACH is not set
-CONFIG_TELNET=y
-# CONFIG_FEATURE_TELNET_TTYPE is not set
-CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-CONFIG_TELNETD=y
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
-CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
-CONFIG_FEATURE_TFTP_GET=y
-CONFIG_FEATURE_TFTP_PUT=y
-# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
-# CONFIG_TFTP_DEBUG is not set
-CONFIG_TRACEROUTE=y
-CONFIG_FEATURE_TRACEROUTE_VERBOSE=y
-CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=y
-CONFIG_FEATURE_TRACEROUTE_USE_ICMP=y
-CONFIG_UDHCPD=y
-CONFIG_DHCPRELAY=y
-CONFIG_DUMPLEASES=y
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
-CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
-CONFIG_UDHCPC=y
-CONFIG_FEATURE_UDHCPC_ARPING=y
-# CONFIG_FEATURE_UDHCP_PORT is not set
-# CONFIG_UDHCP_DEBUG is not set
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="@DATADIR@/udhcpc/default.script"
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-# CONFIG_VCONFIG is not set
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-# CONFIG_ZCIP is not set
-# CONFIG_TCPSVD is not set
-# CONFIG_UDPSVD is not set
-
-#
-# Print Utilities
-#
-# CONFIG_LPD is not set
-# CONFIG_LPR is not set
-# CONFIG_LPQ is not set
-
-#
-# Mail Utilities
-#
-# CONFIG_MAKEMIME is not set
-CONFIG_FEATURE_MIME_CHARSET=""
-# CONFIG_POPMAILDIR is not set
-# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
-# CONFIG_REFORMIME is not set
-# CONFIG_FEATURE_REFORMIME_COMPAT is not set
-# CONFIG_SENDMAIL is not set
-# CONFIG_FEATURE_SENDMAIL_MAILX is not set
-# CONFIG_FEATURE_SENDMAIL_MAILXX is not set
-
-#
-# Process Utilities
-#
-CONFIG_FREE=y
-CONFIG_FUSER=y
-CONFIG_KILL=y
-CONFIG_KILLALL=y
-# CONFIG_KILLALL5 is not set
-# CONFIG_NMETER is not set
-# CONFIG_PGREP is not set
-CONFIG_PIDOF=y
-CONFIG_FEATURE_PIDOF_SINGLE=y
-CONFIG_FEATURE_PIDOF_OMIT=y
-# CONFIG_PKILL is not set
-CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
-CONFIG_RENICE=y
-CONFIG_BB_SYSCTL=y
-CONFIG_TOP=y
-CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
-CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
-# CONFIG_FEATURE_TOP_SMP_CPU is not set
-# CONFIG_FEATURE_TOP_DECIMALS is not set
-# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
-# CONFIG_FEATURE_TOPMEM is not set
-CONFIG_UPTIME=y
-CONFIG_WATCH=y
-
-#
-# Runit Utilities
-#
-# CONFIG_RUNSV is not set
-# CONFIG_RUNSVDIR is not set
-# CONFIG_FEATURE_RUNSVDIR_LOG is not set
-# CONFIG_SV is not set
-CONFIG_SV_DEFAULT_SERVICE_DIR=""
-# CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
-# CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
-# CONFIG_GETENFORCE is not set
-# CONFIG_GETSEBOOL is not set
-# CONFIG_LOAD_POLICY is not set
-# CONFIG_MATCHPATHCON is not set
-# CONFIG_RESTORECON is not set
-# CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
-# CONFIG_SELINUXENABLED is not set
-# CONFIG_SETENFORCE is not set
-# CONFIG_SETFILES is not set
-# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
-# CONFIG_SETSEBOOL is not set
-# CONFIG_SESTATUS is not set
-
-#
-# Shells
-#
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_MSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
-CONFIG_ASH=y
-
-#
-# Ash Shell Options
-#
-CONFIG_ASH_BASH_COMPAT=y
-CONFIG_ASH_JOB_CONTROL=y
-CONFIG_ASH_READ_NCHARS=y
-CONFIG_ASH_READ_TIMEOUT=y
-CONFIG_ASH_ALIAS=y
-CONFIG_ASH_MATH_SUPPORT=y
-# CONFIG_ASH_MATH_SUPPORT_64 is not set
-CONFIG_ASH_GETOPTS=y
-CONFIG_ASH_BUILTIN_ECHO=y
-CONFIG_ASH_BUILTIN_PRINTF=y
-CONFIG_ASH_BUILTIN_TEST=y
-# CONFIG_ASH_CMDCMD is not set
-# CONFIG_ASH_MAIL is not set
-# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_ASH_RANDOM_SUPPORT is not set
-CONFIG_ASH_EXPAND_PRMT=y
-# CONFIG_HUSH is not set
-# CONFIG_HUSH_HELP is not set
-# CONFIG_HUSH_INTERACTIVE is not set
-# CONFIG_HUSH_JOB is not set
-# CONFIG_HUSH_TICK is not set
-# CONFIG_HUSH_IF is not set
-# CONFIG_HUSH_LOOPS is not set
-# CONFIG_HUSH_CASE is not set
-# CONFIG_LASH is not set
-# CONFIG_MSH is not set
-
-#
-# Bourne Shell Options
-#
-CONFIG_FEATURE_SH_EXTRA_QUIET=y
-# CONFIG_FEATURE_SH_STANDALONE is not set
-# CONFIG_FEATURE_SH_NOFORK is not set
-# CONFIG_CTTYHACK is not set
-
-#
-# System Logging Utilities
-#
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-CONFIG_FEATURE_SYSLOGD_DUP=y
-CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
-CONFIG_LOGREAD=y
-CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
-CONFIG_KLOGD=y
-CONFIG_LOGGER=y
diff --git a/recipes/busybox/busybox-1.17.1/fdisk_nios2.patch b/recipes/busybox/busybox-1.17.1/fdisk_nios2.patch
deleted file mode 100644
index 648e68e..0000000
--- a/recipes/busybox/busybox-1.17.1/fdisk_nios2.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: busybox-1.15.3/util-linux/fdisk_osf.c
-===================================================================
---- busybox-1.15.3.orig/util-linux/fdisk_osf.c
-+++ busybox-1.15.3/util-linux/fdisk_osf.c
-@@ -44,7 +44,7 @@
- #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
- 
- #if defined(i386) || defined(__sparc__) || defined(__arm__) \
-- || defined(__m68k__) || defined(__mips__) || defined(__s390__) \
-+ || defined(__m68k__) || defined(__mips__) || defined(__nios2__) \
-  || defined(__s390__) || defined(__s390x__) \
-  || defined(__sh__) || defined(__x86_64__) || defined(__avr32__)
- # define BSD_LABELSECTOR   1
diff --git a/recipes/busybox/busybox-1.17.1/get_header_tar.patch b/recipes/busybox/busybox-1.17.1/get_header_tar.patch
deleted file mode 100644
index 0121cd1..0000000
--- a/recipes/busybox/busybox-1.17.1/get_header_tar.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.13.2/archival/libunarchive/get_header_tar.c.orig	2008-11-09 18:28:02.000000000 +0100
-+++ busybox-1.13.2/archival/libunarchive/get_header_tar.c	2009-02-11 22:34:52.000000000 +0100
-@@ -252,6 +252,8 @@
- 			file_header->name = concat_path_file(tar.prefix, tar.name);
- 		} else
- 			file_header->name = xstrdup(tar.name);
-+		if (strlen(file_header->name) > 100) 
-+			file_header->name[100] = 0;
- 	}
- 
- 	/* Set bits 12-15 of the files mode */
diff --git a/recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch b/recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch
deleted file mode 100644
index 3b975b6..0000000
--- a/recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Index: busybox-1.15.1/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-16 22:52:09.000000000 +0200
-+++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:57:11.424608476 +0200
-@@ -10,10 +10,17 @@ NETMASK=""
- BROADCAST="broadcast +"
- [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
- 
-+# return 0 if root is mounted on a network filesystem
-+root_is_nfs() {
-+	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
-+}
-+
- case "$1" in
- 	deconfig)
-+		if ! root_is_nfs ; then
- 		echo "Setting IP address 0.0.0.0 on $interface"
--		ifconfig $interface 0.0.0.0
-+			ifconfig $interface 0.0.0.0
-+		fi
- 		;;
- 
- 	renew|bound)
-@@ -21,15 +28,18 @@ case "$1" in
- 		ifconfig $interface $ip $NETMASK $BROADCAST
- 
- 		if [ -n "$router" ] ; then
--			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
--				:
--			done
-+			if ! root_is_nfs ; then
-+				echo "Deleting routers"
-+				while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
-+					:
-+				done
-+			:
-+		done
- 
- 			metric=0
- 			for i in $router ; do
- 				echo "Adding router $i"
--				route add default gw $i dev $interface metric $((metric++))
-+				route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
- 			done
- 		fi
- 
diff --git a/recipes/busybox/busybox-1.17.1/udhcpscript.patch b/recipes/busybox/busybox-1.17.1/udhcpscript.patch
deleted file mode 100644
index 2ffba95..0000000
--- a/recipes/busybox/busybox-1.17.1/udhcpscript.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: busybox-1.15.1/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-12 17:55:36.000000000 +0200
-+++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:51:06.599693412 +0200
-@@ -22,7 +22,7 @@ case "$1" in
- 
- 		if [ -n "$router" ] ; then
- 			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface ; do
-+			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
- 				:
- 			done
- 
diff --git a/recipes/busybox/busybox_1.17.1.bb b/recipes/busybox/busybox_1.17.1.bb
deleted file mode 100644
index 12976f2..0000000
--- a/recipes/busybox/busybox_1.17.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require busybox_1.1x.inc
-PR = "${INC_PR}.0"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI += "\
-  file://busybox-1.17.1-grep.patch \
-  file://busybox-1.17.1-make.patch \
-  file://busybox-1.17.1-mdev.patch \
-  file://busybox-1.17.1-mktemp.patch \
-  file://busybox-1.17.1-sed.patch \
-  file://busybox-1.17.1-shell.patch \
-"
-
-SRC_URI[md5sum] = "c7fe7533b7fc4018b0b49a05ee0ee601"
-SRC_URI[sha256sum] = "bf9177810d7e151b0e662477c33b9afd062570e6298ec46f2a8397a6a839d164"
-- 
1.6.3.3



