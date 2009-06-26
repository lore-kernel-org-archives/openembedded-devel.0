Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MKClo-000463-8b
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 16:51:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 14F2A49E5D4;
	Fri, 26 Jun 2009 10:39:53 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17579-06; Fri, 26 Jun 2009 10:39:53 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id F381D49EFA3; Fri, 26 Jun 2009 10:39:52 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id BBE8B49E970;
	Fri, 26 Jun 2009 10:39:50 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id A38C34147E; Fri, 26 Jun 2009 10:39:50 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jun 2009 10:39:49 -0400
Message-Id: <1246027189-26894-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] Add fping 2.4b2_to, plus patch from SourceForge.
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
X-List-Received-Date: Fri, 26 Jun 2009 14:51:16 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 conf/checksums.ini                              |    4 +
 conf/licenses.conf                              |    2 +-
 recipes/fping/files/sourceforge-truckload.patch |  257 +++++++++++++++++++++++
 recipes/fping/fping_2.3+2.4b2to.bb              |   12 +
 4 files changed, 274 insertions(+), 1 deletions(-)
 create mode 100644 recipes/fping/files/sourceforge-truckload.patch
 create mode 100644 recipes/fping/fping_2.3+2.4b2to.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index caba61c..3d8c9d3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6754,6 +6754,10 @@ sha256=bd54e294c056c6d52b2037e91d7b2782d6805b24a74923dc80e1c9107acac707
 md5=6106c8d0aba37563b7ca9ccc94bc6c95
 sha256=44b7e18ba9ae5667dd64c89f7b04627bda5807a3a90255a125702d63c0c4ee17
 
