Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC9E759B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:41:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u218fRQb007613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Mar 2016 00:41:27 -0800
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 1 Mar 2016 00:41:26 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Mar 2016 16:41:10 +0800
Message-ID: <1456821670-4331-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-selinux][PATCH] net-tools: Add SCTP option support
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
X-List-Received-Date: Tue, 01 Mar 2016 08:41:28 -0000
Content-Type: text/plain

Patch netstat-selinux-support.patch's context is changed becasue of the
commit in oe-core which adds SCTP support for net-tools. So rebase it.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../net-tools/netstat-selinux-support.patch        |   61 ++++++++++----------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch b/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch
index 2a97216..4b023d9 100644
--- a/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch
+++ b/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch
@@ -1,17 +1,20 @@
-From: Xin Ouyang <Xin.Ouyang@windriver.com>
-Date: Wed, 13 Jun 2012 13:32:01 +0800
+From 759be4a417a6720eff482bc0a20635529d44b8a9 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Fri, 15 Jan 2016 17:31:18 +0800
 Subject: [PATCH] net-tools: netstat add SELinux support.
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+[Rebase the patch for  LIN6-10717's commit]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
- Makefile  |    9 +++++++-
- netstat.c |   69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ Makefile  |  9 ++++++++-
+ netstat.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
  2 files changed, 74 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8fcc55c..dca8fbc 100644
+index 8fcc55c..0b5c395 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -116,6 +116,13 @@ NET_LIB = $(NET_LIB_PATH)/lib$(NET_LIB_NAME).a
@@ -38,12 +41,12 @@ index 8fcc55c..dca8fbc 100644
  iptunnel:	$(NET_LIB) iptunnel.o
  		$(CC) $(LDFLAGS) -o iptunnel iptunnel.o $(NLIB) $(RESLIB)
 diff --git a/netstat.c b/netstat.c
-index c3a7bb1..71be41f 100644
+index 387217c..1c19672 100644
 --- a/netstat.c
 +++ b/netstat.c
-@@ -86,6 +86,12 @@
- #include <net/if.h>
- #include <dirent.h>
+@@ -89,6 +89,12 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
  
 +#if HAVE_SELINUX
 +#include <selinux/selinux.h>
@@ -54,7 +57,7 @@ index c3a7bb1..71be41f 100644
  #include "net-support.h"
  #include "pathnames.h"
  #include "version.h"
-@@ -97,6 +103,7 @@
+@@ -100,6 +106,7 @@
  #include "proc.h"
  
  #define PROGNAME_WIDTH 20
@@ -62,7 +65,7 @@ index c3a7bb1..71be41f 100644
  
  #if !defined(s6_addr32) && defined(in6a_words)
  #define s6_addr32 in6a_words	/* libinet6			*/
-@@ -153,6 +160,7 @@ int flag_wide= 0;
+@@ -179,6 +186,7 @@ int flag_wide= 0;
  int flag_prg = 0;
  int flag_arg = 0;
  int flag_ver = 0;
@@ -70,7 +73,7 @@ index c3a7bb1..71be41f 100644
  
  FILE *procinfo;
  
-@@ -216,12 +224,17 @@ FILE *procinfo;
+@@ -242,12 +250,17 @@ FILE *procinfo;
  #define PROGNAME_WIDTH1(s) PROGNAME_WIDTH2(s)
  #define PROGNAME_WIDTH2(s) #s
  
@@ -88,7 +91,7 @@ index c3a7bb1..71be41f 100644
  } *prg_hash[PRG_HASH_SIZE];
  
  static char prg_cache_loaded = 0;
-@@ -229,9 +242,12 @@ static char prg_cache_loaded = 0;
+@@ -255,9 +268,12 @@ static char prg_cache_loaded = 0;
  #define PRG_HASHIT(x) ((x) % PRG_HASH_SIZE)
  
  #define PROGNAME_BANNER "PID/Program name"
@@ -101,7 +104,7 @@ index c3a7bb1..71be41f 100644
  #define PRG_LOCAL_ADDRESS "local_address"
  #define PRG_INODE	 "inode"
  #define PRG_SOCKET_PFX    "socket:["
-@@ -253,7 +269,7 @@ static char prg_cache_loaded = 0;
+@@ -279,7 +295,7 @@ static char prg_cache_loaded = 0;
  /* NOT working as of glibc-2.0.7: */
  #undef  DIRENT_HAVE_D_TYPE_WORKS
  
@@ -110,7 +113,7 @@ index c3a7bb1..71be41f 100644
  {
      unsigned hi = PRG_HASHIT(inode);
      struct prg_node **pnp,*pn;
-@@ -274,6 +290,14 @@ static void prg_cache_add(unsigned long inode, char *name)
+@@ -300,6 +316,14 @@ static void prg_cache_add(unsigned long inode, char *name)
      if (strlen(name)>sizeof(pn->name)-1) 
  	name[sizeof(pn->name)-1]='\0';
      strcpy(pn->name,name);
@@ -125,7 +128,7 @@ index c3a7bb1..71be41f 100644
  }
  
  static const char *prg_cache_get(unsigned long inode)
