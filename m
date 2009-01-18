Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRg-00053q-VQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:29 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:36 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:25 +0100
Message-Id: <2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:36.0736 (UTC)
	FILETIME=[E869D800:01C97913]
Subject: [PATCH 05/14] kexecboot: remove kexecboot-0.3
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:29 -0000

- now broken as kexec is now used as init with 0.4
---
 packages/kexecboot/files/kexecboot-rewrite.patch |  344 ----------------------
 packages/kexecboot/kexecboot_0.3.bb              |   21 --
 2 files changed, 0 insertions(+), 365 deletions(-)
 delete mode 100644 packages/kexecboot/files/kexecboot-rewrite.patch
 delete mode 100644 packages/kexecboot/kexecboot_0.3.bb

diff --git a/packages/kexecboot/files/kexecboot-rewrite.patch b/packages/kexecboot/files/kexecboot-rewrite.patch
deleted file mode 100644
index 4f25206..0000000
--- a/packages/kexecboot/files/kexecboot-rewrite.patch
+++ /dev/null
@@ -1,344 +0,0 @@
---- kexecboot-0.3.orig/kexecboot.h	2008-09-03 02:35:40.000000000 +0400
-+++ kexecboot-0.3/kexecboot.h	2008-09-03 02:36:04.000000000 +0400
-@@ -24,6 +24,10 @@
- #include <string.h>
- #include <linux/input.h>
- #include <termios.h>
-+#include <unistd.h>
-+#include <signal.h>
-+#include <sys/wait.h>
-+#include <ctype.h>
- #include "fb.h"
- #include "devicescan.h"
- #include "res/logo-img.h"
-@@ -33,4 +37,14 @@
- #include "res/memory-img.h"
- #include "res/radeon-font.h"
- 
-+/* Macro for dealing with NULL strings */
-+#define strlenn(s)	( (NULL != s) ? (strlen(s)) : 0 )
-+
-+/* Tags we want from /proc/cmdline */
-+char *wanted_tags[] = {
-+	"mtdparts",
-+	NULL
-+};
-+
-+
- #endif
---- kexecboot-0.3.orig/kexecboot.c	2008-09-03 02:35:40.000000000 +0400
-+++ kexecboot-0.3/kexecboot.c	2008-09-03 03:33:05.000000000 +0400
-@@ -78,20 +78,293 @@
- 	fb_render(fb);
- }
- 
-+/*
-+ * Function: get_extra_cmdline()
-+ * It gets wanted tags from original cmdline.
-+ * Takes 2 args:
-+ * - extra_cmdline - buffer to store cmdline parameters;
-+ * - extra_cmdline_size - size of buffer
-+ *   (inc. terminating '\0').
-+ * Return values:
-+ * - length of extra_cmdline on success (w/o term. zero);
-+ * - -1 on error;
-+ * - (- length of extra_cmdline - 1)  on insufficient buffer space.
-+ */
-+
-+int get_extra_cmdline(char *const extra_cmdline, const size_t extra_cmdline_size)
-+{
-+	char *p, *t, *tag = NULL;
-+	char line[COMMAND_LINE_SIZE];
-+	int i, len, sp_size;
-+	int sum_len = 0;
-+	int wanted_tag_found = 0;
-+	int overflow = 0;
-+
-+	const char proc_cmdline_path[] = "/proc/cmdline";
-+	
-+	/* Open /proc/cmdline and read cmdline */
-+	FILE *f = fopen(proc_cmdline_path, "r");
-+	if (NULL == f) {
-+		perror("Can't open /proc/cmdline");
-+		return -1;
-+	}
-+
-+	if ( NULL == fgets(line, sizeof(line), f) ) {
-+		perror("Can't read /proc/cmdline");
-+		fclose(f);
-+		return -1;
-+	}
-+
-+	fclose(f);
-+	
-+	/* clean up buffer before parsing */
-+	t = extra_cmdline;
-+	*t = '\0';
-+	
-+	p = line-1;		/* because of ++p below */
-+
-+	sp_size = 0;	/* size of (first) space */
-+	
-+	do {
-+		++p;
-+		
-+		if ( (NULL == tag) && (isalnum(*p)) ) {
-+			/* new tag found */
-+			tag = p;
-+		} else if (tag) {
-+			/* we are working on some tag */
-+
-+			if (isspace(*p) || ('\0' == *p) || ('=' == *p) ) {
-+				/* end of tag or '=' found */
-+				
-+				if (!wanted_tag_found) {
-+					/* search in wanted_tags */
-+					for (i = 0; wanted_tags[i] != NULL; i++) {
-+						if ( 0 == strncmp(wanted_tags[i], tag, p-tag) ) {
-+							/* match found */
-+							wanted_tag_found = 1;
-+							break;
-+						}
-+					}
-+				}
-+				
-+				if ( ('=' != *p) && wanted_tag_found ) {
-+					/* end of wanted tag found -> copy */
-+					
-+					len = p - tag;
-+					if ( (sum_len + len + sp_size) < extra_cmdline_size ) {
-+						if (sp_size) {
-+							/* prepend space when have tags already */
-+							*t = ' ';
-+							++t;
-+							*t = '\0';
-+							++sum_len;
-+						} else {
-+							sp_size = sizeof(char);
-+						}
-+			
-+						/* NOTE: tag is not null-terminated so copy only
-+						 * len chars and terminate it directly
-+						 */
-+						strncpy(t, tag, len);
-+						/* move pointer to position after copied tag */
-+						t += len ;
-+						/* null-terminate */
-+						*t = '\0';
-+						/* update summary length */
-+						sum_len += len;
-+					} else {
-+						/* we have no space - skip this tag */
-+						overflow = 1;
-+					}
-+
-+					/* reset wanted_tag_found */
-+					wanted_tag_found = 0;
-+				}
-+				
-+				/* reset tag */
-+				if (!wanted_tag_found) tag = NULL;
-+
-+			}
-+		}
-+
-+	} while ('\0' != *p);
-+
-+	if (overflow) return -sum_len-1;
-+	return sum_len;
-+}
-+
-+/*
-+ * Function: kexec_execw()
-+ * (execve and wait)
-+ * kexecboot's replace of system() call without /bin/sh invocation.
-+ * During execution  of the command, SIGCHLD will be blocked,
-+ * and SIGINT and SIGQUIT will be ignored (like system() does).
-+ * Takes 2 args (execve()-like):
-+ * - path - full path to executable file
-+ * - argv[] - array of args for executed file (command options e.g.)
-+ * - envp[] - array of environment strings ("key=value")
-+ * Return value:
-+ * - command exit status on success
-+ * - -1 on error (e.g. fork() failed)
-+ */
-+int kexec_execw(const char *path, char *const argv[], char *const envp[])
-+{
-+	pid_t pid;
-+	struct sigaction ignore, old_int, old_quit;
-+	sigset_t masked, oldmask;
-+	int status;
-+
-+	/* Block SIGCHLD and ignore SIGINT and SIGQUIT */
-+	/* Do this before the fork() to avoid races */
-+
-+	ignore.sa_handler = SIG_IGN;
-+	sigemptyset(&ignore.sa_mask);
-+	ignore.sa_flags = 0;
-+	sigaction(SIGINT, &ignore, &old_int);
-+	sigaction(SIGQUIT, &ignore, &old_quit);
-+
-+	sigemptyset(&masked);
-+	sigaddset(&masked, SIGCHLD);
-+	sigprocmask(SIG_BLOCK, &masked, &oldmask);
-+
-+	pid = fork();
-+
-+	if (pid < 0)
-+		/* can't fork */
-+		return -1;
-+	else if (pid == 0) {
-+		/* it is child */
-+		sigaction(SIGINT, &old_int, NULL);
-+		sigaction(SIGQUIT, &old_quit, NULL);
-+		sigprocmask(SIG_SETMASK, &oldmask, NULL);
-+
-+		/* replace child with executed file */
-+		execve(path, (char *const *)argv, (char *const *)envp);
-+		/* should not happens but... */
-+		_exit(127);
-+	}
-+
-+	/* it is parent */
-+
-+	/* wait for our child and store status */
-+	waitpid(pid, &status, 0);
-+
-+	/* restore signal handlers */
-+	sigaction(SIGINT, &old_int, NULL);
-+	sigaction(SIGQUIT, &old_quit, NULL);
-+	sigprocmask(SIG_SETMASK, &oldmask, NULL);
-+
-+	return status;
-+}
-+
- void start_kernel(struct boot *boot)
- {
--	//kexec --command-line="CMDLINE" -l /mnt/boot/zImage
--	char command[COMMAND_LINE_SIZE + 60];
--	mount(boot->device, "/mnt", boot->fstype, MS_RDONLY, NULL);
--	if( boot->cmdline )
--		sprintf(command,"/usr/sbin/kexec --command-line=\"%s root=%s rootfstype=%s\" -l %s", 
--			boot->cmdline, boot->device, boot->fstype, boot->kernelpath);
--	else
--		sprintf(command,"kexec -l %s", boot->kernelpath);
--	system(command);
--//	puts(command);		
--	umount("/mnt");
--	system("/usr/sbin/kexec -e");
-+	/* we use var[] instead of *var because sizeof(var) using */
-+	const char mount_point[] = "/mnt";
-+	const char kexec_path[] = "/usr/sbin/kexec";
-+
-+	const char str_cmdline_start[] = "--command-line=";
-+	const char str_root[] = " root=";
-+	const char str_rootfstype[] = " rootfstype=";
-+	const char str_rootwait[] = " rootwait";
-+
-+	/* empty environment */
-+	char *const envp[] = { NULL };
-+
-+	const char *kexec_load_argv[] = { NULL, "-l", NULL, NULL, NULL };
-+	const char *kexec_exec_argv[] = { NULL, "-e", NULL};
-+
-+	char extra_cmdline_buffer[COMMAND_LINE_SIZE];
-+	char *extra_cmdline, *cmdline_arg = NULL;
-+	int n, idx;
-+	
-+	kexec_exec_argv[0] = kexec_path;
-+	kexec_load_argv[0] = kexec_path;
-+
-+	/* --command-line arg generation */
-+	idx = 2;	/* kexec_load_argv current option index */
-+
-+	/* get some parts of cmdline from boot loader (e.g. mtdparts) */
-+	n = get_extra_cmdline( extra_cmdline_buffer,
-+			sizeof(extra_cmdline_buffer) );
-+	if ( -1 == n ) {
-+		/* clean up extra_cmdline on error */
-+		extra_cmdline = NULL;
-+/*	} else if ( n < -1 ) { */
-+		/* Do something when we have no space to get all wanted tags */
-+		/* Now do nothing ;) */
-+	} else {
-+		extra_cmdline = extra_cmdline_buffer;
-+	}
-+
-+	/* fill '--command-line' option */
-+	if (boot->cmdline || extra_cmdline || boot->device) {
-+		/* allocate space */
-+		n = strlenn(str_cmdline_start) + strlenn(boot->cmdline) +
-+				sizeof(char) + strlenn(extra_cmdline) +
-+				strlenn(str_root) + strlenn(boot->device) +
-+				strlenn(str_rootfstype) + strlenn(boot->fstype) +
-+				strlenn(str_rootwait) + sizeof(char);
-+		
-+		cmdline_arg = (char *)malloc(n);
-+		if (NULL == cmdline_arg) {
-+			perror("Can't allocate memory for cmdline_arg");
-+			/*  Should we exit?
-+			exit(-1);
-+			*/
-+		} else {
-+			strcat(cmdline_arg, str_cmdline_start);
-+			if (extra_cmdline)
-+				strcat(cmdline_arg, extra_cmdline);
-+			if (boot->cmdline && extra_cmdline)
-+				strcat(cmdline_arg, " ");
-+			if (boot->cmdline)
-+				strcat(cmdline_arg, boot->cmdline);
-+			if (boot->device) {
-+				strcat(cmdline_arg, str_root);
-+				strcat(cmdline_arg, boot->device);
-+				if (boot->fstype) {
-+					strcat(cmdline_arg, str_rootfstype);
-+					strcat(cmdline_arg, boot->fstype);
-+				}
-+			}
-+			strcat(cmdline_arg, str_rootwait);
-+
-+			kexec_load_argv[idx] = cmdline_arg;
-+			++idx;
-+		}
-+	}
-+
-+	/* Append kernelpath as last arg of kexec */
-+	kexec_load_argv[idx] = boot->kernelpath;
-+
-+	/* Debug
-+	fprintf(stderr, "%s\n%s\n%s\n%s\n", kexec_load_argv[0],
-+			kexec_load_argv[1], kexec_load_argv[2],
-+			kexec_load_argv[3]); */
-+
-+	/* Mount boot device */
-+	if ( -1 == mount(boot->device, mount_point, boot->fstype,
-+			MS_RDONLY, NULL) ) {
-+		perror("Can't mount boot device");
-+		exit(-1);
-+	}
-+
-+	/* Load kernel */
-+	n = kexec_execw(kexec_path, (char *const *)kexec_load_argv, envp);
-+	if (-1 == n) {
-+		perror("Kexec can't load kernel");
-+		exit(-1);
-+	}
-+
-+	if (cmdline_arg)
-+		free(cmdline_arg);
-+
-+	umount(mount_point);
-+
-+	/* Boot new kernel */
-+	execve(kexec_path, (char *const *)kexec_exec_argv, envp);
- }
- 
- int main(int argc, char **argv)
-@@ -219,5 +492,6 @@
- 	tcsetattr(fileno(stdin), TCSANOW, &old);
- 	fb_destroy(fb);
- 	start_kernel(bl->list[choice]);
--	return 0;
-+	/* When we reach this point then some error was occured */
-+	return -1;
- }
diff --git a/packages/kexecboot/kexecboot_0.3.bb b/packages/kexecboot/kexecboot_0.3.bb
deleted file mode 100644
index f94e31b..0000000
--- a/packages/kexecboot/kexecboot_0.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "GPL"
-PR = "r2"
-DEPENDS = "klibc"
-RDEPENDS = "kexec-static"
-
-inherit autotools
-
-# You can create your own *-img.h by doing
-# ./make-image-header.sh <file>.png HAND
-
-SRC_URI = "http://projects.linuxtogo.org/frs/download.php/221/kexecboot-${PV}.tar.gz \
-	   file://kexecboot-rewrite.patch;patch=1"
-
-S = "${WORKDIR}/kexecboot-${PV}"
-
-export CC=${TARGET_PREFIX}klcc
-
-# standart oe cflags don't work with klcc
-export CFLAGS = ""
-export CPPFLAGS = ""
-export LDFLAGS = ""
-- 
1.6.0.6



