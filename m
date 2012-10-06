Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TKZTB-0000Cl-24
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 20:51:25 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so2629320obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gMJH8dwcOeuAbeQ+5evzWE7U3jpDjkULlGr2Nl8PoEY=;
	b=bX4nBwL9cyC1YK40SdBs/aFcLAXyzXliBB89ABmPY7J472EYS2WyCarRNJVPb1xn7V
	q/a5DlOBV8wjyfD05ww6AFOiJxXvl+V5y8Az7d9O3KTp1SNsC22sW4P+8ksdhumR1TEE
	g9FIRrFpgMrPUx6CHtiCmIqGt7Em2uNW++QNx8sv+ns5L2Si9Os1rI39UVVxxUn3txRk
	aTzCAaXRmE2whz8Nap6mqqJq7WCRXCLUrbjX21JlXNwwkjAZaqiGFAx15uBwKQi3asBZ
	E6YJ5hQxzFwLoRy4+ziMB+TCzAqsoDAkl3xM+uHpsKRTgQ1daMMf7zOAKZ+yidbw+MxU
	Qavw==
Received: by 10.182.89.42 with SMTP id bl10mr9683922obb.27.1349548695460;
	Sat, 06 Oct 2012 11:38:15 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bd5sm12843034obb.5.2012.10.06.11.38.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 11:38:14 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 14:07:06 -0500
Message-Id: <1349550426-12357-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5
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
X-List-Received-Date: Sat, 06 Oct 2012 18:51:25 -0000

* Upgrade to version 2.0.5.
* Below patches used in version 2.0.4 are no longer needed:
    004-svn-r43-ro.patch (already applied)
    006-iperf-die-on-connect-fail.patch (already applied)
    009-delayloop.patch (equivalent solution already exists)
* Patch 000-Iperf_Fix-CPU-Usage.diff has been updated to apply to
  version 2.0.5
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff |  164 --------------------
 .../iperf/iperf-2.0.4/004-svn-r43-ro.patch         |  117 --------------
 .../006-iperf-die-on-connect-fail.patch            |   15 --
 .../iperf/iperf-2.0.4/009-delayloop.patch          |   22 ---
 .../iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff |   45 ++++++
 .../001-cast-to-max_size_t-instead-of-int.patch    |    0
 .../003-fix-hyphen-used-as-minus-sign.patch        |    0
 .../005-iperf-die-on-bind-fail.patch               |    0
 .../007-iperf-reporter-deadlock.patch              |    0
 .../008-numofreport.patch                          |    0
 .../iperf/{iperf_2.0.4.bb => iperf_2.0.5.bb}       |   10 +-
 11 files changed, 49 insertions(+), 324 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 => iperf-2.0.5}/001-cast-to-max_size_t-instead-of-int.patch (100%)
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 => iperf-2.0.5}/003-fix-hyphen-used-as-minus-sign.patch (100%)
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 => iperf-2.0.5}/005-iperf-die-on-bind-fail.patch (100%)
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 => iperf-2.0.5}/007-iperf-reporter-deadlock.patch (100%)
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 => iperf-2.0.5}/008-numofreport.patch (100%)
 rename meta-oe/recipes-benchmark/iperf/{iperf_2.0.4.bb => iperf_2.0.5.bb} (79%)

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
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
new file mode 100644
index 0000000..ff801a4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff
@@ -0,0 +1,45 @@
+From c7c18bc93441872e7ff2fa47a18a12ef319b7949 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Sat, 6 Oct 2012 12:32:29 -0500
+Subject: [PATCH] iperf: Fix CPU Usage
+
+* Updated the patch 000-Iperf_Fix-CPU-Usage.diff to apply to iperf v2.0.5
+* That patch was largely based on the patch:
+  http://marc.info/?l=linux-kernel&m=119088670113210&w=2
+* The majority of the changes from 000-Iperf_Fix-CPU-Usage.diff have been
+  incorporated into iperf v2.0.5.
+* The two remaining thread_rest changes that 000-Iperf_Fix-CPU-Usage.diff
+  made have been added to this version of iperf v2.0.5
+
+Upstream-Status: Inappropriate [not author]
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ src/Reporter.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Reporter.c b/src/Reporter.c
+index 7d9263b..4fbb712 100644
+--- a/src/Reporter.c
++++ b/src/Reporter.c
+@@ -391,7 +391,7 @@ void EndReport( ReportHeader *agent ) {
+     if ( agent != NULL ) {
+         int index = agent->reporterindex;
+         while ( index != -1 ) {
+-            thread_rest();
++            Condition_Wait( &ReportDoneCond );
+             index = agent->reporterindex;
+         }
+         agent->agentindex = -1;
+@@ -412,7 +412,7 @@ void EndReport( ReportHeader *agent ) {
+ Transfer_Info *GetReport( ReportHeader *agent ) {
+     int index = agent->reporterindex;
+     while ( index != -1 ) {
+-        thread_rest();
++        Condition_Wait( &ReportDoneCond );
+         index = agent->reporterindex;
+     }
+     return &agent->report.info;
+-- 
+1.7.0.4
+
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_t-instead-of-int.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-as-minus-sign.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind-fail.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-deadlock.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
similarity index 79%
rename from meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
rename to meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index bd8bac1..729e845 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -4,22 +4,20 @@ SECTION = "console/network"
 LICENSE = "NewBSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
+PR = "r0"
+
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
         file://000-Iperf_Fix-CPU-Usage.diff \
         file://001-cast-to-max_size_t-instead-of-int.patch \
         file://003-fix-hyphen-used-as-minus-sign.patch \
-        file://004-svn-r43-ro.patch \
         file://005-iperf-die-on-bind-fail.patch \
-        file://006-iperf-die-on-connect-fail.patch \
         file://007-iperf-reporter-deadlock.patch \
         file://008-numofreport.patch \
-        file://009-delayloop.patch \
 	"
 
-
-SRC_URI[md5sum] = "8c5bc14cc2ea55f18f22afe3c23e3dcb"
-SRC_URI[sha256sum] = "3b52f1c178d6a99c27114929d5469c009197d15379c967b329bafb956f397944"
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
 
 inherit autotools
 
-- 
1.7.0.4



