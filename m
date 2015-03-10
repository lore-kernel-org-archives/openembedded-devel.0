Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9B52673A52
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 21:11:43 +0000 (UTC)
Received: by qcrw7 with SMTP id w7so5419222qcr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=7MZVNS4cYFVDfDTYKxnXXII0DfNS2IZp2RQcn2kq5u4=;
	b=lit3GqrrmC2N795UFKz3fuYpojNYB5b7Fw2r8ENCZOmcyKoDl7E6n6SQ0oBTa6rIQp
	mjd8P546vDhSgEiWTzz2LvtuK+Imz17051sZGVV8IwhE9HXn1+Z104g/KzbOTk1szgbZ
	qVQagWG8eX/Vhzhyc3e2nMFiRteuClC0cbFji6sOkGmBOULkstVbhplsX//oJhsOYFqz
	huzrM/7kkJKf5BOrYsO0liQyg2B1vuukHJS28OZRy6kEawY2hXENYseU4MX7lJ4mt//V
	oxK0KTPuZg63MFfq9SLRPlvEo6jbAzO+BMihUmu1TBArwZGF772PN2PE5QuNBoln3DA3
	cymQ==
X-Received: by 10.140.35.239 with SMTP id n102mr42485221qgn.69.1426021904299; 
	Tue, 10 Mar 2015 14:11:44 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	c199sm1179624qka.21.2015.03.10.14.11.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 14:11:43 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 18:10:20 -0300
Message-Id: <1426021821-26379-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 1/2] rxtx: update to the latest Debian patchset
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
X-List-Received-Date: Tue, 10 Mar 2015 21:11:46 -0000

Update the recipe to apply all patches available from
git://anonscm.debian.org/pkg-java/rxtx.git as of
a4cd13e04254cea7842df2e30e9d12e9765a3ef9.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../rxtx/files/MonitorThread-daemon.patch          |  66 ++++
 .../rxtx/files/fhs_lock_buffer_overflow_fix.patch  |  66 ++++
 recipes-extended/rxtx/files/fix_snprintf.patch     | 399 +++++++++++++++++++++
 recipes-extended/rxtx/files/format_security.patch  | 112 ++++++
 recipes-extended/rxtx/files/kfreebsd_port.patch    |   7 +
 recipes-extended/rxtx/files/usb_38400.patch        |  68 ++++
 recipes-extended/rxtx/rxtx_2.2.0.bb                |   7 +-
 7 files changed, 724 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/rxtx/files/MonitorThread-daemon.patch
 create mode 100644 recipes-extended/rxtx/files/fhs_lock_buffer_overflow_fix.patch
 create mode 100644 recipes-extended/rxtx/files/fix_snprintf.patch
 create mode 100644 recipes-extended/rxtx/files/format_security.patch
 create mode 100644 recipes-extended/rxtx/files/usb_38400.patch

