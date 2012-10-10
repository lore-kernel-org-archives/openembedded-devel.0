Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1TM1yc-0004T7-PK
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 21:29:55 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AJCFum000494;
	Wed, 10 Oct 2012 14:12:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AJCF5q015197;
	Wed, 10 Oct 2012 14:12:15 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 14:12:14 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5
Thread-Index: AQHNo/HAypWkizn5j0CpfAF4KEYyfpey7cTQ
Date: Wed, 10 Oct 2012 19:12:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C300F89@DFLE09.ent.ti.com>
References: <1349550426-12357-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349550426-12357-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5
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
X-List-Received-Date: Wed, 10 Oct 2012 19:29:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this recipe for right now. I need to send a new version of th=
is patch that includes my massaged version of the 003-fix-hyphen-used-as-mi=
nus-sign patch.

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Saturday, October 06, 2012 2:07 PM
To: openembedded-devel@lists.openembedded.org
Cc: Cooper Jr., Franklin
Subject: [meta-oe][PATCH] iperf: Upgrade to version 2.0.5

* Upgrade to version 2.0.5.
* Below patches used in version 2.0.4 are no longer needed:
    004-svn-r43-ro.patch (already applied)
    006-iperf-die-on-connect-fail.patch (already applied)
    009-delayloop.patch (equivalent solution already exists)
* Patch 000-Iperf_Fix-CPU-Usage.diff has been updated to apply to
  version 2.0.5
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff |  164 ----------------=
----
 .../iperf/iperf-2.0.4/004-svn-r43-ro.patch         |  117 --------------
 .../006-iperf-die-on-connect-fail.patch            |   15 --
 .../iperf/iperf-2.0.4/009-delayloop.patch          |   22 ---
 .../iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usage.diff |   45 ++++++
 .../001-cast-to-max_size_t-instead-of-int.patch    |    0
 .../003-fix-hyphen-used-as-minus-sign.patch        |    0
 .../005-iperf-die-on-bind-fail.patch               |    0
 .../007-iperf-reporter-deadlock.patch              |    0
 .../008-numofreport.patch                          |    0
 .../iperf/{iperf_2.0.4.bb =3D> iperf_2.0.5.bb}       |   10 +-
 11 files changed, 49 insertions(+), 324 deletions(-)  delete mode 100644 m=
eta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43=
-ro.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-d=
ie-on-connect-fail.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delaylo=
op.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_F=
ix-CPU-Usage.diff
 rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 =3D> iperf-2.0.5}/001-=
