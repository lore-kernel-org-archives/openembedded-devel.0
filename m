Return-Path: <Lauren.Post@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe001.messaging.microsoft.com [216.32.181.181])
	by mail.openembedded.org (Postfix) with ESMTP id 870E06E87A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 20:35:36 +0000 (UTC)
Received: from mail223-ch1-R.bigfish.com (10.43.68.254) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Tue, 11 Mar 2014 20:35:36 +0000
Received: from mail223-ch1 (localhost [127.0.0.1])	by
	mail223-ch1-R.bigfish.com (Postfix) with ESMTP id D408B340494	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 20:35:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -11
X-BigFish: VS-11(z98bRz936eI154dIzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h177df4h8275eh17326ah8275bh8275dh19a27bh1de097h186068ha1495iz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail223-ch1 (localhost.localdomain [127.0.0.1]) by mail223-ch1
	(MessageSwitch) id 1394570132710690_7966;
	Tue, 11 Mar 2014 20:35:32 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail223-ch1.bigfish.com (Postfix) with ESMTP id
	A910F160067;	Tue, 11 Mar 2014 20:35:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 11 Mar 2014 20:35:30 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 11 Mar 2014 20:35:29 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s2BKZS9D030006;
	Tue, 11 Mar 2014 13:35:28 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Mar 2014 15:23:48 -0500
Message-ID: <1394569428-29307-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5
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
X-List-Received-Date: Tue, 11 Mar 2014 20:35:38 -0000
Content-Type: text/plain

This version provides better ethernet performance

Patch is required for man page portion of build

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff |  164 ------------------
 .../001-cast-to-max_size_t-instead-of-int.patch    |   14 --
 .../003-fix-hyphen-used-as-minus-sign.patch        |  178 --------------------
 .../iperf/iperf-2.0.4/004-svn-r43-ro.patch         |  117 -------------
 .../iperf-2.0.4/005-iperf-die-on-bind-fail.patch   |   15 --
 .../006-iperf-die-on-connect-fail.patch            |   15 --
 .../iperf-2.0.4/007-iperf-reporter-deadlock.patch  |   68 --------
 .../iperf/iperf-2.0.4/008-numofreport.patch        |   15 --
 .../iperf/iperf-2.0.4/009-delayloop.patch          |   22 ---
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |    8 +
 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb     |   46 -----
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |   18 ++
 12 files changed, 26 insertions(+), 654 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
 create mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
deleted file mode 100644
index 7e89953..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
+++ /dev/null
@@ -1,164 +0,0 @@
-[Thread]: Replace thread_rest() with condition variables
-
-This applies the patch by Ingo Molnar from
-
-   http://marc.info/?l=linux-kernel&m=119088670113210&w=2
-
-by reverting previous changes that coincided with changes made by this
-patch. Other than that, the patch is the original from the above URL.
-
-Gerrit
----
- compat/Thread.c |    6 ------
- src/Reporter.c  |   37 +++++++++----------------------------
- src/main.cpp    |    2 ++
- 3 files changed, 11 insertions(+), 34 deletions(-)
-
-rover: changed two remaining thread_rest.
-
---- a/compat/Thread.c
-+++ b/compat/Thread.c
-@@ -405,12 +405,6 @@ int thread_numuserthreads( void ) {
- void thread_rest ( void ) {
- #if defined( HAVE_THREAD )
- #if defined( HAVE_POSIX_THREAD )
--#if defined( _POSIX_PRIORITY_SCHEDULING )
--    sched_yield();
--#else
--    usleep( 0 );
--#endif
--
- #else // Win32
-     SwitchToThread( );
- #endif
---- a/src/Reporter.c
-+++ b/src/Reporter.c
-@@ -110,9 +110,8 @@
- 
- char buffer[64]; // Buffer for printing
- ReportHeader *ReportRoot = NULL;
--int threadWait = 0;
--int threadSleeping = 0;
- extern Condition ReportCond;
-+extern Condition ReportDoneCond;
- int reporter_process_report ( ReportHeader *report );
- void process_report ( ReportHeader *report );
- int reporter_handle_packet( ReportHeader *report );
-@@ -340,7 +339,7 @@
-             // item
-             while ( index == 0 ) {
-                 Condition_Signal( &ReportCond );
--                thread_rest();
-+                Condition_Wait( &ReportDoneCond );
-                 index = agent->reporterindex;
-             }
-             agent->agentindex = 0;
-@@ -348,11 +347,9 @@
-         // Need to make sure that reporter is not about to be "lapped"
-         while ( index - 1 == agent->agentindex ) {
-             Condition_Signal( &ReportCond );
--            thread_rest();
-+            Condition_Wait( &ReportDoneCond );
-             index = agent->reporterindex;
-         }
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
- 
-         // Put the information there
-         memcpy( agent->data + agent->agentindex, packet, sizeof(ReportStruct) );
-@@ -382,9 +379,6 @@
-         packet->packetLen = 0;
-         ReportPacket( agent, packet );
-         packet->packetID = agent->report.cntDatagrams;
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
--
-     }
- }
- 
-@@ -396,11 +390,8 @@
- void EndReport( ReportHeader *agent ) {
-     if ( agent != NULL ) {
-         int index = agent->reporterindex;
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
--
-         while ( index != -1 ) {
--            thread_rest();
-+            Condition_Wait( &ReportDoneCond );
-             index = agent->reporterindex;
-         }
-         agent->agentindex = -1;
-@@ -421,7 +412,7 @@
- Transfer_Info *GetReport( ReportHeader *agent ) {
-     int index = agent->reporterindex;
-     while ( index != -1 ) {
--        thread_rest();
-+        Condition_Wait( &ReportDoneCond );
-         index = agent->reporterindex;
-     }
-     return &agent->report.info;
-@@ -467,10 +458,6 @@
-              * Update the ReportRoot to include this report.
-              */
-             Condition_Lock( ReportCond );
--	    if ( isUDP(agent) )
--	      threadWait = 0;
--	    else
--	      threadWait = 1;
-             reporthdr->next = ReportRoot;
-             ReportRoot = reporthdr;
-             Condition_Signal( &ReportCond );
-@@ -567,6 +554,7 @@
-         }
-         Condition_Unlock ( ReportCond );
- 
-+again:
-         if ( ReportRoot != NULL ) {
-             ReportHeader *temp = ReportRoot;
-             //Condition_Unlock ( ReportCond );
-@@ -589,19 +577,12 @@
-                 // finished with report so free it
-                 free( temp );
-                 Condition_Unlock ( ReportCond );
-+                Condition_Signal( &ReportDoneCond );
-+                if (ReportRoot)
-+                    goto again;
-             }
--            // yield control of CPU is another thread is waiting
--	    // sleep on a condition variable, as it is much cheaper
--	    // on most platforms than issuing schedyield or usleep
--	    // syscalls
--	    Condition_Lock ( ReportCond );
--	    if ( threadWait && ReportRoot != NULL) {
--	      threadSleeping = 1;
--	      Condition_TimedWait (& ReportCond, 1 );
--	      threadSleeping = 0;
--	    }
--	    Condition_Unlock ( ReportCond );
--	    
-+            Condition_Signal( &ReportDoneCond );
-+            usleep(10000);
-         } else {
-             //Condition_Unlock ( ReportCond );
-         }
---- a/src/main.cpp
-+++ b/src/main.cpp
-@@ -96,6 +96,7 @@ extern "C" {
-     // records being accessed in a report and also to
-     // serialize modification of the report list
-     Condition ReportCond;
-+    Condition ReportDoneCond;
- }
- 
- // global variables only accessed within this file
-@@ -142,6 +143,7 @@ int main( int argc, char **argv ) {
- 
-     // Initialize global mutexes and conditions
-     Condition_Initialize ( &ReportCond );
-+    Condition_Initialize ( &ReportDoneCond );
-     Mutex_Initialize( &groupCond );
-     Mutex_Initialize( &clients_mutex );
- 
-
- 	  	 
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch
deleted file mode 100644
index b6728d4..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Import Debian patches and fix a lot of real bugs. 
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
---- iperf-2.0.4.orig/src/Settings.cpp.orig	2008-04-08 04:37:54.000000000 +0200
-+++ iperf-2.0.4/src/Settings.cpp	2008-05-07 17:41:03.923942801 +0200
-@@ -458,7 +458,7 @@
-         case 't': // seconds to write for
-             // time mode (instead of amount mode)
-             setModeTime( mExtSettings );
--            mExtSettings->mAmount = (int) (atof( optarg ) * 100.0);
-+            mExtSettings->mAmount = (max_size_t) (atof( optarg ) * 100.0);
-             break;
- 
-         case 'u': // UDP instead of TCP
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch
deleted file mode 100644
index 929b5ac..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-Import Debian patches and fix a lot of real bugs. 
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4.orig/man/iperf.1	2008-08-21 00:21:49.290527643 +0200
-+++ iperf-2.0.4/man/iperf.1	2008-08-21 00:35:17.850640445 +0200
-@@ -2,21 +2,21 @@
- .SH NAME
- iperf \- perform network throughput tests
- .SH SYNOPSIS
--.B iperf -s [
-+.B iperf \-s [
- .I options
- .B ]
- 
--.B iperf -c 
-+.B iperf \-c 
- .I server
- .B [
- .I options
- .B ]
- 
--.B iperf -u -s [
-+.B iperf \-u \-s [
- .I options
- .B ]
- 
--.B iperf -u -c 
-+.B iperf \-u \-c 
- .I server
- .B [
- .I options
-@@ -28,103 +28,103 @@
- traffic).  
- .SH "GENERAL OPTIONS"
- .TP
--.BR -f ", " --format " "
-+.BR \-f ", " \-\-format " "
- [kmKM]   format to report: Kbits, Mbits, KBytes, MBytes
- .TP
--.BR -h ", " --help " "
-+.BR \-h ", " \-\-help " "
- print a help synopsis
- .TP
--.BR -i ", " --interval " \fIn\fR"
-+.BR \-i ", " \-\-interval " \fIn\fR"
- pause \fIn\fR seconds between periodic bandwidth reports
- .TP
--.BR -l ", " --len " \fIn\fR[KM]"
-+.BR \-l ", " \-\-len " \fIn\fR[KM]"
- set length read/write buffer to \fIn\fR (default 8 KB)
- .TP
--.BR -m ", " --print_mss " "
-+.BR \-m ", " \-\-print_mss " "
- print TCP maximum segment size (MTU - TCP/IP header)
- .TP
--.BR -o ", " --output " <filename>"
-+.BR \-o ", " \-\-output " <filename>"
- output the report or error message to this specified file
- .TP
--.BR -p ", " --port " \fIn\fR"
-+.BR \-p ", " \-\-port " \fIn\fR"
- set server port to listen on/connect to to \fIn\fR (default 5001)
- .TP
--.BR -u ", " --udp " "
-+.BR \-u ", " \-\-udp " "
- use UDP rather than TCP
- .TP
--.BR -w ", " --window " \fIn\fR[KM]"
-+.BR \-w ", " \-\-window " \fIn\fR[KM]"
- TCP window size (socket buffer size)
- .TP
--.BR -B ", " --bind " <host>"
-+.BR \-B ", " \-\-bind " <host>"
- bind to <host>, an interface or multicast address
- .TP
--.BR -C ", " --compatibility " "
-+.BR \-C ", " \-\-compatibility " "
- for use with older versions does not sent extra msgs
- .TP
--.BR -M ", " --mss " \fIn\fR"
-+.BR \-M ", " \-\-mss " \fIn\fR"
- set TCP maximum segment size (MTU - 40 bytes)
- .TP
--.BR -N ", " --nodelay " "
-+.BR \-N ", " \-\-nodelay " "
- set TCP no delay, disabling Nagle's Algorithm
- .TP
--.BR -v ", " --version " "
-+.BR \-v ", " \-\-version " "
- print version information and quit
- .TP
--.BR -V ", " --IPv6Version " "
-+.BR \-V ", " \-\-IPv6Version " "
- Set the domain to IPv6
- .TP
--.BR -x ", " --reportexclude " "
-+.BR \-x ", " \-\-reportexclude " "
- [CDMSV]   exclude C(connection) D(data) M(multicast) S(settings) V(server) reports
- .TP
--.BR -y ", " --reportstyle " C|c"
-+.BR \-y ", " \-\-reportstyle " C|c"
- if set to C or c report results as CSV (comma separated values)
- .SH "SERVER SPECIFIC OPTIONS"
- .TP
--.BR -s ", " --server " "
-+.BR \-s ", " \-\-server " "
- run in server mode
- .TP
--.BR -U ", " --single_udp " "
-+.BR \-U ", " \-\-single_udp " "
- run in single threaded UDP mode
- .TP
--.BR -D ", " --daemon " "
-+.BR \-D ", " \-\-daemon " "
- run the server as a daemon
- .SH "CLIENT SPECIFIC OPTIONS"
- .TP
--.BR -b ", " --bandwidth " \fIn\fR[KM]"
-+.BR \-b ", " \-\-bandwidth " \fIn\fR[KM]"
- set target bandwidth to \fIn\fR bits/sec (default 1 Mbit/sec).
--This setting requires UDP (-u).
-+This setting requires UDP (\-u).
- .TP
--.BR -c ", " --client " <host>"
-+.BR \-c ", " \-\-client " <host>"
- run in client mode, connecting to <host>
- .TP
--.BR -d ", " --dualtest " "
-+.BR \-d ", " \-\-dualtest " "
- Do a bidirectional test simultaneously
- .TP
--.BR -n ", " --num " \fIn\fR[KM]"
--number of bytes to transmit (instead of -t)
-+.BR \-n ", " \-\-num " \fIn\fR[KM]"
-+number of bytes to transmit (instead of \-t)
- .TP
--.BR -r ", " --tradeoff " "
-+.BR \-r ", " \-\-tradeoff " "
- Do a bidirectional test individually
- .TP
--.BR -t ", " --time " \fIn\fR"
-+.BR \-t ", " \-\-time " \fIn\fR"
- time in seconds to transmit for (default 10 secs)
- .TP
--.BR -F ", " --fileinput " <name>"
-+.BR \-F ", " \-\-fileinput " <name>"
- input the data to be transmitted from a file
- .TP
--.BR -I ", " --stdin " "
-+.BR \-I ", " \-\-stdin " "
- input the data to be transmitted from stdin
- .TP
--.BR -L ", " --listenport " \fIn\fR"
-+.BR \-L ", " \-\-listenport " \fIn\fR"
- port to recieve bidirectional tests back on
- .TP
--.BR -P ", " --parallel " \fIn\fR"
-+.BR \-P ", " \-\-parallel " \fIn\fR"
- number of parallel client threads to run
- .TP
--.BR -T ", " --ttl " \fIn\fR"
-+.BR \-T ", " \-\-ttl " \fIn\fR"
- time-to-live, for multicast (default 1)
- .TP
--.BR -Z ", " --linux-congestion " <algo>"
-+.BR \-Z ", " \-\-linux\-congestion " <algo>"
- set TCP congestion control algorithm (Linux only)
- .SH ENVIRONMENT
- .TP
-@@ -143,6 +143,6 @@
- Kevin Gibbs,
- John Estabrook <jestabro at ncsa.uiuc.edu>,
- Andrew Gallatin <gallatin at gmail.com>,
--Stephen Hemminger <shemminger at linux-foundation.org>
-+Stephen Hemminger <shemminger at linux\-foundation.org>
- .SH "SEE ALSO"
- http://iperf.sourceforge.net/
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
deleted file mode 100644
index 8340148..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Import Debian patches and fix a lot of real bugs. 
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4-4/AUTHORS	2009-07-06 12:02:24.159696747 +0200
-+++ iperf-2.0.4/AUTHORS	2009-07-06 12:14:32.236079541 +0200
-@@ -28,3 +28,7 @@
- 
- Stephen Hemminger <shemminger@linux-foundation.org>
-   * Linux congestion control selection and theading improvements
-+
-+Nathan Jones <nmjones@users.sourceforge.net>
-+  * patch for underflow when value specified in -n is not a multiple of -l
-+
---- iperf-2.0.4-4/ChangeLog	2009-07-06 12:02:24.166276642 +0200
-+++ iperf-2.0.4/ChangeLog	2009-07-06 12:15:28.883699655 +0200
-@@ -1,3 +1,18 @@
-+2008-05-09 Jon Dugan <jdugan@x1024.net>
-+
-+* change currLen to unsigned to squelch warning generated by Nathan's patch
-+
-+2008-05-09 Nathan Jones <nmjones@users.sourceforge.net>
-+
-+* prevent underflow when the amount of data to be transmitted (-n) is not a
-+multiple of the buffer size (-l)  Patch:
-+https://sourceforge.net/tracker/index.php?func=detail&aid=1943432&group_id=128336&atid=711373
-+
-+2008-04-08 Jon Dugan <jdugan@x1024.net>
-+
-+* print report headers only once
-+* use appropriate report header for UDP tests
-+
- 2008-04-07 Jon Dugan <jdugan@x1024.net>
- 
- * Add man page to autoconf goo
-diff -urN 204orig/src/Client.cpp trunk/src/Client.cpp
---- 204orig/src/Client.cpp	2008-04-08 04:37:54.000000000 +0200
-+++ trunk/src/Client.cpp	2008-05-10 05:18:35.000000000 +0200
-@@ -116,7 +116,7 @@
- const int    kBytes_to_Bits = 8; 
- 
- void Client::RunTCP( void ) {
--    long currLen = 0; 
-+    unsigned long currLen = 0; 
-     struct itimerval it;
-     max_size_t totLen = 0;
- 
-@@ -170,7 +170,12 @@
-         }	
- 
-         if ( !mMode_Time ) {
--            mSettings->mAmount -= currLen;
-+            /* mAmount may be unsigned, so don't let it underflow! */
-+            if( mSettings->mAmount >= currLen ) {
-+                mSettings->mAmount -= currLen;
-+            } else {
-+                mSettings->mAmount = 0;
-+            }
-         }
- 
-     } while ( ! (sInterupted  || 
-@@ -198,7 +203,7 @@
- 
- void Client::Run( void ) {
-     struct UDP_datagram* mBuf_UDP = (struct UDP_datagram*) mBuf; 
--    long currLen = 0; 
-+    unsigned long currLen = 0; 
- 
-     int delay_target = 0; 
-     int delay = 0; 
-@@ -310,7 +315,12 @@
-             delay_loop( delay ); 
-         }
-         if ( !mMode_Time ) {
--            mSettings->mAmount -= currLen;
-+            /* mAmount may be unsigned, so don't let it underflow! */
-+            if( mSettings->mAmount >= currLen ) {
-+                mSettings->mAmount -= currLen;
-+            } else {
-+                mSettings->mAmount = 0;
-+            }
-         }
- 
-     } while ( ! (sInterupted  || 
-diff -urN 204orig/src/ReportDefault.c trunk/src/ReportDefault.c
---- 204orig/src/ReportDefault.c	2008-04-08 04:37:54.000000000 +0200
-+++ trunk/src/ReportDefault.c	2008-04-09 02:08:11.000000000 +0200
-@@ -67,6 +67,7 @@
-  * Prints transfer reports in default style
-  */
- void reporter_printstats( Transfer_Info *stats ) {
-+    static char header_printed = 0;
- 
-     byte_snprintf( buffer, sizeof(buffer)/2, (double) stats->TotalLen,
-                    toupper( stats->mFormat));
-@@ -76,13 +77,19 @@
- 
-     if ( stats->mUDP != (char)kMode_Server ) {
-         // TCP Reporting
--        printf( report_bw_header);
-+        if( !header_printed ) {
-+            printf( report_bw_header);
-+            header_printed = 1;
-+        }
-         printf( report_bw_format, stats->transferID, 
-                 stats->startTime, stats->endTime, 
-                 buffer, &buffer[sizeof(buffer)/2] );
-     } else {
-         // UDP Reporting
--        printf( report_bw_jitter_loss_header);
-+        if( !header_printed ) {
-+            printf( report_bw_jitter_loss_header);
-+            header_printed = 1;
-+        }
-         printf( report_bw_jitter_loss_format, stats->transferID, 
-                 stats->startTime, stats->endTime, 
-                 buffer, &buffer[sizeof(buffer)/2],
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch
deleted file mode 100644
index ec13d6b..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Import Debian patches and fix a lot of real bugs. 
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4/src/Listener.cpp	2009-02-23 16:20:31.000000000 -0500
-+++ iperf-2.0.4-fixed/src/Listener.cpp	2009-02-23 16:20:40.000000000 -0500
-@@ -333,7 +333,7 @@
- #endif
-     {
-         rc = bind( mSettings->mSock, (sockaddr*) &mSettings->local, mSettings->size_local );
--        WARN_errno( rc == SOCKET_ERROR, "bind" );
-+        FAIL_errno( rc == SOCKET_ERROR, "bind", mSettings );
-     }
-     // listen for connections (TCP only).
-     // default backlog traditionally 5
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch
deleted file mode 100644
index 9e17e6d..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Import Debian patches and fix a lot of real bugs. 
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4/src/Client.cpp	2008-04-07 22:37:54.000000000 -0400
-+++ iperf-2.0.4-fixed/src/Client.cpp	2009-03-03 12:30:02.000000000 -0500
-@@ -403,7 +403,7 @@
-     // connect socket
-     rc = connect( mSettings->mSock, (sockaddr*) &mSettings->peer, 
-                   SockAddr_get_sizeof_sockaddr( &mSettings->peer ));
--    WARN_errno( rc == SOCKET_ERROR, "connect" );
-+    FAIL_errno( rc == SOCKET_ERROR, "connect", mSettings );
- 
-     getsockname( mSettings->mSock, (sockaddr*) &mSettings->local, 
-                  &mSettings->size_local );
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch
deleted file mode 100644
index 4b5f914..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-by Kirby Zhou < kirbyzhou \x40 sohu-rd.com >
-add a Condition_Wait_Event for ReporterDoneCond
-
-Upstream-Status: Inappropriate [not author]
-
---- iperf-2.0.4.orig/include/Condition.h	2007-08-30 00:06:19.000000000 +0200
-+++ iperf-2.0.4/include/Condition.h	2009-07-06 11:45:02.407700310 +0200
-@@ -115,6 +115,11 @@ typedef struct Condition {
-     // sleep this thread, waiting for condition signal
- #if   defined( HAVE_POSIX_THREAD )
-     #define Condition_Wait( Cond ) pthread_cond_wait( &(Cond)->mCondition, &(Cond)->mMutex )
-+    #define Condition_Wait_Event( Cond ) do { \
-+        Mutex_Lock( &(Cond)->mMutex ); \
-+        pthread_cond_wait( &(Cond)->mCondition, &(Cond)->mMutex ); \
-+        Mutex_Unlock( &(Cond)->mMutex ); \
-+    } while ( 0 )
- #elif defined( HAVE_WIN32_THREAD )
-     // atomically release mutex and wait on condition,                      
-     // then re-acquire the mutex
-@@ -122,6 +127,10 @@ typedef struct Condition {
-         SignalObjectAndWait( (Cond)->mMutex, (Cond)->mCondition, INFINITE, false ); \
-         Mutex_Lock( &(Cond)->mMutex );                          \
-     } while ( 0 )
-+    #define Condition_Wait_Event( Cond ) do { \
-+        Mutex_Lock( &(Cond)->mMutex ); \
-+        SignalObjectAndWait( (Cond)->mMutex, (Cond)->mCondition, INFINITE, false ); \
-+    } while ( 0 )
- #else
-     #define Condition_Wait( Cond )
- #endif
---- iperf-2.0.4.orig/src/Reporter.c	2009-07-06 11:49:05.996443011 +0200
-+++ iperf-2.0.4/src/Reporter.c	2009-07-06 11:46:52.919699530 +0200
-@@ -339,7 +339,7 @@ void ReportPacket( ReportHeader* agent, 
-             // item
-             while ( index == 0 ) {
-                 Condition_Signal( &ReportCond );
--                Condition_Wait( &ReportDoneCond );
-+                Condition_Wait_Event( &ReportDoneCond );
-                 index = agent->reporterindex;
-             }
-             agent->agentindex = 0;
-@@ -347,7 +347,7 @@ void ReportPacket( ReportHeader* agent, 
-         // Need to make sure that reporter is not about to be "lapped"
-         while ( index - 1 == agent->agentindex ) {
-             Condition_Signal( &ReportCond );
--            Condition_Wait( &ReportDoneCond );
-+            Condition_Wait_Event( &ReportDoneCond );
-             index = agent->reporterindex;
-         }
- 
-@@ -391,7 +391,7 @@ void EndReport( ReportHeader *agent ) {
-     if ( agent != NULL ) {
-         int index = agent->reporterindex;
-         while ( index != -1 ) {
--            Condition_Wait( &ReportDoneCond );
-+            Condition_Wait_Event( &ReportDoneCond );
-             index = agent->reporterindex;
-         }
-         agent->agentindex = -1;
-@@ -412,7 +412,7 @@ void EndReport( ReportHeader *agent ) {
- Transfer_Info *GetReport( ReportHeader *agent ) {
-     int index = agent->reporterindex;
-     while ( index != -1 ) {
--        Condition_Wait( &ReportDoneCond );
-+        Condition_Wait_Event( &ReportDoneCond );
-         index = agent->reporterindex;
-     }
-     return &agent->report.info;
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch
deleted file mode 100644
index c5d85b1..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-by Kirby Zhou < kirbyzhou \x40 sohu-rd.com >
-increase the queue length to avoid thread racing
-
-Upstream-Status: Inappropriate [not author]
---- iperf-2.0.4.orig/include/Reporter.h	2008-04-08 04:37:54.000000000 +0200
-+++ iperf-2.0.4/include/Reporter.h	2009-07-06 11:53:58.700541554 +0200
-@@ -61,7 +61,7 @@ struct server_hdr;
- 
- #include "Settings.hpp"
- 
--#define NUM_REPORT_STRUCTS 700
-+#define NUM_REPORT_STRUCTS 5700
- #define NUM_MULTI_SLOTS    5
- 
- #ifdef __cplusplus
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
deleted file mode 100644
index a2a0797..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-by Kirby Zhou < kirbyzhou \x40 sohu-rd.com >
-using sched_yield to schedule other threads, so multiple iperf can run simultaneously
-using usleep with delay-loop between 2 package is long than 1.25ms.
-
-Upstream-Status: Inappropriate [not author]
-
---- iperf-2.0.4-4/compat/delay.cpp	2009-07-06 12:02:24.166276642 +0200
-+++ iperf-2.0.4/compat/delay.cpp	2009-07-06 12:01:33.858384005 +0200
-@@ -69,6 +69,13 @@ void delay_loop( unsigned long usec ) {
- 
-     Timestamp now;
-     while ( now.before( end ) ) {
-+       long diff = end.subUsec(now);
-+       if (diff >= 1250) {
-+               usleep(0);
-+       }
-+       if (diff >= 2) {
-+               sched_yield();
-+       }
-         now.setnow();
-     }
- }
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
new file mode 100755
index 0000000..12e8f46
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
@@ -0,0 +1,8 @@
+diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
+ index ed97bc6..728873f 100644
+--- iperf-2.0.5/man/Makefile.am
++++ iperf-2.0.5/man/Makefile.am
+@@ -1,2 +1 @@
+-man_MANS = iperf.1
+-dist_man_MANS = $(man_MANS)
++dist_man_MANS = iperf.1
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
deleted file mode 100644
index 4261c95..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
-HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
-SECTION = "console/network"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
-
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
-        file://000-Iperf_Fix-CPU-Usage.diff \
-        file://001-cast-to-max_size_t-instead-of-int.patch \
-        file://003-fix-hyphen-used-as-minus-sign.patch \
-        file://004-svn-r43-ro.patch \
-        file://005-iperf-die-on-bind-fail.patch \
-        file://006-iperf-die-on-connect-fail.patch \
-        file://007-iperf-reporter-deadlock.patch \
-        file://008-numofreport.patch \
-        file://009-delayloop.patch \
-"
-
-
-SRC_URI[md5sum] = "8c5bc14cc2ea55f18f22afe3c23e3dcb"
-SRC_URI[sha256sum] = "3b52f1c178d6a99c27114929d5469c009197d15379c967b329bafb956f397944"
-
-inherit autotools
-
-S="${WORKDIR}/iperf-${PV}"
-
-EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
-do_configure() {
-    export ac_cv_func_malloc_0_nonnull=yes
-    gnu-configize
-    oe_runconf
-}
-
-do_compile() {
-    cd ${WORKDIR}/iperf-${PV}
-    oe_runmake
-}
-
-do_install() {
-    cd ${WORKDIR}/iperf-${PV}/src
-    oe_runmake DESTDIR=${D} install
-}
-
-
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
new file mode 100644
index 0000000..a207716
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
+SECTION = "console/network"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
+
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${PN}-${PV}.tar.gz \
+            file://iperf-2.0.5_ManPage.patch \
+          "
+
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
-- 
1.7.9.5