diff --git a/recipes-extended/rxtx/files/MonitorThread-daemon.patch b/recipes-extended/rxtx/files/MonitorThread-daemon.patch
new file mode 100644
index 0000000..8e7951a
--- /dev/null
+++ b/recipes-extended/rxtx/files/MonitorThread-daemon.patch
@@ -0,0 +1,66 @@
+Description: Threads created in Java by RXTX are not marked as daemon.
+Bug: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674975
+Author: Christopher Wellons <mosquitopsu@gmail.com>
+Upstream-Status: Pending
+--- a/src/gnu/io/I2C.java
++++ b/src/gnu/io/I2C.java
+@@ -468,7 +468,9 @@
+ 		private boolean BI=false;
+ 		private boolean Data=false;
+ 		private boolean Output=false;
+-		MonitorThread() { }
++		MonitorThread() {
++			setDaemon(true);
++		}
+ 		public void run() {
+ 			eventLoop();
+ 		}
+--- a/src/gnu/io/LPRPort.java
++++ b/src/gnu/io/LPRPort.java
+@@ -366,7 +366,9 @@
+ {
+ 	private boolean monError = false;
+ 	private boolean monBuffer = false;
+-		MonitorThread() { }
++		MonitorThread() {
++			setDaemon(true);
++		}
+ 		public void run()
+ 		{
+ 			eventLoop();
+--- a/src/gnu/io/RS485.java
++++ b/src/gnu/io/RS485.java
+@@ -465,7 +465,9 @@
+ 		private boolean BI=false;
+ 		private boolean Data=false;
+ 		private boolean Output=false;
+-		MonitorThread() { }
++		MonitorThread() {
++			setDaemon(true);
++		}
+ 		public void run() {
+ 			eventLoop();
+ 		}
+--- a/src/gnu/io/RXTXPort.java
++++ b/src/gnu/io/RXTXPort.java
+@@ -1629,6 +1629,7 @@
+ 
+ 		MonitorThread() 
+ 		{
++			setDaemon(true);
+ 			if (debug)
+ 				z.reportln( "RXTXPort:MontitorThread:MonitorThread()"); 
+ 		}
+--- a/src/gnu/io/Raw.java
++++ b/src/gnu/io/Raw.java
+@@ -466,7 +466,9 @@
+ 		private boolean BI=false;
+ 		private boolean Data=false;
+ 		private boolean Output=false;
+-		MonitorThread() { }
++		MonitorThread() {
++			setDaemon(true);
++		}
+ 		public void run() {
+ 			eventLoop();
+ 		}
diff --git a/recipes-extended/rxtx/files/fhs_lock_buffer_overflow_fix.patch b/recipes-extended/rxtx/files/fhs_lock_buffer_overflow_fix.patch
new file mode 100644
index 0000000..c4d0e89
--- /dev/null
+++ b/recipes-extended/rxtx/files/fhs_lock_buffer_overflow_fix.patch
@@ -0,0 +1,66 @@
+Description: Java fails with a buffer overflow when there's a locked serial
+device, see http://mailman.qbang.org/pipermail/rxtx/2009-May/10897125.html.
+Author: Sergio Talens-Oliag <sto@debian.org>
+Upstream-Status: Pending
+
+Index: rxtx-2.2pre2/CNI/SerialImp.c
+===================================================================
+--- rxtx-2.2pre2.orig/CNI/SerialImp.c	2012-05-21 13:13:43.000000000 +0200
++++ rxtx-2.2pre2/CNI/SerialImp.c	2012-05-21 13:24:05.876652630 +0200
+@@ -4752,7 +4752,7 @@
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		sprintf( message,
++		snprintf( message, 79,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		report_error( message );
+Index: rxtx-2.2pre2/src/SerialImp.c
+===================================================================
+--- rxtx-2.2pre2.orig/src/SerialImp.c	2012-05-21 13:13:43.000000000 +0200
++++ rxtx-2.2pre2/src/SerialImp.c	2012-05-21 13:26:50.184644233 +0200
+@@ -5307,7 +5307,7 @@
+ 	}
+ 	if ( dev_lock( filename ) )
+ 	{
+-		sprintf( message,
++		snprintf( message, 79,
+ 			"RXTX fhs_lock() Error: creating lock file for: %s: %s\n",
+ 			filename, strerror(errno) );
+ 		report_error( message );
+@@ -5367,7 +5367,7 @@
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		sprintf( message,
++		snprintf( message, 79,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		report_error( message );
+Index: rxtx-2.2pre2/src/lfd/lockdaemon.c
+===================================================================
+--- rxtx-2.2pre2.orig/src/lfd/lockdaemon.c	2007-04-26 07:26:07.000000000 +0200
++++ rxtx-2.2pre2/src/lfd/lockdaemon.c	2012-05-21 13:25:35.396648055 +0200
+@@ -145,7 +145,7 @@
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		sprintf( message,
++		snprintf( message, 79,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		syslog( LOG_INFO, message );
+Index: rxtx-2.2pre2/src/lfd/lockdaemon.c.noinetd
+===================================================================
+--- rxtx-2.2pre2.orig/src/lfd/lockdaemon.c.noinetd	2007-04-26 07:26:07.000000000 +0200
++++ rxtx-2.2pre2/src/lfd/lockdaemon.c.noinetd	2012-05-21 13:25:55.748647017 +0200
+@@ -144,7 +144,7 @@
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		sprintf( message,
++		snprintf( message, 79,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		syslog( LOG_INFO, message );
diff --git a/recipes-extended/rxtx/files/fix_snprintf.patch b/recipes-extended/rxtx/files/fix_snprintf.patch
new file mode 100644
index 0000000..704a2c4
--- /dev/null
+++ b/recipes-extended/rxtx/files/fix_snprintf.patch
@@ -0,0 +1,399 @@
+From: Jose Luis Guardiola <guardiola@iti.upv.es>
+Forwarded: no
+Description: replace s[n]printf with asprintf/free
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=731151
+Upstream-Status: Pending
+
+--- a/src/SerialImp.c
++++ b/src/SerialImp.c
+@@ -5827,7 +5827,7 @@
+ 		LOCKDIR, NULL
+ 	};
+ 	const char *lockprefixes[] = { "LCK..", "lk..", "LK.", NULL };
+-	char *p, file[80], pid_buffer[20], message[80];
++	char *p, *file, pid_buffer[20], *message;
+ 	int i = 0, j, k, fd , pid;
+ 	struct stat buf, buf2, lockbuf;
+ 
+@@ -5868,19 +5868,22 @@
+ 			while ( lockprefixes[k] )
+ 			{
+ 				/* FHS style */
+-				sprintf( file, "%s/%s%s", lockdirs[i],
++				asprintf( &file, "%s/%s%s", lockdirs[i],
+ 					lockprefixes[k], p );
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					report_warning( message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 
+ 				/* UUCP style */
+ 				stat(port_filename , &buf );
+-				sprintf( file, "%s/%s%03d.%03d.%03d",
++				asprintf( &file, "%s/%s%03d.%03d.%03d",
+ 					lockdirs[i],
+ 					lockprefixes[k],
+ 					(int) major( buf.st_dev ),
+@@ -5889,11 +5892,14 @@
+ 				);
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					report_warning( message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 				k++;
+ 			}
+ 		}
+@@ -5917,7 +5923,7 @@
+ #endif /* __unixware__ */
+ 		p--;
+ 	}
+-	sprintf( file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
++	asprintf( &file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
+ #else
+ 	/*  UUCP standard locks */
+ 	if ( stat( port_filename, &buf ) != 0 )
+@@ -5925,7 +5931,7 @@
+ 		report( "RXTX is_device_locked() could not find device.\n" );
+ 			return 1;
+ 	}
+-	sprintf( file, "%s/LK.%03d.%03d.%03d",
++	asprintf( &file, "%s/LK.%03d.%03d.%03d",
+ 		LOCKDIR,
+ 		(int) major( buf.st_dev ),
+  		(int) major( buf.st_rdev ),
+@@ -5946,21 +5952,25 @@
+ 
+ 		if( kill( (pid_t) pid, 0 ) && errno==ESRCH )
+ 		{
+-			sprintf( message,
++			asprintf( &message,
+ 				"RXTX Warning:  Removing stale lock file. %s\n",
+ 				file );
+ 			report_warning( message );
++			free( message );
+ 			if( unlink( file ) != 0 )
+ 			{
+-				snprintf( message, 80, "RXTX Error:  Unable to \
++				asprintf( &message, "RXTX Error:  Unable to \
+ 					remove stale lock file: %s\n",
+ 					file
+ 				);
+ 				report_warning( message );
++				free( message );
++				free( file );
+ 				return 1;
+ 			}
+ 		}
+ 	}
++	free(file);
+ 	return 0;
+ }
+ #endif /* WIN32 */
+--- a/src/lfd/lockdaemon.c
++++ b/src/lfd/lockdaemon.c
+@@ -120,8 +120,8 @@
+ 	 *
+ 	 */
+ 	int fd,j;
+-	char lockinfo[12], message[80];
+-	char file[80], *p;
++	char lockinfo[12];
++	char *file, *p, *message;
+ 
+ 	j = strlen( filename );
+ 	p = ( char * ) filename + j;
+@@ -136,24 +136,28 @@
+ #endif /* __unixware__ */
+ 		p--;
+ 	}
+-	sprintf( file, "%s/LCK..%s", LOCKDIR, p );
+ 	if ( check_lock_status( filename ) )
+ 	{
+ 		/* syslog( LOG_INFO, "fhs_lock() lockstatus fail\n" ); */
+ 		return 1;
+ 	}
++	asprintf( &file, "%s/LCK..%s", LOCKDIR, p );
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		snprintf( message, 79,
++		asprintf( &message,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		syslog( LOG_INFO, message );
++		free(message);
++		free(file);
+ 		return 1;
+ 	}
+ 	sprintf( lockinfo, "%10d\n", pid );
+-	sprintf( message, "fhs_lock: creating lockfile: %s\n", lockinfo );
++	//asprintf( &message, "fhs_lock: creating lockfile: %s\n", lockinfo );
+ 	//syslog( LOG_INFO, message );
++	//free(message);
++	free(file);
+ 	write( fd, lockinfo, 11 );
+ 	close( fd );
+ 	return 0;
+@@ -563,7 +567,7 @@
+ 		LOCKDIR, NULL
+ 	};
+ 	const char *lockprefixes[] = { "LCK..", "lk..", "LK.", NULL }; 
+-	char *p, file[80], pid_buffer[20], message[80];
++	char *p, *file, pid_buffer[20], *message;
+ 	int i = 0, j, k, fd , pid;
+ 	struct stat buf;
+ 	struct stat buf2;
+@@ -602,19 +606,22 @@
+ 			while ( lockprefixes[k] )
+ 			{
+ 				/* FHS style */
+-				sprintf( file, "%s/%s%s", lockdirs[i],
++				asprintf( &file, "%s/%s%s", lockdirs[i],
+ 					lockprefixes[k], p );
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					syslog( LOG_INFO, message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 
+ 				/* UUCP style */
+ 				stat(port_filename , &buf );
+-				sprintf( file, "%s/%s%03d.%03d.%03d",
++				asprintf( &file, "%s/%s%03d.%03d.%03d",
+ 					lockdirs[i],
+ 					lockprefixes[k],
+ 					(int) major( buf.st_dev ),
+@@ -623,11 +630,14 @@
+ 				);
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					syslog( LOG_INFO, message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 				k++;
+ 			}
+ 		}
+@@ -651,10 +661,10 @@
+ #endif /* __unixware__ */
+ 		p--;
+ 	}
+-	sprintf( file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
++	asprintf( &file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
+ #else 
+ 	/*  UUCP standard locks */
+-	sprintf( file, "%s/LK.%03d.%03d.%03d",
++	asprintf( &file, "%s/LK.%03d.%03d.%03d",
+ 		LOCKDIR,
+ 		(int) major( buf.st_dev ),
+  		(int) major( buf.st_rdev ),
+@@ -672,32 +682,39 @@
+ 		/* FIXME null terminiate pid_buffer? need to check in Solaris */
+ 		close( fd );
+ 		sscanf( pid_buffer, "%d", &pid );
+-		sprintf( message, "found lock for %s with pid %i\n", file, pid );
++		/* asprintf( &message, "found lock for %s with pid %i\n", file, pid ); */
+ 		/* syslog( LOG_INFO, message ); */
++		/* free( message ); */
+ 
+ 		if( kill( (pid_t) pid, 0 ) && errno==ESRCH )
+ 		{
+-			sprintf( message,
++			asprintf( &message,
+ 				"RXTX Warning:  Removing stale lock file. %s\n",
+ 				file );
+ 			syslog( LOG_INFO, message );
++			free( message );
+ 			if( unlink( file ) != 0 )
+ 			{
+-				snprintf( message, 80, "RXTX Error:  Unable to \
++				asprintf( &message, "RXTX Error:  Unable to \
+ 					remove stale lock file: %s\n",
+ 					file
+ 				);
+ 				syslog( LOG_INFO, message );
++				free( message );
++				free( file );
+ 				return 0;
+ 			}
+ 		}
+ 		else
+ 		{
+-			sprintf( message, "could not kill %i\n", pid );
++			/* asprintf( &message, "could not kill %i\n", pid ); */
+ 			/* syslog( LOG_INFO, message ); */
++			/* free( message ); */
++			free( file );
+ 			return 1;
+ 		}
+ 	}
++	free( file );
+ 	return 0;
+ }
+ int init( void )
+--- a/src/lfd/lockdaemon.c.noinetd
++++ b/src/lfd/lockdaemon.c.noinetd
+@@ -119,8 +119,8 @@
+ 	 *
+ 	 */
+ 	int fd,j;
+-	char lockinfo[12], message[80];
+-	char file[80], *p;
++	char lockinfo[12];
++	char *file, *p, *message;
+ 
+ 	j = strlen( filename );
+ 	p = ( char * ) filename + j;
+@@ -135,24 +135,28 @@
+ #endif /* __unixware__ */
+ 		p--;
+ 	}
+-	sprintf( file, "%s/LCK..%s", LOCKDIR, p );
+ 	if ( check_lock_status( filename ) )
+ 	{
+ 		syslog( LOG_INFO, "fhs_lock() lockstatus fail\n" );
+ 		return 1;
+ 	}
++	asprintf( &file, "%s/LCK..%s", LOCKDIR, p );
+ 	fd = open( file, O_CREAT | O_WRONLY | O_EXCL, 0444 );
+ 	if( fd < 0 )
+ 	{
+-		snprintf( message, 79,
++		asprintf( &message,
+ 			"RXTX fhs_lock() Error: creating lock file: %s: %s\n",
+ 			file, strerror(errno) );
+ 		syslog( LOG_INFO, message );
++		free(message);
++		free(file);
+ 		return 1;
+ 	}
+ 	sprintf( lockinfo, "%10d\n", pid );
+-	sprintf( message, "fhs_lock: creating lockfile: %s\n", lockinfo );
++	asprintf( &message, "fhs_lock: creating lockfile: %s\n", lockinfo );
+ 	syslog( LOG_INFO, message );
++	free( message );
++	free( file );
+ 	write( fd, lockinfo, 11 );
+ 	close( fd );
+ 	return 0;
+@@ -556,7 +560,7 @@
+ 		LOCKDIR, NULL
+ 	};
+ 	const char *lockprefixes[] = { "LCK..", "lk..", "LK.", NULL }; 
+-	char *p, file[80], pid_buffer[20], message[80];
++	char *p, *file, pid_buffer[20], *message;
+ 	int i = 0, j, k, fd , pid;
+ 	struct stat buf;
+ 	struct stat buf2;
+@@ -595,19 +599,22 @@
+ 			while ( lockprefixes[k] )
+ 			{
+ 				/* FHS style */
+-				sprintf( file, "%s/%s%s", lockdirs[i],
++				asprintf( &file, "%s/%s%s", lockdirs[i],
+ 					lockprefixes[k], p );
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					syslog( LOG_INFO, message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 
+ 				/* UUCP style */
+ 				stat(port_filename , &buf );
+-				sprintf( file, "%s/%s%03d.%03d.%03d",
++				asprintf( &file, "%s/%s%03d.%03d.%03d",
+ 					lockdirs[i],
+ 					lockprefixes[k],
+ 					(int) major( buf.st_dev ),
+@@ -616,11 +623,14 @@
+ 				);
+ 				if( stat( file, &buf ) == 0 )
+ 				{
+-					sprintf( message, UNEXPECTED_LOCK_FILE,
++					asprintf( &message, UNEXPECTED_LOCK_FILE,
+ 						file );
+ 					syslog( LOG_INFO, message );
++					free( message );
++					free( file );
+ 					return 1;
+ 				}
++				free( file );
+ 				k++;
+ 			}
+ 		}
+@@ -644,7 +654,7 @@
+ #endif /* __unixware__ */
+ 		p--;
+ 	}
+-	sprintf( file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
++	asprintf( &file, "%s/%s%s", LOCKDIR, LOCKFILEPREFIX, p );
+ #else 
+ 	/*  UUCP standard locks */
+ 	if ( stat( port_filename, &buf ) != 0 )
+@@ -656,7 +666,7 @@
+ 		syslog( LOG_INFO, message );
+ 		return 1;
+ 	}
+-	sprintf( file, "%s/LK.%03d.%03d.%03d",
++	asprintf( &file, "%s/LK.%03d.%03d.%03d",
+ 		LOCKDIR,
+ 		(int) major( buf.st_dev ),
+  		(int) major( buf.st_rdev ),
+@@ -677,10 +687,11 @@
+ 
+ 		if( kill( (pid_t) pid, 0 ) && errno==ESRCH )
+ 		{
+-			sprintf( message,
++			asprintf( &message,
+ 				"RXTX Warning:  Removing stale lock file. %s\n",
+ 				file );
+ 			syslog( LOG_INFO, message );
++			free( message );
+ 			if( unlink( file ) != 0 )
+ 			{
+ 				snprintf( message, 80, "RXTX Error:  Unable to \
+@@ -688,10 +699,13 @@
+ 					file
+ 				);
+ 				syslog( LOG_INFO, message );
++				free( message );
++				free( file );
+ 				return 1;
+ 			}
+ 		}
+ 	}
++	free( file );
+ 	return 0;
+ }
+ int init( void )
diff --git a/recipes-extended/rxtx/files/format_security.patch b/recipes-extended/rxtx/files/format_security.patch
new file mode 100644
index 0000000..bd074ad
--- /dev/null
+++ b/recipes-extended/rxtx/files/format_security.patch
@@ -0,0 +1,112 @@
+From: tony mancill <tmancill@debian.org>
+Forwarded: no
+Description: use format specifiers in fprintf statements for hardening flags
+Upstream-Status: Pending
+
+--- a/src/SerialImp.c
++++ b/src/SerialImp.c
+@@ -5108,7 +5108,7 @@
+ void report_warning(const char *msg)
+ {
+ #ifndef DEBUG_MW
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #else
+ 	mexWarnMsgTxt( (const char *) msg );
+ #endif /* DEBUG_MW */
+@@ -5129,7 +5129,7 @@
+ #ifdef DEBUG_MW
+ 	mexErrMsgTxt( msg );
+ #else
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #endif /* DEBUG_MW */
+ #endif /* DEBUG_VERBOSE */
+ }
+@@ -5145,7 +5145,7 @@
+ void report_error(const char *msg)
+ {
+ #ifndef DEBUG_MW
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #else
+ 	mexWarnMsgTxt( msg );
+ #endif /* DEBUG_MW */
+@@ -5164,7 +5164,7 @@
+ {
+ #ifdef DEBUG
+ #	ifndef DEBUG_MW
+-		fprintf(stderr, msg);
++		fprintf(stderr, "%s", msg);
+ #	else
+ 		mexPrintf( msg );
+ #	endif /* DEBUG_MW */
+--- a/src/ParallelImp.c
++++ b/src/ParallelImp.c
+@@ -920,7 +920,7 @@
+ void report_error(char *msg)
+ {
+ #ifndef DEBUG_MW
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #else
+ 	mexWarnMsgTxt( msg );
+ #endif /* DEBUG_MW */
+@@ -938,7 +938,7 @@
+ void report(char *msg)
+ {
+ #ifdef DEBUG
+-        fprintf(stderr, msg);
++        fprintf(stderr, "%s", msg);
+ #endif /* DEBUG */
+ }
+ 
+--- a/src/SerialImp.cpp
++++ b/src/SerialImp.cpp
+@@ -1844,7 +1844,7 @@
+ 
+ 
+ #ifdef DEBUG
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #endif
+ }
+ 
+--- a/CNI/SerialImp.c
++++ b/CNI/SerialImp.c
+@@ -4549,7 +4549,7 @@
+ void report_warning(char *msg)
+ {
+ #ifndef DEBUG_MW
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #else
+ 	mexWarnMsgTxt( (const char *) msg );
+ #endif /* DEBUG_MW */
+@@ -4570,7 +4570,7 @@
+ #ifdef DEBUG_MW
+ 	mexErrMsgTxt( msg );
+ #else
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #endif /* DEBUG_MW */
+ #endif /* DEBUG_VERBOSE */
+ }
+@@ -4586,7 +4586,7 @@
+ void report_error(char *msg)
+ {
+ #ifndef DEBUG_MW
+-	fprintf(stderr, msg);
++	fprintf(stderr, "%s", msg);
+ #else
+ 	mexWarnMsgTxt( msg );
+ #endif /* DEBUG_MW */
+@@ -4605,7 +4605,7 @@
+ {
+ #ifdef DEBUG
+ #	ifndef DEBUG_MW
+-		fprintf(stderr, msg);
++		fprintf(stderr, "%s", msg);
+ #	else
+ 		mexPrintf( msg );
+ #	endif /* DEBUG_MW */
diff --git a/recipes-extended/rxtx/files/kfreebsd_port.patch b/recipes-extended/rxtx/files/kfreebsd_port.patch
index b5fa172..a05e40a 100644
--- a/recipes-extended/rxtx/files/kfreebsd_port.patch
+++ b/recipes-extended/rxtx/files/kfreebsd_port.patch
@@ -1,7 +1,14 @@
 Description: Defines FreeBSD for kFreeBSD systems, also makes sure kfreeBSD is set to use FHS
+
 #grep -r -H "__FreeBSD" . -m 1 --exclude=*.patch --exclude-dir=.git | cut -d: -f1 | xargs sed -i s/__FreeBSD__/__FreeBSD_kernel__/
+
+#grep -r -H "ifdef __linux__" . -m 1 --exclude=*.patch --exclude-dir=.git | cut -d: -f1 | xargs sed -i s/'#ifdef __linux__'/'#if defined(__linux__) || defined(__GNU__) || defined(__GLIBC__)'/
+
+#grep -r -H "ifndef __linux__" . -m 1 --exclude=*.patch --exclude-dir=.git | cut -d: -f1 | xargs sed -i s/'#ifndef __linux__'/'#if !defined(__linux__) \&\& !defined(__GNU__) \&\& !defined(__GLIBC__)'/
+
 Bug: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=585089
 Author: Scott Howard <showard@debian.org>
+Upstream-Status: Pending
 
 Index: rxtx/src/RS485Imp.c
 ===================================================================
diff --git a/recipes-extended/rxtx/files/usb_38400.patch b/recipes-extended/rxtx/files/usb_38400.patch
new file mode 100644
index 0000000..fffe4c5
--- /dev/null
+++ b/recipes-extended/rxtx/files/usb_38400.patch
@@ -0,0 +1,68 @@
+From: Jan Niehusmann <jan@gondor.com>
+Subject: Patch to fix setting USB-serial adapters to 38400 bps
+Bug-Debian: http://bugs.debian.org/740098
+Forwarded: no
+Description: The following patch should fix the reported issue.
+ .
+ On serial ports not supporting the TIOCGSERIAL/TIOCSSERIAL mechanism,
+ this still means that the custom baud rates do not work, but at least
+ 38400 works, again.
+ .
+ Perhaps an even better fix would be switching to the newer termios2 API,
+ as described here:
+ https://mail.python.org/pipermail/python-list/2012-October/633871.html
+ .
+ That API allows setting custom baud rates on the USB serial adapters I
+ have tested, where TIOCGSERIAL/TIOCSSERIAL was not supported.
+ .
+ But unfortunately, termios2 is not available through glibc, so one would
+ need to call linux-specific ioctls directly, which wouldn't be portable
+ at all, and I don't know how it interacts with the BSD / Hurd ports.
+ .
+ Therefore this is the minimal fix, for now.
+Upstream-Status: Pending
+
+--- a/src/SerialImp.c
++++ b/src/SerialImp.c
+@@ -872,10 +872,14 @@
+ 	   out and select baud rates 38400 then 28800 then 38400, you will get
+ 	   a final baud rate of 28800 because you did not update the divisor.
+ 
++	   However, if the serial port doesn't support TIOCGSERIAL or custom speeds,
++	   don't fail: In this case, just use B38400 and assume that there is no way
++	   to set a custom speed on this port.
++
+ 	   See the next ifdef below for the divisor.
+ 	*/
+ #if defined(TIOCGSERIAL)
+-	if ( cspeed == B38400 )
++	if ( cspeed == B38400 && ioctl( fd, TIOCGSERIAL, &sstruct ) == 0 )
+ 		cspeed = 38400;
+ #endif /* TIOCGSERIAL */
+ 	if(     cfsetispeed( &ttyset, cspeed ) < 0 ||
+@@ -905,10 +909,9 @@
+ 			return(1);
+ 		}
+ 		sstruct.custom_divisor = ( sstruct.baud_base/cspeed );
+-		cspeed = B38400;
+ #endif /* TIOCGSERIAL */
+-		if(     cfsetispeed( &ttyset, cspeed ) < 0 ||
+-			cfsetospeed( &ttyset, cspeed ) < 0 )
++		if(     cfsetispeed( &ttyset, B38400 ) < 0 ||
++			cfsetospeed( &ttyset, B38400 ) < 0 )
+ 		{
+ 			/* OK, we tried everything */
+ 			report( "nativeSetSerialPortParams: Cannot Set Speed\n" );
+@@ -916,8 +919,11 @@
+ 		}
+ #if defined(TIOCSSERIAL)
+ 		/*  It is assumed Win32 does this for us */
++		/*  Ignore errors if the target speed is 38400: In this case,
++		 *  just assume TIOCSSERIAL is not supported and custom speeds are
++		 *  not available. */
+ 		if (	sstruct.baud_base < 1 ||
+-		ioctl( fd, TIOCSSERIAL, &sstruct ) < 0 )
++		ioctl( fd, TIOCSSERIAL, &sstruct ) < 0 && cspeed != 38400 )
+ 		{
+ 			return( 1 );
+ 		}
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 0d5aa21..ff17e9c 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -13,7 +13,12 @@ SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://sys_io_h_check.patch \
            file://port_to_hurd.patch \
            file://multiple_property_dirs.patch \
-           file://uninstall_target.patch"
+           file://uninstall_target.patch \
+           file://fhs_lock_buffer_overflow_fix.patch \
+           file://MonitorThread-daemon.patch \
+           file://usb_38400.patch \
+           file://fix_snprintf.patch \
+           file://format_security.patch"
 
 SRC_URI[md5sum] = "7eedb18e3f33a427e2b0e9be8ce3f94c"
 SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880495b03"
-- 
2.1.4


