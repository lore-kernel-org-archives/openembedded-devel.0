Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE178C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:37:36 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.43955.1743057445091961692
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 27 Mar 2025 15:37:22 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.151 with ESMTP; 27 Mar 2025 15:37:22 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] gpm: fix build with gcc-15
Date: Thu, 27 Mar 2025 15:37:20 +0900
Message-Id: <20250327063720.519660-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 06:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116315

From: "mark.yang" <mark.yang@lge.com>

* fix build with gcc-15

lib/libcurses.c:46:5: error: conflicting types for 'Gpm_Wgetch'; have 'int(WINDOW *)' {aka 'int(struct _win_st *)'}
   46 | int Gpm_Wgetch(WINDOW *win)
      |     ^~~~~~~~~~
In file included from gpm/1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530/git/src/headers/gpmInt.h:28,
                 from lib/libcurses.c:30:
gpm/1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530/git/src/headers/gpm.h:271:12: note: previous declaration of 'Gpm_Wgetch' with type 'int(void)'
  271 | extern int Gpm_Wgetch();
      |            ^~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...01-Avoid-shadowing-ncurses-functions.patch | 234 ++++++++++++++++++
 ...inition-in-yacc-source-file-until-va.patch |  81 ++++++
 ...ype-definition-for-WINDOW-in-Gpm_Wge.patch |  37 +++
 meta-oe/recipes-support/gpm/gpm_git.bb        |   3 +
 4 files changed, 355 insertions(+)
 create mode 100644 meta-oe/recipes-support/gpm/gpm/0001-Avoid-shadowing-ncurses-functions.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm/0002-Fix-function-definition-in-yacc-source-file-until-va.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm/0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch

