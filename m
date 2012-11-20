Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Taq0Y-0003zY-HO
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 16:45:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2012 07:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,286,1352102400"; d="scan'208";a="222183621"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.208])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2012 07:30:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2012 15:30:45 +0000
Message-Id: <0e4fc7bfad068a36025e7f84bbe162a82e76696b.1353425302.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353425302.git.paul.eggleton@linux.intel.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v2 1/8] tftp-hpa: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Tue, 20 Nov 2012 15:45:08 -0000

* Update to 5.2
* Add patches from Fedora
* Add DESCRIPTION and better SUMMARY
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM
* Update ALTERNATIVE_* definitions
* Handle hardcoded paths in initscript

Much of this was done by Joe MacDonald <joe.macdonald@windriver.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons/tftp-hpa/files/default         |    3 +
 .../recipes-daemons/tftp-hpa/files/init            |  104 ++++++++++++
 .../tftp-hpa/files/tftp-0.40-remap.patch           |   25 +++
 .../tftp-hpa/files/tftp-0.42-tftpboot.patch        |   60 +++++++
 .../tftp-hpa/files/tftp-0.49-chk_retcodes.patch    |   21 +++
 .../tftp-hpa/files/tftp-0.49-cmd_arg.patch         |  165 ++++++++++++++++++++
 .../tftp-hpa/files/tftp-hpa-0.39-tzfix.patch       |   24 +++
 .../files/tftp-hpa-0.49-fortify-strcpy-crash.patch |   32 ++++
 .../tftp-hpa/files/tftp-hpa-0.49-stats.patch       |   20 +++
 .../tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch      |   29 ++++
 .../recipes-daemons/tftp-hpa/files/tftp-xinetd     |   18 +++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   71 +++++++++
 12 files changed, 572 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/default
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/init
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/meta-networking/recipes-daemons/tftp-hpa/files/default
new file mode 100644
index 0000000..de2ed18
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
@@ -0,0 +1,3 @@
+#Defaults for tftpd-hpa
+RUN_DAEMON="yes"
+OPTIONS="-l -s /srv/tftpboot"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta-networking/recipes-daemons/tftp-hpa/files/init
new file mode 100644
index 0000000..5ad8c52
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
@@ -0,0 +1,104 @@
+#! /bin/sh
+#
+# Author:	Jaakko Niemi <liiwi@iki.fi>
+# Modified from skeleton file in sarge
+
+### BEGIN INIT INFO
+# Provides:          tftp-hpa
+# Required-Start:    $local_fs $remote_fs $syslog $network
+# Required-Stop:     $local_fs $remote_fs $syslog $network
+# Default-Start:     2 3 4 5
+# Default-Stop:      1
+# Short-Description: HPA's tftp client 
+# Description:       tftp server to allow booting clients which support
+#                    the PXE protocol.
+### END INIT INFO
+
+set -e
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DESC="HPA's tftpd"
+NAME=in.tftpd
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+SCRIPTNAME=/etc/init.d/tftpd-hpa
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+# Read config file if it is present.
+if [ -r /etc/default/tftpd-hpa ]
+then
+	. /etc/default/tftpd-hpa
+fi
+
+if [ "$RUN_DAEMON" != "yes" ] ; then
+         echo "tftpd-hpa disabled in /etc/default/tftpd-hpa"
+	 exit 0
+fi
+
+#
+#	Function that starts the daemon/service.
+#
+d_start() {
+	start-stop-daemon --start --quiet --exec $DAEMON -- $OPTIONS
+}
+
+#
+#	Function that stops the daemon/service.
+#
+d_stop() {
+	start-stop-daemon --stop --quiet --name $NAME
+}
+
+#
+#	Function that sends a SIGHUP to the daemon/service.
+#
+d_reload() {
+	start-stop-daemon --stop --quiet --name $NAME --signal 1
+}
+
+case "$1" in
+  start)
+	echo  "Starting $DESC: $NAME"
+	d_start
+	echo "."
+	;;
+  stop)
+	echo  "Stopping $DESC: $NAME"
+	d_stop
+	echo "."
+	;;
+  #reload)
+	#
+	#	If the daemon can reload its configuration without
+	#	restarting (for example, when it is sent a SIGHUP),
+	#	then implement that here.
+	#
+	#	If the daemon responds to changes in its config file
+	#	directly anyway, make this an "exit 0".
+	#
+	# echo -n "Reloading $DESC configuration..."
+	# d_reload
+	# echo "done."
+  #;;
+  restart|force-reload)
+	#
+	#	If the "reload" option is implemented, move the "force-reload"
+	#	option to the "reload" entry above. If not, "force-reload" is
+	#	just the same as "restart".
+	#
+	echo "Restarting $DESC: $NAME"
+	d_stop
+	sleep 1
+	d_start
+	echo "."
+	;;
+  *)
+	# echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+	echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
new file mode 100644
index 0000000..3f69060
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
@@ -0,0 +1,25 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.49/tftpd/remap.c.zero tftp-hpa-0.49/tftpd/remap.c
+--- tftp-hpa-0.49/tftpd/remap.c.zero	2008-10-20 18:08:31.000000000 -0400
++++ tftp-hpa-0.49/tftpd/remap.c	2008-11-25 11:41:09.000000000 -0500
+@@ -286,6 +286,7 @@ struct rule *parserulefile(FILE * f)
+     int lineno = 0;
+     int err = 0;
+ 
++    memset(this_rule, '\0', sizeof(struct rule));
+     while (lineno++, fgets(line, MAXLINE, f)) {
+         rv = parseline(line, this_rule, lineno);
+         if (rv < 0)
+@@ -294,6 +295,7 @@ struct rule *parserulefile(FILE * f)
+             *last_rule = this_rule;
+             last_rule = &this_rule->next;
+             this_rule = tfmalloc(sizeof(struct rule));
++            memset(this_rule, '\0', sizeof(struct rule));
+         }
+     }
+ 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
new file mode 100644
index 0000000..98a86b7
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
@@ -0,0 +1,60 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.48/tftp-xinetd.tftpboot tftp-hpa-0.48/tftp-xinetd
+--- tftp-hpa-0.48/tftp-xinetd.tftpboot	2007-01-31 00:51:05.000000000 +0100
++++ tftp-hpa-0.48/tftp-xinetd	2008-05-20 12:05:53.000000000 +0200
+@@ -10,7 +10,7 @@ service tftp
+ 	wait			= yes
+ 	user			= root
+ 	server			= /usr/sbin/in.tftpd
+-	server_args		= -s /tftpboot
++	server_args		= -s /var/lib/tftpboot
+ 	disable			= yes
+ 	per_source		= 11
+ 	cps			= 100 2
+diff -up tftp-hpa-0.48/README.security.tftpboot tftp-hpa-0.48/README.security
+--- tftp-hpa-0.48/README.security.tftpboot	2008-05-29 17:36:32.000000000 +0200
++++ tftp-hpa-0.48/README.security	2008-05-29 17:37:21.000000000 +0200
+@@ -17,10 +17,10 @@ probably the following:
+ 
+ 1. Create a separate "tftpd" user and group only used for tftpd;
+ 2. Have all your boot files in a single directory tree (usually called 
+-   /tftpboot).
+-3. Specify "-p -u tftpd -s /tftpboot" on the tftpd command line; if
++   /var/lib/tftpboot).
++3. Specify "-p -u tftpd -s /var/lib/tftpboot" on the tftpd command line; if
+    you want clients to be able to create files use
+-   "-p -c -U 002 -u tftpd -s /tftpboot" (replace 002 with whatever
++   "-p -c -U 002 -u tftpd -s /var/lib/tftpboot" (replace 002 with whatever
+    umask is appropriate for your setup.)
+ 
+ 	       =======================================
+@@ -40,12 +40,12 @@ directly.  Thus, if your /etc/inetd.conf
+ line):
+ 
+ tftp	dgram	udp	wait	root	/usr/sbin/tcpd
+-/usr/sbin/in.tftpd -s /tftpboot -r blksize
++/usr/sbin/in.tftpd -s /var/lib/tftpboot -r blksize
+ 
+ ... it's better to change to ...
+ 
+ tftp	dgram	udp	wait	root	/usr/sbin/in.tftpd
+-in.tftpd -s /tftpboot -r blksize
++in.tftpd -s /var/lib/tftpboot -r blksize
+ 
+ You should make sure that you are using "wait" option in tftpd; you
+ also need to have tftpd spawned as root in order for chroot (-s) to
+diff -up tftp-hpa-0.48/tftpd/sample.rules.tftpboot tftp-hpa-0.48/tftpd/sample.rules
+--- tftp-hpa-0.48/tftpd/sample.rules.tftpboot	2008-05-29 17:38:46.000000000 +0200
++++ tftp-hpa-0.48/tftpd/sample.rules	2008-05-29 17:38:05.000000000 +0200
+@@ -30,5 +30,5 @@ rg	\\		/		# Convert backslashes to slash
+ rg	\#		@		# Convert hash marks to @ signs
+ rg	/../		/..no../	# Convert /../ to /..no../
+ e	^ok/				# These are always ok
+-r	^[^/]		/tftpboot/\0	# Convert non-absolute files
++r	^[^/]		/var/lib/tftpboot/\0	# Convert non-absolute files
+ a	\.pvt$				# Reject requests for private files
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
new file mode 100644
index 0000000..7ae1a87
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
@@ -0,0 +1,21 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.49/tftpd/tftpd.c.chk_retcodes tftp-hpa-0.49/tftpd/tftpd.c
+--- tftp-hpa-0.49/tftpd/tftpd.c.chk_retcodes	2009-01-15 15:28:50.000000000 +0100
++++ tftp-hpa-0.49/tftpd/tftpd.c	2009-01-15 15:31:36.000000000 +0100
+@@ -932,7 +932,10 @@ int main(int argc, char **argv)
+             exit(EX_OSERR);
+         }
+ #ifdef __CYGWIN__
+-        chdir("/");             /* Cygwin chroot() bug workaround */
++				if (chdir("/") < 0) {			/* Cygwin chroot() bug workaround */
++					syslog(LOG_ERR, "chroot: %m");
++					exit(EX_OSERR);
++				}
+ #endif
+     }
+ #ifdef HAVE_SETREGID
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
new file mode 100644
index 0000000..6b8ceaa
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
@@ -0,0 +1,165 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.49/config.h.cmd_arg tftp-hpa-0.49/config.h
+--- tftp-hpa-0.49/config.h.cmd_arg	2010-04-19 15:29:10.567331454 +0200
++++ tftp-hpa-0.49/config.h	2010-04-20 07:33:03.133232772 +0200
+@@ -291,6 +291,7 @@ typedef int socklen_t;
+ /* Prototypes for libxtra functions */
+ 
+ void *xmalloc(size_t);
++void *xrealloc(void *, size_t);
+ char *xstrdup(const char *);
+ 
+ #ifndef HAVE_BSD_SIGNAL
+diff -up tftp-hpa-0.49/configure.in.cmd_arg tftp-hpa-0.49/configure.in
+--- tftp-hpa-0.49/configure.in.cmd_arg	2008-10-21 00:08:31.000000000 +0200
++++ tftp-hpa-0.49/configure.in	2010-04-19 11:05:12.387340698 +0200
+@@ -152,6 +152,7 @@ OBJROOT=`pwd`
+ 
+ XTRA=false
+ PA_SEARCH_LIBS_AND_ADD(xmalloc, iberty)
++PA_SEARCH_LIBS_AND_ADD(xrealloc, iberty)
+ PA_SEARCH_LIBS_AND_ADD(xstrdup, iberty)
+ PA_SEARCH_LIBS_AND_ADD(bsd_signal, bsd, bsdsignal)
+ PA_SEARCH_LIBS_AND_ADD(getopt_long, getopt, getopt_long)
+diff -up tftp-hpa-0.49/lib/xrealloc.c.cmd_arg tftp-hpa-0.49/lib/xrealloc.c
+--- tftp-hpa-0.49/lib/xrealloc.c.cmd_arg	2010-04-19 11:05:12.387340698 +0200
++++ tftp-hpa-0.49/lib/xrealloc.c	2010-04-19 11:05:12.387340698 +0200
+@@ -0,0 +1,20 @@
++/*
++ * xrealloc.c
++ *
++ * Simple error-checking version of realloc()
++ *
++ */
++
++#include "config.h"
++
++void *xrealloc(void *ptr, size_t size)
++{
++    void *p = realloc(ptr, size);
++
++    if (!p) {
++        fprintf(stderr, "Out of memory!\n");
++        exit(128);
++    }
++
++    return p;
++}
+diff -up tftp-hpa-0.49/tftp/main.c.cmd_arg tftp-hpa-0.49/tftp/main.c
+--- tftp-hpa-0.49/tftp/main.c.cmd_arg	2008-10-21 00:08:31.000000000 +0200
++++ tftp-hpa-0.49/tftp/main.c	2010-04-19 11:05:12.389329337 +0200
+@@ -89,11 +89,14 @@ int connected;
+ const struct modes *mode;
+ #ifdef WITH_READLINE
+ char *line = NULL;
++char *remote_pth = NULL;
+ #else
+ char line[LBUFLEN];
++char remote_pth[LBUFLEN];
+ #endif
+ int margc;
+-char *margv[20];
++char **margv;
++int sizeof_margv=0;
+ const char *prompt = "tftp> ";
+ sigjmp_buf toplevel;
+ void intr(int);
+@@ -379,6 +382,10 @@ static void getmoreargs(const char *part
+         free(line);
+         line = NULL;
+     }
++    if (remote_pth) {
++        free(remote_pth);
++        remote_pth = NULL;
++    }
+     line = xmalloc(len + elen + 1);
+     strcpy(line, partial);
+     strcpy(line + len, eline);
+@@ -535,6 +542,7 @@ void put(int argc, char *argv[])
+     int fd;
+     int n, err;
+     char *cp, *targ;
++    long dirlen, namelen, lastlen=0;
+ 
+     if (argc < 2) {
+         getmoreargs("send ", "(file) ");
+@@ -588,9 +596,22 @@ void put(int argc, char *argv[])
+     }
+     /* this assumes the target is a directory */
+     /* on a remote unix system.  hmmmm.  */
+-    cp = strchr(targ, '\0');
+-    *cp++ = '/';
++    dirlen = strlen(targ)+1;
++#ifdef WITH_READLINE
++    remote_pth = xmalloc(dirlen+1);
++#endif
++    strcpy(remote_pth, targ);
++    remote_pth[dirlen-1] = '/';
++    cp = remote_pth + dirlen;
+     for (n = 1; n < argc - 1; n++) {
++#ifdef WITH_READLINE
++        namelen = strlen(tail(argv[n])) + 1;
++        if (namelen > lastlen) {
++            remote_pth = xrealloc(remote_pth, dirlen + namelen + 1);
++            cp = remote_pth + dirlen;
++            lastlen = namelen;
++        }
++#endif
+         strcpy(cp, tail(argv[n]));
+         fd = open(argv[n], O_RDONLY | mode->m_openflags);
+         if (fd < 0) {
+@@ -600,9 +621,9 @@ void put(int argc, char *argv[])
+         }
+         if (verbose)
+             printf("putting %s to %s:%s [%s]\n",
+-                   argv[n], hostname, targ, mode->m_mode);
++                   argv[n], hostname, remote_pth, mode->m_mode);
+         sa_set_port(&peeraddr, port);
+-        tftp_sendfile(fd, targ, mode->m_mode);
++        tftp_sendfile(fd, remote_pth, mode->m_mode);
+     }
+ }
+ 
+@@ -801,6 +822,10 @@ static void command(void)
+             free(line);
+             line = NULL;
+         }
++        if (remote_pth) {
++            free(remote_pth);
++            remote_pth = NULL;
++        }
+         line = readline(prompt);
+         if (!line)
+             exit(0);            /* EOF */
+@@ -872,7 +897,13 @@ struct cmd *getcmd(char *name)
+ static void makeargv(void)
+ {
+     char *cp;
+-    char **argp = margv;
++    char **argp;
++
++    if (!sizeof_margv) {
++        sizeof_margv = 20;
++        margv = xmalloc(sizeof_margv * sizeof(char *));
++    }
++    argp = margv;
+ 
+     margc = 0;
+     for (cp = line; *cp;) {
+@@ -882,6 +913,11 @@ static void makeargv(void)
+             break;
+         *argp++ = cp;
+         margc += 1;
++        if (margc == sizeof_margv) {
++            sizeof_margv += 20;
++            margv = xrealloc(margv, sizeof_margv * sizeof(char *));
++            argp = margv + margc;
++        }
+         while (*cp != '\0' && !isspace(*cp))
+             cp++;
+         if (*cp == '\0')
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
new file mode 100644
index 0000000..85110eb
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
@@ -0,0 +1,24 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.49/tftpd/tftpd.c.tzfix tftp-hpa-0.49/tftpd/tftpd.c
+--- tftp-hpa-0.49/tftpd/tftpd.c.tzfix	2008-10-20 18:08:31.000000000 -0400
++++ tftp-hpa-0.49/tftpd/tftpd.c	2008-11-25 11:45:27.000000000 -0500
+@@ -350,6 +350,14 @@ int main(int argc, char **argv)
+     const char *pidfile = NULL;
+     u_short tp_opcode;
+ 
++    time_t my_time = 0;
++    struct tm* p_tm;
++    char envtz[10];
++    my_time = time(NULL);
++    p_tm = localtime(&my_time);
++    snprintf(envtz, sizeof(envtz) - 1, "UTC%+d", (p_tm->tm_gmtoff * -1)/3600);
++    setenv("TZ", envtz, 0);
++
+     /* basename() is way too much of a pain from a portability standpoint */
+ 
+     p = strrchr(argv[0], '/');
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
new file mode 100644
index 0000000..08d2b5b
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
@@ -0,0 +1,32 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -urN tftp-hpa-0.49.orig/tftp/tftp.c tftp-hpa-0.49/tftp/tftp.c
+--- tftp-hpa-0.49.orig/tftp/tftp.c	2008-10-20 18:08:31.000000000 -0400
++++ tftp-hpa-0.49/tftp/tftp.c	2009-08-05 09:47:18.072585848 -0400
+@@ -279,15 +279,16 @@
+             struct tftphdr *tp, const char *mode)
+ {
+     char *cp;
++    size_t len;
+ 
+     tp->th_opcode = htons((u_short) request);
+     cp = (char *)&(tp->th_stuff);
+-    strcpy(cp, name);
+-    cp += strlen(name);
+-    *cp++ = '\0';
+-    strcpy(cp, mode);
+-    cp += strlen(mode);
+-    *cp++ = '\0';
++    len = strlen(name) + 1;
++    memcpy(cp, name, len);
++    cp += len;
++    len = strlen(mode) + 1;
++    memcpy(cp, mode, len);
++    cp += len;
+     return (cp - (char *)tp);
+ }
+ 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
new file mode 100644
index 0000000..720cd69
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
@@ -0,0 +1,20 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-0.49/tftp/tftp.c.stats tftp-hpa-0.49/tftp/tftp.c
+--- tftp-hpa-0.49/tftp/tftp.c.stats	2011-01-03 15:38:34.217918067 +0100
++++ tftp-hpa-0.49/tftp/tftp.c	2011-01-03 15:38:37.498917014 +0100
+@@ -400,8 +400,8 @@ static void printstats(const char *direc
+ {
+     double delta;
+ 
+-    delta = (tstop.tv_sec + (tstop.tv_usec / 100000.0)) -
+-        (tstart.tv_sec + (tstart.tv_usec / 100000.0));
++    delta = (tstop.tv_sec + (tstop.tv_usec / 1000000.0)) -
++        (tstart.tv_sec + (tstart.tv_usec / 1000000.0));
+     if (verbose) {
+         printf("%s %lu bytes in %.1f seconds", direction, amount, delta);
+         printf(" [%.0f bit/s]", (amount * 8.) / delta);
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
new file mode 100644
index 0000000..216349d
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
@@ -0,0 +1,29 @@
+Patch originally from Fedora
+
+http://pkgs.fedoraproject.org/cgit/tftp.git/
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-5.2/tftpd/recvfrom.c.test tftp-hpa-5.2/tftpd/recvfrom.c
+--- tftp-hpa-5.2/tftpd/recvfrom.c.test	2011-12-11 23:13:52.000000000 +0100
++++ tftp-hpa-5.2/tftpd/recvfrom.c	2012-01-04 10:05:17.852042256 +0100
+@@ -149,16 +149,16 @@ myrecvfrom(int s, void *buf, int len, un
+ 
+     /* Try to enable getting the return address */
+ #ifdef IP_RECVDSTADDR
+-    if (from->sa_family == AF_INET)
++    if (from->sa_family == AF_INET || !from->sa_family)
+         setsockopt(s, IPPROTO_IP, IP_RECVDSTADDR, &on, sizeof(on));
+ #endif
+ #ifdef IP_PKTINFO
+-    if (from->sa_family == AF_INET)
++    if (from->sa_family == AF_INET || !from->sa_family)
+         setsockopt(s, IPPROTO_IP, IP_PKTINFO, &on, sizeof(on));
+ #endif
+ #ifdef HAVE_IPV6
+ #ifdef IPV6_RECVPKTINFO
+-    if (from->sa_family == AF_INET6)
++    if (from->sa_family == AF_INET6 || !from->sa_family)
+         setsockopt(s, IPPROTO_IPV6, IPV6_RECVPKTINFO, &on, sizeof(on));
+ #endif
+ #endif
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
new file mode 100644
index 0000000..fe70163
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
@@ -0,0 +1,18 @@
+# default: off
+# description: The tftp server serves files using the trivial file transfer \
+#	protocol.  The tftp protocol is often used to boot diskless \
+#	workstations, download configuration files to network-aware printers, \
+#	and to start the installation process for some operating systems.
+service tftp
+{
+	socket_type		= dgram
+	protocol		= udp
+	wait			= yes
+	user			= root
+	server			= /usr/sbin/in.tftpd-hpa
+	server_args		= -s /var/lib/tftpboot
+	disable			= yes
+	per_source		= 11
+	cps				= 100 2
+	flags			= IPv6
+}
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
new file mode 100644
index 0000000..40294b0
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -0,0 +1,71 @@
+SUMMARY        = "Client for the Trivial File Transfer Protocol"
+DESCRIPTION    = \
+"The Trivial File Transfer Protocol (TFTP) is normally used only for \
+booting diskless workstations.  The tftp package provides the user   \
+interface for TFTP, which allows users to transfer files to and from a \
+remote machine.  This program and TFTP provide very little security, \
+and should not be enabled unless it is expressly needed."
+DEPENDS = "tcp-wrappers readline"
+SECTION = "network"
+LICENSE = "BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://MCONFIG.in;startline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
+                    file://tftp/tftp.c;startline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
+
+PR = "r0"
+
+SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.tar.bz2 \
+           file://tftp-0.40-remap.patch \
+           file://tftp-0.42-tftpboot.patch \
+           file://tftp-0.49-chk_retcodes.patch \
+           file://tftp-0.49-cmd_arg.patch \
+           file://tftp-hpa-0.39-tzfix.patch \
+           file://tftp-hpa-0.49-fortify-strcpy-crash.patch \
+           file://tftp-hpa-0.49-stats.patch \
+           file://tftp-hpa-5.2-pktinfo.patch \
+           file://default \
+           file://init"
+
+SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
+SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
+
+inherit autotools update-rc.d update-alternatives
+
+EXTRA_OECONF += "--disable-option-checking"
+
+# configure.in has errors
+do_configure() {
+	oe_runconf
+}
+
+do_install() {
+	oe_runmake install INSTALLROOT=${D}
+	mv ${D}${bindir}/tftp ${D}${bindir}/tftp-hpa
+	mv ${D}${sbindir}/in.tftpd ${D}${sbindir}/in.tftpd-hpa
+
+	install -m 755 -d ${D}${localstatedir}/lib/tftpboot/
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/tftpd-hpa
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
+}
+
+FILES_${PN} = "${bindir}"
+
+PACKAGES += "tftp-hpa-server"
+SUMMARY_tftp-hpa-server = "Server for the Trivial File Transfer Protocol"
+FILES_tftp-hpa-server = "${sbindir} ${sysconfdir} ${localstatedir}"
+CONFFILES_tftp-hpa-server = "${sysconfdir}/default/tftpd-hpa"
+
+INITSCRIPT_PACKAGES = "tftp-hpa-server"
+INITSCRIPT_NAME = "tftpd-hpa"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 1 ."
+
+ALTERNATIVE_${PN} = "tftp"
+ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
+ALTERNATIVE_PRIORITY = "50"
+
-- 
1.7.9.5



