Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS3-0007Ef-Ly
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:33 +0200
Received: (qmail 2169 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:45 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:38 +0200
Message-Id: <1288387543-1277-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288387543-1277-1-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295589621277896010
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/7] busybox-1.17.1: add fixes from upstream
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.17.1/busybox-1.17.1-grep.patch       |   39 +++++++
 .../busybox-1.17.1/busybox-1.17.1-make.patch       |   32 ++++++
 .../busybox-1.17.1/busybox-1.17.1-mdev.patch       |   49 ++++++++
 .../busybox-1.17.1/busybox-1.17.1-mktemp.patch     |   12 ++
 .../busybox-1.17.1/busybox-1.17.1-sed.patch        |  117 ++++++++++++++++++++
 .../busybox-1.17.1/busybox-1.17.1-shell.patch      |  105 ++++++++++++++++++
 recipes/busybox/busybox_1.17.1.bb                  |    9 ++
 7 files changed, 363 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
 create mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch

diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
new file mode 100644
index 0000000..f8fc25d
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
@@ -0,0 +1,39 @@
+diff -urpN busybox-1.17.1/findutils/grep.c busybox-1.17.1-grep/findutils/grep.c
+--- busybox-1.17.1/findutils/grep.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-grep/findutils/grep.c	2010-08-23 02:37:08.000000000 +0200
+@@ -461,15 +461,19 @@ static int grep_file(FILE *file)
+ 						if (found)
+ 							print_line(gl->pattern, strlen(gl->pattern), linenum, ':');
+ 					} else while (1) {
++						unsigned start = gl->matched_range.rm_so;
+ 						unsigned end = gl->matched_range.rm_eo;
++						unsigned len = end - start;
+ 						char old = line[end];
+ 						line[end] = '\0';
+-						print_line(line + gl->matched_range.rm_so,
+-								end - gl->matched_range.rm_so,
+-								linenum, ':');
++						/* Empty match is not printed: try "echo test | grep -o ''" */
++						if (len != 0)
++							print_line(line + start, len, linenum, ':');
+ 						if (old == '\0')
+ 							break;
+ 						line[end] = old;
++						if (len == 0)
++							end++;
+ #if !ENABLE_EXTRA_COMPAT
+ 						if (regexec(&gl->compiled_regex, line + end,
+ 								1, &gl->matched_range, REG_NOTBOL) != 0)
+diff -urpN busybox-1.17.1/testsuite/grep.tests busybox-1.17.1-grep/testsuite/grep.tests
+--- busybox-1.17.1/testsuite/grep.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-grep/testsuite/grep.tests	2010-08-23 02:37:08.000000000 +0200
+@@ -98,5 +98,9 @@ testing "grep -o does not loop forever" 
+ 	'grep -o "[^/]*$"' \
+ 	"test\n" \
+ 	"" "/var/test\n"
++testing "grep -o does not loop forever on zero-length match" \
++	'grep -o "" | head -n1' \
++	"" \
++	"" "test\n"
+ 
+ exit $FAILCOUNT
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
new file mode 100644
index 0000000..6177696
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
@@ -0,0 +1,32 @@
+diff -urpN busybox-1.17.1/Makefile busybox-1.17.1-make/Makefile
+--- busybox-1.17.1/Makefile	2010-07-25 00:13:44.000000000 +0200
++++ busybox-1.17.1-make/Makefile	2010-08-22 09:30:33.000000000 +0200
+@@ -433,7 +433,12 @@ ifeq ($(config-targets),1)
+ -include $(srctree)/arch/$(ARCH)/Makefile
+ export KBUILD_DEFCONFIG
+ 
+-config %config: scripts_basic outputmakefile gen_build_files FORCE
++config: scripts_basic outputmakefile gen_build_files FORCE
++	$(Q)mkdir -p include
++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
++	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
++
++%config: scripts_basic outputmakefile gen_build_files FORCE
+ 	$(Q)mkdir -p include
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
+@@ -1285,9 +1290,13 @@ endif
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++%/: prepare scripts FORCE
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
++/: prepare scripts FORCE
++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
++	$(build)=$(build-dir)
++
+ %.ko: prepare scripts FORCE
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
+ 	$(build)=$(build-dir) $(@:.ko=.o)
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
new file mode 100644
index 0000000..71c7abd
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
@@ -0,0 +1,49 @@
+diff -urpN busybox-1.17.1/testsuite/mdev.tests busybox-1.17.1-mdev/testsuite/mdev.tests
+--- busybox-1.17.1/testsuite/mdev.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-mdev/testsuite/mdev.tests	2010-08-23 02:38:21.000000000 +0200
+@@ -38,6 +38,16 @@ brw-rw---- 1 0 0 8,0 sda
+ SKIP=
+ 
+ # continuing to use directory structure from prev test
++optional STATIC FEATURE_MDEV_CONF FEATURE_LS_TIMESTAMPS FEATURE_LS_USERNAME
++testing "mdev deletes /block/sda" \
++	"env - PATH=$PATH ACTION=remove DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
++	ls -ln mdev.testdir/dev | $FILTER_LS" \
++"\
++" \
++	"" ""
++SKIP=
++
++# continuing to use directory structure from prev test
+ rm -rf mdev.testdir/dev/*
+ echo ".* 1:1 666" >mdev.testdir/etc/mdev.conf
+ echo "sda 2:2 444" >>mdev.testdir/etc/mdev.conf
+diff -urpN busybox-1.17.1/util-linux/mdev.c busybox-1.17.1-mdev/util-linux/mdev.c
+--- busybox-1.17.1/util-linux/mdev.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-mdev/util-linux/mdev.c	2010-08-23 02:38:21.000000000 +0200
+@@ -132,6 +132,7 @@ static void make_device(char *path, int 
+ 			major = -1;
+ 		}
+ 	}
++	/* else: for delete, -1 still deletes the node, but < -1 suppresses that */
+ 
+ 	/* Determine device name, type, major and minor */
+ 	device_name = (char*) bb_basename(path);
+@@ -279,7 +280,7 @@ static void make_device(char *path, int 
+ 				if (aliaslink == '!' && s == a+1) {
+ 					val = st;
+ 					/* "!": suppress node creation/deletion */
+-					major = -1;
++					major = -2;
+ 				}
+ 				else if (aliaslink == '>' || aliaslink == '=') {
+ 					val = st;
+@@ -379,7 +380,7 @@ static void make_device(char *path, int 
+ 				free(command);
+ 			}
+ 
+-			if (delete && major >= 0) {
++			if (delete && major >= -1) {
+ 				if (ENABLE_FEATURE_MDEV_RENAME && alias) {
+ 					if (aliaslink == '>')
+ 						unlink(device_name);
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
new file mode 100644
index 0000000..557e337
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.1/debianutils/mktemp.c busybox-1.17.1-mktemp/debianutils/mktemp.c
+--- busybox-1.17.1/debianutils/mktemp.c	2010-07-25 00:12:56.000000000 +0200
++++ busybox-1.17.1-mktemp/debianutils/mktemp.c	2010-07-27 08:21:26.000000000 +0200
+@@ -50,7 +50,7 @@ int mktemp_main(int argc UNUSED_PARAM, c
+ 	opts = getopt32(argv, "dqtp:", &path);
+ 
+ 	chp = argv[optind] ? argv[optind] : xstrdup("tmp.XXXXXX");
+-	if (chp[0] != '/' || (opts & 8))
++	if (!strchr(chp, '/') || (opts & 8))
+ 		chp = concat_path_file(path, chp);
+ 
+ 	if (opts & 1) { /* -d */
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
new file mode 100644
index 0000000..f65aebe
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
@@ -0,0 +1,117 @@
+diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
+--- busybox-1.17.1/editors/sed.c	2010-07-06 04:25:53.000000000 +0200
++++ busybox-1.17.1-sed/editors/sed.c	2010-08-17 02:05:27.000000000 +0200
+@@ -61,6 +61,10 @@
+ #include "libbb.h"
+ #include "xregex.h"
+ 
++enum {
++	OPT_in_place = 1 << 0,
++};
++
+ /* Each sed command turns into one of these structures. */
+ typedef struct sed_cmd_s {
+ 	/* Ordered by alignment requirements: currently 36 bytes on x86 */
+@@ -938,8 +942,11 @@ static void process_files(void)
+ 
+ 		if (matched) {
+ 			/* once matched, "n,xxx" range is dead, disabling it */
+-			if (sed_cmd->beg_line > 0)
++			if (sed_cmd->beg_line > 0
++			 && !(option_mask32 & OPT_in_place) /* but not for -i */
++			) {
+ 				sed_cmd->beg_line = -2;
++			}
+ 			sed_cmd->in_match = !(
+ 				/* has the ending line come, or is this a single address command? */
+ 				(sed_cmd->end_line ?
+@@ -985,6 +992,8 @@ static void process_files(void)
+ 		}
+ 
+ 		/* actual sedding */
++		//bb_error_msg("pattern_space:'%s' next_line:'%s' cmd:%c",
++		//pattern_space, next_line, sed_cmd->cmd);
+ 		switch (sed_cmd->cmd) {
+ 
+ 		/* Print line number */
+@@ -1111,10 +1120,16 @@ static void process_files(void)
+ 		{
+ 			int len;
+ 			/* If no next line, jump to end of script and exit. */
++			/* http://www.gnu.org/software/sed/manual/sed.html:
++			 * "Most versions of sed exit without printing anything
++			 * when the N command is issued on the last line of
++			 * a file. GNU sed prints pattern space before exiting
++			 * unless of course the -n command switch has been
++			 * specified. This choice is by design."
++			 */
+ 			if (next_line == NULL) {
+-				free(next_line);
+-				next_line = NULL;
+-				goto discard_line;
++				//goto discard_line;
++				goto discard_commands; /* GNU behavior */
+ 			}
+ 			/* Append next_line, read new next_line. */
+ 			len = strlen(pattern_space);
+@@ -1270,9 +1285,6 @@ static void add_cmd_block(char *cmdstr)
+ int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int sed_main(int argc UNUSED_PARAM, char **argv)
+ {
+-	enum {
+-		OPT_in_place = 1 << 0,
+-	};
+ 	unsigned opt;
+ 	llist_t *opt_e, *opt_f;
+ 	int status = EXIT_SUCCESS;
+@@ -1292,6 +1304,7 @@ int sed_main(int argc UNUSED_PARAM, char
+ 	opt_e = opt_f = NULL;
+ 	opt_complementary = "e::f::" /* can occur multiple times */
+ 	                    "nn"; /* count -n */
++	/* -i must be first, to match OPT_in_place definition */
+ 	opt = getopt32(argv, "irne:f:", &opt_e, &opt_f,
+ 			    &G.be_quiet); /* counter for -n */
+ 	//argc -= optind;
+diff -urpN busybox-1.17.1/testsuite/sed.tests busybox-1.17.1-sed/testsuite/sed.tests
+--- busybox-1.17.1/testsuite/sed.tests	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-sed/testsuite/sed.tests	2010-08-17 02:05:27.000000000 +0200
+@@ -80,10 +80,18 @@ test x"$SKIP_KNOWN_BUGS" = x"" && {
+ # Query: how does this interact with no newline at EOF?
+ testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'" \
+ 	"a\nb\nb\nc\n" "" "a\nb\nc\n"
+-# N does _not_ flush pattern space, therefore c is still in there @ script end.
+-testing "sed N (doesn't flush pattern space when terminating)" "sed -e 'N;p'" \
+-	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
+ }
++# non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ script end
++# GNU sed: N flushes pattern space, therefore c is printed too @ script end
++testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
++	"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
++
++testing "sed N test2" "sed ':a;N;s/\n/ /;ta'" \
++	"a b c\n" "" "a\nb\nc\n"
++
++testing "sed N test3" "sed 'N;s/\n/ /'" \
++	"a b\nc\n" "" "a\nb\nc\n"
++
+ testing "sed address match newline" 'sed "/b/N;/b\\nc/i woo"' \
+ 	"a\nwoo\nb\nc\nd\n" "" "a\nb\nc\nd\n"
+ 
+@@ -270,11 +278,16 @@ testing "sed a cmd ended by double backs
+ 	| two \\
+ '
+ 
+-# fisrt three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
++# first three lines are deleted; 4th line is matched and printed by "2,3" and by "4" ranges
+ testing "sed with N skipping lines past ranges on next cmds" \
+ 	"sed -n '1{N;N;d};1p;2,3p;3p;4p'" \
+ 	"4\n4\n" "" "1\n2\n3\n4\n"
+ 
++testing "sed -i with address modifies all files, not only first" \
++	"cp input input2; sed -i -e '1s/foo/bar/' input input2 && cat input input2; rm input2" \
++	"bar\nbar\n" "foo\n" ""
++
++
+ # testing "description" "arguments" "result" "infile" "stdin"
+ 
+ exit $FAILCOUNT
diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
new file mode 100644
index 0000000..5279b12
--- /dev/null
+++ b/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
@@ -0,0 +1,105 @@
+diff -urpN busybox-1.17.1/shell/ash.c busybox-1.17.1-shell/shell/ash.c
+--- busybox-1.17.1/shell/ash.c	2010-07-25 00:12:43.000000000 +0200
++++ busybox-1.17.1-shell/shell/ash.c	2010-07-25 13:09:32.000000000 +0200
+@@ -4515,6 +4515,7 @@ clear_traps(void)
+ 			INT_ON;
+ 		}
+ 	}
++	may_have_traps = 0;
+ }
+ 
+ /* Lives far away from here, needed for forkchild */
+diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.right busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right
+--- busybox-1.17.1/shell/ash_test/ash-signals/signal7.right	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right	2010-07-25 13:09:32.000000000 +0200
+@@ -0,0 +1 @@
++Bug detected: 0
+diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests
+--- busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests	2010-07-25 13:09:32.000000000 +0200
+@@ -0,0 +1,18 @@
++bug() {
++	trap : exit
++	# Bug was causing sh to be run in subshell,
++	# as if this line is replaced with (sh -c ...; exit $?) &
++	# here:
++	sh -c 'echo REAL_CHILD=$$' &
++	echo PARENTS_IDEA_OF_CHILD=$!
++	wait  # make sure bkgd shell completes
++}
++
++bug | {
++while read varval; do
++	eval $varval
++done
++test x"$REAL_CHILD" != x"" \
++&& test x"$REAL_CHILD" = x"$PARENTS_IDEA_OF_CHILD"
++echo "Bug detected: $?"
++}
+diff -urpN busybox-1.17.1/shell/hush.c busybox-1.17.1-shell/shell/hush.c
+--- busybox-1.17.1/shell/hush.c	2010-07-25 00:12:43.000000000 +0200
++++ busybox-1.17.1-shell/shell/hush.c	2010-07-25 13:09:32.000000000 +0200
+@@ -3901,8 +3901,6 @@ static void insert_bg_job(struct pipe *p
+ 
+ 	if (G_interactive_fd)
+ 		printf("[%d] %d %s\n", job->jobid, job->cmds[0].pid, job->cmdtext);
+-	/* Last command's pid goes to $! */
+-	G.last_bg_pid = job->cmds[job->num_cmds - 1].pid;
+ 	G.last_jobid = job->jobid;
+ }
+ 
+@@ -4825,6 +4823,8 @@ static int run_list(struct pipe *pi)
+ 				if (G.run_list_level == 1)
+ 					insert_bg_job(pi);
+ #endif
++				/* Last command's pid goes to $! */
++				G.last_bg_pid = pi->cmds[pi->num_cmds - 1].pid;
+ 				G.last_exitcode = rcode = EXIT_SUCCESS;
+ 				debug_printf_exec(": cmd&: exitcode EXIT_SUCCESS\n");
+ 			} else {
+diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.right busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.right
+--- busybox-1.17.1/shell/hush_test/hush-trap/signal7.right	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.right	2010-07-25 13:09:32.000000000 +0200
+@@ -0,0 +1 @@
++Bug detected: 0
+diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests
+--- busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests	1970-01-01 01:00:00.000000000 +0100
++++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests	2010-07-25 13:09:32.000000000 +0200
+@@ -0,0 +1,18 @@
++bug() {
++	trap : exit
++	# Bug was causing sh to be run in subshell,
++	# as if this line is replaced with (sh -c ...; exit $?) &
++	# here:
++	sh -c 'echo REAL_CHILD=$$' &
++	echo PARENTS_IDEA_OF_CHILD=$!
++	wait  # make sure bkgd shell completes
++}
++
++bug | {
++while read varval; do
++	eval $varval
++done
++test x"$REAL_CHILD" != x"" \
++&& test x"$REAL_CHILD" = x"$PARENTS_IDEA_OF_CHILD"
++echo "Bug detected: $?"
++}
+diff -urpN busybox-1.17.1/shell/shell_common.c busybox-1.17.1-shell/shell/shell_common.c
+--- busybox-1.17.1/shell/shell_common.c	2010-07-06 04:25:54.000000000 +0200
++++ busybox-1.17.1-shell/shell/shell_common.c	2010-07-27 08:41:43.000000000 +0200
+@@ -428,9 +428,14 @@ shell_builtin_ulimit(char **argv)
+ 						val <<= l->factor_shift;
+ 					}
+ //bb_error_msg("opt %c val_str:'%s' val:%lld", opt_char, val_str, (long long)val);
++					/* from man bash: "If neither -H nor -S
++					 * is specified, both the soft and hard
++					 * limits are set. */
++					if (!opts)
++						opts = OPT_hard + OPT_soft;
+ 					if (opts & OPT_hard)
+ 						limit.rlim_max = val;
+-					if ((opts & OPT_soft) || opts == 0)
++					if (opts & OPT_soft)
+ 						limit.rlim_cur = val;
+ //bb_error_msg("setrlimit(%d, %lld, %lld)", l->cmd, (long long)limit.rlim_cur, (long long)limit.rlim_max);
+ 					if (setrlimit(l->cmd, &limit) < 0) {
diff --git a/recipes/busybox/busybox_1.17.1.bb b/recipes/busybox/busybox_1.17.1.bb
index c16251c..5bd5210 100644
--- a/recipes/busybox/busybox_1.17.1.bb
+++ b/recipes/busybox/busybox_1.17.1.bb
@@ -4,5 +4,14 @@ PR = "${INC_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
+SRC_URI += "\
+  file://busybox-1.17.1-grep.patch \
+  file://busybox-1.17.1-make.patch \
+  file://busybox-1.17.1-mdev.patch \
+  file://busybox-1.17.1-mktemp.patch \
+  file://busybox-1.17.1-sed.patch \
+  file://busybox-1.17.1-shell.patch \
+"
+
 SRC_URI[md5sum] = "c7fe7533b7fc4018b0b49a05ee0ee601"
 SRC_URI[sha256sum] = "bf9177810d7e151b0e662477c33b9afd062570e6298ec46f2a8397a6a839d164"
-- 
1.6.3.3