+[http://fping.sourceforge.net/download/fping.tar.gz]
+md5=d5e8be59e307cef76bc479e1684df705
+sha256=9f3b3ed7c9fffccefefa9af432eee7244a65592118851f75b5897814cb79b86f
+
 [http://downloads.sourceforge.net/free42/free42.tgz]
 md5=1fc21e04b3b77150846027dc7cb5210d
 sha256=9d348a9d2d5bf8eabc7e7bb6f0907e611403e4abe6dc1e11b1b2ad1118b3088a
diff --git a/conf/licenses.conf b/conf/licenses.conf
index c067627..3da47f9 100644
--- a/conf/licenses.conf
+++ b/conf/licenses.conf
@@ -2,4 +2,4 @@ SRC_DISTRIBUTE_LICENSES += "GPL GPLv2 GPLv3 LGPL LGPLv2.1 LGPLv3"
 SRC_DISTRIBUTE_LICENSES += "BSD Apache-2.0 QPL AFL CUPS"
 SRC_DISTRIBUTE_LICENSES += "MIT Sleepycat Classpath Perl PSF PD Artistic"
 SRC_DISTRIBUTE_LICENSES += "bzip2 zlib ntp cron libpng netperf openssl"
-SRC_DISTRIBUTE_LICENSES += "Info-ZIP tcp-wrappers"
+SRC_DISTRIBUTE_LICENSES += "Info-ZIP tcp-wrappers Stanford"
diff --git a/recipes/fping/files/sourceforge-truckload.patch b/recipes/fping/files/sourceforge-truckload.patch
new file mode 100644
index 0000000..ef9971a
--- /dev/null
+++ b/recipes/fping/files/sourceforge-truckload.patch
@@ -0,0 +1,257 @@
+upstream: http://sourceforge.net/tracker/?func=detail&aid=2748675&group_id=183434&atid=905228
+status: submitted to SF by anonymous poster on Apr 9 2009
+origin: anonymous on SourceForge
+comment: various minor fixes - ID: 2748675
+
+The attached patch fixes a truckload of compiler warnings and fflushes the
+output stream after each line. The new function `lf_and_flush' was
+introduced to accomplish this. `recvfrom' now gets a real socklen_t if its
+existance is detected via autoconf.
+
+Submitted: Nobody/Anonymous ( nobody ) - 2009-04-09 21:26
+
+--- fping-2.4b2_to/configure.in	2001-11-03 16:36:49.000000000 +0100
++++ fping/configure.in	2009-04-09 22:57:32.000000000 +0200
+@@ -29,4 +29,7 @@
+ dnl Checks for header files.
+ AC_CHECK_HEADERS(unistd.h sys/file.h stdlib.h sys/select.h)
+ 
++AC_CHECK_TYPES([socklen_t], , , [#include <sys/types.h>
++                                 #include <sys/socket.h>])
++
+ AC_OUTPUT(Makefile)
+--- fping-2.4b2_to/fping.c	2001-07-20 19:10:26.000000000 +0200
++++ fping/fping.c	2009-04-09 23:10:08.000000000 +0200
+@@ -114,6 +114,10 @@
+ 
+ #include "options.h"
+ 
++#ifndef HAVE_SOCKLEN_T
++typedef int socklen_t;
++#endif
++
+ /*** externals ***/
+ 
+ extern char *optarg;
+@@ -314,6 +318,7 @@
+ void add_addr();
+ char *na_cat();
+ char *cpystr();
++void lf_and_flush();
+ void crash_and_burn();
+ void errno_crash_and_burn();
+ char *get_host_by_address();
+@@ -338,6 +343,7 @@
+ void add_addr( char *name, char *host, struct in_addr ipaddr );
+ char *na_cat( char *name, struct in_addr ipaddr );
+ char *cpystr( char *string );
++void lf_and_flush( FILE *stream );
+ void crash_and_burn( char *message );
+ void errno_crash_and_burn( char *message );
+ char *get_host_by_address( struct in_addr in );
+@@ -411,7 +417,7 @@
+ 
+ 	if( ( uid = getuid() ) )
+ 	{
+-		seteuid( getuid() );
++		seteuid( uid );
+ 
+ 	}/* IF */
+ 
+@@ -610,7 +616,7 @@
+ 	
+ 	if( ( ping_data_size > MAX_PING_DATA ) || ( ping_data_size < MIN_PING_DATA ) )
+ 	{
+-		fprintf( stderr, "%s: data size %u not valid, must be between %u and %u\n",
++		fprintf( stderr, "%s: data size %u not valid, must be between %lu and %u\n",
+ 			prog, ping_data_size, MIN_PING_DATA, MAX_PING_DATA );
+ 		usage();
+ 	
+@@ -783,7 +789,6 @@
+ 		int iBitpos;
+ 		int iMask = 1;
+ 		int failed = 0;
+-		unsigned long uTemp;
+ 
+ 		/* two possible forms are allowed here */
+ 
+@@ -1085,6 +1090,7 @@
+ 	}/* WHILE */
+ 	
+ 	finish();
++	return 0;
+ 
+ } /* main() */
+ 
+@@ -1130,7 +1136,7 @@
+ 				if( verbose_flag ) 
+ 					printf( " is unreachable" );
+ 				
+-				printf( "\n" );
++				lf_and_flush( stdout );
+ 			
+ 			}/* IF */
+ 		}/* IF */
+@@ -1175,7 +1181,7 @@
+ void print_per_system_stats( void )
+ #endif /* _NO_PROTO */
+ {
+-	int i, j, k, avg;
++	int i, j, avg;
+ 	HOST_ENTRY *h;
+ 	char *buf;
+ 	int bufsize;
+@@ -1210,7 +1216,7 @@
+ 
+ 			}/* FOR */
+ 		  
+-			fprintf( stderr, "\n" );
++			lf_and_flush( stderr );
+ 	  
+ 		}/* IF */
+ 		else
+@@ -1253,7 +1259,7 @@
+ 				else
+ 					fprintf( stderr, " -" );
+ 			  
+-				fprintf( stderr, "\n" );
++				lf_and_flush( stderr );
+ 
+ 			}/* FOR */
+ 		}/* IF */
+@@ -1284,11 +1290,10 @@
+ void print_per_system_splits( void )
+ #endif /* _NO_PROTO */
+ {
+-	int i, j, k, avg;
++	int i, avg;
+ 	HOST_ENTRY *h;
+ 	char *buf;
+ 	int bufsize;
+-	int resp;
+ 	struct tm *curr_tm;
+ 
+ 	bufsize = max_hostname_len + 1;
+@@ -1463,9 +1468,9 @@
+ 		{
+ 			printf( "%s", h->host );
+ 			if( verbose_flag )
+-				printf( " error while sending ping: %s\n", strerror( errno ) );
++				printf( " error while sending ping: %s", strerror( errno ) );
+ 			
+-			printf( "\n" );
++			lf_and_flush( stdout );
+ 
+ 		}/* IF */
+ 		
+@@ -1631,7 +1636,7 @@
+ 					if( response_addr.sin_addr.s_addr != h->saddr.sin_addr.s_addr )
+ 						fprintf( stderr, " [<- %s]", inet_ntoa( response_addr.sin_addr ) );
+ 	  
+-					fprintf( stderr, "\n" );
++					lf_and_flush( stderr );
+ 	
+ 				}/* IF */
+       		}/* IF */
+@@ -1664,7 +1669,7 @@
+ 			if( response_addr.sin_addr.s_addr != h->saddr.sin_addr.s_addr )
+ 				printf( " [<- %s]", inet_ntoa( response_addr.sin_addr ) );
+ 
+-			printf( "\n" );
++			lf_and_flush( stdout );
+ 		
+ 		}/* IF */
+ 	}/* IF */
+@@ -1692,7 +1697,7 @@
+ 		if( response_addr.sin_addr.s_addr != h->saddr.sin_addr.s_addr )
+ 			printf( " [<- %s]", inet_ntoa( response_addr.sin_addr ) );
+ 		
+-		printf( "\n" );
++		lf_and_flush( stdout );
+ 	
+ 	}/* IF */
+ 	
+@@ -1725,7 +1730,6 @@
+ #endif /* _NO_PROTO */
+ {
+ 	struct icmp *sent_icmp;
+-	struct ip *sent_ip;
+ 	u_char *c;
+ 	HOST_ENTRY *h;
+ 
+@@ -1758,7 +1762,7 @@
+ 			if( inet_addr( h->host ) == -1 )
+ 				fprintf( stderr, " (%s)", inet_ntoa( h->saddr.sin_addr ) );
+ 			
+-			fprintf( stderr, "\n" );
++			lf_and_flush( stderr );
+ 		
+ 		}/* IF */
+ 
+@@ -1781,7 +1785,7 @@
+ 			if( inet_addr( h->host ) == -1 )
+ 				fprintf( stderr, " (%s)", inet_ntoa( h->saddr.sin_addr ) );
+ 
+-			fprintf( stderr, "\n" );
++			lf_and_flush( stderr );
+ 		
+ 		}/* IF */
+ 
+@@ -2241,6 +2245,29 @@
+ 
+ } /* cpystr() */
+ 
++/************************************************************
++
++  Function: lf_and_flush
++
++*************************************************************
++
++  Inputs:  FILE *stream
++
++  Description:
++
++************************************************************/
++
++#ifdef _NO_PROTO
++void lf_and_flush( stream )
++FILE *stream;
++#else
++void lf_and_flush( FILE *stream )
++#endif /* _NO_PROTO */
++{
++	putc( '\n', stream );
++	fflush( stream );
++} /* lf_and_flush() */
++
+ 
+ /************************************************************
+ 
+@@ -2405,7 +2432,7 @@
+ void u_sleep( int u_sec )
+ #endif /* _NO_PROTO */
+ {
+-	int nfound, slen, n;
++	int nfound;
+ 	struct timeval to;
+ 	fd_set readset, writeset;
+ 
+@@ -2418,8 +2445,6 @@
+ 	if( nfound < 0 )
+ 		errno_crash_and_burn( "select" );
+ 
+-	return;
+-
+ } /* u_sleep() */
+ 
+ 
+@@ -2448,7 +2473,8 @@
+ int recvfrom_wto( int s, char *buf, int len, struct sockaddr *saddr, int timo )
+ #endif /* _NO_PROTO */
+ {
+-	int nfound, slen, n;
++	int nfound, n;
++	socklen_t slen;
+ 	struct timeval to;
+ 	fd_set readset, writeset;
+ 
diff --git a/recipes/fping/fping_2.3+2.4b2to.bb b/recipes/fping/fping_2.3+2.4b2to.bb
new file mode 100644
index 0000000..20b7bb0
--- /dev/null
+++ b/recipes/fping/fping_2.3+2.4b2to.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Fast, scriptable ping"
+LICENSE = "Stanford"
+PR = "r0"
+
+SRC_URI = " \
+	http://fping.sourceforge.net/download/fping.tar.gz \
+	file://sourceforge-truckload.patch;patch=1 \
+"
+
+S = "${WORKDIR}/fping-2.4b2_to"
+
+inherit autotools
-- 
1.6.3