diff --git a/meta-oe/recipes-support/gpm/gpm/0001-Avoid-shadowing-ncurses-functions.patch b/meta-oe/recipes-support/gpm/gpm/0001-Avoid-shadowing-ncurses-functions.patch
new file mode 100644
index 0000000000..ad10c9848c
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm/0001-Avoid-shadowing-ncurses-functions.patch
@@ -0,0 +1,234 @@
+From 8acd38879bcdeb34700ab1989e0dd6245af04706 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Tue, 11 Feb 2025 18:42:47 +0400
+Subject: [PATCH 1/3] Avoid shadowing ncurses functions. This fails with GCC-15
+ and other compilers implementing C23 Added prefix gpm_ to raw() and noraw()
+ used in two files because they are implemented in same two files, and are
+ static. Same with scr_dump() and src_restore() in yacc source file
+
+Upstream-Status: Submitted [https://github.com/telmich/gpm/pull/49]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/prog/gpm-root.y   | 10 +++++-----
+ src/prog/hltest.c     | 11 +++++------
+ src/prog/mouse-test.c | 24 ++++++++++++------------
+ 3 files changed, 22 insertions(+), 23 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 76c896c..800e51b 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -941,7 +941,7 @@ static unsigned short clear_sel_args[6]={0, 0,0, 0,0, 4};
+ static unsigned char *clear_sel_arg= (unsigned char *)clear_sel_args+1;
+ 
+ /*------------*/
+-static inline void scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
++static inline void gpm_scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
+ {
+    int dumpfd;
+    char dumpname[20];
+@@ -960,7 +960,7 @@ static inline void scr_dump(int fd, FILE *f, unsigned char *buffer, int vc)
+ }
+ 
+ /*------------*/
+-static inline void scr_restore(int fd, FILE *f, unsigned char *buffer, int vc)
++static inline void gpm_scr_restore(int fd, FILE *f, unsigned char *buffer, int vc)
+ {
+    int dumpfd;
+    char dumpname[20];
+@@ -1002,7 +1002,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    if (!new) return NULL;
+    new->draw=draw;
+    new->dump=dump=malloc(opt_buf);
+-   scr_dump(fd,f,dump,console);
++   gpm_scr_dump(fd,f,dump,console);
+    lines=dump[0]; columns=dump[1];
+    i=(columns*dump[3]+dump[2])*2+1; /* where to get it */
+    if (i<0) i=1;
+@@ -1060,7 +1060,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    for (i=0; i<draw->width; i++) PUTC(HORLINE,draw->bord,draw->back);
+    PUTC(LRCORNER,draw->bord,draw->back);
+ 
+-   scr_restore(fd,f,dump,console);
++   gpm_scr_restore(fd,f,dump,console);
+    free(dump);
+ 
+ #undef PUTC
+@@ -1077,7 +1077,7 @@ Posted *unpostmenu(int fd, FILE *f, Posted *which, int vc)
+ {
+    Posted *prev=which->prev;
+ 
+-   scr_restore(fd,f,which->dump, vc);
++   gpm_scr_restore(fd,f,which->dump, vc);
+    ioctl(fd,TCXONC,TCOON); /* activate the console */  
+    free(which->dump);
+    free(which);
+diff --git a/src/prog/hltest.c b/src/prog/hltest.c
+index cce0abc..a916873 100644
+--- a/src/prog/hltest.c
++++ b/src/prog/hltest.c
+@@ -80,7 +80,6 @@ int wid,hei,vcsize;
+ unsigned short clear_sel_args[6]={0, 0,0, 0,0, 4};
+ unsigned char *clear_sel_arg= (unsigned char *)clear_sel_args+1;
+ 
+-
+ static inline int scrdump(char *buf)
+ {
+    clear_sel_arg[0]=2;  /* clear_selection */
+@@ -99,7 +98,7 @@ static inline int scrrestore(char *buf)
+ 
+ 
+ /* I don't like curses, so I'm doing low level stuff here */
+-static void raw(void)
++static void gpm_raw(void)
+ {
+ struct termios it;
+ 
+@@ -115,7 +114,7 @@ tcsetattr(fileno(stdin),TCSANOW,&it);
+ 
+ }
+ 
+-static void noraw(void)
++static void gpm_noraw(void)
+ {
+ struct termios it;
+ 
+@@ -136,7 +135,7 @@ void killed(int signo)
+ {
+    CLEAR;
+    fprintf(stderr,"hltest: killed by signal %i\r\n",signo);
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+ 
+@@ -525,7 +524,7 @@ int main(int argc, char **argv)
+    gpm_roi_handler=xhandler;
+    gpm_roi_data=NULL;
+ 
+-   raw();
++   gpm_raw();
+    newmsg(0,NULL); /* init data structures */
+    while((c=Gpm_Getchar())!=EOF) {
+       char s[32];
+@@ -538,6 +537,6 @@ int main(int argc, char **argv)
+    newmsg(roi ? ((WinInfo *)roi->clientdata)->number : 0,s);
+    }
+ 
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+diff --git a/src/prog/mouse-test.c b/src/prog/mouse-test.c
+index d7d1027..0db3560 100644
+--- a/src/prog/mouse-test.c
++++ b/src/prog/mouse-test.c
+@@ -106,7 +106,7 @@ return 0;
+ /*----------------------------------------------------------------------------- 
+    Place the description here.
+  -----------------------------------------------------------------------------*/
+-static void raw(void)
++static void gpm_raw(void)
+ {
+    struct termios it;
+ 
+@@ -125,7 +125,7 @@ static void raw(void)
+ /*----------------------------------------------------------------------------- 
+    Place the description here.
+  -----------------------------------------------------------------------------*/
+-static void noraw(void)
++static void gpm_noraw(void)
+ {
+    struct termios it;
+ 
+@@ -144,7 +144,7 @@ static void noraw(void)
+ void killed(int signo)
+ {
+    fprintf(stderr,"mouse-test: killed by signal %i\r\n",signo);
+-   noraw();
++   gpm_noraw();
+    exit(0);
+ }
+ 
+@@ -196,7 +196,7 @@ int mousereopen(int oldfd, const char *name, Gpm_Type *type)
+ 
+ int noneofthem(void)
+ {
+-   noraw();
++   gpm_noraw();
+    printf("\n\nSomething went wrong, I didn't manage to detect your"
+ 	 "protocol\n\nFeel free to report your problems to the author\n");
+    exit(1);
+@@ -336,7 +336,7 @@ int main(int argc, char **argv)
+    I_serial=mice->init; /* the first one has I_serial */
+ 
+    signal(SIGINT,killed);   /* control-C kills us */
+-   raw();
++   gpm_raw();
+ 
+ /*====================================== First of all, detect the device */
+ 
+@@ -568,7 +568,7 @@ int main(int argc, char **argv)
+    /* why checking and not using return value ??? */
+    CHECKFAIL(typecount);
+    if (typecount==1) {
+-      noraw();
++      gpm_noraw();
+       printf("\n\n\nWell, it seems like your mouse is already detected:\n"
+       "it is on the device \"%s\", and speaks the protocol \"%s\"\n",
+       mousename,list->this->name);
+@@ -587,7 +587,7 @@ int main(int argc, char **argv)
+    } while(i!='y' && i!='n');
+ 
+    if (i=='n') {
+-      noraw();
++      gpm_noraw();
+       printf("\nThen, you should use the \"bare\" protocol on \"%s\"\n",
+ 	   mousename);
+       exit(0);
+@@ -634,7 +634,7 @@ int main(int argc, char **argv)
+    for (pending=0,i=0;i<got-16;i++)
+       if(!memcmp(buf+i,buf+i+8,8)) pending++;
+    if (pending > 3) {
+-      noraw();
++      gpm_noraw();
+       printf("\nYour mouse seems to be a 'mman' one  on \"%s\" (%i matches)\n",
+ 	   mousename,pending);
+       exit(0);
+@@ -660,7 +660,7 @@ int main(int argc, char **argv)
+          continue;
+       }
+ 	   if (pending>3) {
+-	      noraw();
++	      gpm_noraw();
+ 	      printf("\nYour mouse seems to be a '%s' one on \"%s\" (%i matches)\n",
+ 		   cur->this->name,mousename,pending);
+ 	      exit(0);
+@@ -695,7 +695,7 @@ int main(int argc, char **argv)
+          for (pending=0,i=0;i<got-20;i++)
+             if(!memcmp(buf+i,buf+i+10,10)) pending++;
+          if (pending>3) {
+-            noraw();
++            gpm_noraw();
+             printf("\nYour mouse becomes a 3-buttons ('-t msc') one when\n"
+ 	         "gpm gets '-o %s' on it command line, and X gets\n"
+ 	         "%s in XF86Config\nThe device is \"%s\"",
+@@ -726,7 +726,7 @@ int main(int argc, char **argv)
+    for (pending=0,i=0;i<got-20;i++)
+       if(!memcmp(buf+i,buf+i+10,10)) pending++;
+    if (pending>3) {
+-      noraw();
++      gpm_noraw();
+       printf("\nWorked. You should keep the button pressed every time the\n"
+ 	   "computer boots, and run gpm in '-R' mode in order to ignore\n"
+ 	   "such hassle when starting X\n\nStill better, but a better mouse\n"
+@@ -734,7 +734,7 @@ int main(int argc, char **argv)
+ 
+       exit(0);
+    }
+-   noraw();
++   gpm_noraw();
+    printf("\nI'm lost. Can't tell you how to use your middle button\n");
+    return 0;
+ }
+
diff --git a/meta-oe/recipes-support/gpm/gpm/0002-Fix-function-definition-in-yacc-source-file-until-va.patch b/meta-oe/recipes-support/gpm/gpm/0002-Fix-function-definition-in-yacc-source-file-until-va.patch
new file mode 100644
index 0000000000..4534de9be4
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm/0002-Fix-function-definition-in-yacc-source-file-until-va.patch
@@ -0,0 +1,81 @@
+From 155873ed357a94f06e7e7032e27acba58bba8214 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Tue, 11 Feb 2025 19:01:48 +0400
+Subject: [PATCH 2/3] Fix function definition in yacc source file until valid
+ C23. Fill empty argument lists with values. Add 0 as third argument for
+ two-argument function, it will be ignored at call site.
+
+Upstream-Status: Submitted [https://github.com/telmich/gpm/pull/49]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/prog/gpm-root.y | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 800e51b..f06872c 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -128,7 +128,7 @@ typedef struct DrawItem {
+    char *name;
+    char *arg;   /* a cmd string */
+    void *clientdata;  /* a (Draw *) for menus or whatever   */
+-   int (*fun)();
++   int (*fun)(int, struct DrawItem *, int);
+    struct DrawItem *next;
+ } DrawItem;
+ 
+@@ -159,7 +159,7 @@ int yyerror(char *s);
+ int yylex(void);
+ 
+ DrawItem *cfg_cat(DrawItem *, DrawItem *);
+-DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail);
++DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(int,  DrawItem *, int), void *detail);
+ 
+ 
+ /*===================================================================*
+@@ -195,7 +195,7 @@ int f_pipe(int mode, DrawItem *self, int uid);
+       char *string;
+       Draw *draw;
+       DrawItem *item;
+-      int (*fun)();
++      int (*fun)(int,  DrawItem *, int);
+       }
+ 
+ %token <string> T_STRING
+@@ -284,7 +284,7 @@ struct tokenName tokenList[] = {
+ struct funcName {
+    char *name;
+    int token;
+-   int (*fun)();
++   int (*fun)(int,  DrawItem *, int);
+    };
+ struct funcName funcList[] = {
+    {"f.debug",T_FUNC,f_debug},
+@@ -390,7 +390,7 @@ Draw *cfg_alloc(void)
+ 
+ /*---------------------------------------------------------------------*/
+ /* malloc an empty DrawItem and fill it */
+-DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail)
++DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(int,  DrawItem *, int), void *detail)
+ {
+    DrawItem *new=calloc(1,sizeof(DrawItem));
+ 
+@@ -405,7 +405,7 @@ DrawItem *cfg_makeitem(int mode, char *msg, int(*fun)(), void *detail)
+ 
+       case 'F': /* a function without args */
+          new->fun=fun;
+-         if (fun) fun(F_CREATE,new);
++         if (fun) fun(F_CREATE,new,0);
+          break;
+ 
+       case 'M':
+@@ -1047,7 +1047,7 @@ Posted *postmenu(int fd, FILE *f, Draw *draw, int x, int y, int console)
+    }
+    /* sides and items */
+    for (item=draw->menu; y++, item; item=item->next) {
+-         if (item->fun) (*(item->fun))(F_POST,item);
++         if (item->fun) (*(item->fun))(F_POST,item,0);
+          GOTO(x,y); PUTC(VERLINE,draw->bord,draw->back);
+          for (i=0;i<item->pad;i++) PUTC(' ',draw->fore,draw->back);
+          PUTS(item->name,draw->fore,draw->back); i+=strlen(item->name);
+
diff --git a/meta-oe/recipes-support/gpm/gpm/0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch b/meta-oe/recipes-support/gpm/gpm/0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch
new file mode 100644
index 0000000000..0913c809c8
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm/0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch
@@ -0,0 +1,37 @@
+From d8224863233ae64310a1ee91b9f4e77daf9cfd10 Mon Sep 17 00:00:00 2001
+From: NHOrus <jy6x2b32pie9@yahoo.com>
+Date: Sat, 22 Feb 2025 01:12:32 +0400
+Subject: [PATCH 3/3] Add incomplete type definition for WINDOW in Gpm_Wgetch()
+
+Window handle is an opaque pointer that Gpm_Wgetch() passes
+through straight to ncurses if it's not null and calls getch
+if it's null. Code doesn't care what's inside the handle
+as long as it agrees with curses definition.
+
+Upstream-Status: Submitted [https://github.com/telmich/gpm/pull/49]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/headers/gpm.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/headers/gpm.h b/src/headers/gpm.h
+index fe52e53..b944d4b 100644
+--- a/src/headers/gpm.h
++++ b/src/headers/gpm.h
+@@ -268,7 +268,14 @@ Gpm_Roi * Gpm_LowerRoi(Gpm_Roi *which, Gpm_Roi *after);
+ /* libcurses.c */
+ /* #include <curses.h>  Hmm... seems risky */
+ 
+-extern int Gpm_Wgetch();
++/* Window handle is an opaque pointer that Gpm_Wgetch()
++ * passes through to ncurses if it's not null and calls getch
++ * if it's null. Code doesn't care what's inside the handle
++ * as long as it agrees with curses definition.
++*/
++typedef struct _win_st WINDOW;
++
++extern int Gpm_Wgetch(WINDOW *);
+ #define Gpm_Getch() (Gpm_Wgetch(NULL))
+ 
+ /* libxtra.c */
+
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index a066488649..a379065912 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -15,6 +15,9 @@ DEPENDS = "ncurses bison-native"
 SRC_URI = "git://github.com/telmich/gpm;protocol=https;branch=master \
            file://init \
            file://gpm.service.in \
+           file://0001-Avoid-shadowing-ncurses-functions.patch \
+           file://0002-Fix-function-definition-in-yacc-source-file-until-va.patch \
+           file://0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


