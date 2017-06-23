Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1820177EA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 05:36:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5N5aqpV017467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:36:53 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Jun 2017 22:36:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 13:36:44 +0800
Message-ID: <5c59e9d5f0520de32c81d77f1d726942bee7f1b1.1498195991.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498195991.git.jackie.huang@windriver.com>
References: <cover.1498195991.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] rdist: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 05:36:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

rdist is a remote file distribution client and server.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch   |   75 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-bison.patch      |  147 ++
 .../rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch    | 2087 ++++++++++++++++++++
 .../rdist-6.1.5-fix-msgsndnotify-loop.patch        |   37 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch   |   25 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch        |  142 ++
 .../rdist/rdist-6.1.5/rdist-6.1.5-links.patch      |   79 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-linux.patch      |   28 +
 .../rdist-6.1.5-makefile-add-ldflags.patch         |   23 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch    |   16 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch    |   28 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch    |   59 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch        |   14 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch     |   85 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch       |   15 +
 .../rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch    |   16 +
 .../recipes-connectivity/rdist/rdist_6.1.5.bb      |   37 +
 17 files changed, 2913 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bison.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-msgsndnotify-loop.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-links.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-linux.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb

diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch
new file mode 100644
index 000000000..c95eaf8f5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bb-build.patch
@@ -0,0 +1,75 @@
+From 244861e2c9bb9cc44f4bd246964ba850a7cf1216 Mon Sep 17 00:00:00 2001
+From: Xin Ouyang <Xin.Ouyang@windriver.com>
+Date: Tue, 15 May 2012 15:06:43 +0800
+Subject: [PATCH] rdist: bitbake build
+
+Upstream-Status: Inappropriate [OE specific]
+
+---
+ Makefile.local    |    8 ++++----
+ doc/Makefile.real |    4 +++-
+ src/Makefile.real |    1 +
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.local b/Makefile.local
+index 26092b2..389cb84 100644
+--- a/Makefile.local
++++ b/Makefile.local
+@@ -14,7 +14,7 @@
+ # BIN_DIR variable, you would uncomment the following line
+ # or add your own line.
+ #
+-#BIN_DIR	= /usr/bin
++BIN_DIR	= ${DESTDIR}/${bindir}
+ 
+ #
+ # Add any local definitions you want pass to the compiler to DEFS_LOCAL
+@@ -46,13 +46,13 @@ LIBS_LOCAL	=
+ # Set a site specific install program to use.  Must support BSD style
+ # install(1) arguments.
+ #
+-#INSTALL		= install
++INSTALL		= install
+ 
+ #
+ # Site specific Man Page configuration.
+ #
+-#MAN_1_DIR	= /usr/local/man/man1
+-#MAN_8_DIR	= /usr/local/man/man8
++MAN_1_DIR	= ${DESTDIR}/${mandir}/man1
++MAN_8_DIR	= ${DESTDIR}/${mandir}/man8
+ #MAN_OWNER	= bin
+ #MAN_GROUP	= bin
+ #MAN_MODE	= 644
+diff --git a/doc/Makefile.real b/doc/Makefile.real
+index 42cabec..e32c30b 100644
+--- a/doc/Makefile.real
++++ b/doc/Makefile.real
+@@ -16,9 +16,11 @@ all:
+ 
+ doc:
+ 
+-install:
++install: install.man
+ 
+ install.man: rdist.man rdistd.man
++	test -d ${MAN_1_DIR} || ${INSTALL} -d ${MAN_1_DIR}
++	test -d ${MAN_8_DIR} || ${INSTALL} -d ${MAN_8_DIR}
+ 	${INSTALL} ${INSTALL_ARGS} rdist.man ${CLIENT_DEST}
+ 	${INSTALL} ${INSTALL_ARGS} rdistd.man ${SERVER_DEST}
+ 
+diff --git a/src/Makefile.real b/src/Makefile.real
+index 02179e4..9ec551d 100644
+--- a/src/Makefile.real
++++ b/src/Makefile.real
+@@ -52,6 +52,7 @@ clean:
+ 		$(COMMONOBJS) $(MISSINGOBJS)
+ 
+ install:
++	test -d $(BIN_DIR) || $(INSTALL) -d $(BIN_DIR)
+ 	$(INSTALL) ${IN_ARGS} -o $(BIN_OWNER) -m ${RDIST_MODE} \
+ 		$(CLIENT_BIN) $(BIN_DIR)/$(CLIENT)
+ 	$(INSTALL) ${IN_ARGS} -o ${BIN_OWNER} -m ${RDISTD_MODE} \
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bison.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bison.patch
new file mode 100644
index 000000000..435491221
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-bison.patch
@@ -0,0 +1,147 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/gram.y.bison	1998-11-10 05:10:42.000000000 +0100
++++ rdist-6.1.5/src/gram.y	2003-06-04 16:02:19.000000000 +0200
+@@ -90,10 +90,10 @@
+ 	struct namelist        *namel;
+ }
+ 
+-%type <optval> OPTION, options
+-%type <string> NAME, STRING
+-%type <subcmd> INSTALL, NOTIFY, EXCEPT, PATTERN, SPECIAL, CMDSPECIAL, cmdlist, cmd
+-%type <namel> namelist, names, opt_namelist nlist
++%type <optval> OPTION options
++%type <string> NAME STRING
++%type <subcmd> INSTALL NOTIFY EXCEPT PATTERN SPECIAL CMDSPECIAL cmdlist cmd
++%type <namel> namelist names opt_namelist nlist
+ 
+ %%
+ 
+@@ -101,19 +101,19 @@
+ 		| file command
+ 		;
+ 
+-command:	  NAME '=' namelist = {
++command:	  NAME '=' namelist {
+ 			(void) lookup($1, INSERT, $3);
+ 		}
+-		| namelist ARROW namelist cmdlist = {
++		| namelist ARROW namelist cmdlist {
+ 			insert((char *)NULL, $1, $3, $4);
+ 		}
+-		| NAME COLON namelist ARROW namelist cmdlist = {
++		| NAME COLON namelist ARROW namelist cmdlist {
+ 			insert($1, $3, $5, $6);
+ 		}
+-		| namelist DCOLON NAME cmdlist = {
++		| namelist DCOLON NAME cmdlist {
+ 			append((char *)NULL, $1, $3, $4);
+ 		}
+-		| NAME COLON namelist DCOLON NAME cmdlist = {
++		| NAME COLON namelist DCOLON NAME cmdlist {
+ 			append($1, $3, $5, $6);
+ 		}
+ 		| error
+@@ -133,10 +133,10 @@
+ 		}
+ 		;
+ 
+-nlist:	  NAME = {
++nlist:	  NAME {
+ 			$$ = makenl($1);
+ 		}
+-		| '(' names ')' = {
++		| '(' names ')' {
+ 			$$ = $2;
+ 		}
+ 		;
+@@ -144,7 +144,7 @@
+ names:		  /* VOID */ {
+ 			$$ = last_n = NULL;
+ 		}
+-		| names NAME = {
++		| names NAME {
+ 			if (last_n == NULL)
+ 				$$ = last_n = makenl($2);
+ 			else {
+@@ -158,7 +158,7 @@
+ cmdlist:	  /* VOID */ {
+ 			$$ = last_sc = NULL;
+ 		}
+-		| cmdlist cmd = {
++		| cmdlist cmd {
+ 			if (last_sc == NULL)
+ 				$$ = last_sc = $2;
+ 			else {
+@@ -169,7 +169,7 @@
+ 		}
+ 		;
+ 
+-cmd:		  INSTALL options opt_namelist ';' = {
++cmd:		  INSTALL options opt_namelist ';' {
+ 			register struct namelist *nl;
+ 
+ 			$1->sc_options = $2 | options;
+@@ -185,17 +185,17 @@
+ 			}
+ 			$$ = $1;
+ 		}
+-		| NOTIFY namelist ';' = {
++		| NOTIFY namelist ';' {
+ 			if ($2 != NULL)
+ 				$1->sc_args = expand($2, E_VARS);
+ 			$$ = $1;
+ 		}
+-		| EXCEPT namelist ';' = {
++		| EXCEPT namelist ';' {
+ 			if ($2 != NULL)
+ 				$1->sc_args = expand($2, E_ALL);
+ 			$$ = $1;
+ 		}
+-		| PATTERN namelist ';' = {
++		| PATTERN namelist ';' {
+ 			struct namelist *nl;
+ 			char *cp, *re_comp();
+ 
+@@ -205,13 +205,13 @@
+ 			$1->sc_args = expand($2, E_VARS);
+ 			$$ = $1;
+ 		}
+-		| SPECIAL opt_namelist STRING ';' = {
++		| SPECIAL opt_namelist STRING ';' {
+ 			if ($2 != NULL)
+ 				$1->sc_args = expand($2, E_ALL);
+ 			$1->sc_name = $3;
+ 			$$ = $1;
+ 		}
+-		| CMDSPECIAL opt_namelist STRING ';' = {
++		| CMDSPECIAL opt_namelist STRING ';' {
+ 			if ($2 != NULL)
+ 				$1->sc_args = expand($2, E_ALL);
+ 			$1->sc_name = $3;
+@@ -219,18 +219,18 @@
+ 		}
+ 		;
+ 
+-options:	  /* VOID */ = {
++options:	  /* VOID */ {
+ 			$$ = 0;
+ 		}
+-		| options OPTION = {
++		| options OPTION {
+ 			$$ |= $2;
+ 		}
+ 		;
+ 
+-opt_namelist:	  /* VOID */ = {
++opt_namelist:	  /* VOID */ {
+ 			$$ = NULL;
+ 		}
+-		| namelist = {
++		| namelist {
+ 			$$ = $1;
+ 		}
+ 		;
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch
new file mode 100644
index 000000000..ed3d7f1b3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-cleanup.patch
@@ -0,0 +1,2087 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/gram.y.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/src/gram.y	2003-12-17 11:38:16.000000000 +0100
+@@ -40,7 +40,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: gram.y,v 6.30 1998/11/10 04:10:42 mcooper Exp $";
+ 
+@@ -170,7 +170,7 @@
+ 		;
+ 
+ cmd:		  INSTALL options opt_namelist ';' {
+-			register struct namelist *nl;
++			struct namelist *nl;
+ 
+ 			$1->sc_options = $2 | options;
+ 			if ($3 != NULL) {
+@@ -240,11 +240,11 @@
+ int	yylineno = 1;
+ extern	FILE *fin;
+ 
+-yylex()
++int yylex()
+ {
+ 	static char yytext[INMAX];
+-	register int c;
+-	register char *cp1, *cp2;
++	int c;
++	char *cp1, *cp2;
+ 	static char quotechars[] = "[]{}*?$";
+ 	
+ again:
+@@ -409,8 +409,8 @@
+  * some of the characters we use.
+  */
+ extern int any(c, str)
+-	register int c;
+-	register char *str;
++	int c;
++	char *str;
+ {
+ 	while (*str)
+ 		if (c == *str++)
+@@ -421,13 +421,14 @@
+ /*
+  * Insert or append ARROW command to list of hosts to be updated.
+  */
++void
+ insert(label, files, hosts, subcmds)
+ 	char *label;
+ 	struct namelist *files, *hosts;
+ 	struct subcmd *subcmds;
+ {
+-	register struct cmd *c, *prev, *nc;
+-	register struct namelist *h, *lasth;
++	struct cmd *c, *prev, *nc;
++	struct namelist *h, *lasth;
+ 
+ 	debugmsg(DM_CALL, "insert(%s, %x, %x, %x) start, files = %s", 
+ 		 label == NULL ? "(null)" : label,
+@@ -475,13 +476,14 @@
+  * Append DCOLON command to the end of the command list since these are always
+  * executed in the order they appear in the distfile.
+  */
++void
+ append(label, files, stamp, subcmds)
+ 	char *label;
+ 	struct namelist *files;
+ 	char *stamp;
+ 	struct subcmd *subcmds;
+ {
+-	register struct cmd *c;
++	struct cmd *c;
+ 
+ 	c = ALLOC(cmd);
+ 	c->c_type = DCOLON;
+@@ -501,6 +503,7 @@
+ /*
+  * Error printing routine in parser.
+  */
++void
+ yyerror(s)
+ 	char *s;
+ {
+@@ -530,7 +533,7 @@
+ makenl(name)
+ 	char *name;
+ {
+-	register struct namelist *nl;
++	struct namelist *nl;
+ 
+ 	debugmsg(DM_CALL, "makenl(%s)", name == NULL ? "null" : name);
+ 
+@@ -627,7 +630,7 @@
+ makesubcmd(type)
+ 	int type;
+ {
+-	register struct subcmd *sc;
++	struct subcmd *sc;
+ 
+ 	sc = ALLOC(subcmd);
+ 	sc->sc_type = type;
+--- rdist-6.1.5/src/rdist.c.cleanup	1998-11-10 05:13:50.000000000 +0100
++++ rdist-6.1.5/src/rdist.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: rdist.c,v 6.66 1998/11/10 04:13:49 mcooper Exp $";
+ 
+@@ -80,7 +80,7 @@
+ 	char *name;
+ 	struct namelist **hostlist;
+ {
+-	register struct namelist *ptr, *new;
++	struct namelist *ptr, *new;
+ 
+ 	if (!name || !hostlist)
+ 		return;
+@@ -97,14 +97,15 @@
+ 		*hostlist = new;
+ }
+ 
++int
+ main(argc, argv, envp)
+ 	int argc;
+ 	char *argv[];
+ 	char **envp;
+ {
+ 	struct namelist *hostlist = NULL;
+-	register int x;
+-	register char *cp;
++	int x;
++	char *cp;
+ 	int cmdargs = 0;
+ 	int c;
+ 
+@@ -114,7 +115,7 @@
+ 	 */
+ 	setprogname(argv);
+ 
+-	if (cp = msgparseopts(localmsglist, TRUE)) {
++	if ((cp = msgparseopts(localmsglist, TRUE))) {
+ 		error("Bad builtin log option (%s): %s.", 
+ 		      localmsglist, cp);
+ 		usage();
+@@ -158,7 +159,7 @@
+ 	while ((c = getopt(argc, argv, optchars)) != -1)
+ 		switch (c) {
+ 		case 'l':
+-			if (cp = msgparseopts(optarg, TRUE)) {
++			if ((cp = msgparseopts(optarg, TRUE))) {
+ 				error("Bad log option \"%s\": %s.", optarg,cp);
+ 				usage();
+ 			}
+@@ -206,7 +207,7 @@
+ 
+ 		case 'D':
+ 			debug = DM_ALL;
+-			if (cp = msgparseopts("stdout=all,debug", TRUE)) {
++			if ((cp = msgparseopts("stdout=all,debug", TRUE))) {
+ 				error("Enable debug messages failed: %s.", cp);
+ 				usage();
+ 			}
+@@ -245,7 +246,7 @@
+ 				error("No path specified to \"-P\".");
+ 				usage();
+ 			}
+-			if (cp = searchpath(optarg))
++			if ((cp = searchpath(optarg)))
+ 				path_remsh = strdup(cp);
+ 			else {
+ 				error("No component of path \"%s\" exists.",
+@@ -297,7 +298,7 @@
+ 	else {
+ 		if (fin == NULL)
+ 			fin = opendist(distfile);
+-		(void) yyparse();
++		yyparse();
+ 		/*
+ 		 * Need to keep stdin open for child processing later
+ 		 */
+@@ -348,6 +349,7 @@
+ /*
+  * Print usage message and exit.
+  */
++void
+ usage()
+ {
+ 	char *sopts = "cDFnv";
+@@ -379,12 +381,13 @@
+ /*
+  * rcp like interface for distributing files.
+  */
++void
+ docmdargs(nargs, args)
+ 	int nargs;
+ 	char *args[];
+ {
+-	register struct namelist *nl, *prev;
+-	register char *cp;
++	struct namelist *nl, *prev;
++	char *cp;
+ 	struct namelist *files, *hosts;
+ 	struct subcmd *cmds;
+ 	char *dest;
+@@ -433,10 +436,10 @@
+  * Get a list of NAME blocks (mostly for debugging).
+  */
+ extern char *getnlstr(nl)
+-	register struct namelist *nl;
++	struct namelist *nl;
+ {
+ 	static char buf[16384];
+-	register int count = 0, len = 0;
++	int count = 0, len = 0;
+ 
+ 	(void) sprintf(buf, "(");
+ 
+--- rdist-6.1.5/src/client.c.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/src/client.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: client.c,v 6.82 1998/11/10 04:08:47 mcooper Exp $";
+ 
+@@ -84,7 +84,7 @@
+ 	int destdir;
+ {
+ 	extern struct namelist *filelist;
+-	register char *lname, *cp;
++	char *lname, *cp;
+ 	static char buff[BUFSIZ];
+ 	int srclen, pathlen;
+ 	char *p;
+@@ -146,7 +146,7 @@
+ 	struct namelist *list;
+ 	char *file;
+ {
+-	register struct namelist *nl;
++	struct namelist *nl;
+ 
+ 	for (nl = list; nl != NULL; nl = nl->n_next)
+ 		if (strcmp(file, nl->n_name) == 0)
+@@ -163,7 +163,7 @@
+ 	char *rname;
+ 	int destdir;
+ {
+-	register struct subcmd *sc;
++	struct subcmd *sc;
+ 	extern struct subcmd *subcmds;
+ 	char *rfile;
+ 
+@@ -200,7 +200,7 @@
+ {
+ 	char *rfile;
+ 	struct namelist *new;
+-	register struct subcmd *sc;
++	struct subcmd *sc;
+ 	extern struct subcmd *subcmds;
+ 	int isokay = 0;
+ 
+@@ -227,7 +227,7 @@
+  */
+ static void freecmdspecialfiles()
+ {
+-	register struct namelist *ptr, *save;
++	struct namelist *ptr, *save;
+ 
+ 	for (ptr = updfilelist; ptr; ) {
+ 		if (ptr->n_name) (void) free(ptr->n_name);
+@@ -249,10 +249,8 @@
+ 	char **filev;
+ 	opt_t opts;
+ {
+-	register struct subcmd *sc;
+-	register struct namelist *f;
+-	register char **cpp;
+-	char *file;
++	struct subcmd *sc;
++	struct namelist *f;
+ 	int first = TRUE;
+ 
+ 	for (sc = cmd->c_cmds; sc != NULL; sc = sc->sc_next) {
+@@ -294,7 +292,7 @@
+ int checkfilename(name)
+ 	char *name;
+ {
+-	register char *cp;
++	char *cp;
+ 
+ 	if (strchr(name, '\n')) {
+ 		for (cp = name; *cp; cp++)
+@@ -501,7 +499,7 @@
+ static int rmchk(opts)
+ 	opt_t opts;
+ {
+-	register u_char *s;
++	u_char *s;
+ 	struct stat stb;
+ 	int didupdate = 0;
+ 	int n;
+@@ -618,7 +616,7 @@
+ 	
+ 	optarget = ptarget;
+ 	len = ptarget - target;
+-	while (dp = readdir(d)) {
++	while ((dp = readdir(d))) {
+ 		if (!strcmp(dp->d_name, ".") ||
+ 		    !strcmp(dp->d_name, ".."))
+ 			continue;
+@@ -631,7 +629,7 @@
+ 		if (ptarget[-1] != '/')
+ 			*ptarget++ = '/';
+ 		cp = dp->d_name;
+-		while (*ptarget++ = *cp++)
++		while ((*ptarget++ = *cp++))
+ 			;
+ 		ptarget--;
+ 		if (sendit(dp->d_name, opts, destdir) > 0)
+@@ -770,13 +768,13 @@
+ 	opt_t opts;
+ 	struct stat *statp;
+ {
+-	register off_t size;
+-	register time_t mtime;
++	off_t size;
++	time_t mtime;
+ 	unsigned short lmode;
+ 	unsigned short rmode;
+ 	char *owner = NULL, *group = NULL;
+ 	int done, n;
+-	u_char *cp;
++	char *cp;
+ 
+ 	debugmsg(DM_CALL, "update(%s, 0x%x, 0x%x)\n", rname, opts, statp);
+ 
+@@ -1035,7 +1033,6 @@
+ 	int destdir;
+ {
+ 	static struct stat stb;
+-	extern struct subcmd *subcmds;
+ 	char *user, *group;
+ 	int u, len;
+ 	int didupdate = 0;
+@@ -1157,7 +1154,7 @@
+ 	(void) unlink(statfile);
+ #endif
+ 
+-	if (file = getnotifyfile())
++	if ((file = getnotifyfile()))
+ 		(void) unlink(file);
+ }
+ 
+--- rdist-6.1.5/src/child.c.cleanup	1998-11-10 05:18:57.000000000 +0100
++++ rdist-6.1.5/src/child.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: child.c,v 6.29 1998/11/10 04:18:56 mcooper Exp $";
+ 
+@@ -90,7 +90,7 @@
+ static void removechild(child)
+ 	CHILD *child;
+ {
+-	register CHILD *pc, *prevpc;
++	CHILD *pc, *prevpc;
+ 
+ 	debugmsg(DM_CALL, "removechild(%s, %d, %d) start",
+ 		 child->c_name, child->c_pid, child->c_readfd);
+@@ -148,7 +148,7 @@
+ static CHILD *copychild(child)
+ 	CHILD *child;
+ {
+-	register CHILD *newc;
++	CHILD *newc;
+ 
+ 	newc = (CHILD *) xmalloc(sizeof(CHILD));
+ 
+@@ -167,7 +167,7 @@
+ static void addchild(child)
+ 	CHILD *child;
+ {
+-	register CHILD *pc;
++	CHILD *pc;
+ 
+ 	debugmsg(DM_CALL, "addchild() start\n");
+ 
+@@ -280,7 +280,7 @@
+  */
+ static void reap()
+ {
+-	register CHILD *pc;
++	CHILD *pc;
+ 	int status = 0;
+ 	pid_t pid;
+ 
+@@ -336,7 +336,7 @@
+  */
+ static void childscan() 
+ {
+-	register CHILD *pc, *nextpc;
++	CHILD *pc, *nextpc;
+ 	
+ 	debugmsg(DM_CALL, "childscan() start");
+ 
+@@ -366,8 +366,8 @@
+ extern void waitup()
+ {
+ #if	defined(HAVE_SELECT)
+-	register int count;
+-	register CHILD *pc;
++	int count;
++	CHILD *pc;
+ 	fd_set rchildfds;
+ 
+ 	debugmsg(DM_CALL, "waitup() start\n");
+--- rdist-6.1.5/src/docmd.c.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/src/docmd.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: docmd.c,v 6.87 1998/11/10 04:08:32 mcooper Exp $";
+ 
+@@ -99,10 +99,10 @@
+  */
+ static void notify(rhost, to, lmod)
+ 	char *rhost;
+-	register struct namelist *to;
++	struct namelist *to;
+ 	time_t lmod;
+ {
+-	register int fd, len;
++	int fd, len;
+ 	FILE *pf, *popen();
+ 	struct stat stb;
+ 	static char buf[BUFSIZ];
+@@ -221,7 +221,7 @@
+ 	struct cmd *cmd;
+ 	struct cmd *cmdlist;
+ {
+-	register struct cmd *pcmd;
++	struct cmd *pcmd;
+ 	
+ 	for (pcmd = cmdlist; pcmd; pcmd = pcmd->c_next) {
+ 		checkcmd(pcmd);
+@@ -238,7 +238,7 @@
+ 	struct cmd *cmd;
+ 	struct cmd *cmdlist;
+ {
+-	register struct cmd *pc;
++	struct cmd *pc;
+ 
+ 	if (!cmd) {
+ 		debugmsg(DM_MISC, "markfailed() NULL cmd parameter");
+@@ -309,7 +309,7 @@
+ static int makeconn(rhost)
+ 	char *rhost;
+ {
+-	register char *ruser, *cp;
++	char *ruser, *cp;
+ 	static char *cur_host = NULL;
+ 	extern char *locuser;
+ 	extern long min_freefiles, min_freespace;
+@@ -430,9 +430,9 @@
+ 	struct cmd *cmd;
+ 	char **filev;
+ {
+-	register struct namelist *f;
+-	register struct subcmd *sc;
+-	register char **cpp;
++	struct namelist *f;
++	struct subcmd *sc;
++	char **cpp;
+ 	int n, ddir, destdir, opts = options;
+ 	struct namelist *files;
+ 	struct subcmd *sbcmds;
+@@ -567,7 +567,6 @@
+ 		}
+ 	}
+ 
+-done:
+ 	/*
+ 	 * Run any commands for the entire cmd
+ 	 */
+@@ -584,7 +583,7 @@
+ 			notify(rhost, sc->sc_args, (time_t) 0);
+ 
+ 	if (!nflag) {
+-		register struct linkbuf *nextl, *l;
++		struct linkbuf *nextl, *l;
+ 
+ 		for (l = ihead; l != NULL; freelinkinfo(l), l = nextl) {
+ 			nextl = l->nextp;
+@@ -601,11 +600,12 @@
+ 	setjmp_ok = FALSE;
+ }
+ 
++int
+ okname(name)
+-	register char *name;
++	char *name;
+ {
+-	register char *cp = name;
+-	register int c, isbad;
++	char *cp = name;
++	int c, isbad;
+ 
+ 	for (isbad = FALSE; *cp && !isbad; ++cp) {
+ 		c = *cp;
+@@ -627,9 +627,9 @@
+ 	struct subcmd *sbcmds;
+ 	char **env;
+ {
+-	register DIR *d;
+-	register DIRENTRY *dp;
+-	register char *cp;
++	DIR *d;
++	DIRENTRY *dp;
++	char *cp;
+ 	char *optarget;
+ 	int len;
+ 
+@@ -641,7 +641,7 @@
+ 	}
+ 	optarget = ptarget;
+ 	len = ptarget - target;
+-	while (dp = readdir(d)) {
++	while ((dp = readdir(d))) {
+ 		if (!strcmp(dp->d_name, ".") || !strcmp(dp->d_name, ".."))
+ 			continue;
+ 		if (len + 1 + (int)strlen(dp->d_name) >= BUFSIZ - 1) {
+@@ -651,7 +651,7 @@
+ 		ptarget = optarget;
+ 		*ptarget++ = '/';
+ 		cp = dp->d_name;
+-		while (*ptarget++ = *cp++)
++		while ((*ptarget++ = *cp++))
+ 			;
+ 		ptarget--;
+ 		cmptime(target, sbcmds, env);
+@@ -740,9 +740,9 @@
+ 	struct cmd *cmd;
+ 	char **filev;
+ {
+-	register struct subcmd *sc;
+-	register struct namelist *f;
+-	register char *cp, **cpp;
++	struct subcmd *sc;
++	struct namelist *f;
++	char *cp, **cpp;
+ 	struct stat stb;
+ 	struct namelist *files = cmd->c_files;
+ 	struct subcmd *sbcmds = cmd->c_cmds;
+@@ -824,8 +824,8 @@
+ extern int except(file)
+ 	char *file;
+ {
+-	register struct	subcmd *sc;
+-	register struct	namelist *nl;
++	struct	subcmd *sc;
++	struct	namelist *nl;
+ 
+ 	debugmsg(DM_CALL, "except(%s)", file);
+ 
+@@ -918,8 +918,8 @@
+ 	int argc;
+ 	char **argv;
+ {
+-	register struct namelist *f;
+-	register int i;
++	struct namelist *f;
++	int i;
+ 
+ 	if (argc) {
+ 		for (i = 0; i < argc; i++) {
+@@ -962,9 +962,9 @@
+ 	int argc;
+ 	char **argv;
+ {
+-	register struct cmd *c;
+-	register char *cp;
+-	register int i;
++	struct cmd *c;
++	char *cp;
++	int i;
+ 
+ 	(void) signal(SIGHUP, sighandler);
+ 	(void) signal(SIGINT, sighandler);
+@@ -1032,7 +1032,7 @@
+ 
+ 		if (hostlist) {
+ 			/* Do specific hosts as specified on command line */
+-			register struct namelist *nlptr;
++			struct namelist *nlptr;
+ 
+ 			for (nlptr = hostlist; nlptr; nlptr = nlptr->n_next)
+ 				/*
+--- rdist-6.1.5/src/distopt.c.cleanup	1998-11-10 05:09:11.000000000 +0100
++++ rdist-6.1.5/src/distopt.c	2003-12-17 11:38:16.000000000 +0100
+@@ -6,7 +6,7 @@
+  * appropriately.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: distopt.c,v 6.12 1998/11/10 04:09:11 mcooper Exp $";
+ 
+@@ -55,7 +55,7 @@
+ extern DISTOPTINFO *getdistopt(name)
+ 	char *name;
+ {
+-	register int i;
++	int i;
+ 
+ 	for (i = 0; distoptinfo[i].do_name; ++i)
+ 		if (strcasecmp(name, distoptinfo[i].do_name) == 0)
+@@ -74,7 +74,7 @@
+ 	opt_t *optptr;
+ 	int doerrs;
+ {
+-	register char *string, *optstr;
++	char *string, *optstr;
+ 	DISTOPTINFO *distopt;
+ 	int negate;
+ 
+@@ -93,7 +93,7 @@
+ 		 * and the option starts with "no", strip "no"
+ 		 * from option and retry lookup.
+ 		 */
+-		if (distopt = getdistopt(optstr)) {
++		if ((distopt = getdistopt(optstr))) {
+ 			FLAG_ON(*optptr, distopt->do_value);
+ 			continue;
+ 		}
+@@ -116,7 +116,7 @@
+  */
+ extern char *getdistoptlist()
+ {
+-	register int i;
++	int i;
+ 	static char buf[1024];
+ 
+ 	for (i = 0, buf[0] = CNULL; distoptinfo[i].do_name; ++i) {
+@@ -138,7 +138,7 @@
+ extern char *getondistoptlist(opts)
+ 	opt_t opts;
+ {
+-	register int i;
++	int i;
+ 	static char buf[1024];
+ 
+ 	for (i = 0, buf[0] = CNULL; distoptinfo[i].do_name; ++i) {
+--- rdist-6.1.5/src/expand.c.cleanup	1998-11-10 05:09:31.000000000 +0100
++++ rdist-6.1.5/src/expand.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: expand.c,v 6.19 1998/11/10 04:09:31 mcooper Exp $";
+ 
+@@ -81,9 +81,9 @@
+ 		      sizeof(*sortbase), argcmp), sortbase = &eargv[eargc]
+ 
+ static void Cat(s1, s2)				/* quote in s1 and s2 */
+-	register u_char *s1, *s2;
++	u_char *s1, *s2;
+ {
+-	register char *cp;
++	char *cp;
+ 	int len = strlen((char *)s1) + strlen((char *)s2) + 2;
+ 
+ 	if ((eargc + 1) >= MAXEARGS) {
+@@ -97,12 +97,12 @@
+ 	do { 
+ 		if (*s1 == QUOTECHAR) 
+ 			s1++; 
+-	} while (*cp++ = *s1++);
++	} while ((*cp++ = *s1++));
+ 	cp--;
+ 	do { 
+ 		if (*s2 == QUOTECHAR) 
+ 			s2++; 
+-	} while (*cp++ = *s2++);
++	} while ((*cp++ = *s2++));
+ }
+ 
+ static void addpath(c)
+@@ -131,8 +131,8 @@
+ 	struct namelist *list;
+ 	int wh;
+ {
+-	register struct namelist *nl, *prev;
+-	register int n;
++	struct namelist *nl, *prev;
++	int n;
+ 	char pathbuf[BUFSIZ];
+ 
+ 	if (debug)
+@@ -182,7 +182,7 @@
+ 	u_char *str;
+ 	int ch;
+ {
+-	register u_char *cp;
++	u_char *cp;
+ 
+ 	for (cp = str; cp && *cp != CNULL; ++cp)
+ 		if (ch == *cp)
+@@ -194,8 +194,8 @@
+ void expstr(s)
+ 	u_char *s;
+ {
+-	register u_char *cp, *cp1;
+-	register struct namelist *tp;
++	u_char *cp, *cp1;
++	struct namelist *tp;
+ 	u_char *tail;
+ 	u_char ebuf[BUFSIZ];
+ 	u_char varbuff[BUFSIZ];
+@@ -302,7 +302,7 @@
+ 			cp1 = (u_char *)pw->pw_dir;
+ 			s = cp;
+ 		}
+-		for (cp = (u_char *)path; *cp++ = *cp1++; )
++		for (cp = (u_char *)path; (*cp++ = *cp1++); )
+ 			;
+ 		tpathp = pathp = (char *)cp - 1;
+ 	} else {
+@@ -326,7 +326,7 @@
+ 	sort();
+ }
+ 
+-static
++static int
+ argcmp(a1, a2)
+ 	char **a1, **a2;
+ {
+@@ -341,8 +341,8 @@
+ void expsh(s)				/* quote in s */
+ 	u_char *s;
+ {
+-	register u_char *cp, *oldcp;
+-	register char *spathp;
++	u_char *cp, *oldcp;
++	char *spathp;
+ 	struct stat stb;
+ 
+ 	spathp = pathp;
+@@ -380,7 +380,7 @@
+ 	char *pattern;
+ {
+ 	struct stat stb;
+-	register DIRENTRY *dp;
++	DIRENTRY *dp;
+ 	DIR *dirp;
+ 
+ 	dirp = opendir(path);
+@@ -417,11 +417,12 @@
+ 	yyerror(path);
+ }
+ 
++int
+ execbrc(p, s)				/* quote in p */
+ 	u_char *p, *s;
+ {
+ 	u_char restbuf[BUFSIZ + 2];
+-	register u_char *pe, *pm, *pl;
++	u_char *pe, *pm, *pl;
+ 	int brclev = 0;
+ 	u_char *lm, savec;
+ 	char *spathp;
+@@ -507,11 +508,12 @@
+ 	return (0);
+ }
+ 
++int
+ match(s, p)					/* quote in p */
+ 	char *s, *p;
+ {
+-	register int c;
+-	register char *sentp;
++	int c;
++	char *sentp;
+ 	char sexpany = expany;
+ 
+ 	if (*s == '.' && *p != '.')
+@@ -524,11 +526,12 @@
+ 	return (c);
+ }
+ 
++int
+ amatch(s, p)					/* quote in p */
+-	register char *s;
+-	register u_char *p;
++	char *s;
++	u_char *p;
+ {
+-	register int scc;
++	int scc;
+ 	int ok, lc;
+ 	char *spathp;
+ 	struct stat stb;
+@@ -545,7 +548,7 @@
+ 		case '[':
+ 			ok = 0;
+ 			lc = 077777;
+-			while (cc = *p++) {
++			while ((cc = *p++)) {
+ 				if (cc == ']') {
+ 					if (ok)
+ 						break;
+@@ -599,7 +602,7 @@
+ 			while (*s)
+ 				addpath(*s++);
+ 			addpath('/');
+-			if (stat(path, &stb) == 0 && S_ISDIR(stb.st_mode))
++			if (stat(path, &stb) == 0 && S_ISDIR(stb.st_mode)) {
+ 				if (*p == CNULL) {
+ 					if (which & E_TILDE)
+ 						Cat((u_char *)path, 
+@@ -609,6 +612,7 @@
+ 						    (u_char *)tpathp);
+ 				} else
+ 					expsh(p);
++			}
+ 			pathp = spathp;
+ 			*pathp = CNULL;
+ 			return (0);
+--- rdist-6.1.5/src/lookup.c.cleanup	1998-11-10 05:12:56.000000000 +0100
++++ rdist-6.1.5/src/lookup.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: lookup.c,v 6.9 1998/11/10 04:12:56 mcooper Exp $";
+ 
+@@ -68,11 +68,12 @@
+ /*
+  * Define a variable from a command line argument.
+  */
++void
+ define(name)
+ 	char *name;
+ {
+-	register char *cp, *s;
+-	register struct namelist *nl;
++	char *cp, *s;
++	struct namelist *nl;
+ 	struct namelist *value;
+ 
+ 	debugmsg(DM_CALL, "define(%s)", name);
+@@ -137,9 +138,9 @@
+ 	int action;
+ 	struct namelist *value;
+ {
+-	register unsigned n;
+-	register char *cp;
+-	register struct syment *s;
++	unsigned n;
++	char *cp;
++	struct syment *s;
+ 	char ebuf[BUFSIZ];
+ 
+ 	debugmsg(DM_CALL, "lookup(%s, %d, %x)", name, action, value);
+--- rdist-6.1.5/src/isexec.c.cleanup	1998-11-10 05:11:42.000000000 +0100
++++ rdist-6.1.5/src/isexec.c	2003-12-17 11:38:16.000000000 +0100
+@@ -37,7 +37,7 @@
+  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  * SUCH DAMAGE.
+  */
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: isexec.c,v 6.22 1998/11/10 04:11:42 mcooper Exp $";
+ 
+--- rdist-6.1.5/src/signal.c.cleanup	1998-11-10 05:16:13.000000000 +0100
++++ rdist-6.1.5/src/signal.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: signal.c,v 6.2 1998/11/10 04:16:13 mcooper Exp $";
+ 
+--- rdist-6.1.5/src/rshrcmd.c.cleanup	1998-11-10 05:15:07.000000000 +0100
++++ rdist-6.1.5/src/rshrcmd.c	2003-12-17 11:38:16.000000000 +0100
+@@ -10,7 +10,7 @@
+  * Chris Siebenmann <cks@utcc.utoronto.ca>.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: rshrcmd.c,v 1.9 1998/11/10 04:15:07 mcooper Exp $";
+ 
+@@ -34,6 +34,7 @@
+  * program in place of a direct rcmd() function call so as to
+  * avoid having to be root.
+  */
++int
+ rshrcmd(ahost, port, luser, ruser, cmd, fd2p)
+ 	char  	**ahost;
+ 	u_short	port;
+@@ -108,6 +109,7 @@
+ 		(void) wait(0);
+ 		return sp[0];
+ 	}
++	return -1;
+ 	/*NOTREACHED*/
+ }
+ 
+--- rdist-6.1.5/src/common.c.cleanup	1998-11-10 05:09:01.000000000 +0100
++++ rdist-6.1.5/src/common.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: common.c,v 6.84 1998/11/10 04:09:01 mcooper Exp $";
+ 
+@@ -87,14 +87,14 @@
+ /* 
+  * Front end to write() that handles partial write() requests.
+  */
+-extern WRITE_RETURN_T xwrite(fd, buf, len)
++WRITE_RETURN_T xwrite(fd, buf, len)
+ 	int fd;
+ 	void *buf;
+ 	WRITE_AMT_T len;
+ {
+     	WRITE_AMT_T nleft = len;
+ 	WRITE_RETURN_T nwritten;
+-	register char *ptr = buf;
++	char *ptr = buf;
+          
+ 	while (nleft > 0) {
+ 	    	if ((nwritten = write(fd, ptr, nleft)) <= 0) {
+@@ -110,14 +110,14 @@
+ /*
+  * Set program name
+  */
+-extern void setprogname(argv)
++void setprogname(argv)
+ 	char **argv;
+ {
+-	register char *cp;
++	char *cp;
+ 
+ 	if (!progname) {
+ 		progname = strdup(argv[0]);
+-		if (cp = strrchr(progname, '/'))
++		if ((cp = strrchr(progname, '/')))
+ 			progname = cp + 1;
+ 	}
+ }
+@@ -125,14 +125,14 @@
+ /*
+  * Do run-time initialization
+  */
+-extern int init(argc, argv, envp)
++int init(argc, argv, envp)
+ 	/*ARGSUSED*/
+ 	int argc;
+ 	char **argv;
+ 	char **envp;
+ {
+-	register int i;
+-	register char *cp;
++	int i;
++	char *cp;
+ 
+ 	if (!isserver)
+ 		(void) signal(SIGSEGV, sighandler);
+@@ -182,7 +182,7 @@
+ /*
+  * Finish things up before ending.
+  */
+-extern void finish()
++void finish()
+ {
+ 	extern jmp_buf finish_jmpbuf;
+ 
+@@ -216,7 +216,7 @@
+ /*
+  * Handle lost connections
+  */
+-extern void lostconn()
++void lostconn()
+ {
+ 	/* Prevent looping */
+ 	(void) signal(SIGPIPE, SIG_IGN);
+@@ -232,7 +232,7 @@
+ /*
+  * Do a core dump
+  */
+-extern void coredump()
++void coredump()
+ {
+ 	error("Segmentation violation - dumping core [PID = %d, %s]",
+ 	      getpid(), 
+@@ -245,7 +245,7 @@
+ /*
+  * General signal handler
+  */
+-extern void sighandler(sig)
++void sighandler(sig)
+ 	int sig;
+ {
+ 	debugmsg(DM_CALL, "sighandler() received signal %d\n", sig);
+@@ -325,7 +325,7 @@
+ /*
+  * Stdarg frontend to sendcmdmsg()
+  */
+-extern int sendcmd(char cmd, char *fmt, ...)
++int sendcmd(char cmd, char *fmt, ...)
+ {
+ 	static char buf[BUFSIZ];
+ 	va_list args;
+@@ -345,7 +345,7 @@
+ /*
+  * Varargs frontend to sendcmdmsg()
+  */
+-extern int sendcmd(va_alist)
++int sendcmd(va_alist)
+ 	va_dcl
+ {
+ 	static char buf[BUFSIZ];
+@@ -372,7 +372,7 @@
+  * Stupid frontend to sendcmdmsg()
+  */
+ /*VARARGS2*/
+-extern int sendcmd(cmd, fmt, a1, a2, a3, a4, a5, a6, a7, a8)
++int sendcmd(cmd, fmt, a1, a2, a3, a4, a5, a6, a7, a8)
+ 	char cmd;
+ 	char *fmt;
+ {
+@@ -433,13 +433,13 @@
+  * errors, call cleanup() or lostconn().  In other words, unless
+  * the third argument is nonzero, this routine never returns failure.
+  */
+-extern int remline(buffer, space, doclean)
+-	register u_char *buffer;
++int remline(buffer, space, doclean)
++	u_char *buffer;
+ 	int space;
+ 	int doclean;
+ {
+-	register int c, left = space;
+-	register u_char *p = buffer;
++	int c, left = space;
++	u_char *p = buffer;
+ 
+ 	if (rem_r < 0) {
+ 		error("Cannot read remote input: Remote descriptor not open.");
+@@ -494,9 +494,9 @@
+ /*
+  * Non-line-oriented remote read.
+  */
+-readrem(p, space)
++int readrem(p, space)
+ 	char *p;
+-	register int space;
++	int space;
+ {
+ 	if (remleft <= 0) {
+ 		/*
+@@ -527,7 +527,7 @@
+ /*
+  * Get the user name for the uid.
+  */
+-extern char *getusername(uid, file, opts)
++char *getusername(uid, file, opts)
+ 	UID_T uid;
+ 	char *file;
+ 	opt_t opts;
+@@ -566,7 +566,7 @@
+ /*
+  * Get the group name for the gid.
+  */
+-extern char *getgroupname(gid, file, opts)
++char *getgroupname(gid, file, opts)
+ 	GID_T gid;
+ 	char *file;
+ 	opt_t opts;
+@@ -604,7 +604,7 @@
+ /*
+  * Read a response from the remote host.
+  */
+-extern int response()
++int response()
+ {
+ 	static u_char resp[BUFSIZ];
+ 	u_char *s;
+@@ -646,6 +646,7 @@
+ 			message(MT_FERROR, "%s", s);
+ 		finish();
+ 	}
++	return -1;
+ 	/*NOTREACHED*/
+ }
+ 
+@@ -657,11 +658,11 @@
+  * user's home directory path name. Return a pointer in buf to the
+  * part corresponding to `file'.
+  */
+-extern char *exptilde(ebuf, file)
++char *exptilde(ebuf, file)
+ 	char *ebuf;
+-	register char *file;
++	char *file;
+ {
+-	register char *s1, *s2, *s3;
++	char *s1, *s2, *s3;
+ 	extern char *homedir;
+ 
+ 	if (*file != '~') {
+@@ -694,12 +695,12 @@
+ 			*s3 = '/';
+ 		s2 = pw->pw_dir;
+ 	}
+-	for (s1 = ebuf; *s1++ = *s2++; )
++	for (s1 = ebuf; (*s1++ = *s2++); )
+ 		;
+ 	s2 = --s1;
+ 	if (s3 != NULL) {
+ 		s2++;
+-		while (*s1++ = *s3++)
++		while ((*s1++ = *s3++))
+ 			;
+ 	}
+ 	return(s2);
+@@ -710,7 +711,7 @@
+  * Set our effective user id to the user running us.
+  * This should be the uid we do most of our work as.
+  */
+-extern int becomeuser()
++int becomeuser()
+ {
+ 	int r = 0;
+ 
+@@ -732,7 +733,7 @@
+ /*
+  * Set our effective user id to "root" (uid = 0)
+  */
+-extern int becomeroot()
++int becomeroot()
+ {
+ 	int r = 0;
+ 
+@@ -753,7 +754,7 @@
+ /*
+  * Set access and modify times of a given file
+  */
+-extern int setfiletime(file, atime, mtime)
++int setfiletime(file, atime, mtime)
+ 	char *file;
+ 	time_t atime;
+ 	time_t mtime;
+@@ -790,7 +791,7 @@
+ /*
+  * Get version info
+  */
+-extern char *getversion()
++char *getversion()
+ {
+ 	static char buff[BUFSIZ];
+ 
+@@ -811,7 +812,7 @@
+ {
+ 	int fd[2], pid, i;
+ 	int status;
+-	register char *cp, *s;
++	char *cp, *s;
+ 	char sbuf[BUFSIZ], buf[BUFSIZ];
+ 
+ 	if (pipe(fd) < 0) {
+@@ -933,12 +934,12 @@
+ /*
+  * Private version of basename()
+  */
+-extern char *xbasename(path)
++char *xbasename(path)
+ 	char *path;
+ {
+-	register char *cp;
++	char *cp;
+  
+-	if (cp = strrchr(path, '/'))
++	if ((cp = strrchr(path, '/')))
+ 		return(cp+1);
+ 	else
+ 		return(path);
+@@ -949,11 +950,11 @@
+  * search until a component of that path is found and
+  * return the found file name.
+  */
+-extern char *searchpath(path)
++char *searchpath(path)
+ 	char *path;
+ {
+-	register char *cp;
+-	register char *file;
++	char *cp;
++	char *file;
+ 	struct stat statbuf;
+ 
+ 	for (; ;) {
+@@ -977,8 +978,7 @@
+ /*
+  * Set line buffering.
+  */
+-extern void
+-mysetlinebuf(fp)
++void mysetlinebuf(fp)
+ 	FILE *fp;
+ {
+ #if	SETBUF_TYPE == SETBUF_SETLINEBUF
+@@ -995,8 +995,7 @@
+ /*
+  * Our interface to system call to get a socket pair.
+  */
+-int
+-getsocketpair(domain, type, protocol, sv)
++int getsocketpair(domain, type, protocol, sv)
+ 	int domain;
+ 	int type;
+ 	int protocol;
+--- rdist-6.1.5/src/message.c.cleanup	1998-11-10 05:13:30.000000000 +0100
++++ rdist-6.1.5/src/message.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: message.c,v 6.25 1998/11/10 04:13:30 mcooper Exp $";
+ 
+@@ -97,7 +97,7 @@
+  */
+ extern void msgprusage()
+ {
+-	register int i, x;
++	int i, x;
+ 
+ 	(void) fprintf(stderr, "\nWhere <msgopt> is of form\n");
+ 	(void) fprintf(stderr, 
+@@ -120,7 +120,7 @@
+  */
+ extern void msgprconfig()
+ {
+-	register int i, x;
++	int i, x;
+ 	static char buf[MSGBUFSIZ];
+ 
+ 	debugmsg(DM_MISC, "Current message logging config:");
+@@ -145,7 +145,7 @@
+ static MSGFACILITY *getmsgfac(name)
+ 	char *name;
+ {
+-	register int i;
++	int i;
+ 
+ 	for (i = 0; msgfacility[i].mf_name; ++i)
+ 		if (strcasecmp(name, msgfacility[i].mf_name) == 0)
+@@ -160,7 +160,7 @@
+ static MSGTYPE *getmsgtype(name)
+ 	char *name;
+ {
+-	register int i;
++	int i;
+ 
+ 	for (i = 0; msgtypes[i].mt_name; ++i)
+ 		if (strcasecmp(name, msgtypes[i].mt_name) == 0)
+@@ -178,9 +178,9 @@
+ 	char *str;
+ {
+ 	static char ebuf[BUFSIZ];
+-	register char *cp;
+-	register char *strptr, *word;
+-	register MSGTYPE *mtp;
++	char *cp;
++	char *strptr, *word;
++	MSGTYPE *mtp;
+ 
+ 	/*
+ 	 * MF_SYSLOG is the only supported message facility for the server
+@@ -240,11 +240,11 @@
+ 	msgfac->mf_msgtypes = 0;	/* Start from scratch */
+ 	while (strptr) {
+ 		word = strptr;
+-		if (cp = strchr(strptr, ','))
++		if ((cp = strchr(strptr, ',')))
+ 			*cp++ = CNULL;
+ 		strptr = cp;
+ 
+-		if (mtp = getmsgtype(word)) {
++		if ((mtp = getmsgtype(word))) {
+ 			msgfac->mf_msgtypes |= mtp->mt_type;
+ 			/*
+ 			 * XXX This is really a kludge until we add real
+@@ -272,8 +272,8 @@
+ 	int doset;
+ {
+ 	static char ebuf[BUFSIZ], msgbuf[MSGBUFSIZ];
+-	register char *cp, *optstr;
+-	register char *word;
++	char *cp, *optstr;
++	char *word;
+ 	MSGFACILITY *msgfac;
+ 
+ 	if (msgstr == NULL)
+@@ -308,7 +308,7 @@
+ 		if (doset) {
+ 			char *mcp;
+ 
+-			if (mcp = setmsgtypes(msgfac, cp))
++			if ((mcp = setmsgtypes(msgfac, cp)))
+ 				return(mcp);
+ 		}
+ 	}
+@@ -462,8 +462,9 @@
+ 		return;
+ 
+ 	if (!msgfac->mf_fptr) {
+-		register char *cp;
++		char *cp;
+ 		char *getenv();
++		int fd;
+ 
+ 		/*
+ 		 * Create and open a new temporary file
+@@ -475,7 +476,10 @@
+ 		(void) sprintf(tempfile, "%s/%s", cp, _RDIST_TMP);
+ 
+ 		msgfac->mf_filename = tempfile;
+-		(void) mktemp(msgfac->mf_filename);
++		fd = mkstemp(msgfac->mf_filename);
++			if (fd < 0)
++				fatalerr("Cannot open notify file for writing: %s: %s.", msgfac->mf_filename, SYSERR);
++		close(fd);
+ 		if ((msgfac->mf_fptr = fopen(msgfac->mf_filename, "w"))==NULL)
+ 			fatalerr("Cannot open notify file for writing: %s: %s.",
+ 			      msgfac->mf_filename, SYSERR);
+@@ -515,15 +519,15 @@
+ 	int flags;
+ 	char *msgbuf;
+ {
+-	register int i, x;
+-	register char *cp;
++	int i, x;
++	char *cp;
+ 	static char mbuf[2048];
+ 
+ 	if (msgbuf && *msgbuf) {
+ 		/*
+ 		 * Ensure no stray newlines are present
+ 		 */
+-		if (cp = strchr(msgbuf, '\n'))
++		if ((cp = strchr(msgbuf, '\n')))
+ 			*cp = CNULL;
+ 
+ 		checkhostname();
+@@ -863,7 +867,7 @@
+  */
+ extern char *getnotifyfile()
+ {
+-	register int i;
++	int i;
+ 
+ 	for (i = 0; msgfacility[i].mf_name; i++)
+ 		if (msgfacility[i].mf_msgfac == MF_NOTIFY &&
+--- rdist-6.1.5/src/setargs.c.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/src/setargs.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: setargs.c,v 6.5 1998/11/10 04:15:56 mcooper Exp $";
+ 
+@@ -66,12 +66,12 @@
+ /*
+  * Settup things for using setproctitle()
+  */
+-setargs_settup(argc, argv, envp)
++void setargs_settup(argc, argv, envp)
+ 	int			argc;
+ 	char		      **argv;
+ 	char		      **envp;
+ {
+-	register int 		i;
++	int 		i;
+ 	extern char 	      **environ;
+ 
+   	/* Remember the User Environment */
+@@ -92,10 +92,10 @@
+ /*
+  * Set process title
+  */
+-extern void _setproctitle(msg)
++void _setproctitle(msg)
+         char *msg;
+ {
+-	register int i;
++	int i;
+ 	char *p;
+ 	
+ 	p = Argv[0];
+@@ -119,7 +119,7 @@
+ /*
+  * Varargs front-end to _setproctitle()
+  */
+-extern void setproctitle(va_alist)
++void setproctitle(va_alist)
+ 	va_dcl
+ {
+ 	static char buf[BUFSIZ];
+@@ -138,7 +138,7 @@
+ /*
+  * Stdarg front-end to _setproctitle()
+  */
+-extern void setproctitle(char *fmt, ...)
++void setproctitle(char *fmt, ...)
+ {
+ 	static char buf[BUFSIZ];
+ 	va_list args;
+@@ -155,7 +155,7 @@
+  * Non-Varargs front-end to _setproctitle()
+  */
+ /*VARARGS1*/
+-extern void setproctitle(fmt, a1, a2, a3, a4, a5, a6)
++void setproctitle(fmt, a1, a2, a3, a4, a5, a6)
+ 	char *fmt;
+ {
+ 	static char buf[BUFSIZ];
+--- rdist-6.1.5/src/rdistd.c.cleanup	1998-11-10 05:14:06.000000000 +0100
++++ rdist-6.1.5/src/rdistd.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: rdistd.c,v 6.23 1998/11/10 04:14:06 mcooper Exp $";
+ 
+@@ -53,21 +53,12 @@
+ 
+ #include "defs.h"
+ 
+-/*
+- * Print usage message
+- */
+-static void usage()
+-{
+-	fprintf(stderr, "usage: %s -S [ -DV ]\n", progname);
+-	exit(1);
+-}
+-
+ char	localmsglist[] = "syslog=ferror";
+ 
+ /*
+  * The Beginning
+  */
+-main(argc, argv, envp)
++int main(argc, argv, envp)
+ 	int argc;
+ 	char **argv;
+ 	char **envp;
+@@ -95,7 +86,8 @@
+ 		case '?':
+ 		default:
+ 			error("Bad command line option.");
+-			usage();
++			fprintf(stderr, "usage: %s -S [ -DV ]\n", progname);
++			exit(1);
+ 		}
+ 
+ 	if (!isserver) {
+@@ -108,7 +100,7 @@
+ 	rem_w = fileno(stdout);
+ 
+ 	/* Set logging */
+-	if (cp = msgparseopts(localmsglist, TRUE))
++	if ((cp = msgparseopts(localmsglist, TRUE)))
+ 		fatalerr("Bad message logging option (%s): %s", 
+ 			 localmsglist, cp);
+ 
+--- rdist-6.1.5/src/server.c.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/src/server.c	2003-12-17 11:38:16.000000000 +0100
+@@ -37,7 +37,7 @@
+  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  * SUCH DAMAGE.
+  */
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: server.c,v 6.86 1998/11/10 04:15:31 mcooper Exp $";
+ 
+@@ -197,7 +197,7 @@
+ 	static UID_T last_uid = (UID_T)-2;
+ 	static GID_T last_primegid;
+ 	extern char *locuser;
+-	register int i;
++	int i;
+ 	UID_T uid;
+ 	GID_T gid;
+ 	GID_T primegid = (GID_T)-2;
+@@ -252,7 +252,7 @@
+ 	        /*
+ 		 * Invalid cached values so we need to do a new lookup.
+ 		 */
+-		if (gr = mygetgroup(group)) {
++		if ((gr = mygetgroup(group))) {
+ 			last_gid = gid = gr->gr_gid;
+ 			strcpy(last_group, gr->gr_name);
+ 		} else {
+@@ -325,7 +325,7 @@
+ {
+ 	DIR *d;
+ 	static DIRENTRY *dp;
+-	register char *cp;
++	char *cp;
+ 	struct stat stb;
+ 	char *optarget;
+ 	int len, failures = 0;
+@@ -362,7 +362,7 @@
+ 
+ 	optarget = ptarget;
+ 	len = ptarget - target;
+-	while (dp = readdir(d)) {
++	while ((dp = readdir(d))) {
+ 		if ((D_NAMLEN(dp) == 1 && dp->d_name[0] == '.') ||
+ 		    (D_NAMLEN(dp) == 2 && dp->d_name[0] == '.' &&
+ 		     dp->d_name[1] == '.'))
+@@ -376,7 +376,7 @@
+ 		ptarget = optarget;
+ 		*ptarget++ = '/';
+ 		cp = dp->d_name;;
+-		while (*ptarget++ = *cp++)
++		while ((*ptarget++ = *cp++))
+ 			;
+ 		ptarget--;
+ 		if (lstat(target, &stb) < 0) {
+@@ -414,10 +414,10 @@
+  * for extraneous files and remove them.
+  */
+ static void doclean(cp)
+-	register char *cp;
++	char *cp;
+ {
+ 	DIR *d;
+-	register DIRENTRY *dp;
++	DIRENTRY *dp;
+ 	struct stat stb;
+ 	char *optarget, *ep;
+ 	int len;
+@@ -436,7 +436,7 @@
+ 
+ 	optarget = ptarget;
+ 	len = ptarget - target;
+-	while (dp = readdir(d)) {
++	while ((dp = readdir(d))) {
+ 		if ((D_NAMLEN(dp) == 1 && dp->d_name[0] == '.') ||
+ 		    (D_NAMLEN(dp) == 2 && dp->d_name[0] == '.' &&
+ 		     dp->d_name[1] == '.'))
+@@ -450,7 +450,7 @@
+ 		ptarget = optarget;
+ 		*ptarget++ = '/';
+ 		cp = dp->d_name;;
+-		while (*ptarget++ = *cp++)
++		while ((*ptarget++ = *cp++))
+ 			;
+ 		ptarget--;
+ 		if (lstat(target, &stb) < 0) {
+@@ -481,7 +481,7 @@
+  * Frontend to doclean().
+  */
+ static void clean(cp)
+-	register char *cp;
++	char *cp;
+ {
+ 	doclean(cp);
+ 	(void) sendcmd(CC_END, NULL);
+@@ -509,7 +509,7 @@
+  */
+ static void docmdspecial()
+ {
+-	register char *cp;
++	char *cp;
+ 	char *cmd, *env = NULL;
+ 	int n;
+ 	int len;
+@@ -667,7 +667,7 @@
+ 	char *name;
+ 	opt_t opts;
+ {
+-	register char *cp;
++	char *cp;
+ 	struct stat stb;
+ 	int r = -1;
+ 
+@@ -760,7 +760,7 @@
+ {
+ 	int f, wrerr, olderrno, lastwashole = 0, wassparse = 0;
+ 	off_t i;
+-	register char *cp;
++	char *cp;
+ 	char *savefile = NULL;
+ 	static struct stat statbuff;
+ 
+@@ -987,7 +987,7 @@
+ 	char *owner, *group;
+ {
+ 	static char lowner[100], lgroup[100];
+-	register char *cp;
++	char *cp;
+ 	struct stat stb;
+ 	int s;
+ 
+@@ -1044,7 +1044,7 @@
+ 
+ 				o = (owner[0] == ':') ? opts & DO_NUMCHKOWNER :
+ 					opts;
+-				if (cp = getusername(stb.st_uid, target, o))
++				if ((cp = getusername(stb.st_uid, target, o)))
+ 					if (strcmp(owner, cp))
+ 						(void) strcpy(lowner, cp);
+ 			}
+@@ -1053,7 +1053,7 @@
+ 
+ 				o = (group[0] == ':') ? opts & DO_NUMCHKGROUP :
+ 					opts;
+-				if (cp = getgroupname(stb.st_gid, target, o))
++				if ((cp = getgroupname(stb.st_gid, target, o)))
+ 					if (strcmp(group, cp))
+ 						(void) strcpy(lgroup, cp);
+ 			}
+@@ -1107,8 +1107,8 @@
+ 	if (s < 0) {
+ 		if (errno == ENOENT) {
+ 			if (mkdir(target, mode) == 0 ||
+-			    chkparent(target, opts) == 0 && 
+-			    mkdir(target, mode) == 0) {
++			    (chkparent(target, opts) == 0 && 
++			     mkdir(target, mode) == 0)) {
+ 				message(MT_NOTICE, "%s: mkdir", target);
+ 				(void) fchog(-1, target, owner, group, mode);
+ 				ack();
+@@ -1304,7 +1304,7 @@
+ static void setconfig(cmd)
+ 	char *cmd;
+ {
+-	register char *cp = cmd;
++	char *cp = cmd;
+ 	char *estr;
+ 
+ 	switch (*cp++) {
+@@ -1338,7 +1338,7 @@
+ 		break;
+ 
+ 	case SC_LOGGING:	/* Logging options */
+-		if (estr = msgparseopts(cp, TRUE)) {
++		if ((estr = msgparseopts(cp, TRUE))) {
+ 			fatalerr("Bad message option string (%s): %s", 
+ 				 cp, estr);
+ 			return;
+@@ -1455,7 +1455,7 @@
+ 		sptarget[catname] = ptarget;
+ 		if (catname++) {
+ 			*ptarget++ = '/';
+-			while (*ptarget++ = *file++)
++			while ((*ptarget++ = *file++))
+ 			    ;
+ 			ptarget--;
+ 		}
+@@ -1463,6 +1463,7 @@
+ 		/*
+ 		 * Create name of temporary file
+ 		 */
++		int fd;
+ 		if (catname && cattarget(file) < 0) {
+ 			error("Cannot set file name.");
+ 			return;
+@@ -1477,7 +1478,12 @@
+ 			(void) sprintf(new, "%s/%s", target, tempname);
+ 			*file = '/';
+ 		}
+-		(void) mktemp(new);
++		fd = mkstemp(new);
++		if (fd < 0) {
++			error("Cannot set file name.");
++			return;
++		}
++		close(fd);
+ 	}
+ 
+ 	/*
+@@ -1581,8 +1587,8 @@
+ extern void server()
+ {
+ 	static char cmdbuf[BUFSIZ];
+-	register char *cp;
+-	register int n;
++	char *cp;
++	int n;
+ 	extern jmp_buf finish_jmpbuf;
+ 
+ 	if (setjmp(finish_jmpbuf)) {
+--- rdist-6.1.5/src/filesys.c.cleanup	1998-11-10 05:10:18.000000000 +0100
++++ rdist-6.1.5/src/filesys.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: filesys.c,v 6.25 1998/11/10 04:10:17 mcooper Exp $";
+ 
+@@ -72,7 +72,7 @@
+ 	static char last_pathname[MAXPATHLEN];
+ 	static char file[MAXPATHLEN + 3];
+ 	static struct stat filestat;
+-	register char *p;
++	char *p;
+ 
+ 	/*
+ 	 * Mark the statbuf as invalid to start with.
+@@ -125,7 +125,7 @@
+ 			 * Normally we want to change /dir1/dir2/file
+ 			 * into "/dir1/dir2/."
+ 			 */
+-			if (p = (char *) strrchr(file, '/')) {
++			if ((p = (char *) strrchr(file, '/'))) {
+ 				*++p = '.';
+ 				*++p = CNULL;
+ 			} else {
+@@ -183,7 +183,7 @@
+ 	struct stat *filest;
+ 	struct mntinfo *mntinfo;
+ {
+-	register struct mntinfo *mi;
++	struct mntinfo *mi;
+ 
+ 	for (mi = mntinfo; mi; mi = mi->mi_nxt) {
+ 		if (mi->mi_mnt->me_flags & MEFLAG_IGNORE)
+@@ -202,7 +202,7 @@
+ 	mntent_t *mnt;
+ 	struct mntinfo *mntinfo;
+ {
+-	register struct mntinfo *m;
++	struct mntinfo *m;
+ 
+ 	for (m = mntinfo; m; m = m->mi_nxt)
+ 		if (strcmp(m->mi_mnt->me_path, mnt->me_path) == 0)
+@@ -247,7 +247,7 @@
+ 	}
+ 
+ 	mntinfo = mi;
+-	while (mnt = getmountent(mfp)) {
++	while ((mnt = getmountent(mfp))) {
+ 		debugmsg(DM_MISC, "mountent = '%s' (%s)", 
+ 			 mnt->me_path, mnt->me_type);
+ 
+@@ -308,7 +308,7 @@
+ 	static struct stat filestat;
+ 	struct stat *pstat;
+ 	struct mntinfo *tmpmi;
+-	register mntent_t *mnt;
++	mntent_t *mnt;
+ 
+ 	/*
+ 	 * Use the supplied stat buffer if not NULL or our own.
+@@ -330,16 +330,16 @@
+ 	/*
+ 	 * Find the mnt that pathname is on.
+ 	 */
+-	if (mnt = findmnt(pstat, mntinfo))
++	if ((mnt = findmnt(pstat, mntinfo)))
+ 		return(mnt);
+ 
+ 	/*
+ 	 * We failed to find correct mnt, so maybe it's a newly
+ 	 * mounted filesystem.  We rebuild mntinfo and try again.
+ 	 */
+-	if (tmpmi = makemntinfo(mntinfo)) {
++	if ((tmpmi = makemntinfo(mntinfo))) {
+ 		mntinfo = tmpmi;
+-		if (mnt = findmnt(pstat, mntinfo))
++		if ((mnt = findmnt(pstat, mntinfo)))
+ 			return(mnt);
+ 	}
+ 
+--- rdist-6.1.5/src/filesys-os.c.cleanup	1998-11-10 05:09:59.000000000 +0100
++++ rdist-6.1.5/src/filesys-os.c	2003-12-17 11:38:16.000000000 +0100
+@@ -38,7 +38,7 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#ifndef lint
++#if 0
+ static char RCSid[] = 
+ "$Id: filesys-os.c,v 6.18 1998/11/10 04:09:58 mcooper Exp $";
+ 
+@@ -314,7 +314,7 @@
+ 
+ 	bzero((char *)&me, sizeof(mntent_t));
+ 
+-	if (mntent = getmntent(fptr)) {
++	if ((mntent = getmntent(fptr))) {
+ 		me.me_path = mntent->mnt_dir;
+ 		me.me_type = mntent->mnt_type;
+ 		if (mntent->mnt_opts && hasmntopt(mntent, MNTOPT_RO))
+--- rdist-6.1.5/src/strcasecmp.c.cleanup	1998-11-10 05:16:52.000000000 +0100
++++ rdist-6.1.5/src/strcasecmp.c	2003-12-17 11:38:16.000000000 +0100
+@@ -51,9 +51,9 @@
+ };
+ 
+ strcasecmp(s1, s2)
+-	register char *s1, *s2;
++	char *s1, *s2;
+ {
+-	register char *cm = charmap;
++	char *cm = charmap;
+ 
+ 	while (cm[*s1] == cm[*s2++])
+ 		if (*s1++ == '\0')
+@@ -62,10 +62,10 @@
+ }
+ 
+ strncasecmp(s1, s2, n)
+-	register char *s1, *s2;
+-	register int n;
++	char *s1, *s2;
++	int n;
+ {
+-	register char *cm = charmap;
++	char *cm = charmap;
+ 
+ 	while (--n >= 0 && cm[*s1] == cm[*s2++])
+ 		if (*s1++ == '\0')
+--- rdist-6.1.5/src/strtol.c.cleanup	1994-03-17 00:25:50.000000000 +0100
++++ rdist-6.1.5/src/strtol.c	2003-12-17 11:38:16.000000000 +0100
+@@ -54,13 +54,13 @@
+ strtol(nptr, endptr, base)
+ 	char *nptr;
+ 	char **endptr;
+-	register int base;
++	int base;
+ {
+-	register char *s = nptr;
+-	register unsigned long acc;
+-	register int c;
+-	register unsigned long cutoff;
+-	register int neg = 0, any, cutlim;
++	char *s = nptr;
++	unsigned long acc;
++	int c;
++	unsigned long cutoff;
++	int neg = 0, any, cutlim;
+ 
+ 	/*
+ 	 * Skip white space and pick up leading +/- sign if any.
+--- rdist-6.1.5/src/regex.c.cleanup	1998-11-10 05:14:28.000000000 +0100
++++ rdist-6.1.5/src/regex.c	2003-12-17 11:39:14.000000000 +0100
+@@ -142,10 +142,8 @@
+  */
+ char *
+ re_comp(sp)
+-	register char	*sp;
+ {
+-	register int	c;
+-	register char	*ep = expbuf;
++	char	*ep = expbuf;
+ 	int	cclcnt, numbra = 0;
+ 	char	*lastep = 0;
+ 	char	bracket[NBRA];
+@@ -266,10 +264,10 @@
+  */
+ int
+ re_exec(p1)
+-	register char	*p1;
++	char	*p1;
+ {
+-	register char	*p2 = expbuf;
+-	register int	c;
++	char	*p2 = expbuf;
++	int	c;
+ 	int	rv;
+ 
+ 	for (c = 0; c < NBRA; c++) {
+@@ -306,9 +304,9 @@
+  */
+ static	int
+ advance(lp, ep)
+-	register char	*lp, *ep;
++	char	*lp, *ep;
+ {
+-	register char	*curlp;
++	char	*curlp;
+ 	int	ct, i;
+ 	int	rv;
+ 
+@@ -413,10 +411,10 @@
+ }
+ 
+ backref(i, lp)
+-	register int	i;
+-	register char	*lp;
++	int	i;
++	char	*lp;
+ {
+-	register char	*bp;
++	char	*bp;
+ 
+ 	bp = braslist[i];
+ 	while (*bp++ == *lp++)
+@@ -427,10 +425,10 @@
+ 
+ int
+ cclass(set, c, af)
+-	register char	*set, c;
++	char	*set, c;
+ 	int	af;
+ {
+-	register int	n;
++	int	n;
+ 
+ 	if (c == 0)
+ 		return(0);
+--- rdist-6.1.5/include/defs.h.cleanup	2003-12-17 11:38:16.000000000 +0100
++++ rdist-6.1.5/include/defs.h	2003-12-17 11:38:16.000000000 +0100
+@@ -30,11 +30,13 @@
+ #include <grp.h>
+ #include <syslog.h>
+ #include <setjmp.h>
++#include <time.h>
+ #include <sys/types.h>
+ #include <sys/param.h>
+ #include <sys/file.h>
+-#include <sys/time.h>
+ #include <sys/stat.h>
++#include <sys/wait.h>
++#include <sys/socket.h>
+ 
+ #include "version.h"
+ #include "config-def.h"
+@@ -48,6 +50,9 @@
+ #endif	/* yacc */
+ 
+ #include <signal.h>
++#define _REGEX_RE_COMP
++#include <regex.h>
++
+ 
+ /*
+  * This belongs in os-svr4.h but many SVR4 OS's
+@@ -321,12 +326,11 @@
+ /*
+  * Our own declarations.
+  */
+-char			       *exptilde();
+ char			       *makestr();
+ char	       		       *xcalloc();
+ char	       		       *xmalloc();
+ char	       		       *xrealloc();
+-extern char		       *xbasename();
++extern char		       *exptilde();
+ extern char		       *getdistoptlist();
+ extern char		       *getgroupname();
+ extern char		       *getnlstr();
+@@ -336,44 +340,75 @@
+ extern char		       *getversion();
+ extern char		       *msgparseopts();
+ extern char		       *searchpath();
++extern char		       *xbasename();
++extern int			amatch();
+ extern int			any();
++extern int			becomeroot();
++extern int			becomeuser();
++extern int			except();
++extern int			execbrc();
++extern int			getfilesysinfo();
++extern int			getsocketpair();
+ extern int			init();
+ extern int			install();
+ extern int			isexec();
++extern int			is_nfs_mounted();
++extern int			is_ro_mounted();
++extern int			is_symlinked();
++extern int			match();
++extern int			okname();
+ extern int			parsedistopts();
++extern int			readrem();
+ extern int			remline();
++extern int			response();
++extern int			rshrcmd();
+ extern int			setfiletime();
++extern int			setnonblocking();
+ extern int			spawn();
++extern int			yylex();
++extern int			yyparse();
+ extern struct subcmd 	       *makesubcmd();
++extern void			append();
+ extern void			checkhostname();
+ extern void			cleanup();
+ extern void			complain();
++extern void			coredump();
++extern void			define();
++extern void			docmdargs();
+ extern void			docmds();
+ extern void			finish();
+-extern void			log();
++extern void			freelinkinfo();
++extern void			insert();
+ extern void			logmsg();
+ extern void			lostconn();
+ extern void			markassigned();
++extern void			msgprconfig();
+ extern void			msgprusage();
++extern void			mysetlinebuf();
+ extern void			note();
+ extern void			runcmdspecial();
+ extern void			runcommand();
+ extern void			server();
++extern void			setargs_settup();
+ extern void			setprogname();
+ extern void			sighandler();
++extern void			usage();
+ extern void			waitup();
++extern void			yyerror();
++extern WRITE_RETURN_T		xwrite();
+ struct namelist		       *expand();
+ struct namelist		       *lookup();
+ struct namelist		       *makenl();
+-extern WRITE_RETURN_T		xwrite();
+ 
+ #if	defined(ARG_TYPE) && ARG_TYPE == ARG_STDARG
++extern int			sendcmd(char cmd, char *fmt, ...);
+ extern void			debugmsg(int, char *, ...);
+ extern void			error(char *, ...);
+ extern void			fatalerr(char *, ...);
+ extern void			message(int, char *, ...);
+ extern void			setproctitle(char *fmt, ...);
+ #else
++extern int			sendcmd(va_alist);
+ extern void			debugmsg();
+ extern void			error();
+ extern void			fatalerr();
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-msgsndnotify-loop.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-msgsndnotify-loop.patch
new file mode 100644
index 000000000..d183d9183
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-msgsndnotify-loop.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/message.c.thestokes	2006-04-19 17:30:39.000000000 -0400
++++ rdist-6.1.5/src/message.c	2006-04-19 17:36:37.000000000 -0400
+@@ -793,15 +793,20 @@
+ 	char *msg;
+ {
+ 	static char buf[MSGBUFSIZ];
+-
+-	++nerrs;
+-
+-	if (isserver)
+-		(void) sprintf(buf, "REMOTE ERROR: %s", msg);
+-	else
+-		(void) sprintf(buf, "LOCAL ERROR: %s", msg);
+-
+-	_message(MT_FERROR, buf);
++	/* Don't reenter this function. There is a nasty infinite recursion
++	   case that pops up when msgsndnotify tries to exit. */
++	static int inside=0; 
++
++	if(inside==0){
++	        ++nerrs;
++		inside=1;
++
++	        if (isserver)
++		        (void) sprintf(buf, "REMOTE ERROR: %s", msg);
++	        else
++		        (void) sprintf(buf, "LOCAL ERROR: %s", msg);
++		_message(MT_FERROR, buf);
++	}
+ 
+ 	exit(nerrs);
+ }
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch
new file mode 100644
index 000000000..baf8e3030
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-hardlink.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/client.c.hardlink	Thu Jun  3 13:56:31 1999
++++ rdist-6.1.5/src/client.c	Thu Jun  3 14:00:06 1999
+@@ -348,7 +348,7 @@
+ 		lp->target = strdup(Tdest);
+ 	else
+ 		lp->target = NULL;
+-	if (!lp->pathname || !lp->src || !(Tdest && lp->target))
++	if (!lp->pathname || !lp->src || (Tdest && !lp->target))
+ 		fatalerr("Cannot malloc memory in linkinfo.");
+ 
+ 	return((struct linkbuf *) NULL);
+@@ -370,7 +370,7 @@
+ 	       "sendhardlink: rname='%s' pathname='%s' src='%s' target='%s'\n",
+ 		 rname, lp->pathname, lp->src, lp->target);
+ 		 
+-	if (*lp->target == CNULL)
++	if (lp->target == NULL || *lp->target == CNULL)
+ 		(void) sendcmd(C_RECVHARDLINK, "%o %s %s", 
+ 			       opts, lp->pathname, rname);
+ 	else {
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch
new file mode 100644
index 000000000..3fa8db8cd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-lfs.patch
@@ -0,0 +1,142 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/client.c.lfs	2003-12-16 23:43:56.000000000 +0100
++++ rdist-6.1.5/src/client.c	2003-12-16 23:46:56.000000000 +0100
+@@ -414,9 +414,9 @@
+ 	/*
+ 	 * Send file info
+ 	 */
+-	(void) sendcmd(C_RECVREG, "%o %04o %ld %ld %ld %s %s %s", 
++	(void) sendcmd(C_RECVREG, "%o %04o %lld %ld %ld %s %s %s", 
+ 		       opts, stb->st_mode & 07777, 
+-		       (long) stb->st_size, 
++		       (off_t) stb->st_size, 
+ 		       stb->st_mtime, stb->st_atime,
+ 		       user, group, rname);
+ 	if (response() < 0) {
+@@ -424,8 +424,8 @@
+ 		return(-1);
+ 	}
+ 
+-	debugmsg(DM_MISC, "Send file '%s' %d bytes\n", 
+-		 rname, (long) stb->st_size);
++	debugmsg(DM_MISC, "Send file '%s' %lld bytes\n", 
++		 rname, (off_t) stb->st_size);
+ 
+ 	/*
+ 	 * Set remote time out alarm handler.
+@@ -676,9 +676,9 @@
+ 	/*
+ 	 * Gather and send basic link info
+ 	 */
+-	(void) sendcmd(C_RECVSYMLINK, "%o %04o %ld %ld %ld %s %s %s", 
++	(void) sendcmd(C_RECVSYMLINK, "%o %04o %lld %ld %ld %s %s %s", 
+ 		       opts, stb->st_mode & 07777, 
+-		       (long) stb->st_size, 
++		       (off_t) stb->st_size, 
+ 		       stb->st_mtime, stb->st_atime,
+ 		       user, group, rname);
+ 	if (response() < 0)
+@@ -858,7 +858,7 @@
+ 	/*
+ 	 * Parse size
+ 	 */
+-	size = strtol(cp, &cp, 10);
++	size = strtoll(cp, &cp, 10);
+ 	if (*cp++ != ' ') {
+ 		error("update: size not delimited");
+ 		return(US_NOTHING);
+@@ -910,8 +910,8 @@
+ 
+ 	debugmsg(DM_MISC, "update(%s,) local mode %04o remote mode %04o\n", 
+ 		 rname, lmode, rmode);
+-	debugmsg(DM_MISC, "update(%s,) size %d mtime %d owner '%s' grp '%s'\n",
+-		 rname, (int) size, mtime, owner, group);
++	debugmsg(DM_MISC, "update(%s,) size %lld mtime %d owner '%s' grp '%s'\n",
++		 rname, (off_t) size, mtime, owner, group);
+ 
+ 	if (statp->st_mtime != mtime) {
+ 		if (statp->st_mtime < mtime && IS_ON(opts, DO_YOUNGER)) {
+@@ -937,8 +937,8 @@
+ 	}
+ 
+ 	if (statp->st_size != size) {
+-		debugmsg(DM_MISC, "size does not match (%d != %d).\n",
+-			 (int) statp->st_size, size);
++		debugmsg(DM_MISC, "size does not match (%lld != %lld).\n",
++			 statp->st_size, size);
+ 		return(US_OUTDATE);
+ 	} 
+ 
+--- rdist-6.1.5/src/server.c.lfs	1998-11-10 05:15:31.000000000 +0100
++++ rdist-6.1.5/src/server.c	2003-12-16 23:50:19.000000000 +0100
+@@ -645,8 +645,8 @@
+ 	case S_IFLNK:
+ 	case S_IFDIR:
+ 	case S_IFREG:
+-		(void) sendcmd(QC_YES, "%ld %ld %o %s %s",
+-			       (long) stb.st_size, 
++		(void) sendcmd(QC_YES, "%lld %ld %o %s %s",
++			       (off_t) stb.st_size, 
+ 			       stb.st_mtime, 
+ 			       stb.st_mode & 07777,
+ 			       getusername(stb.st_uid, target, options), 
+@@ -1388,7 +1388,7 @@
+ 	/*
+ 	 * Get file size
+ 	 */
+-	size = strtol(cp, &cp, 10);
++	size = strtoll(cp, &cp, 10);
+ 	if (*cp++ != ' ') {
+ 		error("recvit: size not delimited");
+ 		return;
+@@ -1441,7 +1441,7 @@
+ 	}
+ 
+ 	debugmsg(DM_MISC,
+-		 "recvit: opts = %04o mode = %04o size = %d mtime = %d",
++		 "recvit: opts = %04o mode = %04o size = %lld mtime = %d",
+ 		 opts, mode, size, mtime);
+ 	debugmsg(DM_MISC,
+        "recvit: owner = '%s' group = '%s' file = '%s' catname = %d isdir = %d",
+--- rdist-6.1.5/include/defs.h.lfs	2003-12-16 23:43:56.000000000 +0100
++++ rdist-6.1.5/include/defs.h	2003-12-16 23:43:56.000000000 +0100
+@@ -22,6 +22,8 @@
+ #include <stdlib.h>
+ #endif	/* _POSIX_SOURCE */
+ #include <stdio.h>
++#include <string.h>
++#include <mntent.h>
+ #include <ctype.h>
+ #include <errno.h>
+ #include <pwd.h>
+@@ -317,15 +319,6 @@
+ #endif /* USE_STATDB */
+ 
+ /*
+- * System function declarations
+- */
+-char 			       *hasmntopt();
+-char			       *strchr();
+-char		 	       *strdup();
+-char		 	       *strrchr();
+-char 			       *strtok();
+-
+-/*
+  * Our own declarations.
+  */
+ char			       *exptilde();
+--- rdist-6.1.5/Makefile.local.lfs	1998-11-10 04:36:31.000000000 +0100
++++ rdist-6.1.5/Makefile.local	2003-12-16 23:43:56.000000000 +0100
+@@ -20,7 +20,7 @@
+ # Add any local definitions you want pass to the compiler to DEFS_LOCAL
+ # below.  This includes those items found in "config/config.h".
+ #
+-#DEFS_LOCAL	= -DDIRECT_RCMD
++DEFS_LOCAL	= -O2 -g -pipe -Wall -D_POSIX_SOURCE -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+ #
+ # Add any local libraries that your system might need to LIBS_LOCAL below.
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-links.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-links.patch
new file mode 100644
index 000000000..e9994f2c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-links.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/client.c.links	Wed Feb 17 17:46:09 1999
++++ rdist-6.1.5/src/client.c	Wed Feb 17 17:51:15 1999
+@@ -309,6 +309,18 @@
+ 	return(0);
+ }
+ 
++void freelinkinfo(lp)
++	struct linkbuf *lp;
++{
++	if (lp->pathname)
++		free(lp->pathname);
++	if (lp->src)
++		free(lp->src);
++	if (lp->target)
++		free(lp->target);
++	free(lp);
++}
++
+ /*
+  * Save and retrieve hard link info
+  */
+@@ -317,6 +329,7 @@
+ {
+ 	struct linkbuf *lp;
+ 
++	/* xxx: linear search doesn't scale with many links */
+ 	for (lp = ihead; lp != NULL; lp = lp->nextp)
+ 		if (lp->inum == statp->st_ino && lp->devnum == statp->st_dev) {
+ 			lp->count--;
+@@ -329,12 +342,14 @@
+ 	lp->inum = statp->st_ino;
+ 	lp->devnum = statp->st_dev;
+ 	lp->count = statp->st_nlink - 1;
+-	(void) strcpy(lp->pathname, target);
+-	(void) strcpy(lp->src, source);
++	lp->pathname = strdup(target);
++	lp->src = strdup(source);
+ 	if (Tdest)
+-		(void) strcpy(lp->target, Tdest);
++		lp->target = strdup(Tdest);
+ 	else
+-		*lp->target = CNULL;
++		lp->target = NULL;
++	if (!lp->pathname || !lp->src || !(Tdest && lp->target))
++		fatalerr("Cannot malloc memory in linkinfo.");
+ 
+ 	return((struct linkbuf *) NULL);
+ }
+--- rdist-6.1.5/src/docmd.c.links	Wed Feb 17 17:51:23 1999
++++ rdist-6.1.5/src/docmd.c	Wed Feb 17 17:52:44 1999
+@@ -586,7 +586,7 @@
+ 	if (!nflag) {
+ 		register struct linkbuf *nextl, *l;
+ 
+-		for (l = ihead; l != NULL; free((char *)l), l = nextl) {
++		for (l = ihead; l != NULL; freelinkinfo(l), l = nextl) {
+ 			nextl = l->nextp;
+ 			if (contimedout || IS_ON(opts, DO_IGNLNKS) || 
+ 			    l->count == 0)
+--- rdist-6.1.5/include/defs.h.links	Wed Feb 17 17:52:58 1999
++++ rdist-6.1.5/include/defs.h	Wed Feb 17 17:53:47 1999
+@@ -276,9 +276,9 @@
+ 	ino_t	inum;
+ 	dev_t	devnum;
+ 	int	count;
+-	char	pathname[BUFSIZ];
+-	char	src[BUFSIZ];
+-	char	target[BUFSIZ];
++	char	*pathname;
++	char	*src;
++	char	*target;
+ 	struct	linkbuf *nextp;
+ };
+ 
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-linux.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-linux.patch
new file mode 100644
index 000000000..b56fd38b9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-linux.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+diff: rdist-6.1.5/config/mf: No such file or directory
+--- rdist-6.1.5/config/os-linux.h.linux	Mon Nov  9 22:59:59 1998
++++ rdist-6.1.5/config/os-linux.h	Thu Nov 12 14:50:35 1998
+@@ -58,7 +58,7 @@
+ /*
+  * Select the type of executable file format.
+  */
+-#define EXE_TYPE	EXE_AOUT
++#define EXE_TYPE	EXE_ELF
+ 
+ /*
+  * Select the type of statfs() system call (if any).
+--- rdist-6.1.5/mf/Makefile.var.linux	Tue Nov 10 00:02:11 1998
++++ rdist-6.1.5/mf/Makefile.var	Thu Nov 12 14:50:35 1998
+@@ -67,7 +67,7 @@
+ #
+ # Name of YACC.
+ #
+-#YACC 		= bison -y
++YACC 		= bison -y
+ 
+ OPT		= -g
+ RM		= rm
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-makefile-add-ldflags.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-makefile-add-ldflags.patch
new file mode 100644
index 000000000..cc82e16cc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-makefile-add-ldflags.patch
@@ -0,0 +1,23 @@
+Add LDFLAGS variable to Makefile so that extra linker flags can be sent via this variable.
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/src/Makefile.real b/src/Makefile.real
+index 02179e4..9070974 100644
+--- a/src/Makefile.real
++++ b/src/Makefile.real
+@@ -36,10 +36,10 @@ all: src
+ src: $(CLIENT_BIN) $(SERVER_BIN)
+ 
+ $(SERVER_BIN): $(SERVEROBJS) $(COMMONOBJS) $(MISSINGOBJS)
+-	$(CC) -o $@ $(SERVEROBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS)
++	$(CC) -o $@ $(SERVEROBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS) $(LDFLAGS)
+ 
+ $(CLIENT_BIN): $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS)
+-	$(CC) -o $@ $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS)
++	$(CC) -o $@ $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS) $(LDFLAGS)
+ 
+ $(CLIENTOBJS) $(SERVEROBJS): $(HFILES) y.tab.h
+ 
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch
new file mode 100644
index 000000000..e81639446
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-maxargs.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:rdist
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/setargs.c.maxargs	1998-11-10 05:15:56.000000000 +0100
++++ rdist-6.1.5/src/setargs.c	2003-09-04 14:39:03.000000000 +0200
+@@ -58,7 +58,7 @@
+  * Set process argument functions
+  */
+ 
+-#define MAXUSERENVIRON 		40
++#define MAXUSERENVIRON 		1024
+ char 			      **Argv = NULL;
+ char 			       *LastArgv = NULL;
+ char 			       *UserEnviron[MAXUSERENVIRON+1];
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch
new file mode 100644
index 000000000..e49e3e4d1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-mkstemp.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/server.c.mkstemp	2004-05-25 14:29:37.279312752 +0200
++++ rdist-6.1.5/src/server.c	2004-05-25 14:31:27.050744340 +0200
+@@ -1479,11 +1479,18 @@
+ 			*file = '/';
+ 		}
+ 		fd = mkstemp(new);
+-		if (fd < 0) {
++		/* 
++		 * Don't consider it a fatal error if mkstemp() fails
++		 * because parent directory didn't exist. (Missing 
++		 * parents are created later (in recvfile())
++		 */
++		if ((fd < 0) && (errno != ENOENT)) {
+ 			error("Cannot set file name.");
+ 			return;
++		} else if (fd >= 0) {
++			close(fd);
++			unlink(new); /* Or symlink() will fail */
+ 		}
+-		close(fd);
+ 	}
+ 
+ 	/*
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch
new file mode 100644
index 000000000..493b18397
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-oldpath.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/config/config.h.oldpath	Tue Nov 10 04:59:48 1998
++++ rdist-6.1.5/config/config.h	Thu Jan 31 17:33:21 2002
+@@ -39,7 +39,7 @@
+  * don't have the old rdist, then uncomment the "#undef" line.
+  */
+ #ifndef _PATH_OLDRDIST
+-#define _PATH_OLDRDIST	"/usr/ucb/oldrdist"	/* Enable compat */
++#define _PATH_OLDRDIST	"/usr/bin/oldrdist"	/* Enable compat */
+ #endif
+ /*#undef  _PATH_OLDRDIST*/				/* Disable compat */
+ 
+--- rdist-6.1.5/doc/rdist.man.oldpath	Tue Nov 10 06:38:53 1998
++++ rdist-6.1.5/doc/rdist.man	Thu Jan 31 17:36:57 2002
+@@ -170,10 +170,9 @@
+ This option will only work if 
+ .I rdist
+ was compiled with the location of the old rdist
+-(usually either
+-.I /usr/ucb/oldrdist
+-or
+-.I /usr/old/rdist)
++(the path
++.I /usr/bin/oldrdist
++is used on Red Hat linux)
+ and that program is available at run time.
+ .PP
+ .I Rdist
+@@ -558,7 +557,7 @@
+ should be of form
+ .sp
+ .RS
+-\fIfacility\fB=\fItypes\fB:\fIfacility\fB=\fItypes...
++\fIfacility\fB=\fItypes\fB:\fIfacility\fB=\fItypes...\fR
+ .RE
+ .sp
+ The valid facility names are:
+--- rdist-6.1.5/README.oldpath	Fri Jul 19 19:24:09 1996
++++ rdist-6.1.5/README	Thu Jan 31 17:33:21 2002
+@@ -65,12 +65,12 @@
+ 
+ The way the old rdist started a server rdist is to run "rdist
+ -Server".  If the new rdist is run with the "-Server" option, then it
+-will exec a copy of the old rdist (usually /usr/old/rdist or
+-/usr/ucb/oldrdist).  In this way, you get compatibility with hosts
++will exec a copy of the old rdist (the path /usr/bin/oldrdist in Red
++Hat linux).  In this way, you get compatibility with hosts
+ running the old rdist attempting to rdist to a machine running new
+ rdist.  If your host running new rdist wants to rdist to a host
+ running the old rdist, then it must run the old rdist program
+-(/usr/old/rdist or /usr/ucb/oldrdist).
++(/usr/bin/oldrdist in Red Hat linux).
+ 
+ The definition _PATH_OLDRDIST in "config/config.h" controls the
+ location of the old rdist.  If this is not defined, or the defined
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch
new file mode 100644
index 000000000..d3982cf41
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-ssh.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/rshrcmd.c.dist	Tue Dec 12 08:20:56 1995
++++ rdist-6.1.5/src/rshrcmd.c	Wed Dec 11 07:14:13 1996
+@@ -64,5 +64,5 @@
+ 		   sp[0]. */
+ 		(void) close(sp[0]);
+-		if (dup2(sp[1], 0) < 0 || dup2(0,1) < 0 || dup2(0, 2) < 0) {
++		if (dup2(sp[1], 0) < 0 || dup2(0,1) < 0) {
+ 			error("dup2 failed: %s.", SYSERR);
+ 			_exit(255);
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch
new file mode 100644
index 000000000..b20953ef3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-stat64.patch
@@ -0,0 +1,85 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/src/filesys.c.stat64	2005-05-04 14:11:03.000000000 +0200
++++ rdist-6.1.5/src/filesys.c	2005-05-04 14:11:10.000000000 +0200
+@@ -430,8 +430,8 @@
+  */
+ int getfilesysinfo(file, freespace, freefiles)
+ 	char *file;
+-	long *freespace;
+-	long *freefiles;
++	fsblkcnt_t *freespace;
++	fsfilcnt_t *freefiles;
+ {
+ #if	defined(STATFS_TYPE)
+ 	static statfs_t statfsbuf;
+--- rdist-6.1.5/src/server.c.stat64	2005-05-04 14:11:23.000000000 +0200
++++ rdist-6.1.5/src/server.c	2005-05-04 14:20:34.000000000 +0200
+@@ -62,8 +62,8 @@
+ int	catname = 0;		/* cat name to target name */
+ char	*sptarget[32];		/* stack of saved ptarget's for directories */
+ char   *fromhost = NULL;	/* Client hostname */
+-static long min_freespace = 0;	/* Minimium free space on a filesystem */
+-static long min_freefiles = 0;	/* Minimium free # files on a filesystem */
++static fsblkcnt_t min_freespace = 0; /* Minimium free space on a filesystem */
++static fsfilcnt_t min_freefiles = 0; /* Minimium free # files on a filesystem */
+ int	oumask;			/* Old umask */
+ 
+ /*
+@@ -1326,7 +1326,7 @@
+ 			fatalerr("Expected digit, got '%s'.", cp);
+ 			return;
+ 		}
+-		min_freespace = (unsigned long) atoi(cp);
++		min_freespace = (fsblkcnt_t) atoll(cp);
+ 		break;
+ 
+ 	case SC_FREEFILES: 	/* Minimium free files */
+@@ -1334,7 +1334,7 @@
+ 			fatalerr("Expected digit, got '%s'.", cp);
+ 			return;
+ 		}
+-		min_freefiles = (unsigned long) atoi(cp);
++		min_freefiles = (fsfilcnt_t) atoll(cp);
+ 		break;
+ 
+ 	case SC_LOGGING:	/* Logging options */
+@@ -1364,7 +1364,8 @@
+ 	time_t mtime, atime;
+ 	char *owner, *group, *file;
+ 	char new[MAXPATHLEN];
+-	long freespace = -1, freefiles = -1;
++	fsfilcnt_t freefiles = -1;
++	fsblkcnt_t freespace = -1;
+ 	char *cp = cmd;
+ 
+ 	/*
+@@ -1499,7 +1500,7 @@
+ 	 */
+ 	if (min_freespace || min_freefiles) {
+ 		/* Convert file size to kilobytes */
+-		long fsize = (long) (size / 1024);
++		fsblkcnt_t fsize = (fsblkcnt_t) (size / 1024);
+ 
+ 		if (getfilesysinfo(target, &freespace, &freefiles) != 0)
+ 			return;
+@@ -1511,14 +1512,14 @@
+ 		if (min_freespace && (freespace >= 0) && 
+ 		    (freespace - fsize < min_freespace)) {
+ 			error(
+-		     "%s: Not enough free space on filesystem: min %d free %d",
++		     "%s: Not enough free space on filesystem: min %lld free %lld",
+ 			      target, min_freespace, freespace);
+ 			return;
+ 		}
+ 		if (min_freefiles && (freefiles >= 0) &&
+ 		    (freefiles - 1 < min_freefiles)) {
+ 			error(
+-		     "%s: Not enough free files on filesystem: min %d free %d",
++		     "%s: Not enough free files on filesystem: min %lld free %lld",
+ 			      target, min_freefiles, freefiles);
+ 			return;
+ 		}
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch
new file mode 100644
index 000000000..bf73b71e1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-svr4.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/build/os-type.svr4	2003-12-17 12:44:18.000000000 +0100
++++ rdist-6.1.5/build/os-type	2003-12-17 12:44:29.000000000 +0100
+@@ -83,7 +83,6 @@
+ if [ -z "${OS}" -a ! -z "${uname}" ]; then
+ 	case "`$uname -a | tr '[A-Z]' '[a-z]'`" in
+ 		    osf1*)	OS=break;;
+-		*"4.0"*)	OS=svr4;;	# There has to be a better way
+ 		*" dcosx "*)	OS=dcosx;;
+ 		*"cx/ux"*)	OS=cxux;;
+ 		*"hp-ux"*)	# HP-UX 9.x
diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch
new file mode 100644
index 000000000..e6edbc44d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-varargs.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [1]
+
+[1] Not the author, the patch is from:
+http://vault.centos.org/5.8/os/SRPMS/rdist-6.1.5-44.src.rpm
+
+--- rdist-6.1.5/config/os-linux.h.varargs	2003-06-17 17:52:33.000000000 +0200
++++ rdist-6.1.5/config/os-linux.h	2003-06-17 17:53:07.000000000 +0200
+@@ -68,7 +68,7 @@
+ /*
+  * Type of arg functions we have.
+  */
+-#define ARG_TYPE	ARG_VARARGS
++#define ARG_TYPE	ARG_STDARG
+ 
+ /*
+  * Do we have select()?
diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
new file mode 100644
index 000000000..cea1f08f9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Remote file distribution client and server"
+DESCRIPTION = "\
+Rdist is a program to maintain identical copies of files over multiple \
+hosts. It preserves the owner, group, mode, and mtime of files if \
+possible and can update programs that are executing. \
+"
+SECTION = "console/network"
+LICENSE = "BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://Copyright;md5=3f47ec9f64b11c8192ee05a66b5c2755"
+
+SRC_URI = "http://www.magnicomp.com/download/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "546779700af70aa5f9103e08782cdcac"
+SRC_URI[sha256sum] = "2bb0d0f5904eadc9e7fe3d60c15389d6897fcf884211070e289a6c710ff37f96"
+
+SRC_URI += "file://rdist-6.1.5-linux.patch \
+            file://rdist-6.1.5-links.patch \
+            file://rdist-6.1.5-oldpath.patch \
+            file://rdist-6.1.5-hardlink.patch \
+            file://rdist-6.1.5-bison.patch \
+            file://rdist-6.1.5-varargs.patch \
+            file://rdist-6.1.5-maxargs.patch \
+            file://rdist-6.1.5-lfs.patch \
+            file://rdist-6.1.5-cleanup.patch \
+            file://rdist-6.1.5-svr4.patch \
+            file://rdist-6.1.5-ssh.patch \
+            file://rdist-6.1.5-mkstemp.patch \
+            file://rdist-6.1.5-stat64.patch \
+            file://rdist-6.1.5-fix-msgsndnotify-loop.patch \
+            file://rdist-6.1.5-bb-build.patch \
+            file://rdist-6.1.5-makefile-add-ldflags.patch \
+"
+
+DEPENDS = "bison-native"
+
+inherit autotools-brokensep
+
+EXTRA_OEMAKE = "BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
-- 
2.11.0