cast-to-max_size_t-instead-of-int.patch (100%)  rename meta-oe/recipes-benc=
hmark/iperf/{iperf-2.0.4 =3D> iperf-2.0.5}/003-fix-hyphen-used-as-minus-sig=
n.patch (100%)  rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 =3D> ip=
erf-2.0.5}/005-iperf-die-on-bind-fail.patch (100%)  rename meta-oe/recipes-=
benchmark/iperf/{iperf-2.0.4 =3D> iperf-2.0.5}/007-iperf-reporter-deadlock.=
patch (100%)  rename meta-oe/recipes-benchmark/iperf/{iperf-2.0.4 =3D> iper=
f-2.0.5}/008-numofreport.patch (100%)  rename meta-oe/recipes-benchmark/ipe=
rf/{iperf_2.0.4.bb =3D> iperf_2.0.5.bb} (79%)

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-=
Usage.diff b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-=
Usage.diff
deleted file mode 100644
index 7e89953..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.d=
iff
+++ /dev/null
@@ -1,164 +0,0 @@
-[Thread]: Replace thread_rest() with condition variables
-
-This applies the patch by Ingo Molnar from
-
-   http://marc.info/?l=3Dlinux-kernel&m=3D119088670113210&w=3D2
-
-by reverting previous changes that coincided with changes made by this -pa=
tch. Other than that, the patch is the original from the above URL.
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
- ReportHeader *ReportRoot =3D NULL;
--int threadWait =3D 0;
--int threadSleeping =3D 0;
- extern Condition ReportCond;
-+extern Condition ReportDoneCond;
- int reporter_process_report ( ReportHeader *report );
- void process_report ( ReportHeader *report );
- int reporter_handle_packet( ReportHeader *report ); -@@ -340,7 +339,7 @@
-             // item
-             while ( index =3D=3D 0 ) {
-                 Condition_Signal( &ReportCond );
--                thread_rest();
-+                Condition_Wait( &ReportDoneCond );
-                 index =3D agent->reporterindex;
-             }
-             agent->agentindex =3D 0;
-@@ -348,11 +347,9 @@
-         // Need to make sure that reporter is not about to be "lapped"
-         while ( index - 1 =3D=3D agent->agentindex ) {
-             Condition_Signal( &ReportCond );
--            thread_rest();
-+            Condition_Wait( &ReportDoneCond );
-             index =3D agent->reporterindex;
-         }
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
-=20
-         // Put the information there
-         memcpy( agent->data + agent->agentindex, packet, sizeof(ReportStr=
uct) );
-@@ -382,9 +379,6 @@
-         packet->packetLen =3D 0;
-         ReportPacket( agent, packet );
-         packet->packetID =3D agent->report.cntDatagrams;
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
--
-     }
- }
-
-@@ -396,11 +390,8 @@
- void EndReport( ReportHeader *agent ) {
-     if ( agent !=3D NULL ) {
-         int index =3D agent->reporterindex;
--	if (threadSleeping)
--           Condition_Signal( &ReportCond );
--
-         while ( index !=3D -1 ) {
--            thread_rest();
-+            Condition_Wait( &ReportDoneCond );
-             index =3D agent->reporterindex;
-         }
-         agent->agentindex =3D -1;
-@@ -421,7 +412,7 @@
- Transfer_Info *GetReport( ReportHeader *agent ) {
-     int index =3D agent->reporterindex;
-     while ( index !=3D -1 ) {
--        thread_rest();
-+        Condition_Wait( &ReportDoneCond );
-         index =3D agent->reporterindex;
-     }
-     return &agent->report.info;
-@@ -467,10 +458,6 @@
-              * Update the ReportRoot to include this report.
-              */
-             Condition_Lock( ReportCond );
--	    if ( isUDP(agent) )
--	      threadWait =3D 0;
--	    else
--	      threadWait =3D 1;
-             reporthdr->next =3D ReportRoot;
-             ReportRoot =3D reporthdr;
-             Condition_Signal( &ReportCond );
-@@ -567,6 +554,7 @@
-         }
-         Condition_Unlock ( ReportCond );
-=20
-+again:
-         if ( ReportRoot !=3D NULL ) {
-             ReportHeader *temp =3D ReportRoot;
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
--	    if ( threadWait && ReportRoot !=3D NULL) {
--	      threadSleeping =3D 1;
--	      Condition_TimedWait (& ReportCond, 1 );
--	      threadSleeping =3D 0;
--	    }
--	    Condition_Unlock ( ReportCond );
--	   =20
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
- // global variables only accessed within this file -@@ -142,6 +143,7 @@ i=
nt main( int argc, char **argv ) {
-=20
-     // Initialize global mutexes and conditions
-     Condition_Initialize ( &ReportCond );
-+    Condition_Initialize ( &ReportDoneCond );
-     Mutex_Initialize( &groupCond );
-     Mutex_Initialize( &clients_mutex );
-
-
- 	  	=20
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.pat=
ch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
deleted file mode 100644
index 8340148..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Import Debian patches and fix a lot of real bugs.=20
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.=
dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4-4/AUTHORS	2009-07-06 12:02:24.159696747 +0200
-+++ iperf-2.0.4/AUTHORS	2009-07-06 12:14:32.236079541 +0200
-@@ -28,3 +28,7 @@
-
- Stephen Hemminger <shemminger@linux-foundation.org>
-   * Linux congestion control selection and theading improvements
-+
-+Nathan Jones <nmjones@users.sourceforge.net>
-+  * patch for underflow when value specified in -n is not a multiple=20
-+of -l
-+
---- iperf-2.0.4-4/ChangeLog	2009-07-06 12:02:24.166276642 +0200
-+++ iperf-2.0.4/ChangeLog	2009-07-06 12:15:28.883699655 +0200
-@@ -1,3 +1,18 @@
-+2008-05-09 Jon Dugan <jdugan@x1024.net>
-+
-+* change currLen to unsigned to squelch warning generated by Nathan's=20
-+patch
-+
-+2008-05-09 Nathan Jones <nmjones@users.sourceforge.net>
-+
-+* prevent underflow when the amount of data to be transmitted (-n) is=20
-+not a multiple of the buffer size (-l)  Patch:
-+https://sourceforge.net/tracker/index.php?func=3Ddetail&aid=3D1943432&gro=
u
-+p_id=3D128336&atid=3D711373
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
- const int    kBytes_to_Bits =3D 8;=20
-
- void Client::RunTCP( void ) {
--    long currLen =3D 0;=20
-+    unsigned long currLen =3D 0;
-     struct itimerval it;
-     max_size_t totLen =3D 0;
-
-@@ -170,7 +170,12 @@
-         }=09
-=20
-         if ( !mMode_Time ) {
--            mSettings->mAmount -=3D currLen;
-+            /* mAmount may be unsigned, so don't let it underflow! */
-+            if( mSettings->mAmount >=3D currLen ) {
-+                mSettings->mAmount -=3D currLen;
-+            } else {
-+                mSettings->mAmount =3D 0;
-+            }
-         }
-=20
-     } while ( ! (sInterupted  ||=20
-@@ -198,7 +203,7 @@
-
- void Client::Run( void ) {
-     struct UDP_datagram* mBuf_UDP =3D (struct UDP_datagram*) mBuf;=20
--    long currLen =3D 0;=20
-+    unsigned long currLen =3D 0;
-=20
-     int delay_target =3D 0;=20
-     int delay =3D 0;=20
-@@ -310,7 +315,12 @@
-             delay_loop( delay );=20
-         }
-         if ( !mMode_Time ) {
--            mSettings->mAmount -=3D currLen;
-+            /* mAmount may be unsigned, so don't let it underflow! */
-+            if( mSettings->mAmount >=3D currLen ) {
-+                mSettings->mAmount -=3D currLen;
-+            } else {
-+                mSettings->mAmount =3D 0;
-+            }
-         }
-=20
-     } while ( ! (sInterupted  ||=20
-diff -urN 204orig/src/ReportDefault.c trunk/src/ReportDefault.c
---- 204orig/src/ReportDefault.c	2008-04-08 04:37:54.000000000 +0200
-+++ trunk/src/ReportDefault.c	2008-04-09 02:08:11.000000000 +0200
-@@ -67,6 +67,7 @@
-  * Prints transfer reports in default style
-  */
- void reporter_printstats( Transfer_Info *stats ) {
-+    static char header_printed =3D 0;
-=20
-     byte_snprintf( buffer, sizeof(buffer)/2, (double) stats->TotalLen,
-                    toupper( stats->mFormat));
-@@ -76,13 +77,19 @@
-=20
-     if ( stats->mUDP !=3D (char)kMode_Server ) {
-         // TCP Reporting
--        printf( report_bw_header);
-+        if( !header_printed ) {
-+            printf( report_bw_header);
-+            header_printed =3D 1;
-+        }
-         printf( report_bw_format, stats->transferID,=20
-                 stats->startTime, stats->endTime,=20
-                 buffer, &buffer[sizeof(buffer)/2] );
-     } else {
-         // UDP Reporting
--        printf( report_bw_jitter_loss_header);
-+        if( !header_printed ) {
-+            printf( report_bw_jitter_loss_header);
-+            header_printed =3D 1;
-+        }
-         printf( report_bw_jitter_loss_format, stats->transferID,=20
-                 stats->startTime, stats->endTime,=20
-                 buffer, &buffer[sizeof(buffer)/2],
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-c=
onnect-fail.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-d=
ie-on-connect-fail.patch
deleted file mode 100644
index 9e17e6d..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-=
fail.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Import Debian patches and fix a lot of real bugs.=20
-
-Upstream-Status: Inappropriate [not author. Above message was get from oe.=
dev c10c33f86903c93611023197a7f812459c2dfe2d]
-
---- iperf-2.0.4/src/Client.cpp	2008-04-07 22:37:54.000000000 -0400
-+++ iperf-2.0.4-fixed/src/Client.cpp	2009-03-03 12:30:02.000000000 -0500
-@@ -403,7 +403,7 @@
-     // connect socket
-     rc =3D connect( mSettings->mSock, (sockaddr*) &mSettings->peer,=20
-                   SockAddr_get_sizeof_sockaddr( &mSettings->peer ));
--    WARN_errno( rc =3D=3D SOCKET_ERROR, "connect" );
-+    FAIL_errno( rc =3D=3D SOCKET_ERROR, "connect", mSettings );
-=20
-     getsockname( mSettings->mSock, (sockaddr*) &mSettings->local,=20
-                  &mSettings->size_local );
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patc=
h b/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
deleted file mode 100644
index a2a0797..0000000
--- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-by Kirby Zhou < kirbyzhou \x40 sohu-rd.com > -using sched_yield to schedul=
e other threads, so multiple iperf can run simultaneously -using usleep wit=
h delay-loop between 2 package is long than 1.25ms.
-
-Upstream-Status: Inappropriate [not author]
-
---- iperf-2.0.4-4/compat/delay.cpp	2009-07-06 12:02:24.166276642 +0200
-+++ iperf-2.0.4/compat/delay.cpp	2009-07-06 12:01:33.858384005 +0200
-@@ -69,6 +69,13 @@ void delay_loop( unsigned long usec ) {
-=20
-     Timestamp now;
-     while ( now.before( end ) ) {
-+       long diff =3D end.subUsec(now);
-+       if (diff >=3D 1250) {
-+               usleep(0);
-+       }
-+       if (diff >=3D 2) {
-+               sched_yield();
-+       }
-         now.setnow();
-     }
- }
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-=
Usage.diff b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-=
Usage.diff
new file mode 100644
index 0000000..ff801a4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/000-Iperf_Fix-CPU-Usag
+++ e.diff
@@ -0,0 +1,45 @@
+From c7c18bc93441872e7ff2fa47a18a12ef319b7949 Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Sat, 6 Oct 2012 12:32:29 -0500
+Subject: [PATCH] iperf: Fix CPU Usage
+
+* Updated the patch 000-Iperf_Fix-CPU-Usage.diff to apply to iperf=20
+v2.0.5
+* That patch was largely based on the patch:
+  http://marc.info/?l=3Dlinux-kernel&m=3D119088670113210&w=3D2
+* The majority of the changes from 000-Iperf_Fix-CPU-Usage.diff have=20
+been
+  incorporated into iperf v2.0.5.
+* The two remaining thread_rest changes that=20
+000-Iperf_Fix-CPU-Usage.diff
+  made have been added to this version of iperf v2.0.5
+
+Upstream-Status: Inappropriate [not author]
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ src/Reporter.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Reporter.c b/src/Reporter.c index 7d9263b..4fbb712=20
+100644
+--- a/src/Reporter.c
++++ b/src/Reporter.c
+@@ -391,7 +391,7 @@ void EndReport( ReportHeader *agent ) {
+     if ( agent !=3D NULL ) {
+         int index =3D agent->reporterindex;
+         while ( index !=3D -1 ) {
+-            thread_rest();
++            Condition_Wait( &ReportDoneCond );
+             index =3D agent->reporterindex;
+         }
+         agent->agentindex =3D -1;
+@@ -412,7 +412,7 @@ void EndReport( ReportHeader *agent ) { =20
+Transfer_Info *GetReport( ReportHeader *agent ) {
+     int index =3D agent->reporterindex;
+     while ( index !=3D -1 ) {
+-        thread_rest();
++        Condition_Wait( &ReportDoneCond );
+         index =3D agent->reporterindex;
+     }
+     return &agent->report.info;
+--
+1.7.0.4
+
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_si=
ze_t-instead-of-int.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/001=
-cast-to-max_size_t-instead-of-int.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_siz=
e_t-instead-of-int.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/001-cast-to-max_size_=
t-instead-of-int.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-use=
d-as-minus-sign.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/003-fix=
-hyphen-used-as-minus-sign.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used=
-as-minus-sign.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/003-fix-hyphen-used-a=
s-minus-sign.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-b=
ind-fail.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-=
on-bind-fail.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bi=
nd-fail.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/005-iperf-die-on-bind=
-fail.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter=
-deadlock.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-rep=
orter-deadlock.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-=
deadlock.patch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/007-iperf-reporter-de=
adlock.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.pa=
tch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
similarity index 100%
rename from meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.pat=
ch
rename to meta-oe/recipes-benchmark/iperf/iperf-2.0.5/008-numofreport.patch
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recip=
es-benchmark/iperf/iperf_2.0.5.bb
similarity index 79%
rename from meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
rename to meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index bd8bac1..729e845 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -4,22 +4,20 @@ SECTION =3D "console/network"
 LICENSE =3D "NewBSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8478eae9f479e39bc3497519336029=
8"
=20
+PR =3D "r0"
+
 SRC_URI =3D " \
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
=20
-
-SRC_URI[md5sum] =3D "8c5bc14cc2ea55f18f22afe3c23e3dcb"
-SRC_URI[sha256sum] =3D "3b52f1c178d6a99c27114929d5469c009197d15379c967b329=
bafb956f397944"
+SRC_URI[md5sum] =3D "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] =3D "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d1=
3096d20362265b"
=20
 inherit autotools
=20
--
1.7.0.4