-@@ -286,6 +310,16 @@ static const char *prg_cache_get(unsigned long inode)
+@@ -312,6 +336,16 @@ static const char *prg_cache_get(unsigned long inode)
      return("-");
  }
  
@@ -142,7 +145,7 @@ index c3a7bb1..71be41f 100644
  static void prg_cache_clear(void)
  {
      struct prg_node **pnp,*pn;
-@@ -357,6 +391,7 @@ static void prg_cache_load(void)
+@@ -383,6 +417,7 @@ static void prg_cache_load(void)
      const char *cs,*cmdlp;
      DIR *dirproc=NULL,*dirfd=NULL;
      struct dirent *direproc,*direfd;
@@ -150,7 +153,7 @@ index c3a7bb1..71be41f 100644
  
      if (prg_cache_loaded || !flag_prg) return;
      prg_cache_loaded=1;
-@@ -426,7 +461,15 @@ static void prg_cache_load(void)
+@@ -452,7 +487,15 @@ static void prg_cache_load(void)
  	    }
  
  	    snprintf(finbuf, sizeof(finbuf), "%s/%s", direproc->d_name, cmdlp);
@@ -167,7 +170,7 @@ index c3a7bb1..71be41f 100644
  	}
  	closedir(dirfd); 
  	dirfd = NULL;
-@@ -546,6 +589,8 @@ static void finish_this_one(int uid, unsigned long inode, const char *timers)
+@@ -572,6 +615,8 @@ static void finish_this_one(int uid, unsigned long inode, const char *timers)
      }
      if (flag_prg)
  	printf(" %-16s",prg_cache_get(inode));
@@ -176,7 +179,7 @@ index c3a7bb1..71be41f 100644
      if (flag_opt)
  	printf(" %s", timers);
      putchar('\n');
-@@ -1238,6 +1283,8 @@ static void unix_do_one(int nr, const char *line)
+@@ -1557,6 +1602,8 @@ static void unix_do_one(int nr, const char *line)
  	printf("-        ");
      if (flag_prg)
  	printf("%-" PROGNAME_WIDTHs "s",(has & HAS_INODE?prg_cache_get(inode):"-"));
@@ -185,7 +188,7 @@ index c3a7bb1..71be41f 100644
      puts(path);
  }
  
-@@ -1256,6 +1303,7 @@ static int unix_info(void)
+@@ -1575,6 +1622,7 @@ static int unix_info(void)
  
      printf(_("\nProto RefCnt Flags       Type       State         I-Node  "));
      print_progname_banner();
@@ -193,15 +196,15 @@ index c3a7bb1..71be41f 100644
      printf(_(" Path\n"));	/* xxx */
  
      {
-@@ -1546,6 +1594,7 @@ static void usage(void)
+@@ -1865,6 +1913,7 @@ static void usage(void)
      fprintf(stderr, _("        -o, --timers             display timers\n"));
      fprintf(stderr, _("        -F, --fib                display Forwarding Information Base (default)\n"));
      fprintf(stderr, _("        -C, --cache              display routing cache instead of FIB\n\n"));
 +    fprintf(stderr, _("        -Z, --context            display SELinux security context for sockets\n\n"));
  
-     fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
+     fprintf(stderr, _("  <Socket>={-t|--tcp} {-u|--udp} {-S|--sctp} {-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
      fprintf(stderr, _("  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: %s\n"), DFLT_AF);
-@@ -1591,6 +1640,7 @@ int main
+@@ -1911,6 +1960,7 @@ int main
  	{"cache", 0, 0, 'C'},
  	{"fib", 0, 0, 'F'},
  	{"groups", 0, 0, 'g'},
@@ -209,16 +212,16 @@ index c3a7bb1..71be41f 100644
  	{NULL, 0, 0, 0}
      };
  
-@@ -1602,7 +1652,7 @@ int main
+@@ -1922,7 +1972,7 @@ int main
      getroute_init();		/* Set up AF routing support */
  
      afname[0] = '\0';
--    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxl64", longopts, &lop)) != EOF)
-+    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxlZ64", longopts, &lop)) != EOF)
+-    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxl64", longopts, &lop)) != EOF)
++    while ((i = getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxlZ64", longopts, &lop)) != EOF)
  	switch (i) {
  	case -1:
  	    break;
-@@ -1705,6 +1755,19 @@ int main
+@@ -2027,6 +2077,19 @@ int main
  	    if (aftrans_opt("unix"))
  		exit(1);
  	    break;
@@ -239,5 +242,5 @@ index c3a7bb1..71be41f 100644
  	case 'h':
  	    usage();
 -- 
-1.7.5.4
+1.8.5.2.233.g932f7e4
 
-- 
1.7.9.5


